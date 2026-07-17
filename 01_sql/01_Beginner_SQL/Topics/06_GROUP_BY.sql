"
The GROUP BY clause is used to group rows that have the same values in one or more columns.

It is almost always used with aggregate functions such as:

COUNT()
SUM()
AVG()
MIN()
MAX()

Instead of calculating one result for the entire table, SQL calculates one result for each group.


Syntax:

SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name;


SQL Execution Order:

Although you write:

SELECT
FROM
WHERE
GROUP BY
ORDER BY

SQL logically processes it like this:

FROM
WHERE
GROUP BY
SELECT
ORDER BY

This explains why WHERE filters rows before they are grouped.

"

#Count employees by gender
SELECT
    gender,
    COUNT(*) AS TotalEmployees
FROM employee_demographics
GROUP BY gender
;

#Average age by gender
SELECT
    gender,
    AVG(age) AS AverageAge
FROM employee_demographics
GROUP BY gender
;

#Sum of salary by occupation
SELECT
    occupation,
    SUM(salary) AS TotalSalary
FROM employee_salary
GROUP BY occupation
;

#Min and max of age by gender
SELECT
    gender,
    MAX(age) AS Oldest,
    MIN(age) AS Youngest
FROM employee_demographics
GROUP BY gender
;

#Multiple Aggregate Functions
SELECT
    gender,
    COUNT(*) AS TotalEmployees,
    AVG(age) AS AverageAge,
    MAX(age) AS Oldest,
    MIN(age) AS Youngest
FROM employee_demographics
GROUP BY gender
;

#Group by with where
SELECT
    gender,
    AVG(age) AS AverageAge
FROM employee_demographics
WHERE age >= 30
GROUP BY gender
;

#ORDER BY with GROUP BY
SELECT
    gender,
    AVG(age) AS AverageAge
FROM employee_demographics
GROUP BY gender
ORDER BY AverageAge DESC
;