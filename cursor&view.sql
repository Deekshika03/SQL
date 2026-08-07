CREATE DATABASE icv;
USE icv;

CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(20),
    dept VARCHAR(20),
    salary INT
);

INSERT INTO emp VALUES (101, 'Anita', 'HR', 30000);
INSERT INTO emp VALUES (102, 'Rahul', 'IT', 45000);
INSERT INTO emp VALUES (103, 'Neha', 'IT', 50000);
INSERT INTO emp VALUES (104, 'Amit', 'Finance', 40000);

SELECT * FROM emp;

-- Index
CREATE INDEX idx_salary ON emp(salary);
SELECT * FROM emp WHERE salary > 40000;

-- View
CREATE VIEW it_emp AS
SELECT emp_id, emp_name, dept, salary
FROM emp
WHERE dept = 'IT';

SELECT * FROM it_emp;

-- Implicit cursor (update)
UPDATE emp 
SET salary = salary + 1000
WHERE dept = 'IT';

SELECT ROW_COUNT() AS "Rows Updated";
SELECT * FROM emp;

-- Explicit cursor using procedure
DELIMITER $$

CREATE PROCEDURE emp_cursor_demo()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_id INT;
    DECLARE v_name VARCHAR(20);
    DECLARE v_salary INT;

    DECLARE emp_cursor CURSOR FOR 
        SELECT emp_id, emp_name, salary FROM emp;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    CREATE TEMPORARY TABLE temp_emp (
        emp_id INT,
        emp_name VARCHAR(20),
        salary INT
    );

    OPEN emp_cursor;

    read_loop: LOOP
        FETCH emp_cursor INTO v_id, v_name, v_salary;
        IF done THEN
            LEAVE read_loop;
        END IF;

        INSERT INTO temp_emp VALUES (v_id, v_name, v_salary);
    END LOOP;

    CLOSE emp_cursor;

    SELECT * FROM temp_emp;
END$$

DELIMITER ;

CALL emp_cursor_demo();
