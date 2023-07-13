--Consider the relational database given in Fig 01 - 
--employee(person-ID, person-name, street, city)
-- works(person-ID, company-name, salary) 
--company(company-name, city, minm-salary, maxm-salary, sales)
-- manager(person-ID, manager-name),
-- where the primary keys are underlined. 
--Give an expression in the relational algebra to express each of the following queries :- Give MS SQL commands for
-- i) Find the names of all employees in the database who live in the same city and on the same street as do their managers.

create database MidtermQ4_Assignment_MCE_079_05536;
go
use MidtermQ4_Assignment_MCE_079_05536;
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
go

--Give an expression in the relational algebra to express each of the following queries :- Give MS SQL commands for
-- i) Find the names of all employees in the database who live in the same city and on the same street as do their managers.

--- First Possible way ---


SELECT m.person_ID, e.city, e.street
INTO #manager_address
FROM employee e
JOIN manager m ON e.person_ID = m.person_ID;

SELECT e. * --SELECT e.person_name
FROM employee e
JOIN works w ON e.person_ID = w.person_ID
JOIN #manager_address ma ON e.city = ma.city
WHERE e.street = ma.street AND e.person_ID <> ma.person_ID;  -- != can be used in place of <>
go
DROP TABLE #manager_address;
go
/* This command joins the tables on the city column instead of the company_name column. This way, it gets the employees and managers who live in the same city. 
The code is:

SELECT m.person_ID, e.city, e.street
INTO #manager_address
FROM employee e
JOIN manager m ON e.person_ID = m.person_ID;
This code selects the person_ID, city, and street columns from the employee table (aliased as e) and the manager table (aliased as m), and joins them on the condition that the person_ID values are equal. This means that it only selects the rows where the employee is also a manager. It then creates a temporary table called #manager_address with these columns and inserts the selected rows into it. The # sign indicates that this is a temporary table that will be deleted when the session ends.

SELECT e.person_name
FROM employee e
JOIN works w ON e.person_ID = w.person_ID
JOIN #manager_address ma ON e.city = ma.city
WHERE e.street = ma.street AND e.person_ID <> ma.person_ID;
This code selects the person_name column from the employee table (aliased as e) and joins it with the works table (aliased as w) on the condition that the person_ID values are equal. This means that it only selects the rows where the employee works for some company. It then joins this result with the temporary table #manager_address (aliased as ma) on the condition that the city values are equal. This means that it only selects the rows where the employee and the manager live in the same city. It then filters out the rows where the street values are not equal or where the person_ID values are equal. This means that it only selects the rows where the employee and the manager live on the same street but are not themselves managers. It then returns the person_name column of these rows as the output.

DROP TABLE #manager_address;
go
This code deletes the temporary table #manager_address and ends the batch of commands.

The other way of achieving the same result is:

*/

--Give an expression in the relational algebra to express each of the following queries :- Give MS SQL commands for
-- i) Find the names of all employees in the database who live in the same city and on the same street as do their managers.


-- Second possible way ---
CREATE VIEW manager_address AS
SELECT m.person_ID, e.city, e.street
FROM employee e
JOIN manager m ON e.person_ID = m.person_ID;
go
SELECT e. * -- SELECT e.person_name
FROM employee e
JOIN works w ON e.person_ID = w.person_ID
JOIN manager_address ma ON e.city = ma.city
WHERE e.street = ma.street AND e.person_ID <> ma.person_ID;
go
Drop VIEW manager_address; -- This statement deletes the view.

/*

This code creates a view called manager_address that includes the person_ID, city, and street columns for all employees who are managers. It then uses the manager_address view to find the names of all employees in the database who live in the same city and on the same street as their managers, but are not themselves managers. The difference between these two ways is that one uses a view and one uses a temporary table. A view is slower to create and query, but it takes up less space and memory. A view also reflects any changes made to the underlying tables, while a temporary table does not. A temporary table is faster to create and query, but it takes up more space and memory.


The code is:

CREATE VIEW manager_address AS
SELECT m.person_ID, e.city, e.street
FROM employee e
JOIN manager m ON e.person_ID = m.person_ID;
go
This code creates a view called manager_address that includes the person_ID, city, and street columns for all employees who are managers. A view is a virtual table that does not store any data but shows a subset of data from one or more tables. It selects these columns from the employee table (aliased as e) and the manager table (aliased as m), and joins them on the condition that the person_ID values are equal. This means that it only selects the rows where the employee is also a manager. The go statement ends the batch of commands.

SELECT e.person_name
FROM employee e
JOIN works w ON e.person_ID = w.person_ID
JOIN manager_address ma ON e.city = ma.city
WHERE e.street = ma.street AND e.person_ID <> ma.person_ID;
go
This code selects the person_name column from the employee table (aliased as e) and joins it with the works table (aliased as w) on the condition that the person_ID values are equal. This means that it only selects the rows where the employee works for some company. It then joins this result with the view manager_address (aliased as ma) on the condition that the city values are equal. This means that it only selects the rows where the employee and the manager live in the same city. It then filters out the rows where the street values are not equal or where the person_ID values are equal. This means that it only selects the rows where the employee and the manager live on the same street but are not themselves managers. It then returns the person_name column of these rows as the output. The go statement ends the batch of commands.

Drop VIEW manager_address; -- This statement deletes the view.
*/


SELECT emp. * --SELECT emp.person_name 
FROM employee emp 
INNER JOIN manager mng 
ON emp.person_ID = mng.person_ID 
INNER JOIN employee emp_mgr 
ON mng.manager_name = emp_mgr.person_name 
AND emp.city = emp_mgr.city 
AND emp.street = emp_mgr.street

-- this query shows two name




SELECT emp. * --SELECT emp.person_name 
FROM employee emp 
INNER JOIN manager mng 
ON emp.person_ID = mng.person_ID 
INNER JOIN employee emp_mgr 
ON mng.manager_name = emp_mgr.person_name 
AND emp.city = emp_mgr.city 
AND emp.street = emp_mgr.street
WHERE emp.person_ID NOT IN (SELECT person_ID FROM manager);
--- does not show names 


SELECT emp.person_name
FROM employee emp
LEFT JOIN manager mng ON emp.person_ID = mng.person_ID
WHERE mng.person_ID IS NULL
AND EXISTS (
  SELECT 1
  FROM employee emp_mgr
  WHERE emp.city = emp_mgr.city 
  AND emp.street = emp_mgr.street 
  AND emp_mgr.person_name IN (
    SELECT manager_name 
    FROM manager 
    WHERE person_ID = mng.person_ID
  )
);

--- does not show names 