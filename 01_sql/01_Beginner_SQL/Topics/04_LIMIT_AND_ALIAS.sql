"
The LIMIT clause is used to return only a specified number of rows.

Syntax:
SELECT column_name
FROM table_name
LIMIT number;
"

#Retrun the first 5 rows
SELECT *
FROM employee_demographics
LIMIT 5
;

#LIMIT with ORDER BY
SELECT *
FROM employee_demographics
ORDER BY age ASC
LIMIT 5
;

#LIMIT with OFFSET OFFSET skips a specified number of rows before returning results.
SELECT *
FROM employee_demographics
LIMIT 5 OFFSET 5
;

#LIMIT after filtering
SELECT *
FROM employee_demographics
WHERE gender = 'Female'
LIMIT 5
;

"Column Alias (AS)

A column alias gives a temporary name to a column in the query result.

It does not change the actual column name in the database.

Syntax
SELECT column_name AS alias_name
FROM table_name;
"

#Rename a column
SELECT first_name AS FirstName
FROM employee_demographics
;

#Multiple aliases
SELECT
    first_name AS FirstName,
    last_name AS LastName,
    age AS EmployeeAge
FROM employee_demographics
;

#Alias for calculated columns
SELECT
    age,
    age + 1 AS NextYearAge
FROM employee_demographics
;

#Alias for functions
SELECT
    CONCAT(first_name, ' ', last_name) AS FullName
FROM employee_demographics
;

#Alias with spaces
SELECT first_name AS "First Name"
FROM employee_demographics
;

#Putting it together
SELECT
    first_name AS "First Name",
    last_name AS "Last Name",
    age AS Age
FROM employee_demographics
ORDER BY age DESC
LIMIT 3
;