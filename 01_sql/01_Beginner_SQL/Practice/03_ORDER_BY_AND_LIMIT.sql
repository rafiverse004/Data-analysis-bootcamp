"
11. Display all employees sorted by age (youngest first).

12. Display all employees sorted by age (oldest first).

13. Display employees sorted by gender and then by age.

14. Show the oldest 5 employees.

15. Show the youngest 3 female employees.

"

#Display all employees sorted by age (youngest first).
SELECT *
FROM employee_demographics
ORDER BY age ASC
;


#Display all employees sorted by age (oldest first).
SELECT *
FROM employee_demographics
ORDER BY age DESC
;


#Display employees sorted by gender and then by age.
SELECT *
FROM employee_demographics
ORDER BY gender, age
;


#Show the oldest 5 employees.
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 5
;


#Show the youngest 3 female employees.
SELECT *
FROM employee_demographics
WHERE gender = 'Female'
ORDER BY age
LIMIT 3
;