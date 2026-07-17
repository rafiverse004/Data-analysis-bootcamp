"
SELECT.sql

SELECT *
Select one column
Select multiple columns
DISTINCT
Calculated columns (age + 1)
String concatenation (CONCAT())
Selecting constant values
"

#Selecting all column
SELECT *
FROM employee_demographics
;

#Selecting a single column
SELECT first_name
FROM employee_demographics
;

#Selecting multiple columns
SELECT first_name, last_name, age
FROM employee_demographics
;

#Print one column with unique values only
SELECT DISTINCT gender
FROM employee_demographics
;

#Print multiple columns with unique values only
SELECT DISTINCT first_name, gender
FROM employee_demographics
;

#Column aliases(AS) - giving temporary names to columns
SELECT first_name AS FirstName
FROM employee_demographics
;

#Calculated columns
SELECT first_name,
        age,
        age + 1 AS next_year_age
FROM employee_demographics
;

#String concatenation
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics
;

#Selecting expressions
SELECT
    first_name,
    age,
    age * 12 AS age_in_months
FROM employee_demographics
;

#Using simple built-in functions
SELECT
    UPPER(first_name),
    LOWER(last_name),
    LENGTH(first_name)
FROM employee_demographics;