-- 1) WRITE a QUERY that RETURNS ALL employees, their department number, their START DATE, their END DATE, AND a NEW COLUMN 'is_current_employee' that IS a 1 IF the employee IS still WITH the company AND 0 IF not.
USE employees;

SELECT CONCAT(first_name, ' ', last_name), de.dept_no AS department_number, de.from_date AS start_date, de.to_date AS end_date,
	IF (de.to_date = '9999-01-01', 1, 0) AS is_current_employee
FROM employees
JOIN dept_emp de USING(emp_no);
	

-- 2) WRITE a QUERY that RETURNS ALL employee NAMES (previous AND current), AND a NEW COLUMN 'alpha_group' that RETURNS 'A-H', 'I-Q', OR 'R-Z' depending ON the FIRST letter of their LAST name.
SELECT CONCAT(first_name, ' ', last_name),
	CASE
	  WHEN last_name < 'I' THEN '(A-H)'
	  WHEN last_name >= 'I' AND last_name < 'R' THEN '(I-Q)'
	     ELSE '(R-Z)'
	END AS alpha_group
FROM employees
ORDER BY last_name;


-- 3) How many employees (current OR previous) were born IN EACH decade?
SELECT birth_date
FROM employees;

SELECT COUNT(*),
  CASE
  	WHEN birth_date < '1960-01-01' THEN 'Fifties'
  	WHEN birth_date >= '1960-01-01' THEN 'Sixties'
  	END AS decades
  FROM employees
  GROUP BY decades;
 
 -- more sophisticated solution
  SELECT CONCAT(LEFT(birth_date, 3), '0s') AS decade,
       COUNT(*)
  FROM employees
  GROUP BY decade;
  	
		
-- 4) What IS the current average salary FOR EACH of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT 
       CASE 
         WHEN dept_name IN ('Research', 'Development') THEN 'R&D'
         WHEN dept_name IN ('Sales', 'Marketing') THEN 'Sales & Marketing' 
         WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
         WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
         		WHEN dept_name IN ('Customer Service') THEN 'Customer Service'
         END AS dept_group,
       AVG(s.salary) AS avg_salary
  FROM salaries s 
    JOIN employees e ON s.emp_no = e.emp_no
    JOIN dept_emp de ON e.emp_no = de.emp_no 
    JOIN departments d ON de.dept_no = d.dept_no
  WHERE s.to_date = '9999-01-01'
    AND de.to_date = '9999-01-01'
  GROUP BY dept_group;

