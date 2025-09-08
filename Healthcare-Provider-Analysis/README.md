# Healthcare-Provider-Analysis
Healthcare provider analysis in UK, using Power BI.

# 1.Project Background
The project's background is to analyze a healthcare dataset and create a comprehensive dashboard to present the findings. [Link data](https://github.com/David-Tu-Nguyen/Power-BI-Projects/tree/main/Healthcare-Provider-Analysis/Source)

This project involves connecting and profiling the data, creating a relational data model, adding calculated measures and fields, and building an interactive report to support data-driven decision-making.

Insights and recommendations are provided on the following key areas:

  **- Financial Analysis:** Summarize the financial health of the healthcare center.
  
  **- Trends Analysis:**  Highlight any important trends over time.
  
  **- Provider Analisi Analysis:**  Analyze the performance and efficiency of healthcare providers.

_An interactive PowerBI dashboard can be downloaded_ [here](https://app.fabric.microsoft.com/view?r=eyJrIjoiNmU3MDEyYWItYTU5NS00YzE4LTg2ODQtM2JjYWUwNGM3MjMzIiwidCI6IjE3MmIzNzFmLWQwYjAtNGVlZS05YWNmLWVjMjI3MWVhZTAzZCJ9)

# 2.Data Structure, Data Model & Initial Checks 
**Healthcare Provider's database structure** as seen below consists of 8 tables.

![](https://i.imgur.com/1rIIJIy.png)

Prior to beginning the analysis, a variety of checks were conducted for quality control and familiarization with the datasets.

# 3. Executive Summary
## 3.1. **Financial Analysis**
![](https://i.imgur.com/RtCij7y.png)

- The healthcare center generated £3M in billing, with treatment costs as the largest driver (£3M) and insurance covering £2M, leaving patients with £1M out-of-pocket. Treatment is the key contributor, but patient cost burden remains significant.

- Billing is geographically concentrated in Edinburgh, Birmingham, and Sheffield, highlighting reliance on a few regions and potential growth opportunities elsewhere.

- By procedure, X-Ray (£1.05M), CT (£805K), and MRI (£600K) dominate revenue, showing strong dependence on diagnostic imaging.

- Across departments, Cardiology, Orthopedics, and General Surgery generate nearly 75% of total revenue, forming the core of financial performance.

- Most diagnoses drive revenue through outpatient services.

## 3.2. Trends Analysis
![](https://i.imgur.com/dCt5Qr3.png)
- Annual Decline: The center's billing dropped significantly by 29.6% from 2024 to 2025 (£1.4M to £672.9K).

- Quarterly Drop: Revenue got worse throughout the year, with a 63.6% decrease from the first quarter to the last.

- Big Monthly Swings: Billing was very inconsistent. January had a huge increase (+352.7%), but October saw a steep drop (-85.6%).

- Weak Weekends: Weekday billing was much higher (£2.4M) than weekend billing (£949K), showing a 60.6% difference.

- Daily Inefficiency: Wednesdays were the best day (+28.7% change), while Sundays were the worst (-18.5% decline).

![](https://i.imgur.com/zj1ih76.png)
- Neurology is the Strongest Performer: While all departments experienced a decline, Neurology had the smallest annual drop at -7.2%, making it the most resilient department. This suggests it has the most stable patient base and operations.

![](https://i.imgur.com/SlFWQtX.png)
- Cardiology is the Weakest Performer: Cardiology showed the most severe decline, with a -74.1% drop in annual billing. This department requires immediate attention to identify the root causes of this sharp decrease.

- General Surgery and Orthopedics are Struggling: These two departments are performing similarly poorly, with annual declines of -51.0% and -54.4%, respectively. They are major contributors to the center's overall financial downturn.

- All Departments Have a Weekend Problem: A consistent and critical insight across all departments is the significant underutilization of resources on weekends. Every department showed weekend billing that was more than 55% lower than weekday billing. This is a systemic issue.

## 3.3.**Provider Analysis**
  
![](https://i.imgur.com/44Wm0iz.png)
The center serves a large number of outpatients (3,768 total) compared to admitted patients (1,232 total). This suggests that the center's business model is heavily reliant on scheduled, non-emergency visits.

- The dashboard shows a clear disparity in provider ratings. While Dr. Emma Jones and Dr. Johnson Grek have high ratings of 4.85 and 5.05, others like Dr. Ravi Patel (3.36) and Dr. Sadie Kikiola (2.36) have significantly lower scores. These ratings could be tied to patient satisfaction and may correlate with the financial performance of their respective departments

- Patient visits are split between non-emergency (61%) and emergency (39%) cases. The majority of admitted patients have a length of stay between 2-4 days, with some staying for longer periods.

## 4.Deep-Dive Dashboard Exploration
### 4.1.Root-Cause Analysis - "Cardiology Department" Underperformance
![](https://i.imgur.com/iOaTPCJ.png)

- Poor Provider Ratings: Two of the center's providers, Dr. Ravi Patel (2.77 rating) and Dr. Sadie Kikiola (2.20 rating), are associated with the Cardiology department. These significantly low ratings suggest potential issues with patient satisfaction, quality of care, or communication. Low ratings could be directly driving a decrease in patient visits and referrals.

### 4.2.Root-Cause Analysis - "Neurology Department" is the Strongest Performer
![](https://i.imgur.com/GbFSI2q.png)

- High-Performing Provider: The department has a top-rated provider, Dr. Olu Abisola, with an average rating of 5.67. High patient satisfaction likely contributes to patient retention and new referrals, which stabilizes the department's patient volume.

- Balanced Patient Mix: The department handles a healthy mix of visits, with 60% non-emergency and 40% emergency, demonstrating its ability to manage both scheduled and urgent care needs effectively.

## 5.Recommendation
- **Boost Weekend Revenue:** Address the 60.6% drop in weekend billing by expanding service hours and promoting high-revenue procedures like X-Rays and MRIs to increase utilization.

- **Investigate Cardiology:** Urgently investigate the -74.1% annual decline in Cardiology's billing, focusing on low provider ratings as a potential root cause.

- **Leverage Neurology's Success:** Study the Neurology department's resilient performance and its high-rated providers to build a model for stabilizing revenue across all departments.

- **Improve Patient Experience:** Address the low provider ratings for Dr. Ravi Patel (2.77) and Dr. Sadie Kikiola (2.20) by implementing a quality improvement plan to boost patient satisfaction and referrals.
