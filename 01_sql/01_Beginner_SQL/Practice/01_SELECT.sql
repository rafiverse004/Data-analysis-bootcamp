"
1. Display all columns from employee_demographics.

2. Display only first_name and age.

3. Display unique genders.

4. Display each employee's first name and rename it as EmployeeName.

5. Display first_name, age, and a calculated column showing age + 10 as AgeAfter10Years.

"

#Display all columns from employee_demographics.
SELECT *
FROM employee_demographics
;

#Display only first_name and age.
SELECT first_name, age
FROM employee_demographics
;

#Display unique genders.
SELECT DISTINCT gender
FROM employee_demographics
;

#Display each employee's first name and rename it as EmployeeName.
SELECT first_name AS EmployeeName
FROM employee_demographics
;

#Display first_name, age, and a calculated column showing age + 10 as AgeAfter10Years
SELECT first_name,
        age,
        age + 10 AS AgeAfter10Years
FROM employee_demographics
;