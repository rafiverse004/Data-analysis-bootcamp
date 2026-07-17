"
20. Count the number of employees in each gender.

21. Find the average age for each gender.

22. Find the maximum salary for each occupation.

23. Count how many employees belong to each occupation.

"

#Count the number of employees in each gender.
SELECT gender, COUNT(*) AS 'Total Employees'
FROM employee_demographics
GROUP BY gender
;


#Find the average age for each gender.
SELECT gender, AVG(age) AS 'Average Age'
FROM employee_demographics
GROUP BY gender
;


#Find the maximum salary for each occupation.
SELECT occupation, MAX(salary) AS 'Highest Salary'
FROM employee_salary
GROUP BY occupation
;


#Count how many employees belong to each occupation.
SELECT occupation, COUNT(*) AS 'Total Employees'
FROM employee_salary
GROUP BY occupation
;