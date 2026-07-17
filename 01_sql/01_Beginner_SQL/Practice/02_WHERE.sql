"
6. Show all employees whose age is greater than 30.

7. Show all female employees.

8. Show employees whose age is between 25 and 35.

9. Show employees whose first name starts with the letter A.

10. Show employees whose gender is Male and age is greater than 40.

"

#Show all employees whose age is greater than 30.
SELECT *
FROM employee_demographics
WHERE age > 30
;


#Show all female employees.
SELECT *
FROM employee_demographics
WHERE gender = 'Female'
;


#Show employees whose age is between 25 and 35.
SELECT *
FROM employee_demographics
WHERE age BETWEEN 25 AND 35
;


#Show employees whose first name starts with the letter A.
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'A%'
;


#Show employees whose gender is Male and age is greater than 40.
SELECT *
FROM employee_demographics
WHERE gender = 'Male' AND age > 40
;