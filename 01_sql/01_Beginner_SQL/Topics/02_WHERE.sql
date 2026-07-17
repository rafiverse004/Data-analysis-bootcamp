"
The WHERE clause is used to filter rows. It returns only the records that satisfy a specified condition.

Syntax:
SELECT column_name
FROM table_name
WHERE condition;

=
!= or <>
>
<
>=
<=
AND
OR
NOT
LIKE
IN
BETWEEN
IS NULL
IS NOT NULL
"

#printing full table
SELECT *
FROM employee_demographics

#Equal to (=)
SELECT *
FROM employee_demographics
WHERE first_name = 'Leslie'
;

#Not equal to (!=) or (<>)
SELECT *
FROM employee_demographics
WHERE first_name != 'Leslie'
;

#Greater than (>)
SELECT *
FROM employee_demographics
WHERE age > 30
;

#Less than (<)
SELECT *
FROM employee_demographics
WHERE age < 30
;

#Greater than or equal (>=)
SELECT *
FROM employee_demographics
WHERE age >= 30
;

#Less than or equal (<=)
SELECT *
FROM employee_demographics
WHERE age <= 30
;

#AND
SELECT *
FROM employee_demographics
WHERE age > 30
AND gender = 'Female'
;

#OR
SELECT *
FROM employee_demographics
WHERE age > 40
OR gender = 'Female'
;

#NOT
SELECT *
FROM employee_demographics
WHERE NOT gender = 'Male'
;

#LIKE

#Starts with
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'A%'
;

#Ends with
SELECT *
FROM employee_demographics
WHERE first_name LIKE '%n'
;

#Contains
SELECT *
FROM employee_demographics
WHERE first_name LIKE '%an%'
;

#Single character (_)
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'J___'
;

#IN
SELECT *
FROM employee_demographics
WHERE first_name IN ('Leslie', 'Tom', 'Jim')
;

#BETWEEN
SELECT *
FROM employee_demographics
WHERE age BETWEEN 25 AND 35
;

#IS NULL 
SELECT *
FROM employee_demographics
WHERE age IS NULL
;

#IS NOT NULL
SELECT *
FROM employee_demographics
WHERE age IS NOT NULL
;

#Combining multiple conditions
SELECT *
FROM employee_demographics
WHERE (gender = 'Female' AND age > 30)
OR first_name = 'Leslie'
;