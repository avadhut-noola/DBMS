-- 9. Perform implementation of relational operators in SQL queries on employee database.

-- Create Employee Table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    ManagerID INT
);

-- Insert Sample Data
INSERT INTO Employee VALUES (1, 'Avdhut', 'IT', 70000, NULL);
INSERT INTO Employee VALUES (2, 'Shripad', 'HR', 55000, 1);
INSERT INTO Employee VALUES (3, 'Rohan', 'IT', 60000, 1);
INSERT INTO Employee VALUES (4, 'Shree', 'Finance', 50000, 1);
INSERT INTO Employee VALUES (5, 'Sagar', 'HR', 30000, 2);

SELECT * FROM Employee WHERE Department = 'HR';
SELECT * FROM Employee WHERE Department <> 'IT';
SELECT * FROM Employee WHERE Salary > 50000;
SELECT * FROM Employee WHERE Salary <= 55000;
SELECT * FROM Employee WHERE Salary BETWEEN 50000 AND 65000;
SELECT * FROM Employee WHERE Department IN ('HR', 'Finance');
SELECT * FROM Employee WHERE Department NOT IN ('Finance');
SELECT * FROM Employee WHERE Name LIKE 'S%';
SELECT * FROM Employee WHERE ManagerID IS NULL;