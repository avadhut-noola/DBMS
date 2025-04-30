-- Create sample Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT
);

-- Insert sample records
INSERT INTO Student VALUES (1, 'Avadhut', 85);
INSERT INTO Student VALUES (2, 'Shiva', 92);
INSERT INTO Student VALUES (3, 'Rohit', 74);
COMMIT;

-- To verify the cursor operations:
CREATE TABLE Cursor_Log (
    CursorName VARCHAR(255),
    Name VARCHAR(255),
    Marks INT
);


DELIMITER $$

CREATE PROCEDURE Update_And_Display_Student_Marks()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_name VARCHAR(255);
    DECLARE v_marks INT;

    -- Declare a cursor for explicit use
    DECLARE c_high_scores CURSOR FOR
        SELECT Name, Marks FROM Student WHERE Marks > 80;

    -- Declare a cursor for parameterized use
    DECLARE c_by_min_marks CURSOR FOR
        SELECT Name, Marks FROM Student WHERE Marks >= 75;

    -- Handler to exit the loop
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Implicit Cursor Example
    UPDATE Student SET Marks = Marks + 5 WHERE Marks < 90;
    SELECT ROW_COUNT() INTO @rows_affected;
    INSERT INTO Cursor_Log (CursorName, Name, Marks)
    VALUES ('Implicit Cursor', CONCAT(@rows_affected, ' rows updated'), NULL);

    -- Explicit Cursor Example
    OPEN c_high_scores;
    REPEAT
        FETCH c_high_scores INTO v_name, v_marks;
        IF NOT done THEN
            INSERT INTO Cursor_Log (CursorName, Name, Marks)
            VALUES ('Explicit Cursor (Marks > 80)', v_name, v_marks);
        END IF;
    UNTIL done END REPEAT;
    CLOSE c_high_scores;

    -- Reset handler variable for next cursor use
    SET done = 0;

    -- Parameterized Cursor Example
    OPEN c_by_min_marks;
    REPEAT
        FETCH c_by_min_marks INTO v_name, v_marks;
        IF NOT done THEN
            INSERT INTO Cursor_Log (CursorName, Name, Marks)
            VALUES ('Parameterized Cursor (Marks >= 75)', v_name, v_marks);
        END IF;
    UNTIL done END REPEAT;
    CLOSE c_by_min_marks;
END$$

DELIMITER ;

-- Call the cursor:
CALL Update_And_Display_Student_Marks();

-- See results:
SELECT * FROM Cursor_Log;