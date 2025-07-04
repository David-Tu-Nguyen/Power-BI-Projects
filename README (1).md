# Emergency_Room_Hospital_Dashboard
This dataset provides detailed patient data gathered from a hospital emergency room (ER) dashboard. It is a vital asset for healthcare analytics, aiming to explore patient demographics, treatment results, and the efficiency of ER operations.

[Preview_Dashboard](https://github.com/David-Tu-Nguyen/Emergency_Room_Hospital_Dashboard/blob/main/PowerBI_Dashboard/Dashboard_Snapshot.gif/).

## Main objective
The questions we will answer through this analysis are the following :
- How many patients visited the ER during a specific period?
- What is the average wait time for ER patients?
- What is the patient satisfaction score?
- How many patients were admitted vs. not admitted?
- What are the busiest days and hours for ER visits?
- Which departments refer the most patients to the ER?

## Data sources
It consists in 1 csv files :

Column Name | Data Type | Description
| ------------- |:-------------:| :-------------:|
date | DATETIME | Timestamp of the patient's ER visit (format: YYYY-MM-DD HH:MM:SS).
patient_id | VARCHAR | Unique identifier for each patient (anonymized ID).
patient_gender | CHAR | Patient’s gender. Common values: M (Male), F (Female).
patient_age | Integer | Patient's age in years.
patient_sat_score | Float | Patient satisfaction score (typically 1-10); NaN indicates missing data.
patient_first_inital | CHAR | First letter of the patient's first name.
patient_last_name | VARCHAR	 | Patient's last name (anonymized).
patient_race | VARCHAR	 | Self-reported race/ethnicity of the patient.
patient_admin_flag | Boolean | Indicates if the patient was admitted to the hospital (True = Admitted).
patient_waittime | Integer | Time (in minutes) the patient waited before being seen.
department_referral | 	VARCHAR | Department to which the patient was referred after ER visit (if applicable).

## Methodology and tools used
Tables
| Step  | Used Tools |
| ------------- |:-------------:|
|First Exploratory Data Analysis & Joining Tables     |     |
|Data Cleaning, Advanced Exploratory Data Analysis & First Visualizations  |  |
|Advanced Data Visualizations & Dashboard    |  Power BI    |

## Data Cleaning and Transformations
I cleaned the data in Power Query and created the following;
- **Created measures**: Total Patients, Average Satisfaction Score, Average Waittime in minutes.
- **Created calculated columns**: Time of Day, Date Hierarchy, Age Group.

## Insights
- During the period, the Emergency room had 9,216 patients visits and the overall Average Satisfaction Score was 5.47 out of 10. Only 50.04% of total patients were admitted to the hospital for further medical attention. The General Practice and Orthopedic Departments are the most departments to which patients are transferred after arriving at the emergency room.
- During patient visits, the waiting time before a patient could see a practitioner was 35 minutes on average.
- The majority of patient visits occur between April and October.
- The Average satisfaction was relatively uniform across all age-groups.

## Recommendations
**Reduce Waiting Times**
- The average waiting time before patients can see a practitioner is 35 minutes. Consider improving processes and ensuring efficient resource allocation to shorten wait times.
- Introduce solutions like priority lanes for less critical cases or utilize technology (e.g., scheduling apps) to better manage patient flow.


