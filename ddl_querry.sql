CREATE DATABASE ddl_query;
USE ddl_query;

CREATE TABLE details (
    Rollnumber INT PRIMARY KEY,
    S_Name VARCHAR(50),
    S_Course VARCHAR(100),
    S_Dept VARCHAR(100)
);

INSERT INTO details (Rollnumber, S_Name, S_Course, S_Dept)
VALUES
(1, 'Ram', 'BTech', 'CSE'),
(2, 'Sohan', 'BCA', 'IT'),
(3, 'Priya', 'MCA', 'CSE'),
(4, 'Riya', 'BSc', 'Maths'),
(5, 'Kamal', 'BBA', 'Management');

SELECT * FROM details;

ALTER TABLE details ADD S_phone BIGINT;
ALTER TABLE details MODIFY Rollnumber VARCHAR(10);
ALTER TABLE details RENAME COLUMN S_Name TO Name;
ALTER TABLE details DROP COLUMN S_Dept;
ALTER TABLE details DROP PRIMARY KEY;

TRUNCATE TABLE details;
DROP TABLE details;

SELECT * FROM details;
