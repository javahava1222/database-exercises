-- Use the employees database
USE employees;

-- List all the tables in the database
SHOW tables; 
/* departments
dept_emp
dept_manager
employees
salaries
titles */

-- Explore the employees table. What different data types are present on this table? int, varchar, date

-- Which table(s) do you think contain a numeric type column? dept_emp, dept_manager, employees, salaries, and titles

-- Which table(s) do you think contain a string type column? departments, dept_emp, dept_manager, employees, and titles

-- Which table(s) do you think contain a date type column? dept_emp, dept_manager, employees, salaries, and titles

-- What is the relationship between the employees and the departments tables? there are no relationship between the employees and the departments tables

-- Show the SQL that created the dept_manager table. 
SHOW CREATE TABLE dept_manager;
