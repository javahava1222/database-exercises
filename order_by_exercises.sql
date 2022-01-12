USE employees;

SHOW Tables;

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name;

-- 2) The first and last name in the first row is 'Irena Reutenauer'. The name in the last row is 'Vidya Simmen'

SELECT * FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya' ORDER BY first_name, last_name;

-- 3) The first row is Irena Acton and the last row is Vidya Zweizig

SELECT * FROM employees WHERE gender = 'male' AND first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya' ORDER BY last_name, first_name;

-- 4) The first row is Vidya Akiyama and the last row is Maya Zyda

SELECT * FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E' ORDER BY emp_no;

-- 5) Number of employees returned is 899. The first emp_no 10021, and the first name and the last name is Ramzi Erde. 
-- 5) The last emp_no is 499648 and the name is Tadahiro Erde.

SELECT * FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E' ORDER BY hire_date;

-- 6)  899 records returned. The name of the newest employee is  Teiji Eldridge. The name of the oldest employee is Sergi Erde.

SELECT * FROM employees WHERE hire_date LIKE '%12-25' AND hire_date BETWEEN '1990-01-01' AND '1999-12-31' ORDER BY hire_date DESC, birth_date ASC;

-- 7) 346 records returned. The name of the oldest employee who was hired last is Vidya VanScheik. The name of the youngest employee who was hired first is Lena Lenart. 

