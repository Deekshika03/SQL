CREATE DATABASE db_university;
USE db_university;
CREATE TABLE studentsrecord(
    rollno INT PRIMARY KEY,
    name VARCHAR(100),
    phone INT
);
INSERT INTO studentsrecord VALUES
(1, 'ram', 347833),
(2, 'sohan', 3478738),
(3, 'priya', 354820),
(4, 'riya', 3476203),
(5, 'kamal', 3356283),
(6, 'lotus', 5752978),
(7, 'marry', 782399);

SELECT * FROM studentsrecord;

UPDATE studentsrecord SET phone = 999999 WHERE rollno = 1;

DELETE FROM studentsrecord WHERE rollno = 7;

SELECT * FROM studentsrecord;

 
 
 
 
