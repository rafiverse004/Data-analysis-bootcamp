Question 1 — Age Group

Using employee_demographics, create:

    Age ≤ 30 → 'Young'
    Age 31 – 50 → 'Middle-aged'
    Age > 50 → 'Older'

Return:

    first_name
    last_name
    age
    age_group

-- solution
SELECT
    first_name,
    last_name,
    age,
    CASE 
        WHEN age <= 30 THEN 'Young'
        WHEN age BETWEEN 31 AND 50 THEN 'Middle - aged'
        WHEN age > 50 THEN 'Older' 
    END AS age_group
FROM employee_demographics
;



----------------------------------------------------------------------------------------------------

Question 2 — Salary Level

Using employee_salary:

    Salary < 40,000 → 'Low'
    Salary 40,000–70,000 → 'Medium'
    Salary > 70,000 → 'High'

Return:

    first_name
    last_name
    salary
    salary_level

-- solution
SELECT
    first_name,
    last_name,
    salary,
    CASE 
        WHEN salary < 40000 THEN 'Low'
        WHEN salary BETWEEN 40000 AND 70000 THEN 'Medium'
        WHEN salary > 70000 THEN 'High' 
    END AS salary_level
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 3 — Department Status

Using employee_salary:

    dept_id IS NULL → 'No Department'
    Otherwise → 'Assigned'

Return:

    first_name
    last_name
    dept_id
    department_status

-- solution
SELECT
    first_name,
    last_name,
    dept_id,
    CASE 
        WHEN dept_id IS NULL THEN 'No Department'
        WHEN dept_id IS NOT NULL THEN 'Assigned'
    END AS department_status
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 4 — Salary Increase

Using employee_salary:

    Salary < 50,000 → 5% increase
    Salary ≥ 50,000 → 7% increase

Return:

    first_name
    last_name
    salary
    new_salary

-- solution
SELECT
    first_name,
    last_name,
    salary,
    CASE 
        WHEN salary < 50000 THEN salary + (salary * 0.05)  
        WHEN salary >= 50000 THEN salary + (salary * 0.07)
    END AS new_salary
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 5 — Bonus

Calculate a bonus:

    Salary < 40,000 → 5%
    Salary 40,000–60,000 → 7%
    Salary > 60,000 → 10%

Return:

    first_name
    last_name
    salary
    bonus

bonus should be the money amount, not "5%", "7%", etc.


-- solution
SELECT
    first_name,
    last_name,
    salary,
    CASE 
        WHEN salary < 40000 THEN salary * 0.05
        WHEN salary BETWEEN 40000 AND 60000 THEN salary * 0.07
        WHEN salary > 60000 THEN salary * 0.10
    END AS bonus
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 6 — Salary Category

Create:

    Salary < 30,000 → 'Low'
    Salary 30,000–50,000 → 'Medium'
    Salary > 50,000 → 'High'

Return:

    first_name
    last_name
    salary
    salary_category

Pay attention to the boundaries.

-- solution
SELECT
    first_name,
    last_name,
    salary,
    CASE 
        WHEN salary < 30000 THEN 'Low'
        WHEN salary BETWEEN 30000 AND 50000 THEN 'Medium'
        WHEN salary > 50000 THEN 'High'
    END AS salary_category
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

"Question 7 — Employee Type

Using employee_demographics:

    Age < 30 AND Male → 'Young Male'
    Age < 30 AND Female → 'Young Female'
    Age ≥ 30 AND Male → 'Older Male'
    Age ≥ 30 AND Female → 'Older Female'

Return:

    first_name
    last_name
    age
    gender
    employee_type"

-- solution
SELECT
    first_name,
    last_name,
    age,
    gender,
    CASE 
        WHEN age < 30 AND gender = 'Male' THEN 'Young Male'
        WHEN age < 30 AND gender = 'Female' THEN 'Young Female'
        WHEN age >= 30 AND gender = 'Male' THEN 'Older Male'
        WHEN age >= 30 AND gender = 'Female' THEN 'Older Female'
    END AS employee_type
FROM employee_demographics
;



----------------------------------------------------------------------------------------------------

Question 8 — Salary Review

Using employee_salary:

    Salary < 30,000 → 'Review Required'
    Salary 30,000–60,000 → 'Normal'
    Salary > 60,000 → 'High Earner'

Return:

    first_name
    last_name
    salary
    salary_status

-- solution
SELECT
    first_name,
    last_name,
    salary,
    CASE 
        WHEN salary < 30000 THEN 'Review Required'
        WHEN salary BETWEEN 30000 AND 60000 THEN 'Normal'
        WHEN salary > 60000 THEN 'High Earner'
    END AS salary_status
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 9 — Compensation Decision

Using employee_salary:

    Salary < 30,000 → 10% raise
    Salary 30,000–50,000 → 7% raise
    Salary > 50,000 → 5% raise

Calculate the new salary.

Return:

    first_name
    last_name
    salary
    new_salary

-- solution
SELECT
    first_name,
    last_name,
    salary,
    CASE 
        WHEN salary < 30000 THEN salary + (salary * 0.10)  
        WHEN salary BETWEEN 30000 AND 50000 THEN salary + (salary * 0.07)
        WHEN salary > 50000 THEN salary + (salary * 0.05)
    END AS new_salary
FROM employee_salary
;



----------------------------------------------------------------------------------------------------

Question 10 — Employee Risk

Using employee_demographics and the salary information available:

Classify employees:

    Low salary + older age → 'High Risk'
    Low salary + younger age → 'Medium Risk'
    Otherwise → 'Low Risk'

"Don't solve this with a JOIN yet. If you realize you need data from both tables, leave this one for later. That's intentional."

-- solution
SELECT
    demo.first_name,
    demo.last_name,
    demo.age,
    sal.salary,
    CASE
        WHEN sal.salary < 40000 AND demo.age > 40 THEN 'High Risk'
        WHEN sal.salary < 40000 AND demo.age <= 40 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS employee_risk
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
;



----------------------------------------------------------------------------------------------------

Question 11 — Salary Review Priority

Using employee_salary, create review_priority:

    Salary < 30,000 → 'High Priority'
    Salary 30,000–50,000 → 'Medium Priority'
    Salary > 50,000 → 'Low Priority'
    salary IS NULL → 'Unknown'

Return:

    first_name
    last_name
    salary
    review_priority

Important: Think about the order of your WHEN conditions.

-- solution
SELECT
    first_name,
    last_name,
    salary,
    CASE
        WHEN salary IS NULL THEN 'Unknown'
        WHEN salary < 30000 THEN 'High Priority'
        WHEN salary BETWEEN 30000 AND 50000 THEN 'Medium Priority'
        WHEN salary > 50000 THEN 'Low Priority'
    END AS review_priority
FROM employee_salary
;


----------------------------------------------------------------------------------------------------

Question 12 ⭐ — Conditional Salary Adjustment

The company wants to adjust salaries:

    Salary < 40,000 → 10% increase
    Salary 40,000–60,000 → 7% increase
    Salary > 60,000 → 5% increase
    If dept_id = 6, give an additional 3%

Return:

    first_name
    last_name
    salary
    dept_id
    adjusted_salary

"This is a good final test because you need to think carefully about multiple conditions and calculation logic."

-- solution
SELECT
    first_name,
    last_name,
    salary,
    dept_id,
    CASE
        WHEN salary < 40000 AND dept_id = 6
            THEN salary * 1.13

        WHEN salary < 40000
            THEN salary * 1.10

        WHEN salary BETWEEN 40000 AND 60000 AND dept_id = 6
            THEN salary * 1.10

        WHEN salary BETWEEN 40000 AND 60000
            THEN salary * 1.07

        WHEN salary > 60000 AND dept_id = 6
            THEN salary * 1.08

        WHEN salary > 60000
            THEN salary * 1.05
    END AS adjusted_salary
FROM employee_salary
;