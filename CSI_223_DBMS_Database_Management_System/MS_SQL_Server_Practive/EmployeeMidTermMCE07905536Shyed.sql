/* F:\Git_Clone_Files\MSc_CSE\CSI_223_DBMS_Database_Management_System\MS_SQL_Server_Practive\EmployeeMidTerm.sql 
Consider the relational database given in Fig 01 - 
employee(person-ID, person-name, street, city)
 works(person-ID, company-name, salary) 
company(company-name, city, minm-salary, maxm-salary, sales)
 manager(person-ID, manager-name),
 where the primary keys are underlined. 
Give an expression in the relational algebra to express each of the following queries :- Give MS SQL commands for
 i) Find the names of all employees in the database who live in the same city and on the same street as do their managers.
 ii) Find the names of all employees in the database who do not work for First Bank Corporation. 
iii) Find the names of all employees who earn more than every employee of Small Bank Corporation. 
*/
--drop DATABASE	EmployeeMidTerm;

CREATE DATABASE EmployeeMidTerm; 

use EmployeeMidTerm;


Select @@SERVERNAME as SERVERNAME , @@SERVICENAME as SERVICENAME , @@VERSION as Version , @@SPID , @@CONNECTIONS , @@FETCH_STATUS , @@IDENTITY , @@IDLE , @@DBTS , 
@@MAX_CONNECTIONS as MAX_CONNECTIONS , @@MICROSOFTVERSION as MSVersion , @@TRANCOUNT as TranCount , @@ROWCOUNT;


-- Create the employee table

CREATE TABLE employee (
    person_ID NVARCHAR(50) PRIMARY KEY,
    person_name NVARCHAR(50),
    street NVARCHAR(50),
    city NVARCHAR(50)
)

-- Insert 25 rows of data in the works table
INSERT INTO employee (person_ID, person_name, street, city) VALUES
('101', 'Asif', '123/A', 'Dhaka'),
('102', 'Sadia', '123/A', 'Dhaka'),
('103', 'Rahim', '789/C', 'Sylhet'),
('104', 'Karim', '111/D', 'Rajshahi'),
('105', 'Fatima', '222/E', 'Khulna'),
('106', 'Kamal', '333/F', 'Barishal'),
('107', 'Sara', '333/F', 'Barishal'),
('108', 'Tarek', '555/H', 'Dhaka'),
('109', 'Anika', '666/I', 'Chittagong'),
('110', 'Farhan', '777/J', 'Sylhet'),
('111', 'Jahan', '888/K', 'Rajshahi'),
('112', 'Raisa', '999/L', 'Khulna'),
('113', 'Rahat', '111/M', 'Barishal'),
('114', 'Samia', '222/N', 'Mymensingh'),
('115', 'Saif', '333/O', 'Dhaka'),
('116', 'Nadia', '444/P', 'Chittagong'),
('117', 'Imran', '555/Q', 'Sylhet'),
('118', 'Ayesha', '666/R', 'Rajshahi'),
('119', 'Sohel', '777/S', 'Khulna'),
('120', 'Reema', '111/V', 'Dhaka'),
('121', 'Sadia', '999/U', 'Mymensingh'),
('122', 'Tamim', '111/V', 'Dhaka'),
('123', 'Nahid', '222/W', 'Chittagong'),
('124', 'Sakib', '333/X', 'Sylhet'),
('125', 'Rafi', '444/Y', 'Rajshahi');

INSERT INTO employee (person_ID, person_name, street, city) VALUES
    (126, 'Jahan', '555/H', 'Dhaka'),
    (127, 'Mishu', '777/I', 'Chittagong'),
    (128, 'Raisa', '888/J', 'Sylhet'),
    (129, 'Rafi', '999/K', 'Rajshahi'),
    (130, 'Sakib', '000/L', 'Khulna'),
    (131, 'Sonia', '111/M', 'Barishal'),
    (132, 'Fahim', '222/N', 'Mymensingh'),
    (133, 'Nazmul', '333/O', 'Dhaka'),
    (134, 'Tahmina', '444/P', 'Chittagong'),
    (135, 'Saif', '555/Q', 'Sylhet'),
    (136, 'Anika', '666/R', 'Rajshahi'),
    (137, 'Mim', '777/S', 'Khulna'),
    (138, 'Tariq', '888/T', 'Barishal'),
    (139, 'Bithi', '999/U', 'Mymensingh'),
    (140, 'Rana', '000/V', 'Dhaka');

	INSERT INTO employee (person_ID, person_name, street, city) VALUES
    (141, 'Jahanara', '123/A', 'Dhaka'),
    (142, 'Mishuk', '333/F', 'Barishal'),
    (143, 'Raisana', '777/J', 'Sylhet'),
    (144, 'Rafique', '555/Q', 'Sylhet'),
    (145, 'Sakibul', '111/V', 'Dhaka'),
    (146, 'Soniaji', '111/M', 'Barishal'),
    (147, 'Fahima', '444/Y', 'Rajshahi'),
    (148, 'Nazmul haq', '333/O', 'Dhaka'),
    (159, 'Tahmina', '444/P', 'Chittagong'),
    (150, 'Saif', '999/K', 'Rajshahi'),
    (151, 'Aniket', '666/R', 'Rajshahi'),
    (152, 'Mimi', '777/S', 'Khulna'),
    (153, 'Tarique', '888/T', 'Barishal'),
    (154, 'Bithika', '000/V', 'Dhaka'),
    (155, 'Ranima', '000/V', 'Dhaka');


-- Create the company table
CREATE TABLE company (
    company_ID NVARCHAR(25) PRIMARY KEY,
    company_name NVARCHAR(50),
    comp_city NVARCHAR(50),
    minm_salary DECIMAL(10,2),
    maxm_salary DECIMAL(10,2),
    sales DECIMAL(10,2)
);


-- Insert 14 rows of data in the company table
INSERT INTO company (company_ID, company_name, comp_city, minm_salary, maxm_salary, sales) VALUES
('C001', 'First Bank Corporation', 'Dhaka', 60000.00, 90000.00, 750000.00),
('C002', 'First Bank Corporation', 'Chittagong', 50000.00, 100000.00, 850000.00),
('C003', 'First Bank Corporation', 'Rajshahi', 40000.00, 80000.00, 650000.00),
('C004', 'First Bank Corporation', 'Khulna', 35000.00, 70000.00, 550000.00),
('C005', 'Small Bank Corporation', 'Dhaka', 45000.00, 85000.00, 700000.00),
('C006', 'Small Bank Corporation', 'Chittagong', 55000.00, 95000.00, 800000.00),
('C007', 'Small Bank Corporation', 'Rajshahi', 35000.00, 75000.00, 600000.00),
('C008', 'Small Bank Corporation', 'Khulna', 30000.00, 65000.00, 500000.00),
('C009', 'First Bank Corporation', 'Sylhet', 45000.00, 85000.00, 700000.00),
('C010', 'First Bank Corporation', 'Barisal', 55000.00, 95000.00, 800000.00),
('C011', 'Small Bank Corporation', 'Sylhet', 35000.00, 75000.00, 600000.00),
('C012', 'Small Bank Corporation', 'Barisal', 30000.00, 65000.00, 500000.00),
('C013', 'First Bank Corporation', 'Rangpur', 50000.00, 100000.00, 850000.00),
('C014', 'Small Bank Corporation', 'Rangpur', 40000.00, 80000.00, 650000.00);


CREATE TABLE works (
    person_ID NVARCHAR(50),
    company_name NVARCHAR(50),
    salary DECIMAL(10,2),
    FOREIGN KEY (person_ID) REFERENCES employee(person_ID)
);

INSERT INTO works (person_ID, company_name, salary)
VALUES
    ('101', 'First Bank Corporation', 150000),
    ('102', 'Small Bank Corporation', 80000),
    ('103', 'Small Bank Corporation', 50000),
    ('104', 'First Bank Corporation', 70000),
    ('105', 'First Bank Corporation', 60000),
    ('106', 'First Bank Corporation', 150000),
    ('107', 'Small Bank Corporation', 45000),
    ('108', 'Small Bank Corporation', 55000),
    ('109', 'First Bank Corporation', 80000),
    ('110', 'First Bank Corporation', 65000),
    ('111', 'Small Bank Corporation', 50000),
    ('112', 'Small Bank Corporation', 55000),
    ('113', 'First Bank Corporation', 60000),
    ('114', 'First Bank Corporation', 55000),
    ('115', 'Small Bank Corporation', 50000),
    ('116', 'Small Bank Corporation', 55000),
    ('117', 'First Bank Corporation', 150000),
    ('118', 'First Bank Corporation', 65000),
    ('119', 'Small Bank Corporation', 45000),
    ('120', 'First Bank Corporation', 55000),
    ('121', 'Small Bank Corporation', 55000),
    ('122', 'First Bank Corporation', 150000),
    ('123', 'Small Bank Corporation', 50000),
    ('124', 'First Bank Corporation', 60000),
    ('125', 'First Bank Corporation', 55000),
    ('126', 'Small Bank Corporation', 50000),
    ('127', 'Small Bank Corporation', 45000),
    ('128', 'First Bank Corporation', 55000),
    ('129', 'Small Bank Corporation', 60000),
    ('130', 'First Bank Corporation', 65000),
    ('131', 'First Bank Corporation', 50000),
    ('132', 'Small Bank Corporation', 55000),
    ('133', 'Small Bank Corporation', 55000),
    ('134', 'First Bank Corporation', 55000),
    ('135', 'Small Bank Corporation', 60000),
    ('136', 'Small Bank Corporation', 65000),
    ('137', 'First Bank Corporation', 50000),
    ('138', 'Small Bank Corporation', 55000),
    ('139', 'First Bank Corporation', 55000),
    ('140', 'First Bank Corporation', 150000);

-- Create the manager table
CREATE TABLE manager (
    person_ID NVARCHAR(50) PRIMARY KEY,
    manager_name NVARCHAR(50),
    FOREIGN KEY (person_ID) REFERENCES employee(person_ID)
);

-- Insert 7 rows of data in the manager table
INSERT INTO manager (person_ID, manager_name)
VALUES
    (101, 'Asif'),
    (106, 'Kamal'),
    (110, 'Farhan'),
    (117, 'Imran'),
    (122, 'Tamim'),
    (129, 'Rafi'),
    (140, 'Rana');
	
	
	SELECT * FROM employee;
	SELECT * FROM company;
	SELECT * FROM works;
	SELECT * FROM manager;

-- i) Find the names of all employees in the database who live in the same city and on the same street as do their managers.



SELECT emp.person_name FROM employee emp JOIN manager mgr ON emp.person_ID = mgr.person_ID JOIN employee emp2 ON mgr.manager_name = emp2.person_name WHERE emp.street = emp2.street AND emp.city = emp2.city;

--(ii) Find the names of all employees in the database who do not work for First Bank Corporation. 

SELECT person_name
FROM employee
WHERE person_ID NOT IN (SELECT person_ID FROM works WHERE company_name = 'First Bank Corporation');


--(iii) Find the names of all employees who earn more than every employee of Small Bank Corporation. 
SELECT employee.person_name
FROM employee
INNER JOIN works ON employee.person_ID = works.person_ID
WHERE salary > ALL (SELECT salary FROM works WHERE company_name = 'Small Bank Corporation');
