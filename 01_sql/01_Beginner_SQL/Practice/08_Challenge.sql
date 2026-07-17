"
Bonus Challenge (Mixed)

Show the top 3 highest-paid occupations (average salary).

Show occupations where the minimum salary is greater than 50,000.

Count employees whose first name starts with J.

Show genders with more than 3 employees, ordered by employee count.

Find the average salary of employees earning more than 60,000.

"

#Show the top 3 highest-paid occupations (average salary).
SELECT occupation, AVG(salary) AS AverageSalary
FROM employee_salary
GROUP BY occupation
ORDER BY AVG(salary) DESC
LIMIT 3
;


#Show occupations where the minimum salary is greater than 50,000.
SELECT occupation, MIN(salary) AS MinimumSalary
FROM employee_salary
GROUP BY occupation
HAVING MIN(salary) > 50000
;


#Count employees whose first name starts with J.
SELECT COUNT(*) AS TotalEmployees
FROM employee_demographics
WHERE first_name LIKE 'J%'
;


#Show genders with more than 3 employees, ordered by employee count.
SELECT gender, COUNT(*) AS TotalEmployees
FROM employee_demographics
GROUP BY gender
HAVING COUNT(*) > 3
ORDER BY COUNT(*) DESC
;


#Find the average salary of employees earning more than 60,000.
SELECT occupation,
       AVG(salary) AS AverageSalary
FROM employee_salary
WHERE salary > 60000
GROUP BY occupation
;