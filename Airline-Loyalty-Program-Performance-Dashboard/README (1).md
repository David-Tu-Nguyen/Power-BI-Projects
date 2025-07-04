# Airline-Loyalty-Program-Performance-Dashboard
The main objective of this project is to analyze loyalty program enrollments, cancellations and flights booked for Northern Lights Air (NLA) -a Canadian airline during the campaign from 1/2/2018 - 30/4/2018  and using Power BI.

[Preview_Dashboard](https://github.com/David-Tu-Nguyen/Airline-Loyalty-Program-Performance-Dashboard/blob/main/Dashboard/Recording%202025-06-03%20000214.gif). 

## Main objective
- **Prepare data for modeling**:
  + Explore and QA the data, and ensure that column headers and data types are accurate
  + Add columns to the Customer Loyalty History table to calculate the enrollment start of month and cancellation start of month
  + Add a column to Customer Flight Activity to calculate the flight booked start of month
  + Add a binary column to Customer Loyalty History to flag if a customer has canceled
- **Model and enhance data for analysis**:
  + Build a data model to connect the Calendar, Customer Loyalty History and Customer Flight Activity tables all the “start of month” fields.
  + Create DAX measures to calculate total enrollments (based on loyalty number) and total flights booked (based on flight activity). 
  + Create measures to calculate total cancellations and net loyalty members.
  + Create a measure to calculate the running total of net loyalty members over time
  + Create measures to calculate flights booked by loyalty members (based on start of month) and flights booked by loyalty members the previous year
- **Analyze loyalty program**:
  + Insert line charts to show total enrollments and cancellations by month. 
  + Insert column charts to show net loyalty members and the running total of net loyalty members by month. 
  + Insert a line chart to show loyalty member flights booked for the current and previous year, trended by month. Adjust layout & formatting for clarity.
  + Insert a stacked column chart to show loyalty member flights booked by enrollment type, trended by month, and add a slicer to filter the page by enrollment type.

The questions we will answer through this analysis are the following :
- Is the promotion program a success?
- How did the campaign influence loyalty program enrollment and cancellation rates?
- Did the campaign appeal more strongly to specific demographic segments (e.g., age, gender, location)?

## Data dictionary
Dataset contains 3 CSV tables :
- **Calendar Table:** Ensures consistency of date intervals for data modelling.
- **Customer Loyalty History Table**: Contains details of 16,000 customers, including location, education background, membership status, and cancellation status.
- **Customer Flight Activity Table:** Includes over 39,000 records including travel month and distance travelled per trip.
  
Column Name | Data Type | Description
| ------------- |:-------------:| :-------------:|
Loyalty Number | String | Customer's unique loyalty number
Year | Integer | Year of the period
Month | Varchar | Month of the period
Total Flights | Integer | Sum of flights booked (all tickets purchased in the period)
Distance | Float | Flight distance traveled in the period (km)
Points Accumulated | Integer | Loyalty points accumulated in the period
Points Redeemed | Integer | Loyalty points redeemed in the period
Dollar Cost Points Redeemed | Float | Dollar equivalent for points redeemed in the period in CDN
Country | String | Country of residence
Province | String | Province of residence
City | String | City of residence
Postal Code | String | Postal code of residence
Gender |	String |	Gender
Education |	String |	Highest education level (High school or lower > College > Bachelor > Master > Doctor)
Salary |	Float |	Annual income
Marital Status |	String |	Marital status (Single, Married, Divorced)
Loyalty Card |	String |	Loyalty card status (Star > Nova > Aurora)
CLV |	Float |	Customer lifetime value - total invoice value for all flights ever booked by member
Enrollment Type |	String |	Enrollment type (Standard / 2018 Promotion)
Enrollment Year |	Integer |	Year member enrolled in membership program
Enrollment Month |	Integer |	Month member enrolled in membership program
Cancellation Year |	Integer |	Year member cancelled their membership
Cancellation Month |	Integer |	Month member cancelled their membership



## Methodology and tools used
Tables
| Step  | Used Tools |
| ------------- |:-------------:|
|First Exploratory Data Analysis & Joining Tables     |     |
|Data Cleaning, Advanced Exploratory Data Analysis & First Visualizations  |  |
|Advanced Data Visualizations & Dashboard    |  Power BI     |

## Data Cleaning and Transformations
I cleaned the data in Power Query and created the following;
- Created a YYYY-MM identifier in the Calendar table to enable consistent joins across related tables.
- Merged the Year and Month columns in both the Customer Loyalty History and Customer Flight Activity tables to align with the unified date format.
- Cleaned the dataset by converting columns to appropriate data types, removing duplicate records, and handling null values to ensure data accuracy and integrity.

## Insights
1. **Is the promotion program a success?**
The year-over-year trend from 2017 to 2018 shows an overall increase. One of the main drivers of this growth in 2018 was the promotional activity.
During the 2018 promotion, there were approximately 9,000 additional enrollments compared to the previous year during the peak period. In terms of effectiveness, the promotion achieved its intended goals — it led to a noticeable increase in both flight bookings by loyalty members and new loyalty program sign-ups during the promotional period.

2. **Loyalty Customer Demographics (during the 2018 promotion):**
- Gender distribution is nearly equal, with 48.71% male and 50.14% female customers.
- Married individuals account for the highest number of flight bookings, followed by single and divorced customers.
- Customers with a Loyalty Card status of Star account for the highest number of flight bookings, followed by those with Nova and Auror cards.
- Customers with a Bachelor’s degree are the most frequent flyers, followed by those with a college-level education.
- The majority of loyalty customers reside in major Canadian cities, primarily Toronto, Vancouver, and Montreal.
  
3. **How did the campaign influence loyalty program enrollment and cancellation rates?**
The campaign had a positive impact on loyalty program performance. During the 2018 promotion, enrollment rates increased significantly, indicating that the campaign successfully attracted new members. At the same time, cancellation rates remained low, suggesting strong member retention and satisfaction with the program.

## Recommendations
- NLA target market would be Married & Single, with Bachelor & College education background and based in 3 major cities (Toronto, Vancouver, and Montreal)
- During off-peak months, specials promotions should be created; during peak seasons (April - September), premium packages should be promoted.
- NLA can create different marketing plans, like special travel deals for couples in February to celebrate the month of love.
