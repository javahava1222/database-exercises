-- 1) Create a new file named group_by_exercises.sql
USE employees;
-- 2) In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.

-- there are 7 unique titles, which are...

/* Senior Engineer
Staff
Engineer
Senior Staff
Assistant Engineer
Technique Leader
Manager */

SELECT DISTINCT title
FROM titles;

-- 3) Write a query to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
SELECT last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name;

-- 4) Write a query to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT last_name, first_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name, first_name;

-- 5) Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name; -- Chleq, Lindqvist, Qiwen


-- 6) Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
SELECT last_name, COUNT(*)
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

/* Chleq	189
Lindqvist	190
Qiwen	168 */

-- 7) Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

SELECT first_name, gender, COUNT(*)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender;

-- 8) Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?

SELECT lower(concat(substr(first_name,1,1), substr(last_name,1,4),'_', substr(birth_date, 6, 2), substr(birth_date,3,2))) AS username, COUNT(*)
FROM employees
GROUP BY username
HAVING COUNT(*) > 1; -- 13251 duplicate usernames

-- 9) More practice with aggregate functions:

-- Determine the historic average salary for each employee. When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column.

DESCRIBE salaries;

SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no;

-- Using the dept_emp table, count how many current employees work in each department. The query result should show 9 rows, one for each department and the employee count.
DESCRIBE dept_emp;

SELECT dept_no, COUNT(*)
FROM dept_emp
WHERE to_date > NOW()
GROUP BY dept_no;

-- Determine how many different salaries each employee has had. This includes both historic and current.
DESCRIBE salaries;

SELECT emp_no, COUNT(*)
FROM salaries
GROUP BY emp_no;

-- Find the maximum salary for each employee.
SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no;

-- Find the minimum salary for each employee.
SELECT emp_no, MIN(salary)
FROM salaries
GROUP BY emp_no;

-- Find the standard deviation of salaries for each employee.
SELECT emp_no, STDDEV(salary)
FROM salaries
GROUP BY emp_no;

-- Now find the max salary for each employee where that max salary is greater than $150,000.
SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no
HAVING MAX(salary) > 150000;

-- Find the average salary for each employee where that average salary is between $80k and $90k.
SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) BETWEEN 80000 AND 90000;