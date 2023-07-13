Create Database VehicleFleetMngtDB;
go


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
(1, 'SedanCar', 'A four-door car for personal or business use', 4);

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
('DHK-1234', 'Toyota', 'Yearis', 2018, 'White', 50000, 'available', 1);

go

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
(1, 'ABC Motors Ltd.', '123 Road, Dhaka, Bangladesh', '+8801234567890', 'abc@motors.com');

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
VALUES (1, 'Dhaka WASA Head Office', '98 Kazi Nazrul Islam Ave, Dhaka 1215', 50, 20.00);

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
(1, 'AutoFix', '123 Road, Dhaka, Bangladesh', '+8801234567890', 'autofix@gmail.com', 4.5); 

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
VALUES ('taqsem', 'c3f1e2f3c2d4a9e6dbb7a6d5c4c5b0e9cdcdbad9d8d7e6e5f4f3f2f1c2c1b0b0', 'MD');

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
VALUES ('Revenue', 'Responsible for collecting revenue from water and sewerage services', 7);

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
VALUES ('Md. Al Amin', 'DLN12345678', '01712345678', 'alamin@dwasa.org.bd', 1, 1);

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
VALUES ('DHK-1234', 16, 'Dhaka WASA Head Office', 'Dhaka WASA Zone-1 Office', '2022-03-01 09:00:00', '2022-03-01 10:00:00', 12.5);

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
VALUES ('DHK-1234', 1, 1, '2022-03-01', '09:30:00', 'Oil change', 500.00);


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
(1, 'DHK-1234', '2023-05-01');


go

select * from Driver_Vehicle_Assignment;

go

--UPDATE Driver SET name = 'John Smith' WHERE id = 123;
--DELETE FROM Driver WHERE id = 123;

--The statement UPDATE Driver SET name = 'John Smith' WHERE id = 123; updates the "name" column of the "Driver" table to 'John Smith' for the row(s) where the "id" column is equal to 123.

--The statement DELETE FROM Driver WHERE id = 123; deletes the row(s) from the "Driver" table where the "id" column is equal to 123.

--Please note that these statements assume the existence of a table named "Driver" with columns "id" and "name" in your database. You should adjust the table and column names according to your actual schema.