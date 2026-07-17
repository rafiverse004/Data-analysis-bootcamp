"
The ORDER BY clause is used to sort the result set in ascending or descending order.

By default, SQL sorts in ascending (ASC) order.

Syntax:
SELECT column_name
FROM table_name
ORDER BY column_name;

ORDER BY age;

ORDER BY age DESC;

ORDER BY gender, age DESC;

Syntax:
SELECT column_name
FROM table_name
ORDER BY column_name;

"

#Sort in Ascending Order (ASC)
SELECT *
FROM employee_demographics
ORDER BY age ASC
;

#Sort in Descending Order (DESC)
SELECT *
FROM employee_demographics
ORDER BY age DESC
;

#Sort by Multiple Columns
SELECT *
FROM employee_demographics
ORDER BY gender, age
;

#Sort text column
SELECT *
FROM employee_demographics
ORDER BY first_name
;

#Sort by Multiple Text Columns
SELECT *
FROM employee_demographics
ORDER BY last_name, first_name
;

#Combining WHERE and ORDER BY
SELECT *
FROM employee_demographics
WHERE age >= 30
ORDER BY age DESC
;