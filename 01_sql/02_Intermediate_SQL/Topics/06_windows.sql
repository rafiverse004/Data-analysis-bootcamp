-- using groupby
SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
GROUP BY gender
;


-- Using windows
SELECT
    demo.first_name,
    demo.last_name,
    gender,
    AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
;


SELECT
    demo.first_name,
    demo.last_name,
    gender,
    SUM(salary) OVER(PARTITION BY gender)
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
;


-- Just like employee id
SELECT
    demo.employee_id,
    demo.first_name,
    demo.last_name,
    demo.gender,
    sal.salary,
    ROW_NUMBER() OVER() AS Employee_id
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
;


-- Use partition
SELECT
    demo.employee_id,
    demo.first_name,
    demo.last_name,
    demo.gender,
    sal.salary,
    ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
    RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
    DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
;



-- Lag
SELECT
    first_name,
    salary,
    LAG(salary) OVER(ORDER BY salary) AS previous_salary
FROM employee_salary
;


-- lead
SELECT
    first_name,
    salary,
    LEAD(salary) OVER(ORDER BY salary) AS next_salary
FROM employee_salary
;


-- Running total
SELECT
    employee_id,
    salary,
    SUM(salary) OVER(
        ORDER BY employee_id
    ) AS running_total
FROM employee_salary
;


-- Moving average - example
SELECT
    sale_date,
    sales,
    AVG(sales) OVER(
        ORDER BY sale_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg
FROM sales
;


-- Top N per group
WITH ranked AS (
    SELECT
        employee_id,
        first_name,
        salary,
        ROW_NUMBER() OVER(
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS ranked
    FROM employee_salary
)
SELECT *
FROM ranked
WHERE ranked <= 3
;