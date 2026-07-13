# HR Employee Attrition Analysis Dashboard

## Project Overview

This project analyzes employee attrition data to identify workforce trends, uncover the key factors influencing employee turnover, and provide actionable business recommendations to improve employee retention.

The project covers the complete data analytics workflow, including:

- Data Cleaning
- Data Validation
- Feature Engineering
- Exploratory Data Analysis (EDA)
- Interactive Dashboard Development using Power BI
- Business Insight Generation
- Business Recommendation

---

## Business Objectives

The main objectives of this analysis are:

- Measure the company's overall employee attrition rate.
- Identify departments with the highest attrition.
- Discover which employee groups are more likely to resign.
- Analyze the key factors driving employee attrition.
- Provide business recommendations to reduce employee turnover.

---

## Dataset Information

| Item | Description |
|------|-------------|
| Dataset | HR Employee Attrition |
| Total Records | 1,470 |
| Total Columns | 43 |
| Data Source | IBM HR Analytics Employee Attrition (Kaggle) |

---

## Data Dictionary

| Column | Description |
|----------|-------------|
| EmpID | Employee Identifier |
| Age | Employee Age |
| Department | Employee Department |
| JobRole | Employee Job Position |
| Attrition | Employee Status (Yes / No) |
| Gender | Employee Gender |
| MaritalStatus | Marital Status |
| MonthlyIncome | Monthly Income |
| OverTime | Overtime Status |
| BusinessTravel | Business Travel Frequency |
| WorkLifeBalance | Work-Life Balance Rating |
| JobSatisfaction | Job Satisfaction Rating |
| EnvironmentSatisfaction | Work Environment Satisfaction |
| RelationshipSatisfaction | Relationship Satisfaction |
| JobInvolvement | Job Involvement Level |
| DistanceFromHome | Distance Between Home and Office |
| YearsAtCompany | Employee Tenure |
| YearsSinceLastPromotion | Years Since Last Promotion |

> **Note:** Only the most relevant columns are listed.

---

## Tools Used

- MySQL
- DBeaver
- Power BI
- GitHub

---

## Data Cleaning

The following data cleaning processes were performed:

- Checked missing values
- Checked duplicate records
- Validated categorical values
- Standardized inconsistent values
- Validated numerical columns
- Verified overall data quality before analysis

---

## Feature Engineering

Additional columns were created to enhance business analysis.

| Feature | Description |
|----------|-------------|
| AgeGroup | Employee age category |
| SalarySlab | Salary category |
| ExperienceCategory | Employee experience category |
| TenureCategory | Employee tenure category |
| PromotionStatus | Promotion category |
| DistanceCategory | Distance from home category |
| AgeGroup_Sort | Custom sorting for Age Group |
| SalarySlab_Sort | Custom sorting for Salary |
| ExperienceCategory_Sort | Custom sorting for Experience |
| TenureCategory_Sort | Custom sorting for Tenure |
| DistanceCategory_Sort | Custom sorting for Distance |

---

## Exploratory Data Analysis (EDA)

The analysis was conducted through several business questions.

### Overall Attrition

- Total Employees
- Total Attrition
- Attrition Rate

### Employee Profile Analysis

- Attrition by Department
- Attrition by Job Role
- Attrition by Age Group
- Attrition by Gender
- Attrition by Marital Status
- Attrition by Salary
- Attrition by Experience
- Attrition by Tenure
- Attrition by Promotion Status

### Potential Attrition Drivers

- Overtime
- Business Travel
- Distance From Home
- Work-Life Balance
- Job Satisfaction
- Environment Satisfaction
- Relationship Satisfaction
- Job Involvement

### Cross Analysis

- Department × Overtime
- Job Role × Overtime
- Department × Work-Life Balance
- Salary × Promotion
- Job Role × Salary

---

## Dashboard Overview

The dashboard consists of **two interactive pages**.

### Page 1 — Employee Profile Overview

Displays overall employee attrition statistics and identifies employee groups with the highest turnover.

#### KPI Metrics

- Total Employees
- Total Attrition
- Active Employees
- Attrition Rate

#### Analysis Sections

- Attrition by Department
- Top 5 Job Roles by Attrition
- Attrition by Age Group
- Attrition by Salary
- Attrition by Experience
- Attrition by Promotion Status

---

### Page 2 — Attrition Drivers

Analyzes factors associated with employee resignation.

#### Analysis Sections

- Attrition by Overtime
- Attrition by Business Travel
- Attrition by Distance From Home
- Attrition by Work-Life Balance
- Attrition by Job Satisfaction
- Attrition by Environment Satisfaction
- Attrition by Relationship Satisfaction
- Attrition by Job Involvement

---

## Key Insights

### 1. Overall Attrition

- The company recorded an attrition rate of **16.12%**, with **237 employees** leaving out of **1,470 employees**.

### 2. Department Analysis

- The **Sales** department has the highest attrition rate at **20.63%**.

### 3. Employee Profile

- **Sales Representatives** experience the highest turnover among all job roles.
- Employees aged **18–25 years** have the highest attrition rate.
- Employees earning **≤ 5K monthly income** are more likely to resign.

### 4. Attrition Drivers

- Employees working **Overtime** have a significantly higher attrition rate.
- Lower **Work-Life Balance** is associated with increased employee turnover.
- Frequent **Business Travel** contributes to higher attrition.
- Lower **Job Satisfaction** and **Environment Satisfaction** also correlate with higher resignation rates.

---

## Business Recommendations

Based on the analysis, the following recommendations can be considered:

- Reduce excessive overtime to improve employee well-being.
- Improve work-life balance through flexible work arrangements.
- Review compensation for lower salary groups.
- Develop targeted retention programs for the Sales department.
- Increase employee engagement and workplace satisfaction.
- Monitor employees with frequent business travel.

---

## Dashboard Preview

### Dashboard Page 1

![Dashboard Page 1](images/dashboard_page1.png)

---

### Dashboard Page 2

![Dashboard Page 2](images/dashboard_page2.png)

---

## Project Outcome

This project demonstrates end-to-end data analytics skills including:

- SQL Data Cleaning
- SQL Data Validation
- SQL Feature Engineering
- Exploratory Data Analysis (EDA)
- Data Visualization
- Business Insight Generation
- Business Recommendation
- Dashboard Development

---

## Repository Structure

```text
hr-employee-attrition-analysis/
│
├── dataset/
│   ├── employee_attrition_raw.csv
│   └── employee_attrition_clean.csv
│
├── sql/
│   ├── 01_data_cleaning.sql
│   ├── 02_feature_engineering.sql
│   └── 03_exploratory_data_analysis.sql
│
├── dashboard/
│   ├── HR_Employee_Attrition.pbix
│   ├── Dashboard_Page1.png
│   └── Dashboard_Page2.png
│
├── images/
│   ├── dashboard_page1.png
│   └── dashboard_page2.png
│
└── README.md
```

---

## Author

**Bachtiar Ramadhan**

Aspiring Data Analyst passionate about transforming raw data into actionable business insights using SQL, Power BI, and data storytelling.
