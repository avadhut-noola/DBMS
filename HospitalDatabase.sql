/* 1. Design Hospital database with at least 3 entities and relationships between them.
Draw suitable ER/EER diagram for the system and implement using DDL statements.

3. Design Hospital database with at least 3 entities and relationships between them. Draw
suitable ER/EER diagram for the system and Create Table with primary key and foreign key
constraints. a. Alter table with add n modify b. Drop table
*/

--Create doctor table
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(50),
    Specialization VARCHAR(50)
);

--Create patient table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(50),
    Disease VARCHAR(50)
);

--Create Appointment table
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    DoctorID INT,
    PatientID INT,
    Date DATE,
    Time TIME,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

--Insert sample data in all tables
INSERT INTO Doctor VALUES (1, 'Dr. Mehta', 'Cardiology'), (2, 'Dr. Shah', 'Neurology');

INSERT INTO Patient VALUES (101, 'Raj', 'Migraine'), (102, 'Simran', 'Heart Issue');

INSERT INTO Appointment VALUES
(1001, 1, 102, '2025-04-30', '10:00:00'),
(1002, 2, 101, '2025-04-30', '11:00:00');

-- a. Alter table with add n modify
-- Add column
ALTER TABLE Doctor ADD Experience INT;

-- Modify column
ALTER TABLE Patient MODIFY Disease VARCHAR(100);

-- b.Drop Table
DROP TABLE Appointment;
DROP TABLE Doctor;
DROP TABLE Patient;