/* 2. Design College database with at least 3 entities and relationships between them. Draw
suitable ER/EER diagram for the system and implement using DDL statements.

4. Design College database with at least 3 entities and relationships between them. Draw
suitable ER/EER diagram for the system and Create Table with primary key and foreign key
constraints. a. Alter table with add n modify b. Drop table
*/

--Create Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(50)
);

--Create Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

--Create Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);


--Insert sample data in all tables
INSERT INTO Department VALUES (1, 'Computer'), (2, 'Mechanical');

INSERT INTO Student VALUES (101, 'Avdhut', 1), (102, 'Shripad', 2);

INSERT INTO Course VALUES (201, 'DBMS', 1), (202, 'Thermodynamics', 2);


-- a. Alter table with add n modify
-- Add column
ALTER TABLE Student ADD Email VARCHAR(100);

-- Modify column
ALTER TABLE Course MODIFY CourseName VARCHAR(100);

-- b.Drop Table
DROP TABLE Student;
DROP TABLE Course;
DROP TABLE Department;
