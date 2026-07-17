SELECT *
FROM employee_demographics
;


SELECT *
FROM employee_salary
;


SELECT *
FROM parks_departments
;


#1.Display each employee's first name, last name, occupation, and salary.
SELECT demo.first_name,
        demo.last_name,
        sal.occupation,
        sal.salary
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
;



#2.Display each employee's first name, gender, and occupation.
SELECT demo.first_name,
        demo.gender,
        sal.occupation
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
;



#3.Show all employees whose salary is greater than 60,000.
SELECT *
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
WHERE sal.salary > 60000
;



#4.Display each employees full name (first and last name) along with their salary, sorted from highest salary to lowest.
SELECT demo.first_name,
        demo.last_name,
        CONCAT(demo.first_name, ' ', demo.last_name) AS Fullname,
        sal.salary
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
ORDER BY sal.salary DESC
;



#5.Find the average salary for each gender.
SELECT demo.gender,
        AVG(sal.salary) AS AverageSalary
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
GROUP BY demo.gender
;



#6.Display all employees from employee_demographics along with their occupation, even if they don't have a salary record.
SELECT CONCAT(demo.first_name, ' ', demo.last_name) AS FullName,
    sal.occupation
FROM employee_demographics AS demo
LEFT JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
;



#7
"
Find employees who do not have a matching salary record.

Hint: Their salary columns will be NULL.
"

SELECT demo.first_name,
    demo.last_name,
    sal.salary
FROM employee_demographics AS demo
LEFT JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
WHERE sal.salary IS NULL
;




#8.Display all employees and their salary. Sort the results by salary from highest to lowest.
SELECT CONCAT(demo.first_name, ' ', demo.last_name) AS FullName,
    sal.salary
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
ORDER BY sal.salary DESC
;



#9
"
Count how many employees have a salary record and how many do not.

(This one is a little more challenging.)
"

SELECT
    COUNT(sal.salary) AS WithSalary,
    COUNT(*) - COUNT(sal.salary) AS WithoutSalary
FROM employee_demographics demo
LEFT JOIN employee_salary sal
    ON demo.employee_id = sal.employee_id
;



#10
"
Display every employee's first name, last name, occupation, and salary. Replace missing salaries with 0.

(You may need IFNULL() or COALESCE(), depending on your SQL database.)
"

SELECT demo.first_name,
    demo.last_name,
    sal.occupation,
    IFNULL(sal.salary, 0) AS Salary
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
;



#11.Display all salary records, even if there is no matching employee in employee_demographics.
SELECT *
FROM employee_salary AS sal
RIGHT JOIN employee_demographics AS demo
    ON sal.employee_id = demo.employee_id
;



#12.Find salary records that do not have a matching employee.
SELECT *
FROM employee_demographics AS demo
RIGHT JOIN employee_salary AS sal
    ON sal.employee_id = demo.employee_id
WHERE demo.employee_id IS NULL
;



#13.Display every occupation and salary, along with the employee's first and last name if available.
SELECT
    demo.first_name,
    demo.last_name,
    sal.occupation,
    sal.salary
FROM employee_salary AS sal
LEFT JOIN employee_demographics AS demo
    ON sal.employee_id = demo.employee_id
;



#14
"
Recreate the Secret Santa pairing.

Each employee gives a gift to the employee whose employee_id is 1 greater than theirs.
"

SELECT
    demo.employee_id AS SecretSanta,
    demo.first_name AS SantaFirstName,
    demo.last_name AS SantaLastName,
    sal.employee_id AS LuckyPerson,
    sal.first_name AS LuckyPersonFirstName,
    sal.last_name AS LuckyPersonLastName
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id + 1 = sal.employee_id
;



#15
"
Show only the first names of both the Secret Santa and the person receiving the gift.
"

SELECT
    demo.first_name AS SantaFirstName,
    sal.first_name AS LuckyPersonFirstName
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id + 1 = sal.employee_id
;



#16
"
Modify the Secret Santa query so that only employees with an assigned partner are shown.

(Think about what happens to the last employee.)
"

SELECT
    demo.first_name AS SantaFirstName,
    sal.first_name AS LuckyPersonFirstName
FROM employee_demographics AS demo
INNER JOIN employee_salary AS sal
    ON demo.employee_id + 1 = sal.employee_id
;



#17
"
Display each employee's:

First name
Last name
Occupation
Salary
Department name
"

SELECT
    sal.first_name,
    sal.last_name,
    sal.occupation,
    sal.salary,
    dept.department_name
FROM employee_salary AS sal
LEFT JOIN parks_departments AS dept
    ON sal.dept_id = dept.department_id
;



#18.Find the average salary for each department.
SELECT
    dept.department_name,
    AVG(sal.salary) AS AverageSalary
FROM employee_salary AS sal
JOIN parks_departments AS dept
    ON sal.dept_id = dept.department_id
GROUP BY dept.department_name
;



#19
"
Display all employees who work in the Parks & Recreation department.

(Use the department name, not the department ID.)
"

SELECT *
FROM employee_salary AS sal
JOIN parks_departments AS pd
    ON sal.dept_id = pd.department_id
WHERE pd.department_name = "Parks and Recreation"
;
"WHERE → Filter rows
HAVING → Filter groups (after GROUP BY)"



#20
"
Find the department that has the Highest average salary.

Display:

Department name
Average salary

Sort from highest to lowest.

"

SELECT
    pd.department_name,
    AVG(es.salary) AS AverageSalary
FROM employee_salary AS es
JOIN parks_departments AS pd
    ON es.dept_id = pd.department_id
GROUP BY pd.department_name
ORDER BY AVG(es.salary) DESC
;



#21.Find the top 5 highest-paid employees, including their department name.
SELECT
    es.first_name,
    es.last_name,
    es.salary,
    pd.department_name
FROM employee_salary AS es
JOIN parks_departments AS pd
    ON es.dept_id = pd.department_id
ORDER BY es.salary DESC
LIMIT 5
;





#22.For each department, count the number of employees.
SELECT
    pd.department_name,
    COUNT(*) AS TotalEmployees
FROM employee_salary AS es
JOIN parks_departments AS pd
    ON es.dept_id = pd.department_id
GROUP BY pd.department_name
;




#23.Find employees who earn more than the average salary of all employees. May need sub-query
SELECT *
FROM employee_salary AS es
JOIN parks_departments AS pd
    ON es.dept_id = pd.department_id
WHERE es.salary > 
    (
        SELECT AVG(es.salary)
        FROM employee_salary AS es
    )
;





#24
"
Find the employee(s) with the highest salary.

(Try solving this without using LIMIT.) May need Sub-query
"

SELECT *
FROM employee_salary
WHERE salary = 
    (
        SELECT MAX(salary)
        FROM employee_salary
    )
;





#25
"
For each department, display:

Department name
Number of employees
Minimum salary
Maximum salary
Average salary
"

SELECT
    pd.department_name,
    COUNT(*),
    MIN(es.salary),
    MAX(es.salary),
    AVG(es.salary)
FROM employee_salary AS es
JOIN parks_departments AS pd
    ON es.dept_id = pd.department_id
GROUP BY pd.department_name
;





#Aggregate function remember this
"
✅ If I use an aggregate function AND I also select normal columns, then I must GROUP BY those normal columns.

Aggregate only?
→ No GROUP BY needed.

Aggregate + normal column?
→ GROUP BY the normal column.

"