
CREATE DATABASE exp2_3;
USE exp2_3;


CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept VARCHAR(20),
    salary INT
);

INSERT INTO emp VALUES
(101, 'Amit', 'HR', 30000),
(102, 'Rahul', 'IT', 45000),
(103, 'Neha', 'IT', 50000),
(104, 'Pooja', 'HR', 28000),
(105, 'Rohan', 'SALES', 40000),
(106, 'Anjali', 'SALES', 42000);


SELECT * FROM emp;

-- Query 1: Count employees in each department
SELECT dept, COUNT(emp_id) AS total_employees
FROM emp
GROUP BY dept;

-- Query 2: Sum of salaries department-wise
SELECT dept, SUM(salary) AS total_salary
FROM emp
GROUP BY dept;

-- Query 3: Average salary of each department
SELECT dept, AVG(salary) AS avg_salary
FROM emp
GROUP BY dept;

-- Query 4: Departments having avg salary > 40000
SELECT dept, AVG(salary) AS avg_salary
FROM emp
GROUP BY dept
HAVING AVG(salary) > 40000;

-- Query 5: Use WHERE with GROUP BY
SELECT dept, COUNT(emp_id) AS total_employees
FROM emp
WHERE salary > 30000
GROUP BY dept;

-- Query 6: Max and Min salary department-wise
SELECT dept,
       MAX(salary) AS max_salary,
       MIN(salary) AS min_salary
FROM emp
GROUP BY dept;

-- Query 7: Order by total salary (Descending)
SELECT dept, SUM(salary) AS total_salary
FROM emp
GROUP BY dept
ORDER BY total_salary DESC;

