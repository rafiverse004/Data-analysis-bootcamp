"
UNION = Remove duplicates = Slower
UNION ALL = Keep duplicates = Faster

UNION does NOT modify tables
DISTINCT is automatic in UNION

Number of columns MUST match in UNION
Data types should be compatible in UNION
Column names come from FIRST SELECT in UNION
ORDER BY only once

UNION = Stack rows
JOIN = Add columns

"

-- Unions give distinct values only
SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary
;

-- if we want all the information we can add ALL
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary
;

-- Using multiple unions
SELECT first_name, last_name, "Old Man" AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, "Old Female" AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, "Highly Paid Employee" AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;