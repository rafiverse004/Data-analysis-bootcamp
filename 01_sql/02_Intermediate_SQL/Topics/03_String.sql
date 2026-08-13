-- Finding length
SELECT LENGTH('skyfall')
;

-- Find length of first names
SELECT first_name, LENGTH(first_name)
FROM employee_demographics
;

-- Making UPPERCASE
SELECT UPPER('sky')
;

-- Making LOWERCASE
SELECT LOWER('SKY')
;

-- Trimming
SELECT TRIM('        sky         ')
;

-- Left Trimming
SELECT LTRIM('        sky         ')
;

-- Right Trimming
SELECT RTRIM('        sky         ')
;

-- Substring
SELECT
    first_name,
    LEFT(first_name, 4),
    RIGHT(first_name, 4),
    SUBSTRING(first_name, 3, 2),
    SUBSTRING(birth_date, 1, 4) AS 'Birth Year'
FROM employee_demographics
;

-- Replace
SELECT
    first_name,
    REPLACE(first_name, 'a','z')
FROM employee_demographics
;

-- Locate
SELECT LOCATE('x', 'Alexgendar')
;

SELECT
    first_name,
    LOCATE('An' ,first_name)
FROM employee_demographics
;

-- Concatanation
SELECT
    first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) AS 'Full name'
FROM employee_demographics
;

-- Concat ws
SELECT
    first_name,
    last_name,
    CONCAT_WS(' ', first_name, last_name) AS 'Full name'
FROM employee_demographics
;

SELECT
    first_name,
    last_name,
    CONCAT_WS('-', '2026','07','18') AS 'Joining Day'
FROM employee_demographics
;

-- Reverse()
SELECT REVERSE('SQL')
;

-- ASCII()
SELECT ASCII('A')
;

-- Repeat()
SELECT REPEAT('*',5)
;

-- LPAD()
SELECT
    LPAD('SQL', 5, '*')
;

-- Format()
SELECT FORMAT(1234567.89,2)
;

-- Nested Function
SELECT
    UPPER(LEFT(first_name,3))
FROM employee_demographics
;

SELECT
    CONCAT
    (
        UPPER(LEFT(first_name,1)),
        LOWER(SUBSTRING(first_name,2))
    )
FROM employee_demographics
;

-- String Functions in WHERE
SELECT *
FROM employee_demographics
WHERE LEFT(first_name,1)='A'
;