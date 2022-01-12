USE employees;

SHOW Tables;

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');

-- 2) 709 records returned

SELECT * FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

-- 3) it matches the number on Q2

SELECT * FROM employees WHERE gender = 'M' AND (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya');

-- 4) 468 records returned

SELECT * FROM employees WHERE last_name LIKE 'E%';

-- 5) 7330 records returned

SELECT * FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E';

-- 6) 30723 records returned

SELECT * FROM employees WHERE last_name LIKE '%E' AND last_name NOT LIKE 'E%';

-- 6) 23393 records returned that does not start with E and ends with E

SELECT * FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E';

-- 7) 899 records returned

SELECT * FROM employees WHERE last_name LIKE '%E';

-- 7) 24292 employees' name end with E

SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

-- 8) 135214 records returned

SELECT * FROM employees WHERE hire_date LIKE '%12-25';

-- 9) 289 records returned

SELECT * FROM employees WHERE hire_date LIKE '%12-25' AND hire_date BETWEEN '1990-01-01' AND '1999-12-31';

-- 10) 346 records returned

SELECT * FROM employees WHERE last_name LIKE 'Q%' OR last_name LIKE '%Q' OR last_name LIKE '%Q%';

-- 11) 1873 records returned

SELECT * FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

-- 12) 547 records returned












