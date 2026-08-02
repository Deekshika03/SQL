CREATE DATABASE ws5;
USE ws5;
CREATE TABLE okk(
 bookid INT PRIMARY KEY,
 title VARCHAR(500),
 author VARCHAR(100),
 price INT ,
 category VARCHAR(50),
 totalBooks INT,
 availableBooks INT 
);
INSERT INTO okk
VALUES
(1, 'DSA', 'Thomas H.', 850, 'Computer Science', 5, 3),
(2, 'dbms', 'Abc', 700, 'Database', 4, 3),
(3, 'Os', 'xyz', 900, 'OS', 3, 2),
(4, 'CC', 'Robert ', 550, 'Software Engg', 6, 4),
(5, 'Python ', 'hookes', 500, 'Programming', 7, 5);

SELECT * FROM okk;
SELECT title , price ,availableBooks  FROM okk;
UPDATE okk SET Price=250 WHERE BookID=7;
DELETE FROM okk WHERE BookID=4;




