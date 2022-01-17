'Join Example Database'

-- 1) Use the join_example_db. Select all the records from both the users and roles tables.
USE join_example_db;

--	2) Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
DESCRIBE roles;
DESCRIBE users;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;


--	3) Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of along with the number of users that has the role. Hint: You will also need to use group by in the query.

SELECT roles.name AS role_name, COUNT(*) AS employee_number
FROM roles
LEFT JOIN users ON users.role_id = roles.id
GROUP BY role_name;


'Employees Database'

-- 1) Use the employees database.
USE employees;

--  2) Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT d.dept_name AS Departments, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
  WHERE dm.to_date > NOW()
  ORDER BY d.dept_name;

-- 3) Find the name of all departments currently managed by women.
SELECT d.dept_name AS Departments, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
  WHERE dm.to_date > NOW() AND e.gender = 'F'
  ORDER BY d.dept_name;

-- 4) Find the current titles of employees currently working in the Customer Service department.
SELECT title, COUNT(*)
FROM titles AS t
JOIN dept_emp AS de
  ON de.emp_no = t.emp_no
WHERE t.to_date > NOW() AND de.to_date > NOW() AND de.dept_no = 'd009'
GROUP BY title;

-- 5) Find the current salary of all current managers.
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name, s.salary
FROM employees AS e
JOIN salaries AS s
ON s.emp_no = e.emp_no
JOIN dept_manager AS dm
ON dm.emp_no = e.emp_no
JOIN departments AS d
ON d.dept_no = dm.dept_no
WHERE s.to_date > NOW() AND dm.to_date > NOW()
ORDER BY d.dept_name;


-- 6) Find the number of current employees in each department.
SELECT d.dept_no, d.dept_name, COUNT(*) AS num_employees
FROM departments AS d
JOIN dept_emp AS de
ON d.dept_no = de.dept_no
WHERE de.to_date > NOW()
GROUP BY d.dept_no
ORDER BY d.dept_no;

-- 7) Which department has the highest average salary? Hint: Use current not historic information.
SELECT d.dept_name, AVG(s.salary) AS average_salary
FROM departments AS d
JOIN dept_emp AS de
ON de.dept_no = d.dept_no
JOIN salaries AS s
ON s.emp_no = de.emp_no
WHERE s.to_date > NOW() 
GROUP BY d.dept_name
ORDER BY AVG(s.salary) DESC
LIMIT 1;


-- 8) Who is the highest paid employee in the Marketing department?
SELECT e.first_name, e.last_name
  FROM departments AS d
    JOIN dept_emp AS de 
      ON d.dept_no = de.dept_no
    JOIN employees AS e
      ON de.emp_no = e.emp_no
    JOIN salaries AS s  
      ON e.emp_no = s.emp_no
  WHERE s.to_date > NOW()
    AND d.dept_name = 'Marketing'
  ORDER BY s.salary DESC
  LIMIT 1;


-- 9) Which current department manager has the highest salary?
SELECT d.dept_name AS 'Department',
       CONCAT(e.first_name, ' ', e.last_name) AS 'Full name',
       s.salary AS 'Salary'
  FROM departments AS d
    JOIN dept_manager AS dm
      ON d.dept_no = dm.dept_no
    JOIN employees AS e
      ON dm.emp_no = e.emp_no
    JOIN salaries AS s
      ON e.emp_no = s.emp_no 
  WHERE dm.to_date > NOW()
    AND s.to_date > NOW()
  ORDER BY s.salary DESC 
  LIMIT 1;

-- 10) Determine the average salary FOR EACH department. USE ALL salary information AND round your results.
SELECT d.dept_name AS 'Department', 
       ROUND(AVG(s.salary), 0) AS 'Average Salary'
  FROM departments AS d
    JOIN dept_emp AS de 
      ON d.dept_no = de.dept_no
    JOIN employees AS e
      ON de.emp_no = e.emp_no 
    JOIN salaries AS s 
      ON e.emp_no = s.emp_no
  GROUP BY d.dept_name
  ORDER BY AVG(s.salary) DESC;

-- Bonus Find the names of all current employees, their department name, and their current manager's name.

-- Bonus Who is the highest paid employee within each department.
