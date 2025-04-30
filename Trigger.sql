/* 7. Write and execute suitable database triggers . Consider row level and statement level triggers. */

-- Create Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT
);

-- Create a log table for trigger execution
CREATE TABLE Student_Log (
    StudentID INT,
    Name VARCHAR(100),
    LogTime DATETIME
);

-- Row-Level Trigger: Log every student added, before insertion.
DELIMITER $$
CREATE TRIGGER trg_log_student_insert
BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
    INSERT INTO Student_Log (StudentID, Name, LogTime)
    VALUES (NEW.StudentID, NEW.Name, NOW());
END$$
DELIMITER ;

-- Verify:
INSERT INTO Student(StudentID, Name, DepartmentID)
VALUES (106, 'Riya', 2);
SELECT * FROM Student_Log;

-- Statement-level Trigger: Track every time the Student table is inserted into (batch insert or single).
DELIMITER $$
CREATE TRIGGER trg_simulate_statement_level_logging
AFTER INSERT ON Student
FOR EACH ROW
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Insert_Log
        WHERE TableName = 'Student'
          AND ActionTime >= NOW() - INTERVAL 5 SECOND
    ) THEN
        INSERT INTO Insert_Log (TableName, ActionTime)
        VALUES ('Student', NOW());
    END IF;
END$$
DELIMITER ;


-- Create a log table for trigger execution
CREATE TABLE Insert_Log (
    TableName VARCHAR(255),
    ActionTime DATETIME
);

-- Verify:
INSERT INTO Student(StudentID, Name, DepartmentID)
VALUES (106, 'Riya', 2);
SELECT * FROM Insert_Log;