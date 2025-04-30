/* 6. Write and execute PL/SQL stored procedure and function to perform a suitable task on the 
database. Demonstrate its use */

-- For executing procedures create tables:
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

INSERT INTO Department VALUES (1, 'Computer'), (2, 'Mechanical');
INSERT INTO Student VALUES (101, 'Avdhut', 1), (102, 'Shripad', 2);

-- 1. Stored Procedure – Insert Student
DELIMITER $$

CREATE PROCEDURE Add_Student (
    IN p_StudentID INT,
    IN p_Name VARCHAR(255),
    IN p_DepartmentID INT
)
BEGIN
    INSERT INTO Student (StudentID, Name, DepartmentID)
    VALUES (p_StudentID, p_Name, p_DepartmentID);
END$$

-- Change delimiter
DELIMITER ;

-- Execute procedure:
CALL Add_Student(103, 'Rohit', 1);

-- Verify
SELECT * FROM Student;

-- 2. Function – Count Students in a Department
DELIMITER $$

CREATE FUNCTION Count_Students_By_Dept(p_DepartmentID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(*)
    INTO total
    FROM Student
    WHERE DepartmentID = p_DepartmentID;

    RETURN total;
END$$

DELIMITER ;

-- Use the function:
SELECT Count_Students_By_Dept(1) AS TotalStudents;