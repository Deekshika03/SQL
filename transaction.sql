CREATE DATABASE hardProblem_exp1;
USE hardProblem_exp1;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_title VARCHAR(50) NOT NULL
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students VALUES
(1, 'DEEKSHIKA'),
(2, 'SHARMA');

INSERT INTO Courses VALUES
(101, 'Database Systems'),
(102, 'Operating Systems');

START TRANSACTION;

-- Valid enrollment
INSERT INTO Enrollments
VALUES (1, 1, 101, 'A');

SAVEPOINT sp1;

-- Invalid enrollment (course_id 999 does not exist)
INSERT INTO Enrollments
VALUES (2, 2, 999, 'B');

ROLLBACK TO SAVEPOINT sp1;

COMMIT;

SELECT
    s.student_name,
    c.course_title,
    e.grade
FROM Students s
JOIN Enrollments e
ON s.student_id = e.student_id
JOIN Courses c
ON e.course_id = c.course_id;

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
