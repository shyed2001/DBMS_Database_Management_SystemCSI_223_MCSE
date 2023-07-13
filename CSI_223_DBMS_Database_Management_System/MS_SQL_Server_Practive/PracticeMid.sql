Select @@SERVERNAME as SERVERNAME , @@SERVICENAME as SERVICENAME , @@VERSION as Version , @@SPID , @@CONNECTIONS , @@FETCH_STATUS , @@IDENTITY , @@IDLE , @@DBTS , 
@@MAX_CONNECTIONS as MAX_CONNECTIONS , @@MICROSOFTVERSION as MSVersion , @@TRANCOUNT as TranCount , @@ROWCOUNT 



----https://www.edureka.co/blog/sql-commands

--/*CREATE
--This statement is used to create a table or a database.

--The ‘CREATE DATABASE’ Statement
--As the name suggests, this statement is used to create a database.
--*/
--
--
--CREATE DATABASE Employee;    --CREATE DATABASE DatabaseName; This should only be done once
--
--

--/*
--The ‘CREATE TABLE’ Statement
--This statement is used to create a table.

--Syntax
--CREATE TABLE TableName (
--Column1 datatype,
--Column2 datatype,
--Column3 datatype,
--....

--ColumnN datatype
--);
--*/
----Example

--
--
--
go

--CREATE TABLE Employee_Info
--(
--EmployeeID int,
--EmployeeName Nvarchar(255) Not Null,
--EmergencyContactName Nvarchar(255),
--PhoneNumber BIGINT,
--Address Nvarchar(255),
--City Nvarchar(255),
--Country Nvarchar(255) )
--go

--

--

----You can also create a table using another table. Refer the below sytax and example:

----https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver16

----https://www.w3schools.com/sql/sql_datatypes.asp

----https://www.promotic.eu/en/pmdoc/Subsystems/Db/MsSQL/DataTypes.htm

----https://www.sqlservertutorial.net/sql-server-basics/sql-server-data-types/

----https://www.guru99.com/sql-server-datatype.html

--
--
--

--INSERT INTO Employee_Info(EmployeeID, EmployeeName, EmergencyContactName, PhoneNumber, Address, City, Country)
--VALUES ('06', 'Sanjana','Jagannath', '9921321141', 'Camel Street House No 12', 'Chennai', 'India')
 
--INSERT INTO Employee_Info 
--VALUES ('07', 'Sayantini','Praveen', '9934567654', 'Nice Road 21', 'Pune', 'India')
----
--
--
----DROP
----This statement is used to drop an existing table or a database.

----The ‘DROP DATABASE’ Statement
----This statement is used to drop an existing database. 
----When you use this statement, complete information present in the database will be lost.

----Syntax
----DROP DATABASE DatabaseName;
----Example
----1

----DROP DATABASE Employee2

----The ‘DROP TABLE’ Statement
----This statement is used to drop an existing table. 
----When you use this statement, complete information present in the table will be lost.

----Syntax
----DROP TABLE TableName;
----Example
----1
--DROP Table Employee_Info


----USE
----The USE statement is used to select the database on which you want to perform operations.
----Syntax
----USE DatabaseName;
----Example
----1
----USE Employee;

--https://www.w3schools.com/sql/sql_join.asp

GO
use Employee -- command use Employee database
select EmployeeName, City FROM Employee_Info

go;




