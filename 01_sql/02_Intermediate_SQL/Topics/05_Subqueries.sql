-- IN subquery
SELECT *
FROM employee_demographics
WHERE employee_id IN(
    SELECT employee_id
    FROM employee_salary
    WHERE dept_id = 1
);


-- Scalar subquery
SELECT
    first_name,
    salary,
    (
        SELECT AVG(salary)
        FROM employee_salary
    )
FROM employee_salary
;


SELECT
    gender,
    AVG(age),
    MAX(age),
    MIN(age),
    COUNT(age)
FROM employee_demographics
GROUP BY gender
;

-- Subquery in FROM / Derived Table
SELECT *
FROM (
    SELECT
    gender,
    AVG(age) AS avg_age,
    MAX(age) AS max_age,
    MIN(age) AS min_age,
    COUNT(age) AS count_age
FROM employee_demographics
GROUP BY gender
) AS Agg_Table
;


-- Correlated subqueries
SELECT
    first_name,
    salary
FROM employee_salary AS sal
WHERE salary > (
    SELECT AVG(salary)
    FROM employee_salary
    WHERE dept_id = sal.dept_id
);

-- EXISTS / NOT EXISTS
SELECT *
FROM employee_demographics AS demo
WHERE EXISTS (
    SELECT 1
    FROM employee_salary AS sal
    WHERE sal.employee_id = demo.employee_id
);


-- CTEs — very important
WITH employee_data AS (
    SELECT
        demo.first_name,
        demo.gender,
        demo.age,
        sal.salary
    FROM employee_demographics AS demo
    JOIN employee_salary AS sal
        ON demo.employee_id = sal.employee_id
)
SELECT *
FROM employee_data
WHERE salary > 50000
;