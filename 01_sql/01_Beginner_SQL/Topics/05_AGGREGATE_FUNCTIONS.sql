"
Aggregate functions perform a calculation on multiple rows and return a single value.

They are commonly used in data analysis to summarize data.

COUNT()

SUM()

AVG()

MIN()

MAX()

"

#COUNT() all rows
SELECT COUNT(*)
FROM employee_demographics
;

#Count non-NULL values
SELECT COUNT(age)
FROM employee_demographics
;

#SUM() of salary
SELECT SUM(salary)
FROM employee_salary
;

#AVG() salary
SELECT AVG(salary)
FROM employee_salary
;

#MIN() salary
SELECT MIN(salary)
FROM employee_salary
;

#MAX() salary
SELECT MAX(salary)
FROM employee_salary
;

#Using Aliases
SELECT
    COUNT(*) AS TotalEmployees,
    AVG(salary) AS AverageSalary,
    MAX(salary) AS HighestSalary,
    MIN(salary) AS MinimumSalary
FROM employee_salary
;