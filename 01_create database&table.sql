/*
==========================================================
Project  : HR Employee Attrition Analysis
Author   : Bachtiar Ramadhan
DBMS     : MySQL
Tools    : DBeaver
Purpose  : Create database & table for HR Employee Attrition project.
==========================================================
*/

DROP TABLE IF EXISTS employee_attrition_clean;
DROP TABLE IF EXISTS employee_attrition;

-- ======================================================
-- Create Database
-- ======================================================
CREATE DATABASE hr_attrition_project;
SHOW databases:
USE hr_attrition_project;



-- ======================================================
-- Create Table
-- ======================================================
CREATE TABLE employee_attrition(
	EmpID VARCHAR(20) PRIMARY KEY,
	Age INT,
	AgeGroup VARCHAR(10),
	Attrition VARCHAR(5),
	BusinessTravel VARCHAR(20),
	DailyRate INT,
	Department VARCHAR(30),
	DistanceFromHome INT,
	Education INT,
	EducationField VARCHAR(20),
	EmployeeCount INT,
	EmployeeNumber INT,
	EnvironmentSatisfaction INT,
	Gender VARCHAR(10),
	HourlyRate INT,
	JobInvolvement INT,
	JobLevel INT,
	JobRole VARCHAR(30),
	JobSatisfaction INT,
	MaritalStatus VARCHAR(10),
	MonthlyIncome INT,
	SalarySlab VARCHAR(10),
	MonthlyRate INT,
	NumCompaniesWorked INT,
	Over18 VARCHAR(2),
	OverTime VARCHAR(5),
	PercentSalaryHike INT,
	PerformanceRating INT,
	RelationshipSatisfaction INT,
	StandardHours INT,
	StockOptionLevel INT,
	TotalWorkingYears INT,
	TrainingTimesLastYear INT,
	WorkLifeBalance INT,
	YearsAtCompany INT,
	YearsInCurrentRole INT,
	YearsSinceLastPromotion INT,
	YearsWithCurrManager INT);

SHOW TABLES;
DESCRIBE employee_attrition;

SELECT COUNT(*) AS Raw_Data
FROM employee_attrition;

SELECT COUNT(*) AS Clean_Data
FROM employee_attrition_clean;