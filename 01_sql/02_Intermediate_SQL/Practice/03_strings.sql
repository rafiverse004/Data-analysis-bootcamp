Question 1 — Full Name

Using employee_demographics, combine first_name and last_name into one column: full_name

Expected structure: first_name | last_name | full_name
Use CONCAT().

-- solution
SELECT
    first_name,
    last_name,
    CONCAT (first_name, ' ', last_name) AS full_name
FROM employee_demographics
;



----------------------------------------------------------------------------------------------------

Question 2 — Uppercase Names

Display all employees with their first name in uppercase.

Return:

    first_name
    uppercase_first_name
Use UPPER().

-- solution
SELECT
    first_name,
    UPPER(first_name) AS UpperCase
FROM employee_demographics
;



----------------------------------------------------------------------------------------------------

Question 3 — Lowercase Occupation

Using employee_salary, display:

    occupation
    lowercase_occupation

Use LOWER().

-- solution
SELECT
    occupation,
    LOWER(occupation) AS LowerCase
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 4 — Name Length

Find the number of characters in each employees first name.

Return:

    first_name
    name_length
Use LENGTH().

-- solution
SELECT
    first_name,
    LENGTH(first_name) AS Length
FROM employee_demographics
;



----------------------------------------------------------------------------------------------------

Question 5 — Full Name in Uppercase Create a full_name containing:

    FIRST_NAME LAST_NAME, with everything in uppercase.

Example:
    LESLIE KNOPE
Use CONCAT() + UPPER().

-- solution
SELECT
    first_name,
    last_name,
    UPPER(CONCAT(first_name, ' ', last_name)) AS 'Name'
FROM employee_demographics
;



----------------------------------------------------------------------------------------------------

Question 6 — Name Initial

Return the first character of every employees first name.

    first_name | initial
Use LEFT().

-- solution
SELECT
    first_name,
    LEFT(first_name, 1) AS initial
FROM employee_demographics
;



----------------------------------------------------------------------------------------------------

Question 7 — Last 2 Characters

Return the last two characters of every employees last name.

    last_name | last_two
Use RIGHT().

-- solution
SELECT
    last_name,
    RIGHT(last_name, 2) AS last_two
FROM employee_demographics
;



----------------------------------------------------------------------------------------------------

Question 8 — First 3 Characters

Return the first three characters of each occupation.

    occupation | occupation_prefix
Use LEFT().

-- solution
SELECT
    occupation,
    LEFT(occupation, 3) AS occupation_prefix
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 9 — Extract Part of Name

Using first_name, extract characters 2 through 4.

Return:

    first_name
    name_part
Use SUBSTRING().

-- solution
SELECT
    first_name,
    SUBSTRING(first_name, 2, 3) AS name_part
FROM employee_demographics
;



----------------------------------------------------------------------------------------------------

Question 10 — Replace Characters

Using employee_salary, replace every space in occupation with a hyphen.

For example: Office Manager

becomes: Office-Manager

Return:

    occupation
    modified_occupation
Use REPLACE().

-- solution
SELECT
    occupation,
    REPLACE(occupation, ' ', '-') AS modified_occupation
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 11 — Create Employee ID Label
Create a text label combining: employee_id + first_name

For example, conceptually: 1 - Leslie

Return:
    employee_id
    first_name
    employee_label
Use CONCAT().

-- solution
SELECT
    employee_id,
    first_name,
    CONCAT(employee_id, ' - ', first_name) AS employee_label
FROM employee_demographics
;



----------------------------------------------------------------------------------------------------

Question 12 — Name Formatting
Create a properly formatted employee name:

    first_name + ' ' + last_name

    Then create another column containing the same name in uppercase.

Return:

    employee_name
    employee_name_upper

-- solution
SELECT
    CONCAT(first_name, ' ', last_name) AS employee_name,
    UPPER(CONCAT(first_name, ' ', last_name)) AS employee_name_upper
FROM employee_demographics
;



----------------------------------------------------------------------------------------------------

Question 13 — Occupation Analysis

Create a column called occupation_type based on the first character of the occupation:

    Occupation starts with D → 'D Group'
    Occupation starts with A → 'A Group'
    Everything else → 'Other'

"Hint: Use a string function to extract the first character."

-- solution
SELECT
    occupation,
    CASE
        WHEN LEFT(occupation, 1) = 'D' THEN 'D Group'
        WHEN LEFT(occupation, 1) = 'A' THEN 'A Group'
        ELSE 'Other'
    END AS occupation_type
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 14 — Name Search

Find employees whose first name contains the letter a.

Return:

    first_name
    last_name

"You can use a string function, but think about whether SQL has another operator specifically designed for this type of search."

-- solution
SELECT
    first_name,
    last_name
FROM employee_demographics
WHERE first_name LIKE '%a%';



----------------------------------------------------------------------------------------------------

Question 15

Create an employee profile label from employee_salary:

    EMPLOYEE_ID - FIRST_NAME LAST_NAME - OCCUPATION

For example, conceptually:

    1 - LESLIE KNOPE - DIRECTOR OF PARKS

Requirements:

    Employee ID
    Full name
    Occupation
    Everything in uppercase

Return:

    employee_id
    employee_profile

Youll need to combine multiple string functions.

-- solution
SELECT
    employee_id,
    CONCAT(employee_id, ' - ', UPPER(first_name), ' - ', UPPER(last_name), ' - ', occupation) AS employee_profile
FROM employee_salary
;