USE employees;

SELECT concat(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'E%E';

SELECT upper(concat(first_name, ' ', last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'E%E';

SELECT datediff(curdate(), hire_date)
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%-12-25';

SELECT MAX(salary), MIN(salary)
FROM salaries;

SELECT lower(concat(substr(first_name,1,1), substr(last_name,1,4),'_', substr(birth_date, 6, 2), substr(birth_date,3,2)))
FROM employees
