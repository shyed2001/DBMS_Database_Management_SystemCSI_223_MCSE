

Create Database VehicleFleetMngtDB;
go

use VehicleFleetMngtDB;
go

-- Create VehicleType table
CREATE TABLE VehicleType (
  TypeID VARCHAR PRIMARY KEY,
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

CREATE TABLE Vehicle (
VehicleRegNo VARCHAR(10) PRIMARY KEY,
MakerCompany VARCHAR(50),
Model VARCHAR(50),
Year INT,
Color VARCHAR(20),
Mileage INT,
Status VARCHAR(20),
TypeID VARCHAR REFERENCES VehicleType (TypeID)
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

-- Create a Parking table
CREATE TABLE Parking (
  ParkingID INT PRIMARY KEY,
  Name VARCHAR (50),
  Address VARCHAR (100),
  Capacity INT,
  CostPerYear DECIMAL (10,2)
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

-- Create a Workshop table
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

-- Create User table
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


-- Create Division table
CREATE TABLE Division (
  DivisionID INT PRIMARY KEY IDENTITY(1,1),
  Name VARCHAR(50),
  Description VARCHAR(200),
  ManagerID INT REFERENCES CarUser(UserID)
);

-- Insert 7 rows of values for division table
INSERT INTO Division (Name, Description, ManagerID)
VALUES ('Revenue', 'Responsible for collecting revenue from water and sewerage services', 7),
('Engineering', 'Responsible for designing and maintaining water and sewerage infrastructure', 4),
('Operations', 'Responsible for operating and monitoring water and sewerage systems', 5),
('Customer Service', 'Responsible for providing customer care and handling complaints', 3),
('Finance', 'Responsible for managing financial resources and accounting', 6),
('Human Resources', 'Responsible for managing human resources and administration', 2),
('Planning and Development', 'Responsible for planning and implementing development projects and programs',6);


select * from Division;


--drop table Driver; 
--DELETE FROM Driver;
-- Create Driver table


CREATE TABLE Driver (
  DriverID INT PRIMARY KEY IDENTITY(1,1),
  Name VARCHAR(50),
  LicenseNumber VARCHAR(20),
  PhoneNumber VARCHAR(20),
  EmailAddress VARCHAR(50),
  DivisionID INT REFERENCES Division(DivisionID),
  UserID INT REFERENCES CarUser(UserID)
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

-- Create Route table
CREATE TABLE Route (
  RouteID INT PRIMARY KEY IDENTITY(1,1),
  VehicleRegNo VARCHAR(10) REFERENCES Vehicle(VehicleRegNo),
  DriverID INT REFERENCES Driver(DriverID),
  StartLocation VARCHAR(100),
  EndLocation VARCHAR(100),
  StartTime DATETIME,
  EndTime DATETIME,
  Distance DECIMAL(10,2)
);

-- Insert 7 rows of values for route table
INSERT INTO Route (VehicleRegNo, DriverID, StartLocation, EndLocation, StartTime, EndTime, Distance)
VALUES ('DHK-1234', 16, 'Dhaka WASA Head Office', 'Dhaka WASA Zone-1 Office', '2022-03-01 09:00:00', '2022-03-01 10:00:00', 12.5),
('DHK-2345', 17, 'Dhaka WASA Zone-4 Office', 'Dhaka WASA Zone-8 Office', '2022-03-01 09:30:00', '2022-03-01 10:30:00', 15.3),
('DHK-3456', 18, 'Dhaka WASA Zone-9 Office', 'Dhaka WASA Zone-10 Office', '2022-03-01 10:00:00', '2022-03-01 11:00:00', 13.7),
('DHK-4567', 19, 'Dhaka WASA Zone-11 Office', 'Dhaka WASA Head Office', '2022-03-01 10:30:00', '2022-03-01 11:30:00', 18.4),
('DHK-5678', 20, 'FM 1 Dhaka - Main Office', 'Dhaka WASA Zone-1 Office', '2022-03-01 11:00:00', '2022-03-01 12:00:00', 14.6),
('DHK-6789', 21, 'Dhaka WASA Zone-4 Office', 'FM 1 Dhaka - Main Office', '2022-03-01 11:30:00', '2022-03-01 12:30:00', 16.2),
('DHK-7890', 22, 'Dhaka WASA Zone-9 Office', 'Dhaka WASA Zone-11 Office', '2022-03-01 12:00:00', '2022-03-01 13:00:00', 17.9);

select * from Route;

-- Create Maintenance table
CREATE TABLE Maintenance (
MaintenanceID INT PRIMARY KEY IDENTITY(1,1),
VehicleRegNo VARCHAR(10) REFERENCES Vehicle(VehicleRegNo),
WorkshopID INT REFERENCES Workshop(WorkshopID),
SupplierID INT REFERENCES Supplier(SupplierID),
Date DATE,
Time TIME,
Type VARCHAR(50),
Cost DECIMAL(10,2)
);

-- Insert 7 rows of values for maintenance table
INSERT INTO Maintenance (VehicleRegNo, WorkshopID, SupplierID, Date, Time, Type, Cost)
VALUES ('DHK-1234', 1, 1, '2022-03-01', '09:30:00', 'Oil change', 500.00),
('DHK-2345', 2, 2, '2022-03-01', '10:00:00', 'Brake repair', 800.00),
('DHK-3456', 3, 3, '2022-03-01', '10:30:00', 'Tire replacement', 1200.00),
('DHK-4567', 4, 4, '2022-03-01', '11:00:00', 'Battery check', 300.00),
('DHK-5678', 5, 5, '2022-03-01', '11:30:00', 'Engine tune-up', 1500.00),
('DHK-6789', 6, 6, '2022-03-01', '12:00:00', 'Transmission service', 2000.00),
('DHK-7890', 7, 7, '2022-03-01', '12:30:00', 'Air conditioning service', 1000.00);

select * from Maintenance;

---  A view is a virtual table that shows the result of a query. A trigger is a special type of stored procedure that automatically runs when an event occurs in the database server.

--- To create a view and a trigger on the database tables, you can use the following commands (using MySQL syntax):


-- Create a view that shows the total cost of maintenance for each vehicle

go

CREATE VIEW MaintenanceCost AS
SELECT VehicleRegNo, SUM(Cost) AS TotalCost
FROM Maintenance
GROUP BY VehicleRegNo;
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


-- Query the MaintenanceCost view to get the total cost of maintenance for vehicle 1
SELECT TotalCost FROM MaintenanceCost WHERE VehicleRegNo = 'DHK-3456';

-- Query the DriverDetails view to get the name and division of driver 2
SELECT Name, DivisionName FROM DriverDetails WHERE DriverID = 2;

-- Query the RouteSummary view to get the number of routes and the total distance for vehicle 3
SELECT RouteCount, TotalDistance FROM RouteSummary WHERE VehicleRegNo = 'DHK-7890';



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
INSERT INTO Route (VehicleRegNo, DriverID, StartLocation, EndLocation, StartTime, EndTime, Distance)
VALUES (1, 1, 'A', 'B', '2022-01-01 10:00:00', '2022-01-01 11:00:00', 50);

go

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

-- Update the mileage of vehicle 2 to 100000 (this will fire the ScheduleMaintenance trigger)
UPDATE Vehicle
SET Mileage = 100000
WHERE VehicleRegNo = 2;

--To fire the trigger that inserts a new row into the Maintenance table when a vehicle's mileage reaches 100000,


UPDATE Vehicle SET Mileage = 100000 WHERE VehicleRegNo = 2;

go





SELECT table_name FROM INFORMATION_SCHEMA.TABLES WHERE table_type = 'BASE TABLE'  -- list all the tables in the database.





