# Pizza_Dashboard
Analyzed data for a pizza manufacturing and distribution company to identify insights and suggest improvements for business performance.
[Preview_Dashboard](https://github.com/David-Tu-Nguyen/Coffee_Shop_Sales_Analysis/blob/main/PowerBI_Dashboard/Dashboard_Snapshot.gif/). 

## Main objective

**1. KPIs:** Create KPI cards displaying the following metrics: Total Revenue, Total Quantity Sold, Total Orders, Average Order Value and Average Pizza per Order.

**2. Sales Trends and Anomalies**

a. Analyze and present daily, weekly, and monthly sales trends across 2015.

b. Identify peak sales periods, patterns, and any seasonal trends.

c. Investigate sales performance by day of the week and time of day.

d. Examine and identify the potential causes behind significant sales spikes or drops on specific dates throughout the year.

   
**3. Product Performance Analysis**

   a. Rank pizza categories by total quantity sold and revenue generated.
   
   b. Identify the top 5 and bottom 5 pizzas by both quantity and revenue.
   
**4. Size and Ingredient Analysis**

   a. Analyze the relationship between pizza size and sales volume within each category.
   
   b. Identify the most and least popular ingredients for each pizza category based on quantity sold.
   
**5. Order and Ingredient Correlations**

   a. Investigate the correlation between revenue and quantity sold by specific ingredients. Use two average reference lines to segment the ingredients into four distinct groups for comparison.
   
   b. Explore the correlation between average pizza prices and sales volume across categories. Include a trend line and calculate the correlation coefficient between the two variables.
   
**6. Order Frequency and Timing**

   a. Analyze the frequency of single-item vs. multi-item orders.
   
   b. Examine the average time interval in minutes between orders.

## Data dictionary
- Number of Rows: 48620
- Number of Columns: 10
  
| **Column Name** | **Data Type** | **Description**                                            |
| --------------- | ------------- | ---------------------------------------------------------- |
| `order_id`      | Text/ID       | Unique identifier for each order placed by a transaction.  |
| `date`          | Date          | Date the order was placed (entered into the system).       |
| `time`          | Time          | Time the order was placed (entered into the system).       |
| `quantity`      | Integer       | Quantity ordered for each pizza of the same type.          |
| `pizza_id`      | Text/ID       | Unique identifier for each pizza (includes size and type). |


## Methodology and tools used
Tables
| Step  | Used Tools |
| ------------- |:-------------:|
|First Exploratory Data Analysis & Joining Tables     |     |
|Data Cleaning, Advanced Exploratory Data Analysis & First Visualizations  |  |
|Advanced Data Visualizations & Dashboard    |  Power BI     |

## Data Cleaning and Transformations
I cleaned the data in Power Query and created the following;
- **Created measures**: Total Revenues, Total Orders, Total quantity,...
- **Created calculated columns**: Time of Day, Date Hierarchy,...
- Created day and time to identifier in the Calendar table to enable consistent joins across related tables.

## Insights
**1. Sales Trends and Anomalies**

a. Daily, Weekly, and Monthly Sales Trends (2015
- **Daily trend:** Sales are highest on Fridays , closely followed by Saturdays. The lowest sales occur on Sundays 
- **Weekly trend:** Weekdays account for 72.8% of total revenue, while weekends contribute 27.2%. This suggests a strong weekday preference, but with notable peaks at the start of the weekend
- **Monthly trend:** July is the top-performing month for both orders and revenue, followed by November and January. September, Octorber, December, and Febuary are the slowest months. 

b. Peak Sales Periods, Patterns, and Seasonal Trends
- **Peak Periods:** The busiest months are July and May, with July generating the highest revenue ($72.56K). Fridays and Saturdays are the peak sales days each week.
- **Seasonal Trends:** Sales are strongest in mid-year (summer), with a drop-off in the fourth quarter. December, despite being a festive month, does not show a significant peak, suggesting an opportunity for targeted promotion
- **Patterns:** Lunch (12–1pm) and dinner (6–8pm) are the busiest times of day, with the majority of orders placed during these hours
c. Sales by Day of the Week and Time of Day
- **By Day:** Friday is the busiest day, followed by Saturday. Monday and Sunday are the slowest.
- **By Time:** Sales peak during lunch (12–1pm) and dinner (6–8pm). The lowest sales occur in the early morning and late night hour

d. Potential Causes Behind Sales Spikes or Drops
- **Spikes:** Peaks align with weekends, holidays, and lunchtime/dinnertime rushes. July's spike may be attributed to summer holidays and increased social gatherings.
- **Drops:** Declines in October and November may be due to seasonal slowdowns or fewer promotional activities. Sundays and Mondays are consistently slow, possibly due to lower dining-out frequency at week’s start and end
**2. Product Performance Analysis**
  
a. Rank pizza categories by total quantity sold and revenue generated.

| Category | Quantity Sold | Revenue Generated |
| -------- | ------------- | ----------------- |
| Classic  | 14,888 (1)| $220,053.10 (1) |
| Supreme  | 11,987 (2)| $208,197.00 (2)|
| Veggie  | 11,649 (3)| $193,690.45 (4)|
| Chicken  | 11,050 (4)| $195,919.50 (3)|

b. Identify the top 5 and bottom 5 pizzas by both quantity and revenue.
**- Top 5 Pizzas by Revenue**
- Thai Chicken Pizza - $43,000 (5.3% of total revenue)
- Barbecue Pizza - $41,000 (5.0% of total revenue)
- Californian Pizza - $41,000 (5.0% of total revenue)
- Classic Deluxe Pizza - $38,000 (4.7% of total revenue)
- Spicy Italian Pizza - $35,000 (4.3% of total revenue)

**- Top 5 Pizzas by Quantity**
- Classic Deluxe Pizza - 2,500 pizzas sold
- Barbecue Pizza - 2,400 pizzas (4.8% of total)
- Hawaiian Pizza - 2,400 pizzas (4.8% of total)
- Pepperoni Pizza 
- Thai Chicken Pizza 

**- Bottom 5 Pizzas by Revenue**
- Brie Carre Pizza - $12,000 
- Green Garden Pizza - $14,000
- Spinach Pizza - $15,000 
- Mediterranean Pizza - $15,000 
- Spinach Pesto Pizza - $15,000 


**- Bottom 5 Pizzas by Quantity**
- Brie Carre Pizza - 490 pizzas sold 
- Mediterranean Pizza - 934 units 
- Calabrese Pizza - 937 units (1.89% of total)
- Spinach Supreme Pizza - 950 units 
- Soppressata Pizza - 961 units

**3. Size and Ingredient Analysis**

a. Analyze the relationship between pizza size and sales volume within each category.

Large (L) pizzas are the most popular size, generating the highest revenue . XXL size has extremely low demand and is recommended for removal from the menu

b. Identify the most and least popular ingredients for each pizza category based on quantity sold.

**Most Popular:**

- Classic:  Red, mushrooms, bacon, onions, pepperoni, peppers 
- Supreme: sausage, garlic, luganega, green, salami, coarse, onions, sicilian, tomatoes, olivers
- Chicken: Red, mushrooms, bacon, onions, pepperoni, peppers 
- Veggie: Cheese

**Least Popular:**

- Classic: green, ppepperoni, mushrooms, peppers
- Supreme: pears, thyme, caramelized, garlic, cheese, brie, carre, prosciutto, onions
- Chicken: pears, thyme, caramelized, garlic, cheese, brie, carre, prosciutto, onions
- Veggie: tomatoes

**4. Order and Ingredient Correlations**

a. Revenue vs. Quantity Sold by Ingredient

The scatter plot is divided using two average reference lines (vertical = quantity; horizontal = revenue), creating four segments:

- **Top Right (High Quantity, High Revenue):** Most profitable and popular ingredients (keep or promote).
- **Top Left (Low Quantity, High Revenue):** High-margin but less frequent — explore upselling.
- **Bottom Right (High Quantity, Low Revenue):** Common but low-margin — consider price adjustments.
- **Bottom Left (Low Quantity, Low Revenue):** Least effective — consider discontinuation.

b. Correlation Between Price and Sales Volume

- Correlation Coefficient: 0.01 (very weak correlation)
- Higher prices do not significantly affect sales volume across categories, indicating price elasticity is low for this product range

**5. Order Frequency and Timing**

a. Single-item vs. Multi-item Orders

- Multi-item orders: 61.6% (13,000 orders)
- Single-item orders: 38.4% (8,000 orders)
Multi-item orders are more common, suggesting group dining or family orders

b. Average Time Interval Between Orders
- **Average interval:** 23.28 minutes between orders, indicating steady demand throughout operating hours
## Recommendations
- During off-peak hours (before 10 AM and after 9 PM), consider reducing operational costs, such as by changing opening hours at 11AM
- Launching a campaign in September–October to combat seasonal revenue drops.
- Focusing marketing efforts on the top-selling pizzas like Thai Chicken, Barbecue, and Hawaiian
- Consider removing XXL pizzas
- Upselling drinks, sides, or desserts with multi-item bundles to increase average order value.

