CREATE DATABASE join_sql;
use join_sql;
CREATE TABLE STUDENT (
    sid INT PRIMARY KEY,
    sname VARCHAR(30),
    dept VARCHAR(10)
);

CREATE TABLE DEPARTMENT (
    dept VARCHAR(10) PRIMARY KEY,
    hod VARCHAR(30)
);
INSERT INTO STUDENT VALUES
(1, 'Anita', 'CSE'),
(2, 'John', 'ECE'),
(3, 'Ravi', 'CSE'),
(4, 'Meera', 'AIML');

INSERT INTO DEPARTMENT VALUES
('CSE', 'Dr. Kumar'),
('ECE', 'Dr. Reddy'),
('IT', 'Dr. Mehta');


SELECT * FROM STUDENT;
SELECT * FROM DEPARTMENT;


SELECT * 
FROM STUDENT 
NATURAL JOIN DEPARTMENT;


SELECT s.sid, s.sname, s.dept, d.hod
FROM STUDENT s
LEFT JOIN DEPARTMENT d
ON s.dept = d.dept;


SELECT s.sid, s.sname, s.dept, d.hod
FROM STUDENT s
RIGHT JOIN DEPARTMENT d
ON s.dept = d.dept;


SELECT s.sid, s.sname, s.dept, d.hod
FROM STUDENT s
LEFT JOIN DEPARTMENT d
ON s.dept = d.dept

UNION

SELECT s.sid, s.sname, s.dept, d.hod
FROM STUDENT s
RIGHT JOIN DEPARTMENT d
ON s.dept = d.dept;
