Question 1 — Employees Above Average Salary

Find employees whose salary is greater than the average salary of all employees.

Return:

    first_name
    last_name
    salary

Youll need a subquery to calculate the average salary.

-- solution
SELECT
    first_name,
    last_name,
    salary
FROM employee_salary
WHERE salary > (
    SELECT AVG(salary)
    FROM employee_salary
);



----------------------------------------------------------------------------------------------------

Question 2 — Highest Salary

Find the employee(s) who earn the highest salary.

Return:

    first_name
    last_name
    salary

Try solving this using a subquery with MAX().

-- solution
SELECT
    first_name,
    last_name,
    salary
FROM employee_salary
WHERE salary = (
    SELECT MAX(salary)
    FROM employee_salary
);



----------------------------------------------------------------------------------------------------

Question 3 — Lowest Salary

Find the employee(s) who earn the lowest salary.

Return:

    first_name
    last_name
    salary
Use a subquery.

-- solution
SELECT
    first_name,
    last_name,
    salary
FROM employee_salary
WHERE salary = (
    SELECT MIN(salary)
    FROM employee_salary
);



----------------------------------------------------------------------------------------------------

Question 4 — Above Average Age

Using employee_demographics, find employees whose age is greater than the average employee age.

Return:

    first_name
    last_name
    age

-- solution
SELECT
    first_name,
    last_name,
    age
FROM employee_demographics
WHERE age > (
    SELECT AVG(age)
    FROM employee_demographics
);



----------------------------------------------------------------------------------------------------

Question 5 — Employees in Certain Departments

Find employees whose dept_id belongs to the departments that have at least one employee earning more than 60,000.

Return:

    first_name
    last_name
    salary
    dept_id

Try using:

    IN (...)
with a subquery.

-- solution
SELECT *
FROM employee_demographics
WHERE employee_id IN(
    SELECT employee_id
    FROM employee_salary
    WHERE salary > 60000
)


----------------------------------------------------------------------------------------------------

Question 6 — Occupations of High Earners

First find the occupations of employees earning more than 60,000.

Then find all employees who have one of those occupations.

Return:

    first_name
    last_name
    occupation
    salary
Use a subquery with IN.

-- solution
SELECT
    first_name,
    last_name,
    occupation,
    salary
FROM employee_salary
WHERE occupation IN (
    SELECT occupation
    FROM employee_salary
    WHERE salary > 60000
);


----------------------------------------------------------------------------------------------------

Question 7 — Average Salary by Occupation
Create a subquery that calculates:

    occupation
    average_salary

Then use the result to find occupations whose average salary is greater than 50,000.

Return:

    occupation
    average_salary

This is a good introduction to a derived table.

-- solution
SELECT *
FROM (
    SELECT
        occupation,
        AVG(salary) AS average_salary
    FROM employee_salary
    GROUP BY occupation
) AS occupation_stats
WHERE average_salary > 50000;



----------------------------------------------------------------------------------------------------

Question 8 — Salary Statistics
Create a subquery that calculates the average salary.

Then return every employees:

    first_name
    last_name
    salary
    average_salary

The result should show the overall average salary alongside every employee.

-- solution
SELECT
    first_name,
    last_name,
    salary,
    (
        SELECT AVG(salary)
        FROM employee_salary
    ) AS average_salary
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 9 — Above Average Earners

Find employees earning more than the overall average salary.

But this time return:

    first_name
    last_name
    occupation
    salary
    salary_difference

Where salary_difference is:

    employee salary − average salary

Youll need a subquery for the average.

-- solution
SELECT
    first_name,
    last_name,
    occupation,
    salary,
    salary - (
        SELECT AVG(salary)
        FROM employee_salary
    ) AS salary_difference
FROM employee_salary
WHERE salary > (
    SELECT AVG(salary)
    FROM employee_salary
);



----------------------------------------------------------------------------------------------------

Question 10 — Employees Earning More Than Their Department

Find employees whose salary is greater than the average salary of their department.

Return:

    first_name
    last_name
    salary
    dept_id

This is significantly harder.

Think about how the subquery needs to know which department the outer employee belongs to.

-- solution
SELECT
    first_name,
    last_name,
    salary,
    dept_id
FROM employee_salary AS sal
WHERE salary > (
    SELECT AVG(salary)
    FROM employee_salary
    WHERE dept_id = sal.dept_id
);



----------------------------------------------------------------------------------------------------

Question 11 — Highest Paid Employee in Each Department

Find the employee(s) with the highest salary within their department.

Return:

    first_name
    last_name
    salary
    dept_id

Try this using a subquery.

"Dont use a window function yet. Well solve this type again later using window functions and compare the approaches."

-- Solution
SELECT
    first_name,
    last_name,
    salary,
    dept_id
FROM employee_salary AS sal
WHERE salary = (
    SELECT MAX(salary)
    FROM employee_salary
    WHERE dept_id = sal.dept_id
);



----------------------------------------------------------------------------------------------------

Question 12 — Above Department Average

Return:

    first_name
    last_name
    occupation
    salary
    dept_id

for employees whose salary is:

    higher than their departments average salary

This is similar to Question 10, but try solving it independently without looking back.

-- solution
SELECT
    first_name,
    last_name,
    occupation,
    salary,
    dept_id
FROM employee_salary AS es
WHERE salary > (
    SELECT AVG(salary)
    FROM employee_salary
    WHERE dept_id = es.dept_id
);



----------------------------------------------------------------------------------------------------

Question 13 — Salary Comparison

Find employees whose salary is greater than the average salary of employees with the same occupation.

Return:

first_name
last_name
occupation
salary

This introduces the idea of a correlated subquery.

-- solution
SELECT
    first_name,
    last_name,
    occupation,
    salary
FROM employee_salary AS sal
WHERE salary > (
    SELECT AVG(salary)
    FROM employee_salary
    WHERE occupation = sal.occupation
);



----------------------------------------------------------------------------------------------------

Question 14 ⭐

Find employees who earn more than the average salary and are older than the average age.

Return:

first_name
last_name
salary
age

Youll need two subqueries.

-- solution
SELECT
    first_name,
    last_name,
    salary,
    age
FROM employee_salary AS sal
JOIN employee_demographics AS demo
    ON sal.employee_id = demo.employee_id
WHERE salary > (
    SELECT AVG(salary)
    FROM employee_salary
)
AND age > (
    SELECT AVG(age)
    FROM employee_demographics
);



----------------------------------------------------------------------------------------------------

Question 15 🔥 Final Challenge

Management wants to identify the highest-paid employees.

Find employees whose salary is:

Greater than the overall average salary
AND equal to the highest salary within their department

Return:

first_name
last_name
occupation
salary
dept_id

Try to solve this using subqueries only.

-- solution
SELECT
    demo.first_name,
    demo.last_name,
    sal.occupation,
    sal.salary,
    sal.dept_id
FROM employee_salary AS sal
JOIN employee_demographics AS demo
    ON sal.employee_id = demo.employee_id
WHERE sal.salary > (
    SELECT AVG(salary)
    FROM employee_salary
)
AND sal.salary = (
    SELECT MAX(salary)
    FROM employee_salary
    WHERE dept_id = sal.dept_id
);