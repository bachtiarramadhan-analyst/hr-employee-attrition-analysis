/*
==========================================================
Project  : HR Employee Attrition Analysis
Author   : Bachtiar Ramadhan
DBMS     : MySQL
Tools    : DBeaver
Purpose  : Validate dataset before data cleaning process.
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
-- 1. Preview Data
-- ======================================================
SELECT *
FROM employee_attrition_clean
LIMIT 10;


-- ======================================================
-- 2. Check Total Rows
-- ======================================================
SELECT COUNT(*) AS Total_row
FROM employee_attrition_clean;


-- ======================================================
-- 3. Check Table Structure
-- ======================================================
DESCRIBE employee_attrition_clean;


-- ======================================================
-- 4. Check Missing Values
-- ======================================================
SELECT
    SUM(EmpID IS NULL) AS EmpID,
    SUM(Age IS NULL) AS Age,
    SUM(AgeGroup IS NULL) AS AgeGroup,
    SUM(Attrition IS NULL) AS Attrition,
    SUM(BusinessTravel IS NULL) AS BusinessTravel,
    SUM(DailyRate IS NULL) AS DailyRate,
    SUM(Department IS NULL) AS Department,
    SUM(DistanceFromHome IS NULL) AS DistanceFromHome,
    SUM(Education IS NULL) AS Education,
    SUM(EducationField IS NULL) AS EducationField,
    SUM(EmployeeCount IS NULL) AS EmployeeCount,
    SUM(EmployeeNumber IS NULL) AS EmployeeNumber,
    SUM(EnvironmentSatisfaction IS NULL) AS EnvironmentSatisfaction,
    SUM(Gender IS NULL) AS Gender,
    SUM(HourlyRate IS NULL) AS HourlyRate,
    SUM(JobInvolvement IS NULL) AS JobInvolvement,
    SUM(JobLevel IS NULL) AS JobLevel,
    SUM(JobRole IS NULL) AS JobRole,
    SUM(JobSatisfaction IS NULL) AS JobSatisfaction,
    SUM(MaritalStatus IS NULL) AS MaritalStatus,
    SUM(MonthlyIncome IS NULL) AS MonthlyIncome,
    SUM(SalarySlab IS NULL) AS SalarySlab,
    SUM(MonthlyRate IS NULL) AS MonthlyRate,
    SUM(NumCompaniesWorked IS NULL) AS NumCompaniesWorked,
    SUM(Over18 IS NULL) AS Over18,
    SUM(OverTime IS NULL) AS OverTime,
    SUM(PercentSalaryHike IS NULL) AS PercentSalaryHike,
    SUM(PerformanceRating IS NULL) AS PerformanceRating,
    SUM(RelationshipSatisfaction IS NULL) AS RelationshipSatisfaction,
    SUM(StandardHours IS NULL) AS StandardHours,
    SUM(StockOptionLevel IS NULL) AS StockOptionLevel,
    SUM(TotalWorkingYears IS NULL) AS TotalWorkingYears,
    SUM(TrainingTimesLastYear IS NULL) AS TrainingTimesLastYear,
    SUM(WorkLifeBalance IS NULL) AS WorkLifeBalance,
    SUM(YearsAtCompany IS NULL) AS YearsAtCompany,
    SUM(YearsInCurrentRole IS NULL) AS YearsInCurrentRole,
    SUM(YearsSinceLastPromotion IS NULL) AS YearsSinceLastPromotion,
    SUM(YearsWithCurrManager IS NULL) AS YearsWithCurrManager
FROM employee_attrition_clean;
-- Hasil:
-- Terdapat Missing value dikolom YearsWithCurrManager sebanyak 57


-- ======================================================
-- 5. Check Duplicated Rows
-- ======================================================
SELECT *,
    COUNT(*) AS duplicate_count
FROM employee_attrition_clean
GROUP BY
    EmpID,
    Age,
    AgeGroup,
    Attrition,
    BusinessTravel,
    DailyRate,
    Department,
    DistanceFromHome,
    Education,
    EducationField,
    EmployeeCount,
    EmployeeNumber,
    EnvironmentSatisfaction,
    Gender,
    HourlyRate,
    JobInvolvement,
    JobLevel,
    JobRole,
    JobSatisfaction,
    MaritalStatus,
    MonthlyIncome,
    SalarySlab,
    MonthlyRate,
    NumCompaniesWorked,
    Over18,
    OverTime,
    PercentSalaryHike,
    PerformanceRating,
    RelationshipSatisfaction,
    StandardHours,
    StockOptionLevel,
    TotalWorkingYears,
    TrainingTimesLastYear,
    WorkLifeBalance,
    YearsAtCompany,
    YearsInCurrentRole,
    YearsSinceLastPromotion,
    YearsWithCurrManager
HAVING COUNT(*) > 1;
-- Hasil:
-- Tidak ditemukan data duplikat


-- ======================================================
-- 6. Check Unique Values(Categorical Columns)
-- ======================================================
-- Verifikasi nilai kategorikal dan identifikasi format yang tidak konsisten
SELECT DISTINCT AgeGroup
FROM employee_attrition_clean;

SELECT DISTINCT Attrition
FROM employee_attrition_clean;

SELECT DISTINCT BusinessTravel
FROM employee_attrition_clean;

SELECT DISTINCT Department
FROM employee_attrition_clean;

SELECT DISTINCT EducationField
FROM employee_attrition_clean;

SELECT DISTINCT Gender
FROM employee_attrition_clean;

SELECT DISTINCT JobRole
FROM employee_attrition_clean;

SELECT DISTINCT MaritalStatus
FROM employee_attrition_clean;

SELECT DISTINCT SalarySlab
FROM employee_attrition_clean;

SELECT DISTINCT Over18
FROM employee_attrition_clean;

SELECT DISTINCT OverTime
FROM employee_attrition_clean;
-- Hasil:
-- Terdapat data Inconsisten dikolom BusinessTravel
-- Pembersihan akan dilakukan di Data_Cleaning.sql
-- Over18 hanya memiliki satu nilai (Y)


-- ======================================================
-- 7. Check Numerical Range
-- ======================================================
SELECT 
	MIN(Age) AS Min_Age,
	MAX(Age) AS Max_Age,
	
	MIN(DailyRate) AS Min_DailyRate,
	MAX(DailyRate) AS Max_DailyRate,
	
	MIN(DistanceFromHome) AS Min_DistanceFromHome,
	MAX(DistanceFromHome) AS Max_DistanceFromHome,
	
	MIN(Education) AS Min_Education,
	MAX(Education) AS Max_Education,
	
	MIN(EmployeeCount) AS Min_EmployeeCount,
	MAX(EmployeeCount) AS Max_EmployeeCount,
	
	MIN(EmployeeNumber) AS Min_EmployeeNumber,
	MAX(EmployeeNumber) AS Max_EmployeeNumber,
	
	MIN(EnvironmentSatisfaction) AS Min_EnvironmentSatisfaction,
	MAX(EnvironmentSatisfaction) AS Max_EnvironmentSatisfaction,
	
	MIN(HourlyRate) AS Min_HourlyRate,
	MAX(HourlyRate) AS Max_HourlyRate,
	
	MIN(JobInvolvement) AS Min_JobInvolvement,
	MAX(JobInvolvement) AS Max_JobInvolvement,
	
	MIN(JobLevel) AS Min_JobLevel,
	MAX(JobLevel) AS Max_JobLevel,
	
	MIN(JobSatisfaction) AS Min_JobSatisfaction,
	MAX(JobSatisfaction) AS Max_JobSatisfaction,
	
	MIN(MonthlyIncome) AS Min_MonthlyIncome,
	MAX(MonthlyIncome) AS Max_MonthlyIncome,
	
	MIN(MonthlyRate) AS Min_MonthlyRate,
	MAX(MonthlyRate) AS Max_MonthlyRate,
	
	MIN(NumCompaniesWorked) AS Min_NumCompaniesWorked,
	MAX(NumCompaniesWorked) AS Max_NumCompaniesWorked,
	
	MIN(PercentSalaryHike) AS Min_PercentSalaryHike,
	MAX(PercentSalaryHike) AS Max_PercentSalaryHike,
	
	MIN(PerformanceRating) AS Min_PerformanceRating,
	MAX(PerformanceRating) AS Max_PerformanceRating,
	
	MIN(RelationshipSatisfaction) AS Min_RelationshipSatisfaction,
	MAX(RelationshipSatisfaction) AS Max_RelationshipSatisfaction,
	
	MIN(StandardHours) AS Min_StandardHours,
	MAX(StandardHours) AS Max_StandardHours,
	
	MIN(StockOptionLevel) AS Min_StockOptionLevel,
	MAX(StockOptionLevel) AS Max_StockOptionLevel,
	
	MIN(TotalWorkingYears) AS Min_TotalWorkingYears,
	MAX(TotalWorkingYears) AS Max_TotalWorkingYears,
	
	MIN(TrainingTimesLastYear) AS Min_TrainingTimesLastYear,
	MAX(TrainingTimesLastYear) AS Max_TrainingTimesLastYear,
	
	MIN(WorkLifeBalance) AS Min_WorkLifeBalance,
	MAX(WorkLifeBalance) AS Max_WorkLifeBalance,
	
	MIN(YearsAtCompany) AS Min_YearsAtCompany,
	MAX(YearsAtCompany) AS Max_YearsAtCompany,
	
	MIN(YearsInCurrentRole) AS Min_YearsInCurrentRole,
	MAX(YearsInCurrentRole) AS Max_YearsInCurrentRole,
	
	MIN(YearsSinceLastPromotion) AS Min_YearsSinceLastPromotion,
	MAX(YearsSinceLastPromotion) AS Max_YearsSinceLastPromotion,
	
	MIN(YearsWithCurrManager) AS Min_YearsWithCurrManager,
	MAX(YearsWithCurrManager) AS Max_YearsWithCurrManager
FROM employee_attrition_clean;
-- Hasil:
-- EmployeeCount hanya memiliki satu nilai (1).
-- StandardHours hanya memiliki satu nilai (80).


-- ======================================================
-- 8. Check Logical Errors
-- ======================================================
SELECT
    Age,
    YearsAtCompany,
    Age - YearsAtCompany AS Starting_Work_Age
FROM employee_attrition_clean
WHERE Age - YearsAtCompany < 18;
-- Validasi bahwa karyawan mulai bekerja pada usia >= 18 tahun.


SELECT
    Age,
    TotalWorkingYears,
    Age - TotalWorkingYears AS Starting_Work_Age
FROM employee_attrition_clean
WHERE Age - TotalWorkingYears < 18;
-- Hasil:
-- Tidak terdapat Employee yang bekerja dibawah umur 18 tahun diperusahaan


SELECT *
FROM employee_attrition_clean
WHERE YearsAtCompany > TotalWorkingYears;
-- Validasi YearsAtCompany <= TotalWorkingYears

SELECT *
FROM employee_attrition_clean
WHERE YearsInCurrentRole > YearsAtCompany;
-- Validasi YearsInCurrentRole <= YearsAtCompany.

SELECT *
FROM employee_attrition_clean
WHERE YearsWithCurrManager > YearsAtCompany;
-- Hasil:
-- Tidak ditemukan ketidakkonsistenan logis


/*
==========================================================
Validation Summary

Total Rows             : 1,470
Missing Values         : 57 (YearsWithCurrManager)
Duplicate Rows         : None
Inconsistent Values    : BusinessTravel
Constant Columns       : EmployeeCount, StandardHours, Over18
Logical Errors         : None
==========================================================
*/