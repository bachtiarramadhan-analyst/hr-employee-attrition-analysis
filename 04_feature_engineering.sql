/*
==========================================================
Project  : HR Employee Attrition Analysis
Author   : Bachtiar Ramadhan
DBMS     : MySQL
Tools    : DBeaver
Purpose  : Create new features to enrich the dataset
           before performing Exploratory Data Analysis.
==========================================================
*/

USE hr_attrition_project;

-- ======================================================
-- 1. Feature Engineering
-- ======================================================

-- TenureCategory
-- ExperienceCategory
-- PromotionStatus
-- DistanceCategory

-- ======================================================
-- 2. Sort Columns for Power BI
-- ======================================================

-- AgeGroup_Sort
-- SalarySlab_Sort
-- ExperienceCategory_Sort
-- TenureCategory_Sort
-- DistanceCategory_Sort


-- ======================================================
-- 1. Add Tenure Category
-- ======================================================
ALTER TABLE employee_attrition_clean
ADD COLUMN TenureCategory VARCHAR(30);

UPDATE employee_attrition_clean
SET TenureCategory = 
CASE 
	WHEN YearsAtCompany <= 2 THEN 'New Employee' 
	WHEN YearsAtCompany <= 5 THEN 'Junior Employee'
	WHEN YearsAtCompany <= 10 THEN 'Mid-Tenure Employee'
	ELSE 'Long-Tenured Employee'
END;


-- ======================================================
-- 2. Add Experience Category
-- ======================================================
ALTER TABLE employee_attrition_clean
ADD COLUMN ExperienceCategory VARCHAR(20);

UPDATE employee_attrition_clean
SET ExperienceCategory =
CASE
	WHEN TotalWorkingYears <= 5 THEN 'Early Career'
	WHEN TotalWorkingYears <= 10 THEN 'Mid Career'
	else 'Experienced'
END;


-- ======================================================
-- 3. Add Promotion Status
-- ======================================================
ALTER TABLE employee_attrition_clean
ADD COLUMN PromotionStatus VARCHAR(30);

UPDATE employee_attrition_clean
SET PromotionStatus = 
CASE
	WHEN YearsSinceLastPromotion <= 2 THEN 'Recently Promoted'
	WHEN YearsSinceLastPromotion <= 6 THEN 'Promotion Due'
	ELSE 'Long Time Without Promotion'
END;


-- ======================================================
-- 4. Add Distance From Home Category
-- ======================================================
ALTER TABLE employee_attrition_clean
ADD COLUMN DistanceCategory VARCHAR(10);

UPDATE employee_attrition_clean
SET DistanceCategory =
CASE
	WHEN DistanceFromHome <= 5 THEN 'Near' 
	WHEN DistanceFromHome <= 15 THEN 'Moderate'
	ELSE 'Far'
END;


-- ======================================================
-- 5. Add AgeGroup_Sort
-- ======================================================
ALTER TABLE employee_attrition_clean
ADD COLUMN AgeGroup_Sort INT;

UPDATE employee_attrition_clean
SET AgeGroup_Sort =
CASE 
	WHEN AgeGroup = '18-25' THEN 1
	WHEN AgeGroup = '26-35' THEN 2
	WHEN AgeGroup = '36-45' THEN 3
	WHEN AgeGroup = '46-55' THEN 4
	WHEN AgeGroup = '55+' THEN 5
END;

-- ======================================================
-- 6. Add SalarySlab_Sort
-- ======================================================
ALTER TABLE employee_attrition_clean
ADD COLUMN SalarySlab_Sort INT;

UPDATE employee_attrition_clean
SET SalarySlab_Sort =
CASE 
	WHEN SalarySlab = 'Upto 5k' THEN 1
	WHEN SalarySlab = '5k-10k' THEN 2
	WHEN SalarySlab = '10k-15k' THEN 3
	WHEN SalarySlab = '15k+' THEN 4
END;

-- ======================================================
-- 7. Add ExperienceCategory_Sort
-- ======================================================
ALTER TABLE employee_attrition_clean
ADD COLUMN ExperienceCategory_Sort INT;

UPDATE employee_attrition_clean
SET ExperienceCategory_Sort =
CASE 
	WHEN ExperienceCategory = 'Early Career' THEN 1
	WHEN ExperienceCategory = 'Mid Career' THEN 2
	WHEN ExperienceCategory = 'Experienced' THEN 3
END;

-- ======================================================
-- 8. Add TenureCategory_Sort
-- ======================================================
ALTER TABLE employee_attrition_clean
ADD COLUMN TenureCategory_Sort INT;

UPDATE employee_attrition_clean
SET TenureCategory_Sort =
CASE 
	WHEN TenureCategory = 'New Employee' THEN 1
	WHEN TenureCategory = 'Junior Employee' THEN 2
	WHEN TenureCategory = 'Mid-Tenure Employee' THEN 3
	WHEN TenureCategory = 'Long-Tenured Employee' THEN 4
END;

-- ======================================================
-- 9. Add DistanceCategory_Sort
-- ======================================================
ALTER TABLE employee_attrition_clean
ADD COLUMN DistanceCategory_Sort INT;

UPDATE employee_attrition_clean
SET DistanceCategory_Sort =
CASE 
	WHEN DistanceCategory = 'Near' THEN 1
	WHEN DistanceCategory = 'Moderate' THEN 2
	WHEN DistanceCategory = 'Far' THEN 3
END;

-- ======================================================
-- 10. Validate New Features
-- ======================================================

-- ============================
-- Check New Columns
-- ============================
DESCRIBE employee_attrition_clean;

-- ============================
-- Check Unique Values
-- ============================
SELECT DISTINCT TenureCategory
FROM employee_attrition_clean;

SELECT DISTINCT ExperienceCategory
FROM employee_attrition_clean;

SELECT DISTINCT PromotionStatus
FROM employee_attrition_clean;

SELECT DISTINCT AgeGroup_Sort
FROM employee_attrition_clean;

SELECT DISTINCT SalarySlab_Sort
FROM employee_attrition_clean;

SELECT DISTINCT ExperienceCategory_Sort
FROM employee_attrition_clean;

SELECT DISTINCT TenureCategory_Sort
FROM employee_attrition_clean;

SELECT DISTINCT DistanceCategory_Sort
FROM employee_attrition_clean;


-- ============================
-- Check Category Distribution
-- ============================
SELECT
    TenureCategory,
    COUNT(*) AS TotalEmployee
FROM employee_attrition_clean
GROUP BY TenureCategory;

SELECT
    ExperienceCategory,
    COUNT(*) AS TotalEmployee
FROM employee_attrition_clean
GROUP BY ExperienceCategory;

SELECT
    PromotionStatus,
    COUNT(*) AS TotalEmployee
FROM employee_attrition_clean
GROUP BY PromotionStatus;

SELECT
    DistanceCategory,
    COUNT(*) AS TotalEmployee
FROM employee_attrition_clean
GROUP BY DistanceCategory;

-- ============================
-- Check Missing Values
-- ============================
SELECT
    SUM(TenureCategory IS NULL) AS TenureCategory,
    SUM(ExperienceCategory IS NULL) AS ExperienceCategory,
    SUM(PromotionStatus IS NULL) AS PromotionStatus,
    SUM(DistanceCategory IS NULL) AS DistanceCategory
FROM employee_attrition_clean;

-- =============================
-- Preview Result
-- =============================
SELECT
    DistanceFromHome,
    DistanceCategory,
	YearsAtCompany,
    TenureCategory,
    TotalWorkingYears,
    ExperienceCategory,
    YearsSinceLastPromotion,
    PromotionStatus
FROM employee_attrition_clean
LIMIT 20;
