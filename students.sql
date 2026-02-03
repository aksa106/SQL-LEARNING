-- Students table practice
-- Database: SQL_Practice

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);

INSERT INTO Students VALUES (1, 'A', 22);
INSERT INTO Students VALUES (2, 'John', 23);

SELECT * FROM Students;

select studentID from Students;