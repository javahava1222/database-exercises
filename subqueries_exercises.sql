-- 1) Find all the current employees with the same hire date as employee 101010 using a sub-query.
USE employees;

SELECT CONCAT(first_name, ' ', last_name) AS employees
FROM employees
WHERE emp_no IN (SELECT emp_no
                 FROM dept_emp
                 WHERE to_date > NOW())
AND hire_date = (SELECT hire_date
                   				FROM employees 
                   				WHERE emp_no = '101010');

-- 2) Find all the titles ever held by all current employees with the first name Aamod.
SELECT title
FROM titles
WHERE titles.to_date > NOW() 
	AND emp_no IN 
	(SELECT emp_no 
	FROM employees 
	WHERE first_name = 'Aamod')
GROUP BY title;

-- 3) How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT COUNT(*) AS 'no longer working'
FROM employees
WHERE emp_no NOT IN 
	(SELECT emp_no 
	FROM dept_emp 
	WHERE to_date > NOW()); -- 59900

-- 4) Find all the current department managers that are female. List their names in a comment in your code.
SELECT CONCAT(first_name, ' ', last_name) AS deparment_managers
FROM employees
WHERE emp_no IN 
	(SELECT emp_no 
	FROM dept_manager 
	WHERE to_date > NOW()) 
	AND gender = 'F';
	
/* Isamu Legleitner
Karsten Sigstam
Leon DasSarma
Hilary Kambil */

-- 5) Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT *
FROM employees
WHERE emp_no IN 
	(SELECT emp_no
	FROM salaries s
	WHERE to_date > now()
	AND salary > 
		(SELECT AVG(salary)
		FROM salaries
		)
	);
	

-- 6) How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
SELECT(
	(SELECT count(*)
	 FROM salaries
	 WHERE to_date > NOW()
	 AND salary > (
	 	(SELECT max(salary) 
			FROM salaries 
			WHERE to_date > NOW()
		  ) - 
			(SELECT STDDEV(salary) 
			FROM salaries 
			WHERE to_date > NOW()
			)
	 				)	
							)/(SELECT count(*)
FROM salaries 
WHERE to_date > now())) * 100 AS 'percentage within 1 Stdev of Max'; -- 0.03%


-- Hint Number 1 You will likely use a combination of different kinds of subqueries.
-- Hint Number 2 Consider that the following code will produce the z score for current salaries.