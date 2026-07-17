"
The HAVING clause is used to filter groups created by GROUP BY.

A simple way to remember it is:

WHERE filters rows
HAVING filters groups


Syntax:
SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name
HAVING condition
;


Execution Order:

Although you write:

SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY

SQL logically processes the query in this order:

FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY

This is why HAVING can use aggregate functions but WHERE cannot.

"

#Suppose you want to find occupations where the average salary is greater than 75,000.
SELECT
    occupation,
    AVG(salary) AS AverageSalary
FROM employee_salary
GROUP BY occupation
HAVING AVG(salary) > 75000
;

#Find genders with more than 5 employees.
SELECT
    gender,
    COUNT(*) AS TotalEmployees
FROM employee_demographics
GROUP BY gender
HAVING COUNT(*) > 5
;

#Find occupations whose total salary exceeds 300,000.
SELECT
    occupation,
    SUM(salary) AS TotalSalary
FROM employee_salary
GROUP BY occupation
HAVING SUM(salary) > 100000
;

#HAVING with AVG()
SELECT
    occupation,
    AVG(salary) AS AverageSalary
FROM employee_salary
GROUP BY occupation
HAVING AVG(salary) >= 70000
;

#HAVING with MIN() and MAX()
SELECT
    gender,
    MAX(age) AS OldestEmployee
FROM employee_demographics
GROUP BY gender
HAVING MAX(age) > 50
;

#Using WHERE and HAVING Together
SELECT
    occupation,
    AVG(salary) AS AverageSalary
FROM employee_salary
WHERE salary > 40000
GROUP BY occupation
HAVING AVG(salary) > 70000;