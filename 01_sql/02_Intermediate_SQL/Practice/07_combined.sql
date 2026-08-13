Question 1 — Employee Report

Management wants a basic employee report.

Return:

    employee_id
    full_name
    age
    occupation
    salary
    salary_level

Where salary_level is:

    < 40,000 → 'Low'
    40,000  –   70,000 → 'Medium'
    > 70,000 → 'High'

Think: You need information from more than one table.

-- solution



----------------------------------------------------------------------------------------------------

Question 2 — Salary Ranking

Management wants to see employees ranked by salary.

Return:

    employee_id
    full_name
    occupation
    salary
    salary_rank

Highest salary should receive rank 1.

-- solution



----------------------------------------------------------------------------------------------------

Question 3 — Above Average

Find employees whose salary is higher than the overall average salary.

Return:

    first_name
    last_name
    occupation
    salary

Sort from highest salary to lowest.

-- solution



----------------------------------------------------------------------------------------------------

Question 4 — Department Salary Analysis

For every department, show:

    dept_id
    employee_count
    average_salary
    highest_salary
    lowest_salary

Sort departments by average salary from highest to lowest.

-- solution



----------------------------------------------------------------------------------------------------

Question 5 — Employee vs Department

Management wants to compare every employee's salary with their department's average salary.

Return:

    first_name
    last_name
    occupation
    dept_id
    salary
    department_average
    salary_difference

Where:

    salary_difference = employee salary - department average

-- solution



----------------------------------------------------------------------------------------------------

Question 6 — Top Earners

Find the top 2 highest-paid employees in each department.

Return:

    first_name
    last_name
    occupation
    dept_id
    salary

----------------------------------------------------------------------------------------------------

Question 7 — Salary Review

Management wants to identify employees who may need a salary review.

Return:

    first_name
    last_name
    age
    occupation
    salary
    review_status

Rules:

    Age > 40 AND salary < 50,000 → 'Review Required'
    Salary < 30,000 → 'Review Required'
    Everyone else → 'No Review'

----------------------------------------------------------------------------------------------------

Question 8 — Employee Profile

Create a formatted employee profile:

    employee_profile

Format:

    EMPLOYEE_ID - FULL NAME - OCCUPATION

Example:

    1 - LESLIE KNOPE - DIRECTOR OF PARKS

    Everything should be uppercase.

Return:

    employee_id
    employee_profile
    salary

-- solution



----------------------------------------------------------------------------------------------------

Question 9 — Department Salary Share

For every employee, calculate what percentage of their departments total salary they represent.

Return:

    first_name
    last_name
    dept_id
    salary
    department_total_salary
    salary_percentage

----------------------------------------------------------------------------------------------------

Question 10 — Highest Paid in Department

Find the highest-paid employee in each department.

Return:

    dept_id
    first_name
    last_name
    occupation
    salary

If two employees are tied for the highest salary, include both.

-- solution



----------------------------------------------------------------------------------------------------

Question 11 — Above Department Average

Find employees whose salary is higher than their departments average salary.

Return:

    first_name
    last_name
    occupation
    dept_id
    salary
    department_average

Sort by department and then salary descending.

-- solution



----------------------------------------------------------------------------------------------------

Question 12 — Salary Position

Create a report showing:

    first_name
    last_name
    salary
    salary_rank
    salary_category

Where:

    Salary < 40,000 → 'Low'
    Salary 40,000–70,000 → 'Medium'
    Salary > 70,000 → 'High'

And salary_rank ranks everyone from highest to lowest salary.

----------------------------------------------------------------------------------------------------

Question 13 — Young High Earners

Find employees who are:

    Age ≤ 30
    Salary > 50,000

Return:

    first_name
    last_name
    age
    occupation
    salary
    salary_rank

Rank them by salary.

-- solution



----------------------------------------------------------------------------------------------------

Question 14 — Department Performance

For every department, return:

    dept_id
    employee_count
    average_salary
    highest_salary
    department_rank

Rank departments by their average salary from highest to lowest.

-- solution



----------------------------------------------------------------------------------------------------

Question 15 ⭐ — Salary Outliers

Find employees whose salary is:

More than 20% above their departments average salary.

Return:

    first_name
    last_name
    occupation
    dept_id
    salary
    department_average
    percentage_above_average

This is a realistic analyst question.

-- solution



----------------------------------------------------------------------------------------------------

Question 16 — Employee Compensation Analysis

Management wants a complete compensation report.

Return:

    employee_id
    full_name
    occupation
    dept_id
    salary
    salary_category
    department_average
    salary_difference
    department_rank

Requirements:
    Create full_name

Categorize salary:
    < 40,000 → Low
    40,000–70,000 → Medium
    > 70,000 → High
    Calculate department average salary
    Calculate difference from department average
    Rank employees within their department

-- solution

