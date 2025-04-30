-- Perform implementation of Processing Date and Time functions in SQL queries on library database.

-- Create BooksIssued Table
CREATE TABLE BooksIssued (
    IssueID INT PRIMARY KEY,
    BookName VARCHAR(100),
    StudentName VARCHAR(50),
    IssueDate DATE,
    ReturnDate DATE
);

-- Insert Sample Records
INSERT INTO BooksIssued VALUES (1, 'DBMS Concepts', 'Avdhut', '2025-04-01', '2025-04-10');
INSERT INTO BooksIssued VALUES (2, 'Let Us C', 'Shripad', '2025-04-05', '2025-04-12');
INSERT INTO BooksIssued VALUES (3, 'Clean Code', 'Akshay', '2025-04-08', '2025-04-18');

-- Current Date
SELECT CURDATE() AS TodayDate;

-- Number of Days Book Was Issued
SELECT BookName, DATEDIFF(ReturnDate, IssueDate) AS DaysIssued
FROM BooksIssued;

-- Books Issued in April
SELECT * FROM BooksIssued
WHERE MONTH(IssueDate) = 4;

-- Extract Year and Day
SELECT BookName, YEAR(IssueDate) AS YearIssued, DAY(IssueDate) AS DayIssued
FROM BooksIssued;