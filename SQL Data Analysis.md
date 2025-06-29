1. What is the total sales and profit for each store?
```
ALTER TABLE products
ADD COLUMN profit DOUBLE;

UPDATE products
SET profit=ROUND(product_price-product_cost);


-- Table to calculate sales and profit of each transaction within each store

CREATE TEMPORARY TABLE SaleProfitCalc
SELECT 
    s.sale_id, s.sale_date, s.store_id, s.product_id, s.units, 
    p.product_cost, p.product_price,
    (p.product_cost)*s.units AS cost_price,
    (p.product_price)*s.units AS sales,
    ROUND(((p.product_price)*s.units)-((p.product_cost)*s.units))AS profit

FROM 
sales s
JOIN products p 
ON s.product_id=p.product_id;

-- Finding the total sum and profit for each store
SELECT 
    st.store_name,
    ROUND(SUM(spc.sales),2) AS sales,
    ROUND(SUM(spc.profit),2) AS profit
FROM
    SaleProfitCalc spc
        JOIN
    stores st ON st.store_id = spc.store_id
GROUP BY st.store_name;
```
2. For each store, what are the three best selling products?
```
SELECT 
  st.store_name, 
  p.product_name, 
  aa.row_num 
FROM 
  (
    SELECT 
      a.* 
    FROM 
      (
        SELECT 
          spc.store_id, 
          spc.product_id, 
          SUM(spc.sales) AS total_sales, 
          ROW_NUMBER() OVER (
            PARTITION BY spc.store_id 
            ORDER BY 
              SUM(spc.sales) DESC
          ) AS row_num 
        FROM 
          SaleProfitCalc spc 
        GROUP BY 
          spc.store_id, 
          spc.product_id
      ) a 
    WHERE 
      a.row_num <= 3
  ) aa 
  JOIN stores st ON st.store_id = aa.store_id 
  JOIN products p ON p.product_id = aa.product_id 
ORDER BY 
  st.store_id, 
  aa.row_num;

```
3. For each store, what is the amount of each product sold daily?
```
CREATE TEMPORARY TABLE UnitsSoldDaily 
SELECT 
  s.sale_date, 
  p.product_id, 
  st.store_id, 
  SUM(s.units) AS units_sold 
FROM 
  sales s 
  JOIN stores st ON st.store_id = s.store_Id 
  JOIN products p ON p.product_id = s.product_id 
GROUP BY 
  p.product_id, 
  st.store_id, 
  s.sale_date;
 ```
 
4. What is the total units sold, sales and profit for each product? 
```
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
```

5. What was the sale for store city
```
SELECT 
    st.store_city,
    ROUND(SUM(spc.sales), 2) AS sales,
    ROUND(SUM(spc.profit), 2) AS profit
FROM
    SaleProfitCalc spc
        JOIN
    stores st ON st.store_id = spc.product_id
GROUP BY st.store_city
```

6. What is the total revenue and profit of our remaining stock from all stores?
```
WITH inventory_sales AS
(SELECT 
    i.*,
    p.product_cost,
    p.product_price,
    ROUND((i.stock_on_hand * p.product_cost),2) AS stock_cost,
    ROUND((i.stock_on_hand * p.product_price),2) AS stock_revenue
FROM
    inventory i
        JOIN
products p ON i.product_id = p.product_id
)
SELECT 
	invs.*,
    ROUND((invs.stock_revenue-invs.stock_cost),2) AS stock_profit
FROM
	inventory_sales invs;




