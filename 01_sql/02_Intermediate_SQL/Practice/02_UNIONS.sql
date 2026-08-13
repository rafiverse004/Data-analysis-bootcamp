Question 1

Create a list containing all employee first names from both:

    employee_demographics
    employee_salary

Return: first_name
Use UNION.

-- solution
SELECT first_name
FROM employee_demographics

UNION

SELECT first_name
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 2

Create one list containing:

    first_name
    last_name

from both tables.
Use: UNION

Dont use SELECT *.

-- solution
SELECT first_name, last_name
FROM employee_demographics

UNION

SELECT first_name, last_name
FROM employee_salary
;


----------------------------------------------------------------------------------------------------

Question 3

Repeat Question 2, but use:

    UNION ALL

Then compare the number of rows returned with Question 2.

Think: Why are the results different?

-- solution
SELECT first_name, last_name
FROM employee_demographics

UNION ALL

SELECT first_name, last_name
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 4

Using UNION, combine the following two employee lists:

    List A: employees older than 30

    List B: employees earning more than 50,000

Return:

    employee_id
    first_name
    last_name

You should get each employee only once, even if they satisfy both conditions.

-- solution
SELECT
    employee_id,
    first_name,
    last_name
FROM employee_demographics
WHERE age > 30

UNION

SELECT
    employee_id,
    first_name,
    last_name
FROM employee_salary
WHERE salary > 50000
;



----------------------------------------------------------------------------------------------------

Question 5
Do the same thing using UNION ALL.

Then ask yourself:

    Why might the same employee appear more than once?
    ANS: Because Union give UNIQUE but union all give all matches

-- solution
SELECT
    employee_id,
    first_name,
    last_name
FROM employee_demographics
WHERE age > 30

UNION ALL

SELECT
    employee_id,
    first_name,
    last_name
FROM employee_salary
WHERE salary > 50000
;



----------------------------------------------------------------------------------------------------

Question 6

Create a single list of employees who meet either condition:

    Age < 30
    Age > 50

Return:

    employee_id
    first_name
    last_name
    age
Use UNION.

-- solution
SELECT
    employee_id,
    first_name,
    last_name,
    age
FROM employee_demographics
WHERE age < 30

UNION

SELECT
    employee_id,
    first_name,
    last_name,
    age
FROM employee_demographics
WHERE age > 50
;



----------------------------------------------------------------------------------------------------

Question 7
Create a single list containing employees who either:
    earn less than 40,000
    OR earn more than 70,000

Return:
    employee_id
    first_name
    last_name
    salary
Use UNION.

-- solution
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employee_salary
WHERE salary < 40000

UNION

SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employee_salary
WHERE salary > 70000
;



----------------------------------------------------------------------------------------------------

Question 8

Management wants a list of employees who are either:

    Group 1: Female employees OR

    Group 2: Employees earning more than 70,000.

Return:
    employee_id
    first_name
    last_name
Use UNION.

Make sure employees satisfying both conditions dont appear twice.

-- solution
SELECT
    employee_id,
    first_name,
    last_name
FROM employee_demographics
WHERE gender = 'Female'

UNION

SELECT
    employee_id,
    first_name,
    last_name
FROM employee_salary
WHERE salary > 70000
;



----------------------------------------------------------------------------------------------------

Question 9 ⭐

Create two groups:
    Group 1: Employees younger than 30

    Group 2: Employees with salary greater than 60,000

Return:
    employee_id
    first_name
    last_name

Add another column called: source that identifies where the employee came from:
    'Young'
    'High Salary'

Youll need to think about how each SELECT in a UNION can create a constant value.

-- solution
SELECT
    employee_id,
    first_name,
    last_name,
    'Young' AS source
FROM employee_demographics
WHERE age < 30

UNION

SELECT
    employee_id,
    first_name,
    last_name,
    'High Salary' AS source
FROM employee_salary
WHERE salary > 60000
;



----------------------------------------------------------------------------------------------------

Question 10

Create a single employee list containing:

    Group A Employees younger than 30

    Group B Employees older than 40

Return:
    employee_id
    first_name
    last_name
    age
    employee_group

Where:
    Group A → 'Young'
    Group B → 'Older'
Use UNION.

-- solution
SELECT
    employee_id,
    first_name,
    last_name,
    age,
    'Young' AS employee_group
FROM employee_demographics
WHERE age < 30

UNION

SELECT
    employee_id,
    first_name,
    last_name,
    age,
    'Older' AS employee_group
FROM employee_demographics
WHERE age > 40;