/* 10. Perform the implementation of Boolean operators and pattern matching in SQL queries on
E-commerce store database. */

-- Create Product Table

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

-- Insert Sample Records
INSERT INTO Product VALUES (101, 'iPhone 14', 'Mobiles', 79999.00, 10);
INSERT INTO Product VALUES (102, 'Samsung Galaxy', 'Mobiles', 65999.00, 0);
INSERT INTO Product VALUES (103, 'OnePlus Charger', 'Accessories', 1999.00, 25);
INSERT INTO Product VALUES (104, 'Dell Laptop', 'Laptops', 58999.00, 15);
INSERT INTO Product VALUES (105, 'HP Mouse', 'Accessories', 499.00, 50);
INSERT INTO Product VALUES (106, 'Apple Watch', 'Wearables', 31999.00, 5);

-- Boolean AND
SELECT * FROM Product
WHERE Category = 'Mobiles' AND Stock > 0;

-- Boolean : OR
SELECT * FROM Product
WHERE Price < 2000 OR Stock = 0;

-- Boolean NOT
SELECT * FROM Product
WHERE NOT Category = 'Accessories';

-- Pattern Matching: LIKE and Wildcards
-- Product name starts with 'A'
SELECT * FROM Product
WHERE Name LIKE 'A%';

-- Product name ends with 'Phone'
SELECT * FROM Product
WHERE Name LIKE '%Phone';

-- Product name contains the word 'Laptop'
SELECT * FROM Product
WHERE Name LIKE '%Laptop%';

-- Product name has 5 characters and starts with 'H'
SELECT * FROM Product
WHERE Name LIKE 'H____';