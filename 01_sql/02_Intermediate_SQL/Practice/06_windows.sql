Question 1 — Row Number

Give every employee a row number based on their salary from highest to lowest.

Return:

    employee_id
    first_name
    last_name
    salary
    row_number
Use:

    ROW_NUMBER()

-- solution
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS 'row_number'
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 2 — Salary Ranking

Rank all employees by salary from highest to lowest.

Return:

    first_name
    last_name
    salary
    salary_rank
Use:

    RANK()

-- solution
SELECT
    first_name,
    last_name,
    salary,
    RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 3 — Dense Ranking

Repeat Question 2, but use:

    DENSE_RANK()

Then compare the result with RANK().

Think about what happens if two employees have the same salary.

-- solution
SELECT
    first_name,
    last_name,
    salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 4 — Rank Within Department

Rank employees by salary within each department.

Return:

    first_name
    last_name
    dept_id
    salary
    department_rank
Use:

    RANK() OVER (
        PARTITION BY dept_id
        ORDER BY salary DESC
    )

-- solution
SELECT
    first_name,
    last_name,
    dept_id,
    salary,
    RANK() OVER(
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS salary_rank
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 5 — Highest Paid Employee per Department

Rank employees within each department by salary.

Return:

    first_name
    last_name
    dept_id
    salary
    department_rank

Dont filter to rank 1 yet. Just display the ranking.

-- solution
SELECT
    first_name,
    last_name,
    dept_id,
    salary,
    RANK() OVER(
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS salary_rank
FROM employee_salary
;

WITH ranked_employees AS (
    SELECT
        first_name,
        last_name,
        dept_id,
        salary,
        RANK() OVER(
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS department_rank
    FROM employee_salary
)
SELECT *
FROM ranked_employees
WHERE department_rank = 1
;



----------------------------------------------------------------------------------------------------

Question 6 — Department Average

Show every employees salary alongside the average salary of their department.

Return:

    first_name
    last_name
    dept_id
    salary
    department_average
Use:

    AVG() OVER(...)

-- solution
SELECT
    first_name,
    last_name,
    dept_id,
    salary,
    AVG(salary) OVER(PARTITION BY dept_id) AS department_average
FROM employee_salary



----------------------------------------------------------------------------------------------------

Question 7 — Salary Difference

Show:

    first_name
    last_name
    salary
    average_salary
    salary_difference

Where:

    salary_difference = salary - overall average salary
Use a window function to calculate the average.

-- solution
SELECT
    first_name,
    last_name,
    salary,
    AVG(salary) OVER() AS average_salary,
    salary - AVG(salary) OVER() AS salary_differece
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 8 — Running Salary Total

Order employees by employee_id and calculate a running total of salaries.

Return:

    employee_id
    first_name
    salary
    running_salary

Use:

    SUM() OVER(...)

-- solution
SELECT
    first_name,
    last_name,
    salary,
    SUM(salary) OVER(
        ORDER BY employee_id
    ) AS running_total
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 9 — Running Salary by Department

Calculate a running salary total within each department.

Return:

    employee_id
    first_name
    dept_id
    salary
    department_running_salary

Youll need both:

    PARTITION BY
    ORDER BY

-- solution
SELECT
    employee_id,
    first_name,
    last_name,
    dept_id,
    salary,
    SUM(salary) OVER(
        PARTITION BY dept_id
        ORDER BY employee_id
    ) AS department_running_salary
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 10 — Previous Salary

Order employees by salary from lowest to highest.

Show each employees salary and the salary of the employee immediately before them.

Return:

    first_name
    last_name
    salary
    previous_salary
Use:

    LAG()

-- solution
SELECT
    first_name,
    last_name,
    salary,
    LAG(salary) OVER(ORDER BY salary) AS previous_salary
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 11 — Salary Difference from Previous Employee

Using LAG(), calculate:

    salary_difference

where:

    current salary − previous employees salary

Return:

    first_name
    last_name
    salary
    previous_salary
    salary_difference

-- solution
SELECT
    first_name,
    last_name,
    salary,
    LAG(salary) OVER(ORDER BY salary) AS previous_salary,
    salary - LAG(salary) OVER(ORDER BY salary) AS salary_difference

FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 12 — Next Employee

Order employees by employee_id.

Show the next employees first name.

Return:

    employee_id
    first_name
    next_employee
Use:

    LEAD()

-- solution
SELECT
    employee_id,
    first_name,
    LEAD(first_name) OVER(ORDER BY employee_id) AS next_employee
FROM employee_demographics
;



----------------------------------------------------------------------------------------------------

Question 13 — Top 3 Employees per Department

Find the top 3 highest-paid employees in each department.

Return:

    first_name
    last_name
    dept_id
    salary
    department_rank
Use a window function to rank them.

This is one of the most important real-world window-function patterns.

-- solution
WITH ranked_employees AS (
    SELECT
        first_name,
        last_name,
        dept_id,
        salary,
        ROW_NUMBER() OVER(
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS department_rank
    FROM employee_salary
)
SELECT *
FROM ranked_employees
WHERE department_rank <= 3
;



----------------------------------------------------------------------------------------------------

Question 14 — Salary vs Department Average

Show every employee and compare their salary to their departments average.

Return:

    first_name
    last_name
    dept_id
    salary
    department_average
    salary_difference

Then create a salary_status:

    Above department average → 'Above Average'
    Below department average → 'Below Average'
    Equal → 'At Average'

For this one youll combine:

    Window Function + CASE

-- solution
SELECT
    first_name,
    last_name,
    dept_id,
    salary,
    AVG(salary) OVER(PARTITION BY dept_id) AS department_average,
    salary - AVG(salary) OVER(PARTITION BY dept_id) AS salary_difference,
    CASE 
        WHEN salary > AVG(salary) OVER(PARTITION BY dept_id) THEN 'Above Average'
        WHEN salary < AVG(salary) OVER(PARTITION BY dept_id) THEN 'Below Average'
        ELSE 'At Average'
    END AS salary_status
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 15 — Percentage of Department Salary

Calculate what percentage of the departments total salary each employee represents.

Return:

    first_name
    last_name
    dept_id
    salary
    department_total_salary
    salary_percentage

Think about:

    SUM(salary) OVER (PARTITION BY dept_id)

-- solution
SELECT
    first_name,
    last_name,
    dept_id,
    salary,
    SUM(salary) OVER(PARTITION BY dept_id) AS department_total_salary,
    salary / SUM(salary) OVER(PARTITION BY dept_id) * 100 AS salary_percentage
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 16 — Employee Salary Report

Create a report containing:

    employee_id
    first_name
    last_name
    occupation
    dept_id
    salary
    department_average
    department_rank
    salary_difference

Where:

    department_average = average salary within department
    department_rank = employees salary rank within department
    salary_difference = employee salary − department average

You should be able to solve this using window functions without subqueries.

-- solution
SELECT
    employee_id,
    first_name,
    last_name,
    occupation,
    dept_id,
    salary,

    AVG(salary) OVER(
        PARTITION BY dept_id
    ) AS department_average,

    RANK() OVER(
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS department_rank,

    salary - AVG(salary) OVER(
        PARTITION BY dept_id
    ) AS salary_difference

FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 17

Find the highest-paid employee in each department.

Return only:

    first_name
    last_name
    dept_id
    salary

"You may need to combine a window function with another SQL technique to filter the ranking."

-- solution
WITH ranked_employees AS (
    SELECT
        first_name,
        last_name,
        dept_id,
        salary,
        RANK() OVER(
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS department_rank
    FROM employee_salary
)
SELECT
    first_name,
    last_name,
    dept_id,
    salary
FROM ranked_employees
WHERE department_rank = 1
;