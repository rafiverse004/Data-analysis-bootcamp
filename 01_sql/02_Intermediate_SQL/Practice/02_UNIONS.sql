-- Problem 1
"Display all employee first names from both tables without duplicates.

Tables:

employee_demographics
employee_salary"

SELECT first_name
FROM employee_demographics
UNION
SELECT first_name
FROM employee_salary
;





-- Problem 2
"Display all employee first names from both tables including duplicates."

SELECT first_name
FROM employee_demographics
UNION ALL
SELECT first_name
FROM employee_salary
;





-- Problem 3
"Display all employee IDs from both tables in ascending order."

SELECT employee_id
FROM employee_demographics
UNION
SELECT employee_id
FROM employee_salary
ORDER BY employee_id
;





-- Problem 4
"Display:

    - Employees whose age is greater than 35 from employee_demographics
    - Employees whose salary is greater than 60000 from employee_salary

Show:

    employee_id
    first_name

Combine the results."

SELECT employee_id, first_name
FROM employee_demographics
WHERE age > 35
UNION
SELECT employee_id, first_name
FROM employee_salary
WHERE salary > 60000
;





--Problem 5
"Show all female employees from employee_demographics together with employees earning more than 80000 from employee_salary.

Display:

first_name
last_name

Remove duplicates."

SELECT first_name, last_name
FROM employee_demographics
WHERE gender = 'Female'
UNION
SELECT first_name, last_name
FROM employee_salary
WHERE salary > 80000
;





-- Problem 6

"Display all employees who satisfy either:

Age < 30
Salary > 70000

Return:

employee_id
first_name"

SELECT employee_id, first_name
FROM employee_demographics
WHERE age < 30
UNION
SELECT employee_id, first_name
FROM employee_salary
WHERE salary > 70000
;





-- Problem 7

"Create a report like this:

John     Senior Employee
Alice    High Earner
Bob      Young Employee

Rules:

Age > 40 → Senior Employee
Salary > 70000 → High Earner
Age < 25 → Young Employee

Use multiple UNIONs."

SELECT
    first_name,
    'Senior Employee' AS Label
FROM employee_demographics
WHERE age > 40
UNION
SELECT
    first_name,
    'Young Employee' AS Label
FROM employee_demographics
WHERE age < 25
UNION
SELECT
    first_name,
    'High Earner' AS Label
FROM employee_salary
WHERE salary > 70000
;





-- Problem 8

"Return

first_name
last_name
status

Where

Male & Age > 35 → Experienced Male
Female & Age > 35 → Experienced Female
Salary > 90000 → Executive

Sort by

last_name
first_name"

SELECT
    first_name,
    last_name,
    'Experienced Male' AS Status
FROM employee_demographics
WHERE gender = 'Male' AND age > 35
UNION
SELECT
    first_name,
    last_name,
    'Experienced Female' AS Status
FROM employee_demographics
WHERE gender = 'female' AND age > 35
UNION
SELECT
    first_name,
    last_name,
    'Executive' AS Status
FROM employee_salary
WHERE salary > 90000
ORDER BY last_name, first_name
;