'Join Example Database'

-- Use the join_example_db. Select all the records from both the users and roles tables.
USE join_example_db;

--	Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
DESCRIBE roles;
DESCRIBE users;

SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

SELECT users.name as user_name, roles.name as role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name as user_name, roles.name as role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;


--	Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of along with the number of users that has the role. Hint: You will also need to use group by in the query.

SELECT roles.name as role_name, COUNT(*) as employee_number
FROM roles
LEFT JOIN users ON users.role_id = roles.id
GROUP BY role_name;


'Employees Database'

-- Use the employees database.
USE employees;

-- Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT d.dept_name as Departments, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
  WHERE dm.to_date > NOW();

-- Find the name of all departments currently managed by women.
SELECT d.dept_name as Departments, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
  WHERE dm.to_date > NOW() AND e.gender = 'F';

-- Find the current titles of employees currently working in the Customer Service department.
SELECT title, COUNT(*)
FROM titles AS t
JOIN dept_emp AS de
  ON de.emp_no = t.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE t.to_date > NOW()
GROUP BY title;

-- Find the current salary of all current managers.
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name), s.salary
FROM employees as e
JOIN salaries as s
ON s.emp_no = e.emp_no
JOIN dept_manager as dm
ON dm.emp_no = e.emp_no
JOIN departments as d
ON d.dept_no = dm.dept_no
WHERE s.to_date > NOW() AND dm.to_date > NOW();


-- Find the number of current employees in each department.
SELECT d.dept_no, d.dept_name, COUNT(*)
FROM departments as d
JOIN dept_emp as de
ON d.dept_no = de.dept_no
WHERE de.to_date > NOW()
GROUP BY d.dept_no
ORDER BY d.dept_no;

-- Which department has the highest average salary? Hint: Use current not historic information.
SELECT d.dept_name, AVG(s.salary)
FROM departments as d
JOIN dept_emp as de
ON de.dept_no = d.dept_no
JOIN salaries as s
ON s.emp_no = de.emp_no
WHERE s.to_date > NOW()
GROUP BY d.dept_name
HAVING MAX(s.salary);

+-----------+----------------+
| dept_name | average_salary |
+-----------+----------------+
| Sales     | 88852.9695     |
+-----------+----------------+
-- Who is the highest paid employee in the Marketing department?
SELECT 
FROM 


+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Akemi      | Warwick   |
+------------+-----------+
-- Which current department manager has the highest salary?


+------------+-----------+--------+-----------+
| first_name | last_name | salary | dept_name |
+------------+-----------+--------+-----------+
| Vishwani   | Minakawa  | 106491 | Marketing |
+------------+-----------+--------+-----------+
-- Determine the average salary for each department. Use all salary information and round your results.


+--------------------+----------------+
| dept_name          | average_salary | 
+--------------------+----------------+
| Sales              | 80668          | 
+--------------------+----------------+
| Marketing          | 71913          |
+--------------------+----------------+
| Finance            | 70489          |
+--------------------+----------------+
| Research           | 59665          |
+--------------------+----------------+
| Production         | 59605          |
+--------------------+----------------+
| Development        | 59479          |
+--------------------+----------------+
| Customer Service   | 58770          |
+--------------------+----------------+
| Quality Management | 57251          |
+--------------------+----------------+
| Human Resources    | 55575          |
+--------------------+----------------+
-- Bonus Find the names of all current employees, their department name, and their current manager's name.


240,124 Rows

Employee Name | Department Name  |  Manager Name
--------------|------------------|-----------------
 Huan Lortz   | Customer Service | Yuchang Weedman

 .....
-- Bonus Who is the highest paid employee within each department.
