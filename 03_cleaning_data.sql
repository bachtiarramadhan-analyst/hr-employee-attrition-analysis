/*
==========================================================
Project  : HR Employee Attrition Analysis
Author   : Bachtiar Ramadhan
DBMS     : MySQL
Tools    : DBeaver
Purpose  : Clean the dataset by handling missing values
           and inconsistent values before performing
           Exploratory Data Analysis (EDA).
==========================================================
*/

USE hr_attrition_project;

-- ======================================================
-- Create Table Cleaning
-- ======================================================
CREATE TABLE employee_attrition_clean AS
SELECT *
FROM employee_attrition;

-- ======================================================
-- 1. Preview Dataset
-- ======================================================
SELECT *
FROM employee_attrition_clean 
LIMIT 10;


-- ======================================================
-- 2.  Handle Missing Values in YearsWithCurrManager
-- ======================================================
SELECT 
	COUNT(YearsWithCurrManager) AS non_null_Years,
	COUNT(*) AS total_rows
FROM employee_attrition_clean;

SELECT 
	MIN(YearsWithCurrManager) AS Min_YearsWithManager,
	MAX(YearsWithCurrManager) AS Max_YearsWithManager,
	AVG(YearsWithCurrManager) AS avg_YearsWithManager
FROM employee_attrition_clean;

SELECT
    JobRole,
    COUNT(*) AS total_missing
FROM employee_attrition_clean
WHERE YearsWithCurrManager IS NULL
GROUP BY JobRole
ORDER BY COUNT(*) DESC;

SELECT
    YearsAtCompany,
    COUNT(*) AS total_missing
FROM employee_attrition_clean
WHERE YearsWithCurrManager IS NULL
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;

-- =========================================
-- Calculate the Average YearsWithCurrManager for Each Job Role
-- =========================================
SELECT
    JobRole,
    ROUND(AVG(YearsWithCurrManager),0) AS avg_manager
FROM employee_attrition_clean
WHERE YearsWithCurrManager IS NOT NULL
GROUP BY JobRole
ORDER BY JobRole;

-- =====================================
-- Replace Missing Values Using the Average of Each Job Role
-- =====================================
UPDATE employee_attrition_clean
SET YearsWithCurrManager = 3
WHERE YearsWithCurrManager IS NULL AND JobRole = 'Research Scientist';

UPDATE employee_attrition_clean
SET YearsWithCurrManager = 3
WHERE YearsWithCurrManager IS NULL AND JobRole = 'Laboratory Technician';

UPDATE employee_attrition_clean
SET YearsWithCurrManager = 5
WHERE YearsWithCurrManager IS NULL AND JobRole = 'Sales Executive';

UPDATE employee_attrition_clean
SET YearsWithCurrManager = 5
WHERE YearsWithCurrManager IS NULL AND JobRole = 'Manufacturing Director';

UPDATE employee_attrition_clean
SET YearsWithCurrManager = 5
WHERE YearsWithCurrManager IS NULL AND JobRole = 'Healthcare Representative';

UPDATE employee_attrition_clean
SET YearsWithCurrManager = 5
WHERE YearsWithCurrManager IS NULL AND JobRole = 'Research Director';

UPDATE employee_attrition_clean
SET YearsWithCurrManager = 6
WHERE YearsWithCurrManager IS NULL AND JobRole = 'Manager';

UPDATE employee_attrition_clean
SET YearsWithCurrManager = 3
WHERE YearsWithCurrManager IS NULL AND JobRole = 'Human Resources';

UPDATE employee_attrition_clean
SET YearsWithCurrManager = 2
WHERE YearsWithCurrManager IS NULL AND JobRole = 'Sales Representative';

-- ======================================
-- Validate Data After Missing Value Imputation
-- ======================================
SELECT 
	COUNT(YearsWithCurrManager) AS non_null_Years,
	COUNT(*) AS total_rows
FROM employee_attrition_clean;

SELECT
    JobRole,
    COUNT(*)
FROM employee_attrition_clean
WHERE YearsWithCurrManager IS NULL
GROUP BY JobRole
ORDER BY COUNT(*) DESC;

-- ======================================================
-- 3. Handle Inconsistent Values
-- ======================================================
SELECT DISTINCT BusinessTravel
FROM employee_attrition_clean;

UPDATE employee_attrition_clean
SET BusinessTravel = 'Travel_Rarely'
WHERE BusinessTravel = 'TravelRarely';

-- ======================================================
-- 4. Final Validation After Data Cleaning
-- ======================================================
SELECT
SUM(YearsWithCurrManager IS NULL)
FROM employee_attrition_clean;
-- Result:
-- No missing values found.

SELECT DISTINCT BusinessTravel
FROM employee_attrition_clean;
-- Result:
-- All values in BusinessTravel are now consistent.

select COUNT(*) AS Total_rows
from employee_attrition_clean;
-- Result:
-- The dataset contains 1,470 rows with no missing values.


/*
==========================================================
Data Cleaning Summary

Missing Values
 - Successfully imputed missing values in
   YearsWithCurrManager using the average value
   for each Job Role.

Inconsistent Values
 - Standardized inconsistent values in
   BusinessTravel.

Final Validation
 - No missing values remaining.
 - Total number of rows remains 1,470.
 - Dataset is ready for Feature Engineering.
==========================================================
*/