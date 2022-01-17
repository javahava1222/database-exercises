-- 1) USING the example FROM the lesson, CREATE a TEMPORARY TABLE called employees_with_departments that CONTAINS first_name, last_name, AND dept_name FOR employees currently WITH that department. Be absolutely sure TO CREATE this TABLE ON your own database. IF you see "Access denied for user ...", it means that the QUERY was attempting TO WRITE a NEW TABLE TO a DATABASE that you can only read.
USE Employees;
CREATE TEMPORARY TABLE employees_with_departments
    AS  SELECT e.first_name, 
               e.last_name, 
               d.dept_name
          FROM employees e 
            JOIN dept_emp de
              ON e.emp_no = de.emp_no
            JOIN departments d
              ON de.dept_no = d.dept_no 
          WHERE de.to_date > NOW();
          
-- 1a) ADD a COLUMN named full_name TO this table. It should be a VARCHAR whose length IS the sum of the lengths of the FIRST NAME AND LAST NAME COLUMNS
ALTER TABLE employees_with_departments
    ADD full_name VARCHAR(31);
    
-- 1b) UPDATE the TABLE so that FULL NAME COLUMN CONTAINS the correct DATA
UPDATE employees_with_departments
    SET full_name = CONCAT(first_name, ' ', last_name);
    
-- 1c) Remove the first_name AND last_name COLUMNS FROM the table.
ALTER TABLE employees_with_departments
    DROP COLUMN first_name;
    
    ALTER TABLE employees_with_departments
    DROP COLUMN last_name;
    
-- 1d) What IS another way you could have ended up WITH this same TABLE?
CREATE TEMPORARY TABLE employees_with_departments
    AS  SELECT d.dept_name,
               CONCAT(e.first_name, ' ', e.last_name) AS full_name
          FROM employees e 
            JOIN dept_emp de USING(emp_no)
            JOIN departments d USING(dept_no)
          WHERE de.to_date > NOW();
-- 2) CREATE a TEMPORARY TABLE based ON the payment TABLE FROM the sakila database.
USE sakila; 

CREATE TEMPORARY TABLE payments
    AS  SELECT *
          FROM payment
          LIMIT 100;
-- WRITE the SQL necessary TO transform the amount COLUMN such that it IS stored AS an INTEGER representing the number of cents of the payment. FOR example, 1.99 should become 199.

ALTER TABLE payments 
    MODIFY amount DECIMAL(6,2);

UPDATE payments
  SET amount = (amount * 100);

ALTER TABLE payments
    MODIFY amount INT;


-- 3) Find OUT how the current average pay IN EACH department compares TO the overall, historical average pay. IN order TO make the comparison easier, you should USE the Z-score FOR salaries. IN terms of salary, what IS the best department RIGHT now TO WORK FOR? The worst?

-- sales department is the best department to work for, and the HR department is the worst to work for.
CREATE TEMPORARY TABLE dept_avg_salary AS
    SELECT d.dept_name AS 'department',
           AVG(s.salary) AS 'curr_avg_sal'
      FROM departments d
        JOIN dept_emp de USING(dept_no)
        JOIN employees e USING(emp_no)
        JOIN salaries s USING(emp_no)
      WHERE s.to_date > NOW()
        AND de.to_date > NOW()
      GROUP BY d.dept_name
      ORDER BY AVG(s.salary) DESC;

SELECT department,
       curr_avg_sal, 
       (curr_avg_sal - (SELECT AVG(salary) FROM salaries)) 
          / 
          (SELECT stddev(salary) FROM salaries) 
          AS z_score
FROM dept_avg_salary;