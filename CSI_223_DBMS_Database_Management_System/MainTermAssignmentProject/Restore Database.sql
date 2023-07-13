RESTORE DATABASE SUB FROM  
DISK = 'C:\Backup\SUB_20230517.BAK' 
WITH MOVE 'SUB' TO 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SUB.mdf',  
     MOVE 'SUB_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SUB_log.ldf',  
RECOVERY, -- 'with recovery' is optional here - it's the default if not specified - database will be available
REPLACE;