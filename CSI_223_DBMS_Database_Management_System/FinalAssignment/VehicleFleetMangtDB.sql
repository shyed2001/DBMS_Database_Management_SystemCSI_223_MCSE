
-- A vehicle fleet management database is a system that stores and manages information about the vehicles and drivers in a fleet. It can help you track various aspects of fleet operations, such as maintenance, fuel consumption, location, costs, etc.

--One possible database schema for a vehicle fleet management database with the tables you mentioned is:

--- A **Vehicle** table that stores information about each vehicle in the fleet, such as its ID, make, model, year, color, mileage, status, type ID, etc.
--- A **VehicleType** table that stores information about each type of vehicle in the fleet, such as its ID, name, description, capacity, etc.
--- A **Supplier** table that stores information about each supplier of vehicles or parts for the fleet, such as its ID, name, address, phone number, email address, etc.
--- A **Parking** table that stores information about each parking location for the vehicles in the fleet, such as its ID, name, address, capacity, cost per hour, etc.
--- A **Workshop** table that stores information about each workshop that provides maintenance or repair services for the vehicles in the fleet, such as its ID, name, address, phone number, email address, rating, etc.
--- A **Driver** table that stores information about each driver in the fleet, such as their ID, name, license number, phone number, email address, division ID, user ID, etc.
--- A **User** table that stores information about each user of the system (such as drivers or managers), such as their ID, username, password (hashed), role (driver or manager), etc.
--- A **Division** table that stores information about each division or department in the organization that uses the fleet vehicles (such as sales or delivery), such as its ID, name, description, manager ID, etc.

--- A **Route** table that stores information about each route assigned to a driver for a vehicle on a given date and time (such as delivery or pickup), such as its ID,
--vehicle ID, driver ID, start location, end location, start time, end time, distance, etc.

--- A **Maintenance** table that stores information about each maintenance service performed on a vehicle by a workshop or a supplier on a given date and time (such as oil change or tire replacement), such as its ID,
--vehicle ID, workshop ID or supplier ID, date, time, type, cost, etc.
--- Create Database named VehicleFleetMngt
go

Create Database VehicleFleetMngtDB;
go


--Select the VehicleFleetMngtDB in MS SQL Server for current actions

use VehicleFleetMngtDB;
go

-- Create VehicleType table

CREATE TABLE VehicleType (
  TypeID VARCHAR(10) PRIMARY KEY,
  Name VARCHAR(50),
  Description VARCHAR(200),
  Capacity INT
);

go


-- Insert 7 rows of values for VehicleType table 
INSERT INTO VehicleType (TypeID, Name, Description, Capacity) 
VALUES 
(1, 'SedanCar', 'A four-door car for personal or business use', 4),
(2, 'PickupTruck2c', 'A vehicle with an open bed for transporting goods or materials with driver and passanger cabins', 5), 
(3, 'Bus', 'A large vehicle for carrying many passengers', 40), 
(4, 'Van', 'A vehicle for transporting goods or passengers', 8), 
(5, 'Motorcycle', 'A two-wheeled vehicle for personal use', 2), 
(6, 'PickupTruck1c', 'A vehicle with an open bed for transporting goods or materials with only driver cabin', 1), 
(7, 'Jeep', 'A 4-wheeled vehicle for transportation', 6);

go

select * from VehicleType;

-- Create Vehicle table
-- Drop table Vehicle;

-- Create Vehicle table
CREATE TABLE Vehicle (
  VehicleRegNo VARCHAR(10) PRIMARY KEY,
  MakerCompany VARCHAR(50),
  Model VARCHAR(50),
  Year INT,
  Color VARCHAR(20),
  Mileage INT,
  Status VARCHAR(20),
  TypeID VARCHAR(10),
  FOREIGN KEY (TypeID) REFERENCES VehicleType (TypeID)
);

go

-- Insert 7 row values for Vehicle table
INSERT INTO Vehicle (VehicleRegNo, MakerCompany, Model, Year, Color, Mileage, Status, TypeID)
VALUES
('DHK-1234', 'Toyota', 'Yearis', 2018, 'White', 50000, 'available', 1),
('DHK-2345', 'Tata', 'Sedn', 2019, 'Red', 30000, 'available', 2),
('DHK-3456', 'Ashok Leyland', 'Falcon', 2020, 'Blue', 20000, 'available', 3),
('DHK-4567', 'Honda', 'Civic', 2017, 'Black', 40000, 'available', 7),
('DHK-5678', 'Nissan', 'Urvan', 2018, 'Silver', 35000, 'available', 6),
('DHK-6789', 'Yamaha', 'FZS', 2019, 'Green', 10000, 'available', 5),
('DHK-7890', 'Hero', 'Splendor+', 2020, 'Yellow', 5000, 'available', 5);

go

select * from Vehicle;

-- Create Supplier table
CREATE TABLE Supplier (
  SupplierID INT PRIMARY KEY,
  Name VARCHAR(50),
  Address VARCHAR(100),
  PhoneNumber VARCHAR(20),
  EmailAddress VARCHAR(50)
);

go

INSERT INTO Supplier(SupplierID, Name, Address, PhoneNumber, EmailAddress)
VALUES
(1, 'ABC Motors Ltd.', '123 Road, Dhaka, Bangladesh', '+8801234567890', 'abc@motors.com'),
(2, 'XYZ Parts Ltd.', '456 Street, Dhaka, Bangladesh', '+8809876543210', 'xyz@parts.com'),
(3, 'RST Vehicles Ltd.', '789 Avenue, Dhaka, Bangladesh', '+8801122334455', 'rst@vehicles.com'),
(4, 'UVW Services Ltd.', '101 Lane, Dhaka, Bangladesh', '+8806677889900', 'uvw@services.com'),
(5, 'EFG Imports Ltd.', '121 Plaza, Dhaka, Bangladesh', '+8802233445566', 'efg@imports.com'),
(6, 'HIJ Exports Ltd.', '141 Tower, Dhaka, Bangladesh', '+8803344556677', 'hij@exports.com'),
(7, 'KLM Industries Ltd.', '161 Park, Dhaka, Bangladesh', '+8804455667788', 'klm@industries.com');

go

select * from Supplier;

--drop table Parking;

-- Create Parking table

CREATE TABLE Parking (
  ParkingID INT PRIMARY KEY,
  Name VARCHAR(50),
  Address VARCHAR(100),
  Capacity INT,
  CostPerYear DECIMAL(10,2),
  VehicleRegNo VARCHAR(10),
  DivisionID INT,
  UserID INT,
  FOREIGN KEY (VehicleRegNo) REFERENCES Vehicle(VehicleRegNo),
  FOREIGN KEY (DivisionID) REFERENCES Division(DivisionID),
  FOREIGN KEY (UserID) REFERENCES CarUser(UserID)
);

go


-- Insert 7 rows of values for the parking table
INSERT INTO Parking (ParkingID, Name, Address, Capacity, CostPerYear)
VALUES (1, 'Dhaka WASA Head Office', '98 Kazi Nazrul Islam Ave, Dhaka 1215', 50, 20.00),
       (2, 'Dhaka WASA Zone-1 Office', '107/1/A/1/1, Near to Jatrabari Ideal School,North Jatrabari,Dhaka', 30, 15.00),
       (3, 'Dhaka WASA Zone-4 Office', 'Near to Mirpur Bangla college, Mirpur-1, Dhaka', 40, 18.00),
       (4, 'Dhaka WASA Zone-8 Office', 'Notun Bazar, Badda, Dhaka', 35, 16.00),
       (5, 'Dhaka WASA Zone-9 Office', 'Road-7, Sector-3, Uttara, Dhaka', 45, 19.00),
       (6, 'Dhaka WASA Zone-10 Office', 'Near to Mirpur Bangla college, Mirpur-1, Dhaka', 25, 12.00),
       (7, 'Dhaka WASA Zone-11 Office', 'Khanpur Jora Panir tank, Khanpur, Narayanganj', 20, 10.00);

go


select * from Parking;

GO


-- Create a Workshop table
-- Create Workshop table
CREATE TABLE Workshop (
  WorkshopID INT PRIMARY KEY,
  Name VARCHAR(50),
  Address VARCHAR(100),
  PhoneNumber VARCHAR(20),
  EmailAddress VARCHAR(50),
  Rating DECIMAL(3,1)
);

go

--Insert 7 row values for the Workshop table 
INSERT INTO Workshop (WorkshopID, Name, Address, PhoneNumber, EmailAddress, Rating) 
VALUES 
(1, 'AutoFix', '123 Road, Dhaka, Bangladesh', '+8801234567890', 'autofix@gmail.com', 4.5), 
(2, 'CarCare', '456 Street, Dhaka, Bangladesh', '+8809876543210', 'carcare@yahoo.com', 4.0), 
(3, 'Speedy Service', '789 Avenue, Dhaka, Bangladesh', '+8801122334455', 'speedy@outlook.com', 3.5), 
(4, 'MotoZone', '101 Lane, Dhaka, Bangladesh', '+8806677889900', 'motozone@msn.com', 4.2), 
(5, 'Garage Master', '121 Plaza, Dhaka, Bangladesh', '+8802233445566', 'garagemaster@live.com', 3.8), 
(6, 'Mechanic Pro', '141 Tower, Dhaka, Bangladesh', '+8803344556677','mechanicpro@skype.com', 4.3), 
(7, 'Auto Expert', '161 Park, Dhaka, Bangladesh','+8804455667788','autoexpert@zoho.com', 4.3);

go

select * from Workshop;

GO

-- Create User table
-- Create CarUser table
CREATE TABLE CarUser (
  UserID INT PRIMARY KEY IDENTITY(1,1),
  Username VARCHAR(20) UNIQUE NOT NULL,
  PasswordHash CHAR(64) NOT NULL,
  Role VARCHAR(50) CHECK (Role IN ('MD', 'DMD', 'Executiveengineer', 'Superintendingengineer', 'Projectdirector', 'Assistantsecretary', 'manager')) NOT NULL
);

go


--drop table CarUser;

-- Insert 7 rows of values for user table
INSERT INTO CarUser (Username, PasswordHash, Role)
VALUES ('taqsem', 'c3f1e2f3c2d4a9e6dbb7a6d5c4c5b0e9cdcdbad9d8d7e6e5f4f3f2f1c2c1b0b0', 'MD'),
('shahid', 'd4f2e3f4d3e5a0e7ecb8a7e6d5d6b1eaededbecae9e8e7f6f5f4f3f2d3d2c1c1', 'DMD'),
('mamun', 'e5f3e4f5e4f6a1e8fdb9a8f7e6e7b2ebfefcfdbbf0e9f8g7g6g5g4g3e4e3d2d2', 'manager'),
('asrib', 'a0f8c9f0a9c1a6e3b8b4a3c2b1a2a7e6b9b8b7c6c5c4d3d2e1e0f9f8a9a8a7a6', 'Executiveengineer'),
('kibria', 'b1f9d0f1b0c2a7e4c9b5a4c3b2a3a8e7bab9b8c7c6c5d4d3e2e1f0f9b0b9a8a7', 'Superintendingengineer'),
('latif', 'c2f0e1f2c1d3a8e5dab6a5d4c3c4b9e8cbcac9d89c1a6e3b8b4a3c2b1a2aeg4', 'Projectdirector'),
('rakib', 'd3f1e2d2c4a9e6dbb7a6d5c4c5b0e9cdcdbad9d8d7e6e5f4f3f2f1c2c1b0b0', 'Assistantsecretary');

go

select * from CarUser;

go


-- Create Division table
-- Create Division table
CREATE TABLE Division (
  DivisionID INT PRIMARY KEY IDENTITY(1,1),
  Name VARCHAR(50),
  Description VARCHAR(200),
  ManagerID INT,
  FOREIGN KEY (ManagerID) REFERENCES CarUser(UserID)
);

go

-- Insert 7 rows of values for division table
INSERT INTO Division (Name, Description, ManagerID)
VALUES ('Revenue', 'Responsible for collecting revenue from water and sewerage services', 7),
('Engineering', 'Responsible for designing and maintaining water and sewerage infrastructure', 4),
('Operations', 'Responsible for operating and monitoring water and sewerage systems', 5),
('Customer Service', 'Responsible for providing customer care and handling complaints', 3),
('Finance', 'Responsible for managing financial resources and accounting', 6),
('Human Resources', 'Responsible for managing human resources and administration', 2),
('Planning and Development', 'Responsible for planning and implementing development projects and programs',6);

go

select * from Division;

go

--drop table Driver; 
--DELETE FROM Driver;
-- Create Driver table


CREATE TABLE Driver (
  DriverID INT PRIMARY KEY IDENTITY(1,1),
  Name VARCHAR(50),
  LicenseNumber VARCHAR(20),
  PhoneNumber VARCHAR(20),
  EmailAddress VARCHAR(50),
  DivisionID INT,
  UserID INT,
  FOREIGN KEY (DivisionID) REFERENCES Division(DivisionID),
  FOREIGN KEY (UserID) REFERENCES CarUser(UserID)
);

go
-- Insert 7 rows of values for driver table
INSERT INTO Driver (Name, LicenseNumber, PhoneNumber, EmailAddress, DivisionID, UserID)
VALUES ('Md. Al Amin', 'DLN12345678', '01712345678', 'alamin@dwasa.org.bd', 1, 1),
('Md. Firoz Alom', 'DLN23456789', '01823456789', 'firoz@dwasa.org.bd', 2, 2),
('Jayanta Saha', 'DLN34567890', '01934567890', 'jayanta@dwasa.org.bd', 3, 3),
('Md. Mazharul Islam', 'DLN45678901', '01645678901', 'mazharul@dwasa.org.bd', 4, 4),
('Mohammad Tawhid Elahi', 'DLN56789012', '01556789012', 'tawhid@dwasa.org.bd', 5, 5),
('Md. Shah Alam', 'DLN67890123', '01467890123', 'shahalam@dwasa.org.bd', 6, 6),
('MD. Abdul Mazid', 'DLN78901234', '01378901234', 'abdulmazid@dwasa.org.bd', 7, 7);

go


select * from Driver;

go


-- Create Route table
-- Create Route table
CREATE TABLE Route (
  RouteID INT PRIMARY KEY IDENTITY(1,1),
  VehicleRegNo VARCHAR(10),
  DriverID INT,
  StartLocation VARCHAR(100),
  EndLocation VARCHAR(100),
  StartTime DATETIME,
  EndTime DATETIME,
  Distance DECIMAL(10,2),
  FOREIGN KEY (VehicleRegNo) REFERENCES Vehicle(VehicleRegNo),
  FOREIGN KEY (DriverID) REFERENCES Driver(DriverID)
);

go



-- Insert 7 rows of values for route table
INSERT INTO Route (VehicleRegNo, DriverID, StartLocation, EndLocation, StartTime, EndTime, Distance)
VALUES ('DHK-1234', 1, 'Dhaka WASA Head Office', 'Dhaka WASA Zone-1 Office', '2022-03-01 09:00:00', '2022-03-01 10:00:00', 12.5),
('DHK-2345', 2, 'Dhaka WASA Zone-4 Office', 'Dhaka WASA Zone-8 Office', '2022-03-01 09:30:00', '2022-03-01 10:30:00', 15.3),
('DHK-3456', 3, 'Dhaka WASA Zone-9 Office', 'Dhaka WASA Zone-10 Office', '2022-03-01 10:00:00', '2022-03-01 11:00:00', 13.7),
('DHK-4567', 4, 'Dhaka WASA Zone-11 Office', 'Dhaka WASA Head Office', '2022-03-01 10:30:00', '2022-03-01 11:30:00', 18.4),
('DHK-5678', 5, 'FM 1 Dhaka - Main Office', 'Dhaka WASA Zone-1 Office', '2022-03-01 11:00:00', '2022-03-01 12:00:00', 14.6),
('DHK-6789', 6, 'Dhaka WASA Zone-4 Office', 'FM 1 Dhaka - Main Office', '2022-03-01 11:30:00', '2022-03-01 12:30:00', 16.2),
('DHK-7890', 7, 'Dhaka WASA Zone-9 Office', 'Dhaka WASA Zone-11 Office', '2022-03-01 12:00:00', '2022-03-01 13:00:00', 17.9);


go

select * from Route;


go


-- Create Maintenance table
CREATE TABLE Maintenance (
  MaintenanceID INT PRIMARY KEY IDENTITY(1,1),
  VehicleRegNo VARCHAR(10),
  WorkshopID INT,
  SupplierID INT,
  Date DATE,
  Time TIME,
  Type VARCHAR(50),
  Cost DECIMAL(10,2),
  FOREIGN KEY (VehicleRegNo) REFERENCES Vehicle(VehicleRegNo),
  FOREIGN KEY (WorkshopID) REFERENCES Workshop(WorkshopID),
  FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

go



-- Insert 7 rows of values for maintenance table
INSERT INTO Maintenance (VehicleRegNo, WorkshopID, SupplierID, Date, Time, Type, Cost)
VALUES ('DHK-1234', 1, 1, '2022-03-01', '09:30:00', 'Oil change', 500.00),
('DHK-2345', 2, 2, '2022-03-01', '10:00:00', 'Brake repair', 800.00),
('DHK-3456', 3, 3, '2022-03-01', '10:30:00', 'Tire replacement', 1200.00),
('DHK-4567', 4, 4, '2022-03-01', '11:00:00', 'Battery check', 300.00),
('DHK-5678', 5, 5, '2022-03-01', '11:30:00', 'Engine tune-up', 1500.00),
('DHK-6789', 6, 6, '2022-03-01', '12:00:00', 'Transmission service', 2000.00),
('DHK-7890', 7, 7, '2022-03-01', '12:30:00', 'Air conditioning service', 1000.00);


go


select * from Maintenance;

go

-- drop TABLE Driver_Vehicle_Assignment
CREATE TABLE Driver_Vehicle_Assignment (
  AssignmentID INT PRIMARY KEY IDENTITY(1,1),
  DriverID INT REFERENCES Driver(DriverID),
  VehicleRegNo VARCHAR(10) REFERENCES Vehicle(VehicleRegNo),
  AssignmentDate DATE,
  ReturnDate DATE,
  CONSTRAINT FK_Driver_Vehicle_Assignment_DriverID FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
  CONSTRAINT FK_Driver_Vehicle_Assignment_VehicleRegNo FOREIGN KEY (VehicleRegNo) REFERENCES Vehicle(VehicleRegNo)
);
go


-- Insert 7 rows of values for Driver_Vehicle_Assignment table
INSERT INTO Driver_Vehicle_Assignment (DriverID, VehicleRegNo, AssignmentDate)
VALUES
(1, 'DHK-1234', '2023-05-01'),
(2, 'DHK-2345', '2023-05-02'),
(3, 'DHK-3456', '2023-05-03'),
(4, 'DHK-4567', '2023-05-04'),
(5, 'DHK-5678', '2023-05-05'),
(6, 'DHK-6789', '2023-05-06'),
(7, 'DHK-7890', '2023-05-07');

go

select * from Driver_Vehicle_Assignment;

go

--CREATE TABLE Driver_Vehicle_Assignment: This line begins the creation of the table named Driver_Vehicle_Assignment.

--(AssignmentID INT PRIMARY KEY IDENTITY(1,1)): This line defines the AssignmentID column as an integer data type and sets it as the primary key of the table. The IDENTITY(1,1) indicates that the values for this column will be automatically generated and incremented by 1.

--(DriverID INT REFERENCES Driver(DriverID)): This line creates the DriverID column as an integer data type and adds a foreign key constraint that references the DriverID column in the Driver table. This ensures that the values in the DriverID column of the Driver_Vehicle_Assignment table must match existing values in the Driver table.

--(VehicleRegNo VARCHAR(10) REFERENCES Vehicle(VehicleRegNo)): This line creates the VehicleRegNo column as a variable character data type with a length of 10. It also adds a foreign key constraint that references the VehicleRegNo column in the Vehicle table. This ensures that the values in the VehicleRegNo column of the Driver_Vehicle_Assignment table must match existing values in the Vehicle table.

--(AssignmentDate DATE, ReturnDate DATE): These lines create the AssignmentDate and ReturnDate columns as date data types. These columns will store the dates when the driver is assigned and returns the vehicle, respectively.

--CONSTRAINT FK_Driver_Vehicle_Assignment_DriverID FOREIGN KEY (DriverID) REFERENCES Driver(DriverID): This line adds a foreign key constraint named FK_Driver_Vehicle_Assignment_DriverID. It specifies that the DriverID column in the Driver_Vehicle_Assignment table references the DriverID column in the Driver table.

--CONSTRAINT FK_Driver_Vehicle_Assignment_VehicleRegNo FOREIGN KEY (VehicleRegNo) REFERENCES Vehicle(VehicleRegNo): This line adds a foreign key constraint named FK_Driver_Vehicle_Assignment_VehicleRegNo. It specifies that the VehicleRegNo column in the Driver_Vehicle_Assignment table references the VehicleRegNo column in the Vehicle table.

--These foreign key constraints ensure referential integrity, meaning that the values in the DriverID and VehicleRegNo columns of the Driver_Vehicle_Assignment table must match existing values in the Driver and Vehicle tables, respectively.

---  A view is a virtual table that shows the result of a query. A trigger is a special type of stored procedure that automatically runs when an event occurs in the database server.
--- To create a view and a trigger on the database tables, you can use the following commands (using MySQL syntax):
-- Create a view that shows the total cost of maintenance for each vehicle

go

-- Create VIEW Create View
--- Create VIEW Create View

CREATE VIEW MaintenanceCost AS
SELECT VehicleRegNo, SUM(Cost) AS TotalCost
FROM Maintenance
GROUP BY VehicleRegNo;
go

--CREATE VIEW MaintenanceCost AS
--This line starts with the CREATE VIEW statement, which is used to create a view in the database. In this case, the view is named "MaintenanceCost". Views are virtual tables that are based on the result of a query. They provide a way to encapsulate complex queries and make them easier to work with.

--SELECT VehicleRegNo, SUM(Cost) AS TotalCost
--This line specifies the columns to select from the underlying table(s) in the view. It selects the "VehicleRegNo" column and calculates the sum of the "Cost" column from the "Maintenance" table. The SUM(Cost) is an aggregate function that adds up all the values in the "Cost" column.

--The AS TotalCost part assigns an alias to the calculated sum, renaming it as "TotalCost" for easier reference.

--FROM Maintenance
--This line specifies the source table for the query. In this case, the "Maintenance" table is used as the source for the calculations.

--GROUP BY VehicleRegNo;
--This line groups the result set by the "VehicleRegNo" column. The GROUP BY clause is used to aggregate rows based on a specific column or columns. In this case, it groups the rows with the same "VehicleRegNo" value together.

--The result of this query will be used to create the "MaintenanceCost" view. The view will contain two columns: "VehicleRegNo" and "TotalCost". It will group the maintenance records by "VehicleRegNo" and calculate the total cost for each vehicle.

--It's worth mentioning that the go statement is specific to SQL Server and is not standard SQL. It is used in SQL Server Management Studio (SSMS) and other SQL Server tools to separate batches of statements.


--to see the view table
go

select * from MaintenanceCost;

go

-- Create a view that shows the details of each driver and their division
CREATE VIEW DriverDetails AS
SELECT d.DriverID, d.Name, d.LicenseNumber, d.PhoneNumber, d.EmailAddress, dv.Name AS DivisionName, dv.Description AS DivisionDescription
FROM Driver d
JOIN Division dv ON d.DivisionID = dv.DivisionID;

go

select * from DriverDetails;


go

---- Create a view that shows the details of each driver and their division
--CREATE VIEW DriverDetails AS
--This comment is not executed as part of the SQL code. It serves as a description to indicate the purpose of the subsequent code. In this case, it states that we are creating a view to display the details of each driver and their division.

--SELECT d.DriverID, d.Name, d.LicenseNumber, d.PhoneNumber, d.EmailAddress, dv.Name AS DivisionName, dv.Description AS DivisionDescription
--This line specifies the columns to select from the underlying tables in the view. It retrieves several columns from two tables, "Driver" (referenced as d) and "Division" (referenced as dv), using a JOIN operation. The columns selected include "DriverID", "Name", "LicenseNumber", "PhoneNumber", "EmailAddress" from the "Driver" table, and "Name" (aliased as "DivisionName") and "Description" (aliased as "DivisionDescription") from the "Division" table.

--FROM Driver d
--JOIN Division dv ON d.DivisionID = dv.DivisionID;
--This line specifies the source tables for the query and the JOIN condition. It retrieves data from the "Driver" table (referenced as d) and the "Division" table (referenced as dv). The JOIN condition ON d.DivisionID = dv.DivisionID specifies that the rows should be joined based on the equality of the "DivisionID" column in both tables. This links the drivers with their respective divisions.

--go
--This line is not part of the SQL query itself. It is used as a delimiter to separate batches of SQL statements. It indicates the end of the current batch and the execution of the previous statements.

--select * from DriverDetails;
--This line selects all columns from the "DriverDetails" view. It retrieves the data that was populated in the view based on the previous CREATE VIEW statement.

--go
--This line is again a delimiter to separate batches of SQL statements. It indicates the end of the current batch.

--Now let's summarize the overall process:

--The CREATE VIEW statement is used to create a view named "DriverDetails".
--The view retrieves specific columns from the "Driver" and "Division" tables using a JOIN operation based on the "DivisionID" column.
--The SELECT statement within the CREATE VIEW statement defines the columns to be displayed in the view.
--The go statement indicates the end of the first batch of statements.
--The subsequent SELECT statement retrieves all columns from the "DriverDetails" view.
--The final go statement indicates the end of the second batch of statements.
--By executing the SQL code, you would create the "DriverDetails" view and then retrieve the data from the view using the SELECT statement.


--SQL code to create the "RouteSummary" view and query it to get the number of routes and the total distance for vehicle with registration number 'DHK-7890':
-- Create a view that shows the route summary
go
CREATE VIEW RouteSummary AS
SELECT r.VehicleRegNo, COUNT(*) AS RouteCount, SUM(r.Distance) AS TotalDistance
FROM Route r
GROUP BY r.VehicleRegNo;
go

-- Query the RouteSummary view to get the number of routes and total distance for vehicle 'DHK-7890'
SELECT RouteCount, TotalDistance
FROM RouteSummary
WHERE VehicleRegNo = 'DHK-7890';

go

--In the above code:
--The CREATE VIEW statement creates a view named "RouteSummary". It retrieves data from the "Route" table and calculates the count of routes (RouteCount) and the sum of distances (TotalDistance) for each unique vehicle registration number (VehicleRegNo).
--The GROUP BY clause groups the data by VehicleRegNo, so the count and sum are calculated per vehicle.
--The SELECT statement outside the CREATE VIEW statement queries the "RouteSummary" view. It selects the RouteCount and TotalDistance columns from the view.
--The WHERE clause filters the results based on the condition VehicleRegNo = 'DHK-7890', so only data related to the vehicle with registration number 'DHK-7890' is returned.
--By executing the above SQL code, you would create the "RouteSummary" view and then query it to retrieve the route count and total distance for the specified vehicle.


-- Query the MaintenanceCost view to get the total cost of maintenance for vehicle 1
SELECT TotalCost FROM MaintenanceCost WHERE VehicleRegNo = 'DHK-3456';

-- Query the DriverDetails view to get the name and division of driver 2
SELECT Name, DivisionName FROM DriverDetails WHERE DriverID = 2;

-- Query the RouteSummary view to get the number of routes and the total distance for vehicle 3
SELECT RouteCount, TotalDistance FROM RouteSummary WHERE VehicleRegNo = 'DHK-7890';

go


-- Create a trigger

-- Create a trigger that prevents inserting a new route if the vehicle is not available

go

CREATE TRIGGER CheckVehicleStatus
ON Route
INSTEAD OF INSERT
AS
BEGIN
  IF EXISTS(
    SELECT 1
    FROM inserted i
    JOIN Vehicle v ON i.VehicleRegNo = v.VehicleRegNo
    WHERE v.Status <> 'available'
  )
  BEGIN
    RAISERROR('Vehicle is not available for route', 16, 1);
    ROLLBACK TRANSACTION;
  END
  ELSE
  BEGIN
    INSERT INTO Route (VehicleRegNo, DriverID, StartLocation, EndLocation, StartTime, EndTime, Distance)
    SELECT VehicleRegNo, DriverID, StartLocation, EndLocation, StartTime, EndTime, Distance
    FROM inserted;
  END;
END;


-- This trigger will check if any of the vehicles in the inserted table have a status other than 'available' in the Vehicle table. If any such vehicle is found, the trigger will raise an error and rollback the transaction. Otherwise, it will proceed to insert the records into the Route table.
-- This trigger checks the status of a vehicle before a new route is inserted. If the vehicle status is not "available," it raises an error and rolls back the transaction. Note that BEFORE INSERT should come after ON Route, and THEN is not needed after IF. This code creates a trigger named "CheckVehicleStatus" on the "Route" table that fires INSTEAD OF an INSERT operation. The trigger checks whether the vehicle associated with the inserted route is available or not. If the vehicle is not available, the trigger raises an error message with severity 16 and rolls back the transaction, preventing the insertion of the new route. If the vehicle is available, the trigger proceeds with the INSERT operation and inserts the new route into the "Route" table. The trigger uses a subquery to check whether the vehicle associated with the inserted route is available or not. It joins the "inserted" table (which contains the rows being inserted) with the "Vehicle" table on the "VehicleRegNo" column. If the vehicle's status is not "available", the trigger raises an error and rolls back the transaction. If the vehicle is available, the trigger uses a SELECT statement to insert the new route into the "Route" table. The SELECT statement retrieves the values of the columns from the "inserted" table and inserts them into the "Route" table.
go


-- Create a trigger that updates the mileage of the vehicle after each route
CREATE TRIGGER UpdateVehicleMileage ON Route
AFTER INSERT
AS
BEGIN
UPDATE Vehicle SET Mileage = Mileage + i.Distance FROM Vehicle JOIN inserted i ON Vehicle.VehicleRegNo = i.VehicleRegNo;
END;

go
-- 
--This is a Transact-SQL (T-SQL) trigger that is being created for Microsoft SQL Server. The trigger is named "UpdateVehicleMileage" and it is set to fire after each insert operation on the "Route" table. The "AFTER INSERT" clause specifies that the trigger should execute after an insert operation is completed on the "Route" table. The trigger is defined with the "CREATE TRIGGER" statement, which includes the trigger name, "ON" keyword and the table name "Route" on which the trigger is being created. The "BEGIN...END" block of code between the trigger definition is the main body of the trigger, and contains the T-SQL code that will be executed when the trigger is fired. In this case, the trigger will update the "Mileage" column in the "Vehicle" table based on the distance traveled for the route that was just inserted into the "Route" table. The "UPDATE" statement in the trigger body updates the "Mileage" column in the "Vehicle" table. The "FROM" clause joins the "Vehicle" table with the "inserted" table, which is a special table that holds the rows affected by the insert operation that fired the trigger. The "ON" clause in the join condition links the "VehicleRegNo" column from the "Vehicle" table to the "VehicleRegNo" column from the "inserted" table. This ensures that only the mileage for the vehicle that was just used for the route will be updated. Finally, the "GO" statement is used to indicate the end of the trigger definition. Once this trigger is created, it will execute after each insert operation on the "Route" table, and update the "Mileage" column in the "Vehicle" table accordingly. Insert a new route for vehicle 1 and driver 1 (this will fire the CheckVehicleStatus and UpdateVehicleMileage triggers)

go
INSERT INTO Route (VehicleRegNo, DriverID, StartLocation, EndLocation, StartTime, EndTime, Distance)
VALUES ('DHK-7890', 1, 'A', 'B', '2022-01-01 10:00:00', '2022-01-01 11:00:00', 50);
go

SELECT table_name FROM INFORMATION_SCHEMA.TABLES WHERE table_type = 'BASE TABLE'  -- list all the tables in the database.

go
-- Create a trigger that updates the mileage of the vehicle after each route
CREATE TRIGGER UpdateVehicleMileage ON Route
AFTER INSERT
AS
BEGIN
UPDATE Vehicle SET Mileage = Mileage + i.Distance FROM Vehicle JOIN inserted i ON Vehicle.VehicleRegNo = i.VehicleRegNo;
END;

GO


-- Insert a new route for vehicle 1 and driver 1 (this will fire the CheckVehicleStatus and UpdateVehicleMileage triggers)
go
INSERT INTO Route (VehicleRegNo, DriverID, StartLocation, EndLocation, StartTime, EndTime, Distance)
VALUES ('DHK-6789', 1, 'A', 'B', '2022-01-01 10:00:00', '2022-01-01 11:00:00', 150);
go

-- 
--The code creates a trigger named "UpdateVehicleMileage" that is associated with the "Route" table. This trigger is fired automatically after an insert operation on the "Route" table. The trigger updates the mileage of the vehicle associated with the inserted route by adding the distance traveled by the vehicle in the inserted route to its current mileage.

--To update the mileage of the vehicle, the trigger joins the "Vehicle" table with the "inserted" table, which is a special table in SQL Server that contains the rows affected by the insert operation. The join is performed on the "VehicleRegNo" column, which is common to both tables. The trigger then updates the "Mileage" column of the "Vehicle" table by adding the distance traveled in the inserted route to the current mileage of the vehicle.

--The second part of the code inserts a new route into the "Route" table for vehicle 1 and driver 1. This insertion operation will fire the "CheckVehicleStatus" and "UpdateVehicleMileage" triggers automatically. The "CheckVehicleStatus" trigger will update the status of the vehicle to "In Use", and the "UpdateVehicleMileage" trigger will update the mileage of the vehicle by adding the distance traveled in the inserted route to its current mileage.

-- Create a trigger that inserts a new row into the Maintenance table when a vehicle's mileage reaches 100000
CREATE TRIGGER ScheduleMaintenance ON Vehicle
AFTER UPDATE AS
BEGIN
IF UPDATE(Mileage)
INSERT INTO Maintenance (VehicleRegNo, WorkshopID, SupplierID, Date, Time, Type, Cost)
SELECT i.VehicleRegNo, 1, 1, GETDATE(), GETDATE(), 'Full service', 5000.00
FROM inserted i JOIN deleted d ON i.VehicleRegNo = d.VehicleRegNo
WHERE i.Mileage >= 100000 AND d.Mileage < 100000;
END;
GO

CREATE TRIGGER ScheduleMaintenance2 ON Vehicle
AFTER UPDATE AS
BEGIN
IF UPDATE(Mileage)
INSERT INTO Maintenance (VehicleRegNo, WorkshopID, SupplierID, Date, Time, Type, Cost)
SELECT i.VehicleRegNo, 1, 1, GETDATE(), GETDATE(), 'Full service', 5000.00
FROM inserted i JOIN deleted d ON i.VehicleRegNo = d.VehicleRegNo
WHERE i.Mileage >= 1000 AND d.Mileage < 1000;
END;
GO


-- Update the mileage of vehicle 2 to 100000 (this will fire the ScheduleMaintenance trigger)
UPDATE Vehicle
SET Mileage = 100000
WHERE VehicleRegNo = 'DHK-7890';

-- Update the mileage of vehicle 2 to 1000 (this will fire the ScheduleMaintenance2 trigger)
UPDATE Vehicle
SET Mileage = 1000
WHERE VehicleRegNo = 'DHK-6789';

--CREATE TRIGGER ScheduleMaintenance ON Vehicle AFTER UPDATE AS - This line starts the creation of a new trigger named ScheduleMaintenance that will be executed on the Vehicle table after an UPDATE operation.

--IF UPDATE(Mileage) - This line checks if the Mileage column was updated during the UPDATE operation.

--INSERT INTO Maintenance (VehicleRegNo, WorkshopID, SupplierID, Date, Time, Type, Cost) - This line specifies the columns of the Maintenance table that will be inserted with new data.

--SELECT i.VehicleRegNo, 1, 1, GETDATE(), GETDATE(), 'Full service', 5000.00 - This line specifies the values to be inserted into the columns specified in the previous line. In this case, the VehicleRegNo column will be set to the VehicleRegNo value of the row being updated, the WorkshopID and SupplierID columns will be set to 1, the Date and Time columns will be set to the current date and time using the GETDATE() function, the Type column will be set to 'Full service', and the Cost column will be set to 5000.00.

--FROM inserted i JOIN deleted d ON i.VehicleRegNo = d.VehicleRegNo - This line specifies that the inserted and deleted tables will be joined on the VehicleRegNo column, which will allow the trigger to compare the old and new values of the Mileage column.

--WHERE i.Mileage >= 100000 AND d.Mileage < 100000 - This line specifies that the trigger will only insert a new row into the Maintenance table if the updated Mileage value is greater than or equal to 100000 and the previous Mileage value was less than 100000.

--END; - This line marks the end of the trigger code.

--GO - This line signals the end of the CREATE TRIGGER statement and executes the query.

--Overall, this trigger will check if the Mileage column of a Vehicle row was updated to a value greater than or equal to 100000, and if so, it will insert a new row into the Maintenance table with information about the vehicle, workshop, supplier, date, time, type of service, and cost.


--To fire the trigger that inserts a new row into the Maintenance table when a vehicle's mileage reaches 100000,

UPDATE Vehicle SET Mileage = 100000 WHERE VehicleRegNo = 'DHK-1234';




go


SELECT table_name FROM INFORMATION_SCHEMA.TABLES WHERE table_type = 'BASE TABLE'  -- list all the tables in the database.
go

---show store procedure
-- Create stored procedure

CREATE PROCEDURE GetVehicleTypeById
  @TypeID VARCHAR(10)
AS
BEGIN
  -- Select the vehicle type based on the given TypeID
  SELECT * FROM VehicleType WHERE TypeID = @TypeID;
END;
go


-- Execute the stored procedure
EXEC GetVehicleTypeById '1';
go


--This stored procedure is named GetVehicleTypeById and takes a parameter @TypeID of type VARCHAR(10). It retrieves the vehicle type information from the VehicleType table based on the provided TypeID. To execute the stored procedure and get the vehicle type with TypeID 1, you can use the EXEC

--A stored procedure in MS SQL Server is a named group of SQL statements that are compiled and stored in the database. It allows you to encapsulate a series of SQL statements into a single program unit, which can be executed repeatedly. Stored procedures enhance performance, security, and code reusability.

-- Create a stored procedure

CREATE PROCEDURE CreateVehicleFleetDatabase
AS
BEGIN
    -- Check if the database already exists
    IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'VehicleFleetMngtDB')
    BEGIN
        -- Create the database
        CREATE DATABASE VehicleFleetMngtDB;
        PRINT 'VehicleFleetMngtDB created successfully.';
    END
    ELSE
    BEGIN
        PRINT 'VehicleFleetMngtDB already exists.';
    END
END;
go
--In this stored procedure, we first check if the database "VehicleFleetMngtDB" already exists. If it doesn't exist, we create the database and print a success message. If the database already exists, we print a message indicating that it already exists.


-- Execute the stored procedure
EXEC CreateVehicleFleetDatabase;
go

--Executing the stored procedure will create the "VehicleFleetMngtDB" database if it doesn't already exist, or print a message indicating that it already exists.





---show ms sql server db backup with code

BACKUP DATABASE VehicleFleetMngtDB
TO DISK = 'C:\Backup\VehicleFleetMngtDB.bak'
WITH FORMAT, COMPRESSION;
go

--
--back up the database "VehicleFleetMngtDB" to a backup file named "VehicleFleetMngtDB.bak" located at "C:\Backup". The statement BACKUP DATABASE is used to create a full database backup. The TO DISK clause specifies the location and filename for the backup file. In this case, it is set to 'C:\Backup\VehicleFleetMngtDB.bak'. The WITH FORMAT option specifies that a new media set will be created, overwriting any existing backup sets on the backup media. The COMPRESSION option indicates that the backup will be compressed to reduce its size. It's important to ensure that the specified directory ('C:\Backup' in this case) exists and that the SQL Server service account has sufficient permissions to write to that location. Additionally, it's a good practice to regularly schedule and perform database backups to protect against data loss.


--show ms sql server db backup with cusrsor 

DECLARE @name VARCHAR(50) -- database name
DECLARE @path VARCHAR(256) -- path for backup files
DECLARE @fileName VARCHAR(256) -- filename for backup
DECLARE @fileDate VARCHAR(20) -- used for file name

SET @path = 'C:\Backup\'

SELECT @fileDate = CONVERT(VARCHAR(20), GETDATE(), 112)

DECLARE db_cursor CURSOR FOR
SELECT name
FROM sys.databases
WHERE name = 'VehicleFleetMngtDB'

OPEN db_cursor
FETCH NEXT FROM db_cursor INTO @name

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @fileName = @path + @name + '_' + @fileDate + '.BAK'
    BACKUP DATABASE @name TO DISK = @fileName

    FETCH NEXT FROM db_cursor INTO @name
END

CLOSE db_cursor
DEALLOCATE db_cursor
go
---This code will backup only the "VehicleFleetMngtDB" database to a file named "VehicleFleetMngtDB_YYYYMMDD.BAK" in the specified backup path. Make sure to update the @path variable with the correct backup directory path.


---show ms sql server db restore with gui and also with code

USE master;

DECLARE @dbName VARCHAR(50) = 'VehicleFleetMngtDB';
DECLARE @backupPath VARCHAR(256) = 'C:\Backup\VehicleFleetMngtDB.bak';
DECLARE @dataFilePath VARCHAR(256) = 'C:\Data\VehicleFleetMngtDB.mdf';
DECLARE @logFilePath VARCHAR(256) = 'C:\Data\VehicleFleetMngtDB.ldf';

-- Restore the database
RESTORE DATABASE @dbName
FROM DISK = @backupPath
WITH MOVE @dbName TO @dataFilePath,
     MOVE @dbName + '_log' TO @logFilePath,
     REPLACE;

-- Optionally, bring the database online
ALTER DATABASE @dbName SET ONLINE;
go
--
--In the code above, you need to provide the appropriate values for the variables @dbName, @backupPath, @dataFilePath, and @logFilePath based on your specific setup. Make sure to update the @backupPath variable with the correct path to the backup file. Additionally, set the @dataFilePath and @logFilePath variables to the desired paths where the data and log files of the restored database should be located. After executing the code, the "VehicleFleetMngtDB" database will be restored from the specified backup file, and the data and log files will be placed in the provided file paths. The REPLACE keyword is used to overwrite any existing database with the same name if it exists. Note: It's essential to ensure that the backup file exists in the specified @backupPath before running the restore operation.

--show ms sql server sql query code for db Remote login

USE master;

-- Create a login for remote access
CREATE LOGIN ShyedLoginName
WITH PASSWORD = 'ShyedPassword';

-- Grant necessary server-level permissions to the login
GRANT CONNECT SQL TO ShyedLoginName;
GRANT VIEW ANY DATABASE TO ShyedLoginName;
-- Add more permissions as needed

-- Map the login to an existing user in the target database
USE VehicleFleetMngtDB;
CREATE USER ShyedUserName FOR LOGIN ShyedLoginName;

go

-- Grant necessary database-level permissions to the user
-- GRANT SELECT, INSERT, UPDATE, DELETE ON YourTableName TO YourUserName;
-- Add more permissions as needed
---In the above code, replace the following placeholders with your desired values:
--YourLoginName: Specify the name for the remote login.
--YourPassword: Set a password for the remote login.
--YourDatabaseName: Specify the name of the database to which the remote login/user should be mapped.
--YourUserName: Provide a name for the user associated with the login.
--YourTableName: If necessary, specify the name of the table for which you want to grant specific permissions.
--Please note that granting appropriate permissions to the remote login/user should be based on your specific requirements and security considerations.
go


--show ms sql server sql query code db Transaction
--show ms sql server sql query code db Transaction
BEGIN TRANSACTION;

-- Insert statement example
INSERT INTO VehicleTableName (Column1, Column2, Column3)
VALUES ('Value1', 'Value2', 'Value3');

-- Update statement example
UPDATE VehicleTableName
SET Column1 = 'NewValue'
WHERE Column2 = 'SomeCondition';

-- Delete statement example
DELETE FROM VehicleTableName
WHERE Column3 = 'SomeValue';

-- Commit the transaction if all statements succeed
COMMIT TRANSACTION;

go

--YourTableName: Specify the name of the table you want to perform the transaction on.
--Column1, Column2, Column3: Replace with the actual column names of your table.
--'Value1', 'Value2', 'Value3': Provide the desired values for the insert statement.
--'NewValue': Set the new value for the update statement.
--'SomeCondition', 'SomeValue': Specify the condition for the update and delete statements.
--The BEGIN TRANSACTION starts the transaction, and all the statements executed after that are part of the transaction. If all statements succeed without any errors, the COMMIT TRANSACTION commits the changes to the database. However, if any statement encounters an error or if you want to discard the changes made in the transaction, you can use ROLLBACK TRANSACTION instead of COMMIT TRANSACTION to roll back the changes.

--Transactions are designed to ensure data integrity and consistency in the database. It's essential to handle transactions properly and consider the potential impact of the transaction on your data.

--show ms sql server sql query code db Rollback
--show ms sql server sql query code db Rollback
BEGIN TRANSACTION;

-- Insert statement example
INSERT INTO VehicleTableName (Column1, Column2, Column3)
VALUES ('Value1', 'Value2', 'Value3');

-- Update statement example
UPDATE VehicleTableName
SET Column1 = 'NewValue'
WHERE Column2 = 'SomeCondition';

-- Delete statement example
DELETE FROM VehicleTableName
WHERE Column3 = 'SomeValue';

-- Check if any error occurred during the transaction
IF @@ERROR <> 0
BEGIN
    -- If an error occurred, rollback the transaction
    ROLLBACK TRANSACTION; 
    PRINT 'Transaction rolled back.';
END
ELSE
BEGIN
    -- If no error occurred, commit the transaction
    COMMIT TRANSACTION;
    PRINT 'Transaction committed.';
END

go

--YourTableName: Specify the name of the table you want to perform the transaction on.
--Column1, Column2, Column3: Replace with the actual column names of your table.
--'Value1', 'Value2', 'Value3': Provide the desired values for the insert statement.
--'NewValue': Set the new value for the update statement.
--'SomeCondition', 'SomeValue': Specify the condition for the update and delete statements.
--The BEGIN TRANSACTION starts the transaction, and all the statements executed after that are part of the transaction. If any statement encounters an error (@@ERROR <> 0), the ROLLBACK TRANSACTION is executed to undo the changes made in the transaction. If no error occurs, the COMMIT TRANSACTION is executed to commit the changes to the database.


---show ms sql server sql query code db Commit and Rollback
---show ms sql server sql query code db Commit and Rollback

BEGIN TRANSACTION;

-- Perform your database operations here
-- For example:
INSERT INTO VehicleTableName (Column1, Column2, Column3)
VALUES ('Value1', 'Value2', 'Value3');

-- Check if any error occurred during the transaction
IF @@ERROR <> 0
BEGIN
    -- If an error occurred, rollback the transaction
    ROLLBACK TRANSACTION;
    PRINT 'Transaction rolled back.';
END
ELSE
BEGIN
    -- If no error occurred, commit the transaction
    COMMIT TRANSACTION;
    PRINT 'Transaction committed.';
END
go

--YourTableName: Specify the name of the table you want to perform the transaction on.
--Column1, Column2, Column3: Replace with the actual column names of your table.
--'Value1', 'Value2', 'Value3': Provide the desired values for the insert statement.
--The BEGIN TRANSACTION statement starts the transaction, and all the statements executed after that are part of the transaction. If any statement encounters an error (@@ERROR <> 0), the ROLLBACK TRANSACTION is executed to undo the changes made in the transaction. If no error occurs, the COMMIT TRANSACTION is executed to commit the changes to the database.



---show ms sql server sql query code to list all the tables in the database.

SELECT table_name FROM INFORMATION_SCHEMA.TABLES WHERE table_type = 'BASE TABLE'  -- list all the tables in the database.
go

---To see various tables use - 
select * from VehicleType;
go
select * from CarUser;
go
select * from Division;
go
select * from Parking;
go
select * from Supplier;
go
select * from Driver;
go
select * from Route;
go
select * from Maintenance;
go

select * from Driver_Vehicle_Assignment;

-- Query the MaintenanceCost view to get the total cost of maintenance for vehicle 1
SELECT TotalCost FROM MaintenanceCost WHERE VehicleRegNo = 'DHK-3456';

-- Query the DriverDetails view to get the name and division of driver 2
SELECT Name, DivisionName FROM DriverDetails WHERE DriverID = 2;


---show ms sql server sql query code to list all the tables, views, triggers, stored procedures, transactions, commits, rollbacks in the database.
-- List all tables

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

-- List all views
SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS;

-- List all triggers
SELECT name AS TriggerName, OBJECT_SCHEMA_NAME(parent_id) AS SchemaName, OBJECT_NAME(parent_id) AS TableName
FROM sys.triggers;

-- List all stored procedures
SELECT SPECIFIC_SCHEMA, SPECIFIC_NAME
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE';

-- List all transactions
SELECT transaction_id, name AS TransactionName, transaction_begin_time
FROM sys.dm_tran_active_transactions;

-- List all committed transactions
SELECT transaction_id, name AS TransactionName, transaction_begin_time
FROM sys.dm_tran_commit_table;

-- List all rolled back transactions
SELECT transaction_id, name AS TransactionName, transaction_begin_time
FROM sys.dm_tran_rollback_transactions;
go

--
--above code retrieves information from system catalog views and system dynamic management views, which provide metadata about the database objects and transactions. Make sure you have sufficient privileges to access these views and adjust the queries as per your specific database and schema names. The queries provided will give you information about the tables, views, triggers, stored procedures, and transactions in the database. However, it's important to note that SQL Server does not keep a history of individual commits and rollbacks, so you won't be able to retrieve a detailed list of all past commits and rollbacks. The sys.dm_tran_commit_table and sys.dm_tran_rollback_transactions views only provide information about the transactions that have been committed or rolled back since the last startup of the SQL Server service.
