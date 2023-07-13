
CREATE DATABASE BankingDatabase;
GO

USE BankingDatabase;
GO

CREATE TABLE Customer_Types (
    Customer_Types_code INT PRIMARY KEY,
    Customer_Types_description VARCHAR(50)
);
GO

CREATE TABLE Customers (
    Customers_ID INT PRIMARY KEY,
    Customers_name VARCHAR(50),
    Customers_phone BIGINT,  -- Changed data type to BIGINT
    Customers_email VARCHAR(50),
    Date_became_customer DATE,
    Login VARCHAR(50),
    Password VARCHAR(50),
    Other_details VARCHAR(50),
    Customer_types_code INT,
    Nominee_name VARCHAR(50),
    Nominee_relation VARCHAR(50),
    Nominee_phone BIGINT,  -- Changed data type to BIGINT
    Nominee_address VARCHAR(50),
    FOREIGN KEY (Customer_types_code) REFERENCES Customer_Types(Customer_Types_code)
);
GO


CREATE TABLE Account_Types (
    Account_Types_code VARCHAR(15) PRIMARY KEY,
    Account_Types_description VARCHAR(50)
);
GO

CREATE TABLE Accounts (
    Account_ID INT PRIMARY KEY,
    Accounts_name VARCHAR(50),
    Date_opened DATE,
    Other_account_details VARCHAR(50),
    Account_types_code VARCHAR(15),
    Customer_ID INT,
    Debit DECIMAL(8,1),
    Credit DECIMAL(8,1),
    Balance DECIMAL(8,1),
    FOREIGN KEY (Account_types_code) REFERENCES Account_Types(Account_Types_code),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customers_ID)
);
GO

CREATE TABLE Admin_user (
    Admin_user_Login VARCHAR(50) PRIMARY KEY,
    Admin_user_Password VARCHAR(50)
);
GO

CREATE TABLE Transaction_Types (
    Transaction_Types_code VARCHAR(50) PRIMARY KEY,
    Transaction_Types_description VARCHAR(50)
);

CREATE TABLE Transactions (
    Transaction_ID INT PRIMARY KEY,
    Date DATE,
    Debit DECIMAL(8,1),
    Credit DECIMAL(8,1),
    Balance DECIMAL(8,1),
    Other_details VARCHAR(50),
    Purchase_ID INT,
    Account_ID INT,
    Transaction_types_code VARCHAR(50),
    FOREIGN KEY (Purchase_ID) REFERENCES Transactions(Transaction_ID),
    FOREIGN KEY (Account_ID) REFERENCES Accounts(Account_ID),
    FOREIGN KEY (Transaction_types_code) REFERENCES Transaction_Types(Transaction_Types_code)
);  



-- Retrieve data from Customer_Types table
SELECT * FROM Customer_Types;
-- Retrieve data from Customers table
SELECT * FROM Customers;
-- Retrieve data from Account_Types table
SELECT * FROM Account_Types;
-- Retrieve data from Accounts table
SELECT * FROM Accounts;
-- Retrieve data from Admin_user table
SELECT * FROM Admin_user;
-- Retrieve data from Transactions table
SELECT * FROM Transactions;
-- Retrieve data from Transaction_Types table
SELECT * FROM Transaction_Types;


-- Insert sample data into Customer_Types table
INSERT INTO Customer_Types (Customer_Types_code, Customer_Types_description)
VALUES (1, 'Type 1'), (2, 'Type 2'), (3, 'Type 3');

-- Insert sample data into Customers table
INSERT INTO Customers (Customers_ID, Customers_name, Customers_phone, Customers_email, Date_became_customer, Login, Password, Other_details, Customer_types_code, Nominee_name, Nominee_relation, Nominee_phone, Nominee_address)
VALUES
    (1, 'John Doe', 1234567890, 'john.doe@example.com', '2023-01-01', 'johndoe', 'password1', 'Details 1', 1, 'Jane Doe', 'Spouse', 9876543210, 'Address 1'),
    (2, 'Jane Smith', 9876543210, 'jane.smith@example.com', '2023-02-01', 'janesmith', 'password2', 'Details 2', 2, 'John Smith', 'Spouse', 1234567890, 'Address 2'),
    (3, 'David Johnson', 5555555555, 'david.johnson@example.com', '2023-03-01', 'davidjohnson', 'password3', 'Details 3', 3, 'Sarah Johnson', 'Spouse', 1111111111, 'Address 3');

-- Insert sample data into Account_Types table
INSERT INTO Account_Types (Account_Types_code, Account_Types_description)
VALUES ('Type A', 'Account Type A'), ('Type B', 'Account Type B'), ('Type C', 'Account Type C');

-- Insert sample data into Accounts table
INSERT INTO Accounts (Account_ID, Accounts_name, Date_opened, Other_account_details, Account_types_code, Customer_ID, Debit, Credit, Balance)
VALUES
    (1, 'Account 1', '2023-01-01', 'Details 1', 'Type A', 1, 100.5, 0, 100.5),
    (2, 'Account 2', '2023-02-01', 'Details 2', 'Type B', 2, 0, 50.2, -50.2),
    (3, 'Account 3', '2023-03-01', 'Details 3', 'Type C', 3, 10.5, 20.3, -9.8);

-- Insert sample data into Admin_user table
INSERT INTO Admin_user (Admin_user_Login, Admin_user_Password)
VALUES ('admin1', 'adminpassword1'), ('admin2', 'adminpassword2'), ('admin3', 'adminpassword3');

-- Insert sample data into Transaction_Types table
INSERT INTO Transaction_Types (Transaction_Types_code, Transaction_Types_description)
VALUES ('Type 1', 'Transaction Type 1'), ('Type 2', 'Transaction Type 2'), ('Type 3', 'Transaction Type 3');

-- Insert sample data into Transactions table
INSERT INTO Transactions (Transaction_ID, Date, Debit, Credit, Balance, Other_details, Purchase_ID, Account_ID, Transaction_types_code)
VALUES
    (1, '2023-01-01', 10.5, 0, 10.5, 'Details 1', NULL, 1, 'Type 1'),
    (2, '2023-02-01', 0, 20.3, -9.8, 'Details 2', NULL, 2, 'Type 2'),
    (3, '2023-03-01', 5.5, 5.5, 0, 'Details 3', NULL, 3, 'Type 3');


-- Retrieve data from Customer_Types table
SELECT * FROM Customer_Types;
go
-- Retrieve data from Account_Types table
SELECT * FROM Account_Types;
go
-- Retrieve data from Accounts table
SELECT * FROM Accounts;
go
-- Retrieve data from Customers table
SELECT * FROM Customers;
go
-- Retrieve data from Admin_user table
SELECT * FROM Admin_user;
go
-- Retrieve data from Transactions table
SELECT * FROM Transactions;
go
-- Retrieve data from Transaction_Types table
SELECT * FROM Transaction_Types;
go



USE BankingDatabase;
GO

-- Create the view to retrieve account details for a customer
CREATE VIEW CustomerAccountDetails AS
SELECT
    C.Customers_ID,
    C.Customers_name,
    A.Account_ID,
    A.Accounts_name,
    A.Balance
FROM
    Customers AS C
JOIN
    Accounts AS A ON C.Customers_ID = A.Customer_ID;

go


SELECT * FROM CustomerAccountDetails;

go


USE BankingDatabase;
GO

USE BankingDatabase;
GO

-- Create a trigger to update the balance of the account after every transaction
CREATE TRIGGER UpdateAccountBalance
ON Transactions
AFTER INSERT, UPDATE
AS
BEGIN
    -- Update the balance in the Accounts table based on the transaction
    UPDATE A
    SET
        A.Balance = A.Balance + (I.Credit - I.Debit)
    FROM
        Accounts AS A
    JOIN
        inserted AS I ON A.Account_ID = I.Account_ID;
END;

go

SELECT * FROM Accounts;
go

USE BankingDatabase;
GO

-- Create a stored procedure to get the account balance for a specific customer
CREATE PROCEDURE GetAccountBalance
    @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        A.Account_ID,
        A.Accounts_name,
        A.Balance
    FROM
        Accounts AS A
    WHERE
        A.Customer_ID = @CustomerID;
END;
go


USE BankingDatabase;
GO

-- Execute the stored procedure to get account balances for a specific customer
EXEC GetAccountBalance @CustomerID = 1;
go
DECLARE @name VARCHAR(50) -- database name
DECLARE @path VARCHAR(256) -- path for backup files
DECLARE @fileName VARCHAR(256) -- filename for backup
DECLARE @fileDate VARCHAR(20) -- used for file name

SET @path = 'C:\Backup\' 

SELECT @fileDate = CONVERT(VARCHAR(20), GETDATE(), 112) 

DECLARE db_cursor CURSOR FOR 
SELECT name 
FROM MASTER.dbo.sysdatabases 
WHERE name NOT IN ('master','model','msdb','tempdb') 

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

USE master; -- Switch to the master database

-- Specify the restore file path and name
DECLARE @backupFilePath NVARCHAR(500) = 'C:\Backup\YourBackupFile.bak';

-- Specify the logical and physical file names for the database
DECLARE @databaseName NVARCHAR(128) = 'YourDatabaseName';
DECLARE @dataFilePath NVARCHAR(500) = 'C:\Data\YourDatabaseName.mdf';
DECLARE @logFilePath NVARCHAR(500) = 'C:\Logs\YourDatabaseName.ldf';

-- Restore the database
RESTORE DATABASE @databaseName
FROM DISK = @backupFilePath
WITH
    MOVE 'LogicalDataFileName' TO @dataFilePath,
    MOVE 'LogicalLogFileName' TO @logFilePath,
    REPLACE; -- Use REPLACE to overwrite the existing database if it already exists

go

--- Remote login
EXECUTE AS LOGIN = 'RemoteLoginName'; -- Replace 'RemoteLoginName' with the actual remote login name

--- To show the current transaction in SQL, you can use the @@TRANCOUNT system variable. 
SELECT @@TRANCOUNT;
go

---To rollback a transaction in SQL, you can use the ROLLBACK statement. 
ROLLBACK;
go

---To commit a transaction in SQL, you can use the COMMIT statement. 
COMMIT;

