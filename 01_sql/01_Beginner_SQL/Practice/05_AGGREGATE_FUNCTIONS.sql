"
16. Count the total number of employees.

17. Find the highest salary.

18. Find the average salary.

19. Find the total salary paid to all employees.

"

#Count the total number of employees.
SELECT COUNT(*) AS 'Total Employee'
FROM employee_demographics
;


#Find the highest salary.
SELECT MAX(salary) AS 'Highest Salaary'
FROM employee_salary
;

#Find the average salary.
SELECT AVG(salary) AS 'Average Salary'
FROM employee_salary
;


#Find the total salary paid to all employees.
SELECT SUM(salary) AS 'Total Salary'
FROM employee_salary
;