# Coffee_Shop_Sales_Analysis
The data source can be found on kaggle website at [this link](https://www.kaggle.com/datasets/divu2001/coffee-shop-sales-analysis/data/). The main objective of this project is to evaluate the sales of three coffee shop locations using Power BI.

[Preview_Dashboard](https://github.com/David-Tu-Nguyen/Coffee_Shop_Sales_Analysis/blob/main/PowerBI_Dashboard/Dashboard_Snapshot.gif/). 

## Main objective

- **Revenue Analysis:** Calculate total sales,...
- **Visitor Trends:** Identify peak hours.
- **Store Performance:** Compare sales performance across store locations.
- **Product Insights:** Identify top-selling items.
- **Category Contribution:** Analyze category-wise sales distribution and contributions to total revenue.
- **Visualize Trends:** Enable visualization-ready data for further exploration.

The questions we will answer through this analysis are the following :
- What is the number of orders?
- Which store location has the highest sales?
- What are the best-selling product types?
- What is the trend of total sales over the months covered in the data?
- What are the peak hours for sales?
- How do sales vary across days of the week?
- Are there any notable correlations between unit price and?
...

## Data dictionary
- Number of Rows: 149116
- Number of Columns: 18
  
Column Name | Data Type | Description
| ------------- |:-------------:| :-------------:|
Transaction_ID | Integer | Unique identifier for each transaction.
Transaction_Date | DateTime | Date and time when the transaction occurred.
Product_Name | Varchar | Name of the product sold (e.g., Espresso, Latte).
Product_Category | Varchar | Category of the product (e.g., Hot Beverage, Cold Beverage, Pastry).
Quantity_Sold | Integer | Number of units sold in the transaction.
Unit_Price | Float | Price per unit of the product.
Total_Sales | Float | Total revenue from the transaction (Quantity_Sold × Unit_Price).
Payment_Method | Varchar | Mode of payment used (e.g., Cash, Credit Card, Mobile Payment).
Customer_Age_Group | Varchar | Age group of the customer (e.g., 18-24, 25-34).
Customer_Gender | Varchar | Gender of the customer (e.g., Male, Female).
Store_Location | Varchar | Location of the store where the transaction took place.
Day_of_Week | Varchar | Day of the week when the transaction occurred (e.g., Monday, Tuesday).
Time_of_Day | Varchar | Time period of the day (e.g., Morning, Afternoon, Evening).
Season | Varchar | Season during which the transaction occurred (e.g., Winter, Summer).

## Methodology and tools used
Tables
| Step  | Used Tools |
| ------------- |:-------------:|
|First Exploratory Data Analysis & Joining Tables     |     |
|Data Cleaning, Advanced Exploratory Data Analysis & First Visualizations  |  |
|Advanced Data Visualizations & Dashboard    |  Power BI     |

## Data Cleaning and Transformations
I cleaned the data in Power Query and created the following;
- **Created measures**: Total Sales, Total Orders, Total quantity,...
- **Created calculated columns**: Time of Day, Date Hierarchy, Linear Regression Prediction,...

## Insights
**Revenue and transactions**
- Monthly sales have consistently grown since the second month (February), reaching their peak in the sixth month (June) across all stores.
- 72.06% of revenue is generated during weekdays for all stores
- On weekdays, Hell's Kitchen experiences its highest sales on Friday and Tuesday, signifying these as the busiest days. Similarly, Astoria's busiest weekdays are Thursday and Monday. Lower Manhattan's busiest weekday is Monday.

**Store hours**
- Hell's Kitchen and Lower Manhattan operate from 6:00 to 20:00, while Astoria is open from 7:00 to 19:00.
- Peak hours for Hell's Kitchen and Lower Manhattan are between 6:00 AM and 10:00 AM.
- Astoria experiences its busiest period from 7:00 to 10:00, consistently throughout the week and on weekends.
  
> Although Lower Manhattan generates the lowest total revenue, it records the highest sales during peak hours compared to the other locations. In contrast, Astoria achieves the highest sales during non-peak hours among all stores, despite having shorter operating hours.

**Top 3 product and category across all 3 stores.**

a) **Coffee** generated $269,952 in revenue, accounting for 38.6% of total sales, making it the highest-performing product category across all branches.
- Top coffee item at each location:
* Astoria: Barista Espresso (~$27K)
* Hell’s Kitchen: Barista Espresso (~$32K)
* Lower Manhattan: Barista Espresso (~$31K)

b) **Tea** sales make up 27.7% of the total combined revenue from the three stores, amounting to $196,406.
- Leading tea products by store:
* Astoria: Brewed Chai Tea (Spicy Eye Opener Chai, Large) – approx. $27K
* Hell’s Kitchen: Brewed Chai Tea (Morning Sunrise Chai, Regular) – approx. $26K
* Lower Manhattan: Brewed Chai Tea (Morning Sunrise Chai, Regular) – approx. $24K

c) **Bakery** items generated $82,316 in sales, contributing 12.3% to the total revenue across all stores, ranking as the third best-selling product category.

## Recommendations
- Leverage data from peak hours and top-performing days to optimize staffing and inventory distribution.
- Target underperforming locations for improvement while replicating successful strategies from high-performing stores.
- Distribute marketing resources according to the revenue share of each product category.
