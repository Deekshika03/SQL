-- Step 1: Create a table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary INT
);

-- Step 2: Insert records
INSERT INTO Employee VALUES
(1, 'Ravi', 30000),
(2, 'Aman', 40000),
(3, 'Priya', 50000);

-- Step 3: Declare a cursor
DECLARE emp_cursor CURSOR FOR
SELECT employee_id, employee_name, salary
FROM Employee;

-- Step 4: Declare variables
DECLARE @id INT,
        @name VARCHAR(50),
        @salary INT;

-- Step 5: Open the cursor
OPEN emp_cursor;

-- Step 6: Fetch the first row
FETCH NEXT FROM emp_cursor
INTO @id, @name, @salary;

-- Step 7: Fetch rows one by one
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'ID: ' + CAST(@id AS VARCHAR(10))
        + ', Name: ' + @name
        + ', Salary: ' + CAST(@salary AS VARCHAR(10));

    FETCH NEXT FROM emp_cursor
    INTO @id, @name, @salary;
END;

-- Step 8: Close and deallocate the cursor
CLOSE emp_cursor;
DEALLOCATE emp_cursor;
