-- Perform implementation of Group functions in SQL queries on employee database.

-- Create Employee Table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2)
);

-- Insert Sample Records
INSERT INTO Employee VALUES (1, 'Avdhut', 'IT', 50000);
INSERT INTO Employee VALUES (2, 'Shripad', 'HR', 45000);
INSERT INTO Employee VALUES (3, 'Somnath', 'IT', 60000);
INSERT INTO Employee VALUES (4, 'Rohit', 'Finance', 40000);
INSERT INTO Employee VALUES (5, 'Shree', 'HR', 47000);

-- Group Function Queries

-- Total Salary
SELECT SUM(Salary) AS TotalSalary FROM Employee;

-- Average Salary per Department
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employee
GROUP BY Department;

-- Count of Employees in Each Department
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY Department;

-- Maximum and Minimum Salary
SELECT MAX(Salary) AS HighestSalary, MIN(Salary) AS LowestSalary FROM Employee;