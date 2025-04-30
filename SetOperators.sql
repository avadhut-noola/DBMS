/* Perform implementation of Complex queries and set operators in SQL queries on online 
store database.*/

-- Create Tables to work on set operators:

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(30)
);
-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert Sample Records
INSERT INTO Customers VALUES
(1, 'Avdhut', 'Pune'),
(2, 'Shripad', 'Mumbai'),
(3, 'Shiva', 'Pune'),
(4, 'Rohit', 'Delhi');
INSERT INTO Orders VALUES
(101, 1, '2025-04-10', 1200.50),
(102, 2, '2025-04-12', 850.00),
(103, 1, '2025-04-15', 450.00),
(104, 3, '2025-04-18', 3000.00);

-- Complex Queries

-- Find customers from Pune who have placed orders over ₹1000
SELECT c.Name, o.OrderID, o.Amount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.City = 'Pune' AND o.Amount > 1000;

-- Find customers who haven’t placed any orders
SELECT Name
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);

-- Find the customer(s) who placed the highest order
SELECT c.Name, o.Amount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.Amount = (SELECT MAX(Amount) FROM Orders);

-- Set Operators
-- UNION – Customers from Pune or who placed orders (no duplicates)
SELECT Name FROM Customers WHERE City = 'Pune'
UNION
SELECT c.Name FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID;

-- UNION ALL – Same as above but includes duplicates
SELECT Name FROM Customers WHERE City = 'Pune'
UNION ALL
SELECT c.Name FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 4. EXCEPT / MINUS – Customers from Pune who did NOT place any order
SELECT Name FROM Customers 
WHERE City = 'Pune' AND CustomerID NOT IN (SELECT CustomerID FROM Orders);