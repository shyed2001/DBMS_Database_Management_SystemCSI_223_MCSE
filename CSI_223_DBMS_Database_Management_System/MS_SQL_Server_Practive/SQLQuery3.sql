Select @@SERVERNAME as SERVERNAME , @@SERVICENAME as SERVICENAME , @@VERSION as Version , @@SPID , @@CONNECTIONS , @@FETCH_STATUS , @@IDENTITY , @@IDLE , @@DBTS , 
@@MAX_CONNECTIONS as MAX_CONNECTIONS , @@MICROSOFTVERSION as MSVersion , @@TRANCOUNT as TranCount , @@ROWCOUNT
Use AdventureWorks2019

Select *                      /* select all columns */ 
FROM HumanResources.Employee  --of this table
Where JobTitle = 'Research and Development Manager' 
Select LoginID, JobTitle  -- select LoginID, JobTitle  columns
FROM HumanResources.Employee;