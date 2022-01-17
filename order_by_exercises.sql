USE employees;

SHOW Tables;

-- 2) Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
-- The first and last name in the first row is 'Irena Reutenauer'. The name in the last row is 'Vidya Simmen'
SELECT * 
FROM employees 
WHERE first_name IN ('Irena', 'Vidya', 'Maya') 
ORDER BY first_name;

-- 3) Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
-- The first row is Irena Acton and the last row is Vidya Zweizig
SELECT * 
FROM employees
WHERE first_name = 'Irena' 
	OR first_name = 'Vidya' 
	OR first_name = 'Maya' 
ORDER BY first_name, last_name;

-- 4) Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
-- The first row is Irena Acton and the last row is Maya Zyda
SELECT * 
FROM employees 
WHERE gender = 'M' 
AND first_name = 'Irena' 
	OR first_name = 'Vidya' 
	OR first_name = 'Maya' 
ORDER BY last_name, first_name;

-- 5) Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
-- Number of employees returned is 899. The first emp_no 10021, and the first name and the last name is Ramzi Erde. 
-- The last emp_no is 499648 and the name is Tadahiro Erde.
SELECT * 
FROM employees 
WHERE last_name LIKE 'E%' 
AND last_name LIKE '%E' 
ORDER BY emp_no;

-- 6)  Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
-- 899 records returned. The name of the newest employee is  Teiji Eldridge. The name of the oldest employee is Sergi Erde.
SELECT * 
FROM employees 
WHERE last_name LIKE 'E%' 
AND last_name LIKE '%E' 
ORDER BY hire_date;

-- 7) Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
-- 362 records returned. The name of the oldest employee who was hired last is Khun Bernini. The name of the youngest employee who was hired first is Douadi Pettis. 
SELECT * 
FROM employees 
WHERE birth_date LIKE '%12-25' 
AND hire_date BETWEEN '1990-01-01' AND '1999-12-31' 
ORDER BY birth_date ASC, hire_date DESC;


