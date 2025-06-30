## QUESTION 1:
Write an SQL query to calculate the total sales of furniture products, grouped by each quarter of the year, and order the results chronologically.

### CODE:

    WITH CTE_1 AS (
        SELECT
            DATEPART(YEAR, o.Order_Date) AS Sales_Year,
            DATEPART(quarter, o.Order_Date) AS Sales_Quarter,
            ROUND(SUM(o.Sales), 2) AS Total_Sales
        FROM [SQL_Test].[dbo].[ORDERS] o
        JOIN [SQL_Test].[dbo].[PRODUCT] p
	        ON o.Product_ID = p.ID
        WHERE p.Name = 'Furniture'
        GROUP BY DATEPART(YEAR, o.Order_Date), DATEPART(quarter, o.Order_Date)
    )
    SELECT
        CONCAT('Q', Sales_Quarter, '-', Sales_Year) AS Quarter_Year, 
        Total_Sales
    FROM CTE_1
    ORDER BY Sales_Year, Sales_Quarter;
    
### Output:
![Picture1.png](https://i.imgur.com/5H5zOJL.png)
---

## QUESTION 2:
Analyze the impact of different discount levels on sales performance across product categories, 
specifically looking at the number of orders and total profit generated for each discount classification.

Discount level condition:

No Discount = 0
0 < Low Discount <= 0.2

0.2 < Medium Discount <= 0.5

High Discount > 0.5 

### CODE:
    WITH CTE_1 AS (
        SELECT 
	        CASE
		        WHEN o.DISCOUNT = 0 THEN 'No Discount'
		        WHEN o.DISCOUNT > 0 AND o.DISCOUNT <= 0.2 THEN 'Low Discount'
		        WHEN o.DISCOUNT > 0.5 THEN 'High Discount'
		    ELSE 'Medium Discount'
	        END AS Discount_Class, 
            p.Category,
            o.Order_ID,
            o.Profit
        FROM [SQL_Test].[dbo].[ORDERS] o
        JOIN [SQL_Test].[dbo].[PRODUCT] p
	        ON o.Product_ID = p.ID
        )
    SELECT 
	    CATEGORY,
	    Discount_Class,
	    COUNT (Order_ID) AS Number_of_Orders,
	    ROUND(SUM(Profit),2) AS Total_Profit
    FROM CTE_1
    GROUP BY CATEGORY, Discount_Class
    ORDER BY CATEGORY, Discount_Class
    
### Output:
![Picture-2.png](https://i.imgur.com/3FSsiVI.png)
---

## QUESTION 3:
Determine the top-performing product categories within each customer segment based on sales and profit, 
focusing specifically on those categories that rank within the top two for profitability. 

### CODE:
    WITH CTE_1 AS (
    SELECT
	    c.SEGMENT,
        p.CATEGORY,
        SUM(o.Sales) AS Total_Sales,
        ROUND(SUM(Profit),2) AS Total_Profit,
        DENSE_RANK () OVER (PARTITION BY c.SEGMENT ORDER BY SUM(o.Sales) DESC) AS Sales_Rank, 
        DENSE_RANK () OVER (PARTITION BY c.SEGMENT ORDER BY SUM(o.Profit) DESC) AS Profit_Rank 
    FROM [SQL_Test].[dbo].[ORDERS] o
    JOIN [SQL_Test].[dbo].[PRODUCT] p
	    ON o.Product_ID = p.ID
    JOIN [SQL_Test].[dbo].[CUSTOMER] c
	    ON o.CUSTOMER_ID = c.ID
    GROUP BY c.SEGMENT, p.CATEGORY
    )
    SELECT 
	    SEGMENT, 
	    CATEGORY,
	    Sales_Rank,
	    Profit_Rank 
    FROM CTE_1
    WHERE Profit_rank <= 2
    ORDER BY SEGMENT, CATEGORY
    
### Output:
![Picture-3.png](https://i.imgur.com/0w2v4Ci.png)
---

## QUESTION 4:
Create a report that displays each employee's performance across different product categories, showing not only the 
total profit per category but also what percentage of their total profit each category represents, with the result 
ordered by the percentage in descending order for each employee.


### CODE:
    WITH CTE_1 AS (
        SELECT
	        e.ID_Employee,
	        p.CATEGORY,
            ROUND(SUM(o.Profit), 2) AS Total_Profit
        FROM [SQL_Test].[dbo].[EMPLOYEES] AS e
        JOIN ORDERS AS o 
	        ON e.ID_Employee = o.ID_Employee
        JOIN PRODUCT AS p 
	        ON o.Product_ID = p.ID
        GROUP BY e.ID_Employee, p.CATEGORY
    ),
    CTE_2 AS (
        SELECT 
	        ID_Employee, 
	        SUM(Total_Profit) AS Total_of_Total_Profit
        FROM CTE_1
    GROUP BY ID_Employee
    )
    SELECT 
	    c1.ID_Employee,
        c1.CATEGORY, 
        c1.Total_Profit as  Rounded_Total_Profit, 
        ROUND(c1.Total_Profit * 100.0 / c2.Total_of_Total_Profit, 2) AS Profit_Percentage
    FROM CTE_1 c1
    JOIN CTE_2 c2 
	    ON c1.ID_Employee = c2.ID_Employee
    ORDER BY c1.ID_Employee, Profit_Percentage DESC
    
### Output:
![Picture-4.png](https://i.imgur.com/aIpAIUZ.png)
---

## QUESTION 5:
Develop a user-defined function in SQL Server to calculate the profitability ratio for each product category 
an employee has sold, and then apply this function to generate a report that sorts each employee's product categories
by their profitability ratio.

### CODE:
    CREATE FUNCTION     CalculateProfitabilityRatio (@Sales DECIMAL(18, 2), @Profit DECIMAL(18, 2))
    RETURNS DECIMAL(18, 2)
    AS
    BEGIN
        DECLARE @ProfitabilityRatio DECIMAL(18, 2);

    IF @Sales > 0
        SET @ProfitabilityRatio = @Profit / @Sales;
    ELSE
        SET @ProfitabilityRatio = 0; 
    RETURN @ProfitabilityRatio;
    END;
    GO
    
    SELECT
        e.ID_Employee,
        p.CATEGORY,
        ROUND (SUM(o.Sales),2) AS Total_Sales,
        ROUND (SUM(o.Profit),2) AS Total_Profit,
        ROUND ((SUM(o.Profit) / NULLIF(SUM(o.Sales), 0)),2) AS Profitability_Ratio 
    FROM [SQL_Test].[dbo].[EMPLOYEES] AS e
    JOIN ORDERS AS o 
	    ON e.ID_Employee = o.ID_Employee
    JOIN PRODUCT AS p 
	    ON o.Product_ID = p.ID
    GROUP BY e.ID_Employee, p.CATEGORY
    ORDER BY e.ID_Employee, Profitability_Ratio  DESC
    
### Output:
![Picture-5.png](https://i.imgur.com/HpD2T8z.png)

![Picture-5.png](https://i.imgur.com/LWjVJFe.png)
---

## QUESTION 6:
Write a stored procedure to calculate the total sales and profit for a specific EMPLOYEE_ID over a specified date range. 
The procedure should accept EMPLOYEE_ID, StartDate, and EndDate as parameters.


### CODE:
    CREATE PROCEDURE GetEmployeeSalesProfit
        @EmployeeID INT,
        @StartDate DATE,
     @EndDate DATE
    AS
    BEGIN
        SET NOCOUNT ON;

        SELECT
            e.Name AS EMPLOYEE_NAME,
            ROUND (SUM(o.Sales),2) AS TOTAL_SALES,
            ROUND (SUM(o.Profit),2) AS TOTAL_PROFIT
        FROM ORDERS o
        INNER JOIN EMPLOYEES e 
		    ON o.ID_Employee = e.ID_Employee
        WHERE
            o.ID_Employee = @EmployeeID
            AND o.Order_Date BETWEEN @StartDate AND @EndDate
        GROUP BY e.Name;
    END;

    EXEC GetEmployeeSalesProfit
        @EmployeeID = 3, 
        @StartDate = '2016-12-01', 
        @EndDate = '2016-12-31';
    
### Output:
![Picture-6.png](https://i.imgur.com/HpD2T8z.png)
---

## QUESTION 7:
Write a query using dynamic SQL query to calculate the total profit for the last six quarters in the datasets, 
pivoted by quarter of the year, for each state.

### CODE:
    -- SELECT DATEPART(YEAR, Order_Date) FROM [SQL_Test].[dbo].[ORDERS] 

    DECLARE @cols NVARCHAR(MAX);
    DECLARE @query NVARCHAR(MAX);

    -- Step 1: Get the latest 6 quarters
    WITH CTE_1 AS (
        SELECT DISTINCT 
            CONCAT('Q', DATEPART(QUARTER, o.Order_Date), '-', YEAR(o.Order_Date)) AS QuarterLabel,
            YEAR(o.Order_Date) AS Sales_Year,
            DATEPART(QUARTER, o.Order_Date) AS Sales_Quarter
        FROM [SQL_Test].[dbo].[ORDERS] o
    ),
    CTE_2 AS (
        SELECT TOP 6 QuarterLabel
        FROM CTE_1
        ORDER BY Sales_Year DESC, Sales_Quarter DESC
    )
    SELECT @cols = STRING_AGG(QUOTENAME(QuarterLabel), ', ')
    FROM CTE_2;

    -- Step 2: Build dynamic SQL
    SET @query = '
    SELECT State, ' + @cols + '
    FROM (
        SELECT 
            c.State,
            CONCAT(''Q'', DATEPART(QUARTER, o.Order_Date), ''-'', YEAR(o.Order_Date)) AS QuarterLabel,
            o.Profit
        FROM [SQL_Test].[dbo].[ORDERS] o
        JOIN [SQL_Test].[dbo].[CUSTOMER] c 
            ON o.Customer_ID = c.ID
    ) AS SourceTable
    PIVOT (
        SUM(Profit) FOR QuarterLabel IN (' + @cols + ')
    ) AS PivotTable
    ORDER BY State;';

-- Step 3: Execute dynamic SQL
EXEC sp_executesql @query;
    
### Output:
![Picture-7.png](https://i.imgur.com/F8wVDd6.png)
---

