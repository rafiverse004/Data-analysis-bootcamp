"
24. Show occupations that have more than 1 employee.

25. Show genders whose average age is greater than 35.

"

#Show occupations that have more than 1 employee.
SELECT occupation, COUNT(*) AS TotalEmployees
FROM employee_salary
GROUP BY occupation
HAVING COUNT(*) > 1
;


#Show genders whose average age is greater than 35.
SELECT gender, AVG(age) AS AverageAge
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 35
;