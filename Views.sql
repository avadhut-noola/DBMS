/* 5. Execute DDL/DML statements which demonstrate the use of views. Update the base table
using its corresponding view. Also consider restrictions on updatable views and perform view
creation from multiple tables.
*/

-- To work on views create 
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(50)
);

-- Create Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Create Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);


-- Insert sample data in all tables
INSERT INTO Department VALUES (1, 'Computer'), (2, 'Mechanical');

INSERT INTO Student VALUES (101, 'Avadhut', 1), (102, 'Shripad', 2);

INSERT INTO Course VALUES (201, 'DBMS', 1), (202, 'Thermodynamics', 2);

-- Create View from One Table (Simple View)

CREATE VIEW CS_Students AS
SELECT StudentID, Name
FROM Student
WHERE DepartmentID = 1;

-- Update Base Table Using View
UPDATE CS_Students
SET Name = 'Avdhut Santosh Noola'
WHERE StudentID = 101;

-- Demonstrate Restriction on Updatable Views
CREATE VIEW StudentDepartment AS
SELECT S.StudentID, S.Name, D.Name AS Department
FROM Student S
JOIN Department D ON S.DepartmentID = D.DepartmentID;

-- Try updating:
UPDATE StudentDepartment
SET Department = 'IT'
WHERE StudentID = 101;

/* Rule Reminder:
According to MySQL's rules for updatable views, as long as the following conditions are met, the view can be updatable:
The view must include all necessary fields to uniquely identify rows in the underlying table(s).
The columns being updated must directly correspond to columns in the base table(s) without transformations.
*/

-- View Creation from Multiple Tables
CREATE VIEW CourseDetails AS
SELECT C.CourseID, C.CourseName, D.Name AS Department
FROM Course C
JOIN Department D ON C.DepartmentID = D.DepartmentID;

-- Read from the multi-table view
-- You can read from this view, but you cannot update it.
SELECT * FROM CourseDetails;