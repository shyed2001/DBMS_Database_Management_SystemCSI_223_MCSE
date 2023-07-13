--use VehicleFleetMngtDB;
go

-- Create VehicleType table
CREATE TABLE VehicleType (
  TypeID VARCHAR(10) PRIMARY KEY,
  Name VARCHAR(50),
  Description VARCHAR(200),
  Capacity INT
);

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

-- Create Supplier table
CREATE TABLE Supplier (
  SupplierID INT PRIMARY KEY,
  Name VARCHAR(50),
  Address VARCHAR(100),
  PhoneNumber VARCHAR(20),
  EmailAddress VARCHAR(50)
);

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

-- Create Workshop table
CREATE TABLE Workshop (
  WorkshopID INT PRIMARY KEY,
  Name VARCHAR(50),
  Address VARCHAR(100),
  PhoneNumber VARCHAR(20),
  EmailAddress VARCHAR(50),
  Rating DECIMAL(3,1)
);

-- Create CarUser table
CREATE TABLE CarUser (
  UserID INT PRIMARY KEY IDENTITY(1,1),
  Username VARCHAR(20) UNIQUE NOT NULL,
  PasswordHash CHAR(64) NOT NULL,
  Role VARCHAR(50) CHECK (Role IN ('MD', 'DMD', 'Executiveengineer', 'Superintendingengineer', 'Projectdirector', 'Assistantsecretary', 'manager')) NOT NULL
);

-- Create Division table
CREATE TABLE Division (
  DivisionID INT PRIMARY KEY IDENTITY(1,1),
  Name VARCHAR(50),
  Description VARCHAR(200),
  ManagerID INT,
  FOREIGN KEY (ManagerID) REFERENCES CarUser(UserID)
);

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

CREATE TABLE Driver_Vehicle_Assignment (
  AssignmentID INT PRIMARY KEY IDENTITY(1,1),
  DriverID INT REFERENCES Driver(DriverID),
  VehicleRegNo VARCHAR(10) REFERENCES Vehicle(VehicleRegNo),
  AssignmentDate DATE,
  ReturnDate DATE,
  CONSTRAINT FK_Driver_Vehicle_Assignment_DriverID FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
  CONSTRAINT FK_Driver_Vehicle_Assignment_VehicleRegNo FOREIGN KEY (VehicleRegNo) REFERENCES Vehicle(VehicleRegNo)
);
