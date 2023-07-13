-- Q 2(b)Consider the relation database for Emplyee_Company dataset holds four tables shown below where the primary keys are underlined. Employee (NationalID, Name, Area, City)Worker (NationalID, CompanyName, Salary)Company (CompanyName, City, MinSalary, MaxSalary)Manager (NationalID, CompanyName)Write the SQL commands for the following queries:

--i)Find the employee (NationalID, Name, Salary) whose salary is the highest.
--ii)Look   the   companies   ordering   salary   range   difference   (i.e.,   MaxSalary-MinSalary).
--iii)Look companywise count of employees.
--iv)Find the Name of the employees who live same City of Manager.  N.B.: Mention alternate SQLs if a query performs alternately.

create database EmployeeFinalBD;
go
use EmployeeFinalBD;
go


CREATE TABLE Employee (
    NationalID INT PRIMARY KEY,
    Name VARCHAR(100),
    Area VARCHAR(100),
    City VARCHAR(100)
)
go


CREATE TABLE Worker (
    NationalID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    Salary DECIMAL(10, 2)
)
go

CREATE TABLE Company (
    CompanyName VARCHAR(100) PRIMARY KEY,
    City VARCHAR(100),
    MinSalary DECIMAL(10, 2),
    MaxSalary DECIMAL(10, 2)
)
go

CREATE TABLE Manager (
    NationalID INT PRIMARY KEY,
    CompanyName VARCHAR(100)
)
go


-- Insert data into Employee table
INSERT INTO Employee (NationalID, Name, Area, City)
VALUES
    (1, 'John Doe', 'Sales', 'New York'),
    (2, 'Jane Smith', 'Marketing', 'Los Angeles'),
    (3, 'Michael Johnson', 'Finance', 'Chicago'),
    (4, 'Emily Davis', 'Human Resources', 'San Francisco'),
    (5, 'Robert Wilson', 'Operations', 'Houston'),
    (6, 'Jessica Lee', 'IT', 'Seattle'),
    (7, 'David Brown', 'Research and Development', 'Boston')
go


-- Insert data into Worker table
INSERT INTO Worker (NationalID, CompanyName, Salary)
VALUES
    (1, 'ABC Company', 5000),
    (2, 'XYZ Corporation', 6000),
    (3, 'DEF Industries', 5500),
    (4, 'GHI Corporation', 7000),
    (5, 'JKL Enterprises', 4500),
    (6, 'MNO Ltd.', 8000),
    (7, 'PQR Solutions', 4000)

	go


-- Insert data into Company table
INSERT INTO Company (CompanyName, City, MinSalary, MaxSalary)
VALUES
    ('ABC Company', 'New York', 4000, 10000),
    ('XYZ Corporation', 'Los Angeles', 4500, 9000),
    ('DEF Industries', 'Chicago', 5000, 9500),
    ('GHI Corporation', 'San Francisco', 5500, 11000),
    ('JKL Enterprises', 'Houston', 3500, 8000),
    ('MNO Ltd.', 'Seattle', 6000, 12000),
    ('PQR Solutions', 'Boston', 4000, 8500)
go


-- Insert data into Manager table
INSERT INTO Manager (NationalID, CompanyName)
VALUES
    (1, 'ABC Company'),
    (2, 'XYZ Corporation'),
    (3, 'DEF Industries'),
    (4, 'GHI Corporation'),
    (5, 'JKL Enterprises'),
    (6, 'MNO Ltd.'),
    (7, 'PQR Solutions')
go
-- Insert data into Employee table
INSERT INTO Employee (NationalID, Name, Area, City)
SELECT * FROM (VALUES
    (8, 'Sarah Johnson', 'Sales', 'New York'),
    (9, 'Daniel Wilson', 'Marketing', 'Los Angeles'),
    (10, 'Emily Thompson', 'Finance', 'Chicago'),
    (11, 'Andrew Davis', 'Human Resources', 'San Francisco'),
    (12, 'Jennifer Lee', 'Operations', 'Houston'),
    (13, 'Michael Brown', 'IT', 'Seattle'),
    (14, 'Jessica Smith', 'Research and Development', 'Boston')
) AS E (NationalID, Name, Area, City)
WHERE NationalID NOT IN (SELECT NationalID FROM Employee);
GO

-- Insert data into Worker table
INSERT INTO Worker (NationalID, CompanyName, Salary)
SELECT * FROM (VALUES
    (8, 'ABC Company', 5500),
    (9, 'XYZ Corporation', 7000),
    (10, 'DEF Industries', 6000),
    (11, 'GHI Corporation', 8000),
    (12, 'JKL Enterprises', 5000),
    (13, 'MNO Ltd.', 9000),
    (14, 'PQR Solutions', 4500)
) AS W (NationalID, CompanyName, Salary)
WHERE NationalID NOT IN (SELECT NationalID FROM Worker);
GO

-- Insert data into Company table
INSERT INTO Company (CompanyName, City, MinSalary, MaxSalary)
SELECT * FROM (VALUES
    ('XYZ Corporation', 'New York', 4500, 9500),
    ('DEF Industries', 'Los Angeles', 5000, 9000),
    ('GHI Corporation', 'Chicago', 5500, 9500),
    ('JKL Enterprises', 'San Francisco', 6000, 11000),
    ('MNO Ltd.', 'Houston', 4000, 8000),
    ('PQR Solutions', 'Seattle', 5500, 12000),
    ('ABC Company', 'Boston', 4500, 8500)
) AS C (CompanyName, City, MinSalary, MaxSalary)
WHERE CompanyName NOT IN (SELECT CompanyName FROM Company);
GO

--i)Find the employee (NationalID, Name, Salary) whose salary is the highest.

	SELECT TOP 1 e.NationalID, e.Name, w.Salary
FROM Employee e
INNER JOIN Worker w ON e.NationalID = w.NationalID
ORDER BY w.Salary DESC

--ii)Look   the   companies   ordering   salary   range   difference   (i.e.,   MaxSalary-MinSalary).

SELECT CompanyName, MaxSalary - MinSalary AS SalaryRangeDifference
FROM Company
ORDER BY SalaryRangeDifference


--iii)Look companywise count of employees.

SELECT c.CompanyName, COUNT(e.NationalID) AS EmployeeCount
FROM Company c
INNER JOIN Manager m ON c.CompanyName = m.CompanyName
INNER JOIN Employee e ON m.NationalID = e.NationalID
GROUP BY c.CompanyName


--iv)Find the Name of the employees who live same City of Manager.  N.B.: Mention alternate SQLs if a query performs alternately.
-- Find the names of employees who live in the same city as their managers

-- Create a temporary table to store the manager cities
-- Create a temporary table to store the manager cities

CREATE TABLE #manager_city
(
    ManagerID INT,
    City VARCHAR(100)
)

-- Insert the manager cities into the temporary table
INSERT INTO #manager_city (ManagerID, City)
SELECT m.NationalID, e.City
FROM Manager m
JOIN Employee e ON m.NationalID = e.NationalID;

-- Query to retrieve employees who live in the same city as their managers
SELECT e.Name AS EmployeeName
FROM Employee e
JOIN #manager_city mc ON e.City = mc.City
WHERE e.NationalID <> mc.ManagerID;

select * from #manager_city;




-- Drop the temporary table
DROP TABLE #manager_city;

go



-- Create a view to represent the manager cities
CREATE VIEW ManagerCityView AS
SELECT m.NationalID AS ManagerID, e.City
FROM Manager m
JOIN Employee e ON m.NationalID = e.NationalID;
go

-- Query the view to retrieve employees who live in the same city as their managers
SELECT e.Name AS EmployeeName
FROM Employee e
JOIN ManagerCityView mc ON e.City = mc.City
WHERE e.NationalID <> mc.ManagerID;
go

select * from ManagerCityView;

-- Drop the view
DROP VIEW IF EXISTS ManagerCityView;
go

SELECT e1.Name AS EmployeeName FROM Employee e1 JOIN Employee e2 ON e1.City = e2.City JOIN Manager m ON e2.NationalID = m.NationalID WHERE e1.NationalID <> m.NationalID

--Find the cities of employees and their managers 

SELECT e1.Name AS EmployeeName, e1.City AS EmployeeCity, e2.Name AS ManagerName, e2.City AS ManagerCity FROM Employee e1 JOIN Manager m ON e1.NationalID = m.NationalID JOIN Employee e2 ON m.NationalID = e2.NationalID