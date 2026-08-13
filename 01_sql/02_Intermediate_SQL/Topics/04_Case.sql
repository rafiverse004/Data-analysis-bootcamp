-- CASE statements

SELECT
    first_name,
    last_name,
    age,
    CASE 
        WHEN age <= 30 THEN "Young"
        WHEN age BETWEEN 31 AND 50 THEN "Old" ELSE "Young"
    END AS "Age bracket"
FROM employee_demographics;


-- Pay increase and bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10%
SELECT
    first_name,
    last_name,
    salary,
    CASE 
        WHEN salary < 50000 THEN salary + (salary * 0.05) 
        WHEN salary > 50000 THEN salary + (salary * 0.07)
    END AS "New salary",
    CASE 
        WHEN dept_id = 6 THEN salary + (salary * 0.10)  
    END AS "New salary"

FROM employee_salary