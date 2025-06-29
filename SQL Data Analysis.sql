-- Finding the monthly total running sales across all stores
WITH monthlysales AS
(SELECT
    spc.sale_date,
    MONTH(spc.sale_date) AS month,
    YEAR(spc.sale_date) AS year,
    SUM(spc.sales) AS total_sales
FROM 
    SaleProfitCalc spc
GROUP BY MONTH(spc.sale_date),YEAR(spc.sale_date)
)
SELECT	
    monthlysales.*,
    SUM(monthlysales.total_sales) OVER (ORDER BY monthlysales.year, monthlysales.month) AS rolling_monthly_sales
FROM
	monthlysales;

-- Finding the number of units sold, total sales and profit for each product
SELECT 
    p.product_name,
    SUM(spc.units) AS units_sold,
    ROUND(SUM(spc.sales), 2) AS sales,
    ROUND(SUM(spc.profit), 2) AS profit
FROM
    SaleProfitCalc spc
        JOIN
    products p ON p.product_id = spc.product_id
GROUP BY p.product_name;


-- Finding the total sales and profit for each city 
SELECT 
    st.store_city,
    ROUND(SUM(spc.sales), 2) AS sales,
    ROUND(SUM(spc.profit), 2) AS profit
FROM
    SaleProfitCalc spc
        JOIN
    stores st ON st.store_id = spc.product_id
GROUP BY st.store_city
	

-- Finding the best selling products within each store
SELECT st.store_name, p.product_name, aa.row_num
FROM 
(SELECT a.* FROM
(SELECT
	spc.store_id,
    spc.product_id,
    SUM(spc.sales) AS total_sales,
	ROW_NUMBER() OVER (PARTITION BY spc.store_id ORDER BY SUM(spc.sales) DESC) AS row_num
FROM 
SaleProfitCalc spc
GROUP BY spc.store_id,spc.product_id) a
WHERE a.row_num<=3) aa
JOIN stores st ON st.store_id=aa.store_id
JOIN products p ON p.product_id=aa.product_id
ORDER BY st.store_id, aa.row_num;

-- Calculating the number of units sold of each product with each store daily
DROP TEMPORARY TABLE UnitsSoldDaily;
CREATE TEMPORARY TABLE UnitsSoldDaily
  SELECT
  s.sale_date,
  p.product_id,
  st.store_id,
  SUM(s.units) AS units_sold
  FROM
  sales s
  JOIN stores st
  ON st.store_id=s.store_Id
  JOIN products p ON
  p.product_id=s.product_id
  GROUP BY p.product_id,st.store_id,s.sale_date;
  








 
