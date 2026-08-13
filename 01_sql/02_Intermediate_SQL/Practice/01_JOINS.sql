-- Active: 1783781823929@@127.0.0.1@3306@parks_and_recreation
SELECT * FROM employee_demographics;

SELECT * FROM employee_salary;



-- Question 1 — Basic INNER JOIN

Combine the two tables using employee_id.

Return:

    first_name
    last_name  
    age
    gender
    occupation
    salary
Use an INNER JOIN.

-- solution
SELECT
    demo.first_name,
    demo.last_name,
    demo.age,
    demo.gender,
    sal.occupation,
    sal.salary
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
;



----------------------------------------------------------------------------------------------------

Question 2 — Select specific columns

Join the tables and return:

    employee_id
    first_name
    last_name
    age
    salary

Only return employees who exist in both tables.

-- solution
SELECT
    demo.employee_id,
    demo.first_name,
    demo.last_name,
    demo.age,
    sal.salary
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
;



----------------------------------------------------------------------------------------------------

Question 3 — Find high earners

Join the two tables and return employees whose salary is greater than 60,000.

Return:

    first_name
    last_name
    age
    occupation
    salary
Use:

    JOIN + WHERE

-- solution
SELECT
    demo.first_name,
    demo.last_name,
    demo.age,
    sal.occupation,
    sal.salary
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
WHERE sal.salary > 60000
;



----------------------------------------------------------------------------------------------------

Question 4 — Female employees

Join the two tables and find all female employees.

Return:

    first_name
    last_name
    age
    occupation
    salary
Use:

    JOIN + WHERE

-- solution
SELECT
    demo.first_name,
    demo.last_name,
    demo.age,
    sal.occupation,
    sal.salary
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
WHERE demo.gender = 'Female'
;



----------------------------------------------------------------------------------------------------

Question 5 — Employee information

Join the tables and return all employees with:

    employee_id
    first_name
    last_name
    age
    gender
    occupation
    salary
    dept_id

Sort them by salary from highest to lowest.
Use:

    JOIN + ORDER BY

-- solution
SELECT
    demo.employee_id,
    demo.first_name,
    demo.last_name,
    demo.age,
    demo.gender,
    sal.occupation,
    sal.salary,
    sal.dept_id
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
ORDER BY sal.salary DESC
;



----------------------------------------------------------------------------------------------------

Question 6 — Salary range

Find employees whose salary is between 40,000 and 70,000, inclusive.

Return:
    first_name
    last_name
    occupation
    salary
Use:

    JOIN + WHERE + BETWEEN

-- solution
SELECT
    demo.first_name,
    demo.last_name,
    sal.occupation,
    sal.salary
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
WHERE sal.salary BETWEEN 40000 AND 70000
;



----------------------------------------------------------------------------------------------------

Question 7 — LEFT JOIN

Using employee_demographics as the left table, perform a LEFT JOIN with employee_salary.

Return:

    employee_id
    first_name
    last_name
    age
    salary
    occupation

Your goal is to understand:

    What happens to an employee who exists in demographics but doesnt have a matching salary record?

-- solution
SELECT
    demo.employee_id,
    demo.first_name,
    demo.last_name,
    demo.age,
    sal.occupation,
    sal.salary
FROM employee_demographics AS demo
LEFT JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
;



----------------------------------------------------------------------------------------------------

Question 8 — Find unmatched employees

Using a LEFT JOIN, find employees who exist in: employee_demographics but do not have a matching record in: employee_salary.

Return:
    employee_id
    first_name
    last_name

Youll need to check for a NULL value from the salary table.

-- solution
SELECT
    demo.employee_id,
    demo.first_name,
    demo.last_name
FROM employee_demographics AS demo
LEFT JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
WHERE sal.salary IS NULL
;



----------------------------------------------------------------------------------------------------

Question 9 — Reverse the LEFT JOIN

Now use employee_salary as the left table and employee_demographics as the right table.

Find employees who exist in employee_salary but dont have a matching record in employee_demographics.

Return:
    employee_id
    first_name
    last_name
    occupation
    salary

This is a very useful exercise because your database actually contains an unmatched record.

-- solution
SELECT
    sal.employee_id,
    demo.first_name,
    demo.last_name,
    sal.occupation,
    sal.salary
FROM employee_salary AS sal
LEFT JOIN employee_demographics AS demo
    ON demo.employee_id = sal.employee_id
WHERE demo.employee_id IS NULL
;



----------------------------------------------------------------------------------------------------

Question 10 — Average salary of employees

Join the two tables and calculate the average salary of employees.

Return just:

    average_salary

Dont worry about GROUP BY yet.

-- solution
SELECT
    AVG(sal.salary) AS "Average Salary"
FROM employee_demographics as demo
JOIN employee_salary as sal
    ON demo.employee_id = sal.employee_id
;



----------------------------------------------------------------------------------------------------

Question 11 — Gender salary analysis

Join the two tables and calculate the average salary for each gender.

Expected structure:

    gender       average_salary
    -----------  -------------
    Female       ?
    Male         ?

Youll need:

    JOIN + GROUP BY + AVG

-- solution
SELECT
    demo.gender,
    AVG(sal.salary) AS "Average Salary"
FROM employee_demographics as demo
JOIN employee_salary as sal
    ON demo.employee_id = sal.employee_id
GROUP BY demo.gender
;



----------------------------------------------------------------------------------------------------

Question 12 — Gender salary comparison

Find:
    Number of male employees
    Number of female employees
    Average male salary
    Average female salary

Return everything in one result.

This is your first more realistic analyst-style JOIN problem.

-- solution
SELECT
    COUNT(CASE WHEN demo.gender = 'Male' THEN 1 END) AS male_employees,
    COUNT(CASE WHEN demo.gender = 'Female' THEN 1 END) AS female_employees,
    AVG(CASE WHEN demo.gender = 'Male' THEN sal.salary END) AS average_male_salary,
    AVG(CASE WHEN demo.gender = 'Female' THEN sal.salary END) AS average_female_salary
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
;



----------------------------------------------------------------------------------------------------

Question 13 — Department salary analysis

Using employee_salary, calculate:

    Number of employees in each dept_id
    Average salary for each dept_id
    Highest salary for each dept_id

Expected structure:

    dept_id | employee_count | avg_salary | highest_salary

You dont actually need the demographics table for this one.

Thats intentional: a good analyst knows when a JOIN is unnecessary.

-- solution
SELECT
    dept_id,
    COUNT(*) AS employee_count,
    AVG(salary) AS avg_salary,
    MAX(salary) AS highest_salary
FROM employee_salary
GROUP BY dept_id
;



----------------------------------------------------------------------------------------------------

Question 14 — Employee comparison

Join the two tables and find employees who are:

Older than 40, Salary greater than 50,000

Return:

    first_name
    last_name
    age
    occupation
    salary

-- solution
SELECT
    demo.first_name,
    demo.last_name,
    demo.age,
    sal.occupation,
    sal.salary
FROM employee_demographics as demo
JOIN employee_salary as sal
    ON demo.employee_id = sal.employee_id
WHERE demo.age > 40 AND sal.salary > 50000
;



----------------------------------------------------------------------------------------------------

Question 15 ⭐ Final JOIN Challenge

Management wants a basic employee report.

Create a query that combines information from both tables and returns:

    employee_id
    first_name
    last_name
    age
    gender
    occupation
    salary
    dept_id

Requirements:

    Include only employees present in both tables.
    Show only employees earning more than 40,000.
    Sort by salary from highest to lowest.

This combines:

    INNER JOIN + WHERE + ORDER BY

-- solution
SELECT
    demo.employee_id,
    demo.first_name,
    demo.last_name,
    demo.age,
    demo.gender,
    sal.occupation,
    sal.salary,
    sal.dept_id
FROM employee_demographics as demo
INNER JOIN employee_salary as sal
    ON demo.employee_id = sal.employee_id
WHERE sal.salary > 40000
ORDER BY sal.salary DESC
;