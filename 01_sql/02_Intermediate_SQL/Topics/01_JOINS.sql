"
Why JOINs are needed

Explain that data is often split into multiple related tables to reduce duplication and improve organization.

"

SELECT *
FROM employee_demographics
;

SELECT *
FROM employee_salary
;



"
INNER JOIN
Syntax
Matching rows only

"

SELECT *
FROM employee_demographics AS demo
INNER JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
;



"
LEFT JOIN
Returns all rows from the left table
Matching rows from the right
NULL when no match exists

"

SELECT *
FROM employee_demographics AS demo
LEFT JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
;



"
RIGHT JOIN
Returns all rows from the right table
Matching rows from the left
NULL when no match exists

"

SELECT *
FROM employee_demographics AS demo
RIGHT JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
;



"
SELF JOIN

The Secret Santa example is a classic beginner exercise.

"

SELECT demo.employee_id AS SecretSanta,
        demo.first_name AS FirstNameSanta,
        demo.last_name AS LastNameSanta,
        sal.employee_id AS EmployeeId,
        sal.first_name AS FirstName,
        sal.last_name AS LastName
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id + 1 = sal.employee_id
;



#JOIN with Specific Columns
SELECT
    demo.first_name,
    demo.last_name,
    sal.salary
FROM employee_demographics AS demo
JOIN employee_salary sal
    ON demo.employee_id = sal.employee_id
;



#Joining multiple tables together
SELECT *
FROM employee_demographics AS demo
INNER JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
    ON sal.dept_id = pd.department_id
;



#Writing Order
"
This is the order you type your query.

SELECT
FROM
JOIN
ON
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT

"



#Execution Order (Logical Processing Order)
"
This is how SQL actually processes the query.

1. FROM
2. JOIN
3. ON
4. WHERE
5. GROUP BY
6. HAVING
7. SELECT
8. ORDER BY
9. LIMIT

Notice that SELECT is written first but executed seventh.

"