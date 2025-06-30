# TATA_Dashboard
The data source can be found on  website at [this link](https://www.theforage.com/simulations/tata/data-visualisation-p5xo). The main objective of this project is to provide actionable insights to the CEO and CMO for strategic planning and expansion. The analysis will highlight high-performing areas, customer demographics, and marketing effectiveness to support data-driven decision-making.

[Preview_Dashboard](https://github.com/David-Tu-Nguyen/TATA_Dashboard/blob/main/1.%20Dashboard/TATA%20Dashboard.gif). 

## Main objective

- **Revenue Analysis:** Calculate total revenues, total customer, total orders,...
- **Revenur Trends:** Identify peak hours.
- **Store Performance:** Compare revenues performance across store locations.
- **Customer Insights:** Identify top-customers
- **Visualize Trends:** Enable visualization-ready data for further exploration.

The questions we will answer through this analysis are the following:

**1. Questions of interest to the CEO**
- Which region is generating the highest revenue, and which region is generating the lowest?
- What is the monthly trend of revenue, which months have faced the biggest increase/decrease?
- Which months generated the most revenue? Is there a seasonality in sales?
- Who are the top customers and how much do they contribute to the total revenue? Is the business dependent on these customers or is the customer base diversified?
  
**2. Questions of interest to the CMO**
- What is the percentage of customers who are repeating their orders? Are they ordering the same products or different?
- For the repeat customers, how long does it take for them to place the next order after being delivered the previous one?
- What revenue is being generated from the customers who have ordered more than once?
- Who are the customers that have repeated the most? How much are they contributing to revenue?

## Data dictionary
- Number of Rows: 531,283
- Number of Columns: 8
  
Column Name | Data Type | Description
| ------------- |:-------------:| :-------------:|
InvoiceNo | Varchar | Unique invoice number. If it starts with 'C', it indicates a cancellation.
StockCode | Varchar | Unique code for each item/product.
Description | Varchar | Description of the item/product.
Quantity | Integer | Number of items purchased per transaction.
InvoiceDate | datetime64 | Date and time of the transaction.
UnitPrice | Float | Price per unit of product (in GBP).
CustomerID | Float | Unique identifier for each customer.
Country | Varchar | Country of the customer.

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
- **Created calculated columns**: Time of Day, Date Hierarchy,...
- Create a check that the quantity should not be below 1 unit
- Create a check that the Unit price should not be below $0
  
## Insights

**Question 1**: The CEO of the retail store is interested to view the time series of the revenue data for the year 2011 only. He would like to view granular data by looking into revenue for each month. The CEO is interested in viewing the seasonal trends and wants to dig deeper into why these trends occur. This analysis will be helpful for the CEO to forecast for the next year.

- The average revenue was ~$130,500.
- We had a significant increase in revenue from July, with the revenue peaking at $0.22 million in October.
- The revenue trend demonstrates how seasonality affects retail store sales

**Question 2**: The CMO is interested in viewing the top 10 countries which are generating the highest revenue. Additionally, the CMO is also interested in viewing the quantity sold along with the revenue generated. The CMO does not want to have the United Kingdom in this visual.

- There is no significant difference between revenue and quantity of goods sold in the top 10 countries, except for the United Kingdom, which shows a much higher purchasing power.
- These countries have strong potential to generate more revenue and should be a key focus for marketing strategies.

**Question 3:** The CMO of the online retail store wants to view the information on the top 10 customers by revenue. He is interested in a visual that shows the greatest revenue generating customer at the start and gradually declines to the lower revenue generating customers. The CMO wants to target the higher revenue generating customers and ensure that they remain satisfied with their products.

- The chart shows that there is no significant difference among the top 10 customers in terms of revenue generated.
- The company should focus on strengthening relationships with these customers to improve loyalty and retention, ultimately increasing sales and revenue.

**Question 4:** The CEO is looking to gain insights on the demand for their products. He wants to look at all countries and see which regions have the greatest demand for their products. Once the CEO gets an idea of the regions that have high demand, he will initiate an expansion strategy which will allow the company to target these areas and generate more business from these regions. He wants to view the entire data on a single view without the need to scroll or hover over the data points to identify the demand. There is no need to show data for the United Kingdom as the CEO is more interested in viewing the countries that have expansion opportunities.

- The map shows that most sales are concentrated in Europe, with a small amount in the Americas.
- There is no market in Russia.
- The company can focus more on Europe and develop strategies to boost sales in each European country, as well as in Australia and Japan.

## Recommendations
1. The company should stock and advertise seasonal products when demand is high to boost sales.
2. It should analyze which products sell well during low-sales months and create marketing strategies around them.
3. Understanding which products generate the most revenue in each region can help guide local marketing plans.
4. Offering incentives to top customers can help build stronger relationships.
5. Since Europe shows strong potential, the company should focus on improving its market position there.
