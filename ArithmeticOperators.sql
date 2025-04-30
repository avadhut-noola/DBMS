/* Perform implementation of Arithmetic operations and built in functions in SQL queries on 
school database. 
*/

-- Create Student Table

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks1 INT,
    Marks2 INT,
    Marks3 INT,
    DateOfBirth DATE
);

-- Insert Sample Records
INSERT INTO Student VALUES (1, 'Avdhut', 85, 90, 80, '2004-08-15');
INSERT INTO Student VALUES (2, 'Shripad', 70, 75, 65, '2005-10-20');
INSERT INTO Student VALUES (3, 'Neha', 95, 88, 92, '2003-12-01');
INSERT INTO Student VALUES (4, 'Rohit', 50, 45, 55, '2004-05-05');

--  Total Marks (Addition)
SELECT Name, Marks1 + Marks2 + Marks3 AS TotalMarks FROM Student;

-- Average Marks (Division operator)
SELECT Name, (Marks1 + Marks2 + Marks3)/3 AS AverageMarks FROM Student;

-- Percentage (Assuming total is out of 300)
SELECT Name, ((Marks1 + Marks2 + Marks3) * 100)/300 AS Percentage FROM Student;

-- Built-in functions
-- Aggregate Function
SELECT MAX(Marks1) AS MaxMark1, MIN(Marks1) AS MinMark1, AVG(Marks1) AS AvgMark1 FROM Student;

-- String Function
SELECT UPPER(Name) AS UpperCaseName, LENGTH(Name) AS NameLength FROM Student;
-- Date Functions
SELECT Name, DateOfBirth, YEAR(CURDATE()) - YEAR(DateOfBirth) AS Age FROM Student;

-- Math Function
SELECT Name, ROUND((Marks1 + Marks2 + Marks3)/3, 2) AS RoundedAvg FROM Student;