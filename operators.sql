-- Create Database
CREATE DATABASE EXPERIMENT8;

-- Use Database
USE EXPERIMENT8;

---------------------------------------------------------
-- Create Tables
---------------------------------------------------------
CREATE TABLE EMP (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(50),
    DEPT VARCHAR(20),
    SALARY INT
);

CREATE TABLE DEPARTMENT (
    DEPT_ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(20)
);

CREATE TABLE PROJECT_TEAM (
    EMP_ID INT
);

---------------------------------------------------------
-- Insert Data
---------------------------------------------------------
INSERT INTO EMP VALUES
(101, 'Amit', 'HR', 30000),
(102, 'Rahul', 'IT', 45000),
(103, 'Neha', 'IT', 50000),
(104, 'Priya', 'HR', 28000),
(105, 'Karan', 'FINANCE', 60000);

INSERT INTO DEPARTMENT VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'FINANCE'),
(4, 'SALES');

INSERT INTO PROJECT_TEAM VALUES
(102),
(103),
(106);

---------------------------------------------------------
-- ANY Operator
---------------------------------------------------------
SELECT emp_name, salary
FROM EMP
WHERE salary > ANY (
    SELECT salary FROM EMP WHERE dept = 'HR'
);

---------------------------------------------------------
-- ALL Operator
---------------------------------------------------------
SELECT emp_name, salary
FROM EMP
WHERE salary > ALL (
    SELECT salary FROM EMP WHERE dept = 'HR'
);

---------------------------------------------------------
-- IN Operator
---------------------------------------------------------
SELECT emp_name, dept
FROM EMP
WHERE dept IN ('IT', 'HR');

---------------------------------------------------------
-- EXISTS Operator
---------------------------------------------------------
SELECT dept_name
FROM DEPARTMENT d
WHERE EXISTS (
    SELECT 1 FROM EMP e WHERE e.dept = d.dept_name
);

---------------------------------------------------------
-- UNION Operator
---------------------------------------------------------
SELECT dept FROM EMP
UNION
SELECT dept_name FROM DEPARTMENT;

---------------------------------------------------------
-- INTERSECT Operator
---------------------------------------------------------

-- For Oracle/PostgreSQL
SELECT emp_id FROM EMP
INTERSECT
SELECT emp_id FROM PROJECT_TEAM;

-- For MySQL (Alternative)
SELECT e.emp_id
FROM EMP e
INNER JOIN PROJECT_TEAM p
ON e.emp_id = p.emp_id;
