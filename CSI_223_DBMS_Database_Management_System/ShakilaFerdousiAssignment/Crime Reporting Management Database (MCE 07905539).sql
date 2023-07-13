--CREATE SQL Database Table--

CREATE TABLE sourcecredential (
credential_id INTEGER,
source_id INTEGER PRIMARY KEY,
credential_info INTEGER
);

CREATE TABLE sourceinfo (
source_id INTEGER PRIMARY KEY REFERENCES sourcecredential(source_id),
source_name varchar(100),
source_contact varchar(11),
source_address varchar(100),
username varchar(30),
password varchar(30)
);

CREATE TABLE admin (
user_id INTEGER PRIMARY KEY,
fullname varchar(100),
address varchar(100),
contact varchar(11),
username varchar(30),
password varchar(30)
);

CREATE TABLE policeinfo (
police_id INTEGER PRIMARY KEY,
police_name varchar(100),
designation varchar(100),
mobile_no varchar(11),
police_station varchar(100),
username varchar(30),
password varchar(30)
);

CREATE TABLE crimeinfo (
crime_id INTEGER PRIMARY KEY,
crime_description varchar(200),
date_reported varchar(30),
time_reported varchar(30),
location varchar(100),
source_id INTEGER,
crime_category_id INTEGER,
case_status varchar(150)
);

CREATE TABLE responseinfo (
response_info_id INTEGER,
crime_id INTEGER PRIMARY KEY REFERENCES crimeinfo(crime_id),
response_date varchar(30),
response_time varchar(30),
police_id INTEGER,
case_status varchar(150)
);

CREATE TABLE crimecategory (
crime_category_id INTEGER PRIMARY KEY,
category_description varchar(150)
);


--INSERT DATA IN VARIOUS TABLE--

-- sourcecredential table
INSERT INTO sourcecredential (credential_id, source_id, credential_info) VALUES (1010,'100', '2020');
INSERT INTO sourcecredential (credential_id, source_id, credential_info) VALUES (1011,'101', '2021');
INSERT INTO sourcecredential (credential_id, source_id, credential_info) VALUES (1012,'102', '2022');
INSERT INTO sourcecredential (credential_id, source_id, credential_info) VALUES (1013,'103', '2023');

-- sourceinfo table
INSERT INTO sourceinfo (source_id, source_name, source_contact, source_address, username, password) VALUES (100,'Jamal', '01715917940', 'Rampura', 'jamal100', 'jamal100');
INSERT INTO sourceinfo (source_id, source_name, source_contact, source_address, username, password) VALUES (101,'Akram', '01750911165', 'Uttora', 'akram101', 'akram101');
INSERT INTO sourceinfo (source_id, source_name, source_contact, source_address, username, password) VALUES (102,'Khan', '01750911164', 'Malibagh', 'khan102', 'khan102');
INSERT INTO sourceinfo (source_id, source_name, source_contact, source_address, username, password) VALUES (103,'Kamal', '0175465449', 'Mohammadpur', 'kamal103', 'kamal103');

-- admin table
INSERT INTO admin (user_id, fullname, address, contact, username, password) VALUES (333, 'crime info', 'Dhaka HQ', '01716089095', 'crimeinfo', 'crimeinfo333');

-- policeinfo table
INSERT INTO policeinfo (police_id, police_name, designation, mobile_no, police_station, username, password) VALUES (900,'Asif', 'SI', '01778933365', 'Rampura', 'asif900', 'asif900');
INSERT INTO policeinfo (police_id, police_name, designation, mobile_no, police_station, username, password) VALUES (901,'Jashim', 'ASI', '01778933366', 'Uttora', 'jashim901', 'jashim901');
INSERT INTO policeinfo (police_id, police_name, designation, mobile_no, police_station, username, password) VALUES (902,'Tomal', 'SI', '01778933367', 'Malibagh', 'tomal902', 'tomal902');
INSERT INTO policeinfo (police_id, police_name, designation, mobile_no, police_station, username, password) VALUES (903,'Habib', 'ASI', '01778933368', 'Mohammadpur', 'habib903', 'habib903');

-- crimeinfo table
INSERT INTO crimeinfo (crime_id, crime_description, date_reported, time_reported, location, source_id, crime_category_id, case_status) VALUES (500,'Heroin', '01-05-2023', '0200', 'Rampura', '100', '600', 'Investigate/Action');
INSERT INTO crimeinfo (crime_id, crime_description, date_reported, time_reported, location, source_id, crime_category_id, case_status) VALUES (501,'Cocaine', '05-05-2023', '2300', 'Uttora', '101', '601', 'Investigate/Action');
INSERT INTO crimeinfo (crime_id, crime_description, date_reported, time_reported, location, source_id, crime_category_id, case_status) VALUES (502,'Cannabis', '15-05-2023', '2000', 'Malibagh', '102', '602', 'Investigate/Action');
INSERT INTO crimeinfo (crime_id, crime_description, date_reported, time_reported, location, source_id, crime_category_id, case_status) VALUES (503,'Alcohol', '01-06-2023', '1200', 'Mohammadpur', '103', '603', 'Investigate/Action');

-- responseinfo table
INSERT INTO responseinfo (response_info_id, crime_id, response_date, response_time, police_id, case_status) VALUES (700,'500', '02-05-2023', '0200', '900', 'Accused');
INSERT INTO responseinfo (response_info_id, crime_id, response_date, response_time, police_id, case_status) VALUES (701,'501', '06-05-2023', '2300', '901', 'Missing person');
INSERT INTO responseinfo (response_info_id, crime_id, response_date, response_time, police_id, case_status) VALUES (702,'502', '16-05-2023', '2000', '902', 'Arrest');
INSERT INTO responseinfo (response_info_id, crime_id, response_date, response_time, police_id, case_status) VALUES (703,'503', '02-06-2023', '1200', '903', 'Released');

-- crimecategory table
INSERT INTO crimecategory (crime_category_id, category_description) VALUES (600,'Any crime is punishable');
INSERT INTO crimecategory (crime_category_id, category_description) VALUES (601,'Any crime is punishable');
INSERT INTO crimecategory (crime_category_id, category_description) VALUES (602,'Any crime is punishable');
INSERT INTO crimecategory (crime_category_id, category_description) VALUES (603,'Any crime is punishable');


--See various table--

SELECT * FROM sourcecredential

SELECT * FROM sourceinfo

SELECT * FROM admin

SELECT * FROM policeinfo

SELECT * FROM crimeinfo

SELECT * FROM responseinfo

SELECT * FROM crimecategory



--SQL VIEW-1

CREATE VIEW Source_view AS
SELECT source_id, source_name, source_contact
FROM Sourceinfo;

UPDATE Source_view
SET source_name='Mahmud'
WHERE source_id=103;


--SQL VIEW-2
CREATE VIEW police_view AS
SELECT police_id, police_name, police_station
FROM policeinfo;

UPDATE police_view
SET police_station='Romna Model Thana'
WHERE police_id=903;


--SQL VIEW-3
CREATE VIEW crime_view AS
SELECT crime_id, crime_description, location, case_status
FROM crimeinfo;

UPDATE crime_view
SET case_status='Five year jail'
WHERE crime_id=500;

--See various View--

SELECT * FROM Source_view;

SELECT * FROM police_view;

SELECT * FROM crime_view;


--SQL TRIGGER

SELECT * FROM Sourceinfo
GO

CREATE TABLE ActionStatus
(
crime_data varchar(50),
ActionStatus varchar(100)
)
GO


CREATE TRIGGER trgcrimeInsert
ON sourceinfo
FOR INSERT
AS
BEGIN
DECLARE @source_id INTEGER
SELECT @source_id = source_id FROM inserted
INSERT INTO ActionStatus
VALUES (@source_id, 'Data has been Inserted at – ' + CAST(GETDATE() AS varchar(50)))
END

INSERT INTO ActionStatus VALUES('0001', 'Implementation')

SELECT * FROM ActionStatus


--SQL Stored Procedure1--

CREATE PROCEDURE SpQueryresponseinfo
AS
BEGIN
SELECT * FROM responseinfo
END;


--SQL Stored Procedure2--

CREATE PROCEDURE SpQuerypoliceinfo
AS
BEGIN
SELECT * FROM policeinfo
END;


--See various procedure--

EXEC SpQueryresponseinfo

EXEC SpQuerypoliceinfo