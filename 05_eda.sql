/*
==========================================================
Project  : HR Employee Attrition Analysis
Author   : Bachtiar Ramadhan
DBMS     : MySQL
Tools    : DBeaver
Purpose  :  Exploratory Data Analysis(EDA)
==========================================================
*/

USE hr_attrition_project;

-- ======================================================
-- 1. Preview Dataset
-- ======================================================
SELECT *
FROM employee_attrition 
LIMIT 10;


-- ======================================================
-- 2. Overall Employee Attrition
-- ======================================================
-- How many employees left the company?
SELECT 
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean;


-- ======================================================
-- 3. Employee Profile Analysis (WHO leaves?)
-- ======================================================

-- ===============================================
-- Which department has the highest attrition?
-- ===============================================
SELECT 
	Department,
	COUNT(*) Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY Department
ORDER BY Attrition_rate DESC;

-- ==============================================
-- Which employees are more likely to resign?
-- ==============================================
-- Attrition by JobRole
SELECT 
	JobRole,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY JobRole
ORDER BY Attrition_rate DESC, Total_Attrition desc;

-- Attrition by AgeGroup
SELECT
	AgeGroup,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY AgeGroup
ORDER BY Attrition_rate DESC;

-- Attrition by Gender
SELECT 
	Gender,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY Gender
ORDER BY Attrition_rate DESC;

-- Attrition by Marital Status
SELECT 
	MaritalStatus,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY MaritalStatus
ORDER BY Attrition_rate DESC;

-- Attrition by SalarySlab
SELECT 
	SalarySlab,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY SalarySlab
ORDER BY Attrition_rate DESC;

-- Attrition by Experience Category
SELECT 
	ExperienceCategory,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY ExperienceCategory
ORDER BY Attrition_rate DESC;

-- Attrition by Tenure Category
SELECT 
	TenureCategory,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY TenureCategory
ORDER BY Attrition_rate DESC;

-- Attrition by Promotion Status
SELECT 
	PromotionStatus,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY PromotionStatus
ORDER BY Attrition_rate DESC;

-- =======================================
-- Top 5 Highest Attrition by JobRole
-- =======================================
SELECT 
	JobRole,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY JobRole
ORDER BY Attrition_rate DESC, Total_Attrition DESC
LIMIT 5;
-- ======================================================
-- 4. Potential Attrition Drivers (WHY leave?)
-- ======================================================
-- Why do they resign?

-- Attrition by OverTime
SELECT 
	OverTime,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS Attrition_Rate
FROM employee_attrition_clean
GROUP BY OverTime
ORDER BY Attrition_Rate DESC;

-- Attrition by Business Travel
SELECT 
	BusinessTravel,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY BusinessTravel
ORDER BY Attrition_rate DESC;

-- Attrition by Distance From Home
SELECT 
	DistanceCategory,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY DistanceCategory
ORDER BY Attrition_rate DESC;

-- Attrition by Work Life Balance
SELECT 
	WorkLifeBalance,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY WorkLifeBalance
ORDER BY Attrition_rate DESC;

-- Attrition by Job Satisfaction
SELECT 
	JobSatisfaction,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY JobSatisfaction
ORDER BY Attrition_rate DESC;

-- Attrition by Environment Satisfaction
SELECT 
	EnvironmentSatisfaction,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY EnvironmentSatisfaction
ORDER BY Attrition_rate DESC;

-- Attrition by Relationship Satisfaction
SELECT 
	RelationshipSatisfaction,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY RelationshipSatisfaction
ORDER BY Attrition_rate DESC;

-- Attrition by Job Involvement
SELECT 
	JobInvolvement,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY JobInvolvement
ORDER BY Attrition_rate DESC;


-- ======================================================
-- 5. Cross Analysis
-- ======================================================

-- =================================
-- WORK LOAD
-- =================================
-- Department × Overtime
SELECT
    Department,
    OverTime,
    COUNT(*) AS Total_Employee,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS Attrition_Rate
FROM employee_attrition_clean
GROUP BY Department, OverTime
ORDER BY Attrition_Rate DESC;

-- JobRole × Overtime
SELECT
    JobRole,
    OverTime,
    COUNT(*) AS Total_Employee,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS Attrition_Rate
FROM employee_attrition_clean
GROUP BY JobRole, OverTime
ORDER BY Attrition_Rate DESC; 

-- =================================
-- COMPENSATION
-- =================================
-- Salary × Promotion
SELECT 
	SalarySlab,
	PromotionStatus,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY SalarySlab, PromotionStatus
ORDER BY Attrition_rate DESC;

-- Job Role x Salary
SELECT 
	JobRole,
	COUNT(*) AS Total_Employee,
	SalarySlab,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY JobRole, SalarySlab
ORDER BY Attrition_rate DESC;

-- =================================
-- ORGANIZATION
-- =================================
-- Department x Job Role
SELECT 
	Department,
	JobRole,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY Department, JobRole
ORDER BY Attrition_rate DESC;

-- Department × WorkLifeBalance
SELECT 
	Department,
	WorkLifeBalance,
	COUNT(*) AS Total_Employee,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS Attrition_rate
FROM employee_attrition_clean
GROUP BY Department, WorkLifeBalance
ORDER BY Attrition_rate DESC;