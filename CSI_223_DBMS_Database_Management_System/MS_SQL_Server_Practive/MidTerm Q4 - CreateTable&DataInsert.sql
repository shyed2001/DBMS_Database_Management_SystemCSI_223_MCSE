--drop table works;
--drop table manager;
--drop table employee;
--drop table company;

--Consider the relational database given in Fig 01 - 
--employee(person-ID, person-name, street, city)
-- works(person-ID, company-name, salary) 
--company(company-name, city, minm-salary, maxm-salary, sales)
-- manager(person-ID, manager-name),
-- where the primary keys are underlined. 
--Give an expression in the relational algebra to express each of the following queries :- Give MS SQL commands for
-- i) Find the names of all employees in the database who live in the same city and on the same street as do their managers.
-- ii) Find the names of all employees in the database who do not work for First Bank Corporation. 
--iii) Find the names of all employees who earn more than every employee of Small Bank Corporation.

create database MidtermQ4_Assignment;
go
use MidtermQ4_Assignment;
go

CREATE TABLE employee (
  person_ID INTEGER PRIMARY KEY,
  person_name varchar(50),
  street varchar(50),
  city varchar(50)
);
go
CREATE TABLE works (
  person_ID INTEGER REFERENCES employee(person_ID),
  company_name varchar(50),
  salary INTEGER,
  PRIMARY KEY (person_ID, company_name)
);
go
CREATE TABLE company (
  company_name varchar(50) PRIMARY KEY,
  city varchar(50),
  minm_salary INTEGER,
  maxm_salary INTEGER,
  sales INTEGER
);
go
CREATE TABLE manager (
  person_ID INTEGER PRIMARY KEY REFERENCES employee(person_ID),
  manager_name varchar(50)
);
go



--employee table
INSERT INTO employee (person_ID, person_name, street, city) VALUES (1, 'John Doe', 'Broadway', 'California');
INSERT INTO employee (person_ID, person_name, street, city) VALUES (2, 'John Smith', 'Broadway', 'New York');
INSERT INTO employee (person_ID, person_name, street, city) VALUES (3, 'Bob Johnson', 'Broadway', 'New York');
INSERT INTO employee (person_ID, person_name, street, city) VALUES (4, 'Alice Lee', 'Park Blvd', 'San Francisco');
INSERT INTO employee (person_ID, person_name, street, city) VALUES (5, 'Thomas Li', 'Park View', 'California');
go
-- works table
INSERT INTO works (person_ID, company_name, salary)  VALUES (1, 'ABC Inc.', 50000);
INSERT INTO works (person_ID, company_name, salary)  VALUES (2, 'XYZ Corp.', 60000);
INSERT INTO works (person_ID, company_name, salary)  VALUES (3, 'Small Bank Corporation', 45000);
INSERT INTO works (person_ID, company_name, salary)  VALUES (4, 'Big Insurance Co.', 37000);
INSERT INTO works (person_ID, company_name, salary)  VALUES (5, 'Small Bank Corporation', 40000);
go

-- company table
INSERT INTO company (company_name, city, minm_salary, maxm_salary, sales) VALUES ('ABC Inc.', 'New York', 40000, 80000, 1000000);
INSERT INTO company (company_name, city, minm_salary, maxm_salary, sales) VALUES ('XYZ Corp.', 'New York', 50000, 90000, 1500000);
INSERT INTO company (company_name, city, minm_salary, maxm_salary, sales) VALUES ('Small Bank Corporation', 'Boston', 30000, 60000, 500000);
INSERT INTO company (company_name, city, minm_salary, maxm_salary, sales) VALUES ('Big Insurance Co.', 'San Francisco', 60000, 120000, 2000000);
go
-- manager table
INSERT INTO manager (person_ID, manager_name) VALUES (1, 'John Doe');
INSERT INTO manager (person_ID, manager_name) VALUES (3, 'Bob Johnson');
go


select * from employee;

select * from company;

select * from works;

select * from  manager;

select * from  employee, manager, works;

select * from  manager, employee;


SELECT m.person_ID, e.city, e.street
INTO #manager_address
FROM employee e
JOIN manager m ON e.person_ID = m.person_ID;

SELECT e.person_name
FROM employee e
JOIN works w ON e.person_ID = w.person_ID
JOIN #manager_address ma ON e.city = ma.city
WHERE e.street = ma.street AND e.person_ID <> ma.person_ID;

DROP TABLE #manager_address;
go
/* This command joins the tables on the city column instead of the company_name column. This way, it gets the employees and managers who live in the same city. 
Okay, I'll explain this code line by line, word by word in details.

```sql
SELECT m.person_ID, e.city, e.street
INTO #manager_address
FROM employee e
JOIN manager m ON e.person_ID = m.person_ID;
```

This statement selects three columns: m.person_ID, e.city and e.street. The m and e are aliases for the manager and employee tables, respectively. The INTO clause creates a new table named #manager_address and inserts the selected data into it. The FROM clause specifies the source tables for the query, which are employee and manager. The JOIN clause combines the two tables based on a common column, which is person_ID. The ON clause specifies the condition for the join, which is that the person_ID values of the two tables must match. This statement returns the person_ID, city and street of each manager.

```sql
SELECT e.person_name
FROM employee e
JOIN works w ON e.person_ID = w.person_ID
JOIN #manager_address ma ON e.city = ma.city
WHERE e.street = ma.street AND e.person_ID <> ma.person_ID;
```

This statement selects one column: e.person_name. The e is an alias for the employee table. The FROM clause specifies the source tables for the query, which are employee, works and #manager_address. The works table contains the information about which employee works for which company. The #manager_address table is the temporary table created by the previous statement. The ma is an alias for the #manager_address table. The first JOIN clause combines the employee and works tables based on a common column, which is person_ID. The second JOIN clause combines the employee and #manager_address tables based on a common column, which is city. The ON clauses specify the conditions for the joins, which are that the person_ID values of the employee and works tables must match, and that the city values of the employee and #manager_address tables must match. The WHERE clause filters the rows that meet certain criteria, which are that the street values of the employee and #manager_address tables must match, and that the person_ID values of the employee and #manager_address tables must not match. This statement returns the name of each employee who lives in the same city and street as their manager.

```sql
DROP TABLE #manager_address;
```

This statement deletes the temporary table named #manager_address from the database. The DROP TABLE clause removes a table definition and all its data. The # symbol indicates that it is a temporary table that is stored in the tempdb database and is automatically deleted when the connection is closed. This statement frees up space and avoids conflicts with other queries.

*/

--However, these commands might not give the correct answer, because they do not check if the employees and managers work for the same company. They might include employees who work for different companies but live in the same city and street as their managers. To avoid this, you should also join the tables on the company_name or company_ID column or use another condition to filter the rows.

-- Using a self-join:
SELECT e.person_name
FROM employee e
INNER JOIN employee m ON e.street = m.street AND e.city = m.city
INNER JOIN manager ON m.person_ID = manager.person_ID;
go


SELECT person_name
FROM employee e
WHERE EXISTS (
  SELECT 1
  FROM employee m
  JOIN manager ON m.person_ID = manager.person_ID
  WHERE e.street = m.street AND e.city = m.city
);
go






CREATE VIEW manager_address AS
SELECT m.person_ID, e.city, e.street
FROM employee e
JOIN manager m ON e.person_ID = m.person_ID;
go
SELECT e.person_name
FROM employee e
JOIN works w ON e.person_ID = w.person_ID
JOIN manager_address ma ON e.city = ma.city
WHERE e.street = ma.street AND e.person_ID <> ma.person_ID;
go
Drop VIEW manager_address;

/*

This code creates a view called manager_address that includes the person_ID, city, and street columns for all employees who are managers. It then uses the manager_address view to find the names of all employees in the database who live in the same city and on the same street as their managers, but are not themselves managers.

CREATE VIEW manager_address AS
SELECT m.person_ID, e.city, e.street
FROM employee e
JOIN manager m ON e.person_ID = m.person_ID;
go
This code creates a view called manager_address that selects the person_ID, city, and street columns from the employee table and the manager table, but only for employees who are managers. It uses an INNER JOIN to join the employee and manager tables on the person_ID column.

SELECT e.person_name
FROM employee e
JOIN works w ON e.person_ID = w.person_ID
JOIN manager_address ma ON e.city = ma.city
WHERE e.street = ma.street AND e.person_ID <> ma.person_ID;
This code selects the person_name column from the employee table for all employees who work for a company and live in the same city and on the same street as their manager, but are not themselves managers. It uses an INNER JOIN to join the employee table with the works table on the person_ID column, and then joins the resulting table with the manager_address view on the city column. Finally, it uses a WHERE clause to filter the results to only include employees who live on the same street as their manager and are not themselves managers.
*/