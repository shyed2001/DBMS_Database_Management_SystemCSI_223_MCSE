/* 

  --- include Views

  --- Include triggers



F:\Git_Clone_Files\MSc_CSE\CSI_223_DBMS_Database_Management_System\MS_SQL_Server_Practive\StudentCourseRegAndResults.sql
Suppose CSE department of Stamford University wants to develop own automation system for  student  course  registration  and  result.  Deign  different  tables  for  the  database  to  store student information, course information, result in informationassigning appropriate keys.

*/

/*
This is a complex task that requires some knowledge of database design and SQL commands. I can provide you with some general guidelines and examples, but you may need to do some further research and testing to complete it.

First, you need to identify the entities and attributes involved in your scenario. Entities are the things that you want to store information about, such as students, courses, results, etc. Attributes are the properties or characteristics of each entity, such as name, id, grade, etc.

Second, you need to define the relationships between the entities. Relationships are the associations or connections that exist between entities, such as one-to-many, many-to-many, etc. For example, a student can enroll in many courses, and a course can have many students enrolled. This is a many-to-many relationship.

Third, you need to create tables for each entity and relationship. Tables are the structures that store data in a database. Each table has a name and a set of columns that represent the attributes of the entity or relationship. Each row in a table represents an instance or record of the entity or relationship. For example, you can have a table called student with columns id, name, email, etc. Each row in this table represents a student with their id, name, email, etc.

Fourth, you need to assign primary keys and foreign keys to each table. Primary keys are the columns that uniquely identify each row in a table. Foreign keys are the columns that reference the primary keys of other tables to establish relationships. For example, you can have a column called student_id as the primary key of the student table and as a foreign key of the enrollment table to link students with courses.

Fifth, you need to write SQL commands to create and populate the tables with data. SQL is the language that allows you to interact with databases. You can use SQL commands such as CREATE TABLE, INSERT INTO, SELECT, etc. to create and manipulate data in your tables.

Here is an example of how you can design tables for your scenario:

student (id PK, name, email)
course (id PK, name, category)
result (id PK, student_id FK references student(id), course_id FK references course(id), grade)
enrollment (student_id FK references student(id), course_id FK references course(id), date)






















The CONSTRAINT fk_course_advisors_department is a FOREIGN KEY constraint that is used to enforce referential integrity between the department_id column in the course_advisors table and the department_id column in the department table.

This constraint ensures that any value in the department_id column of the course_advisors table must exist in the department_id column of the department table. If an attempt is made to insert a value that does not exist in the department table, the foreign key constraint will be violated and the insert or update operation will fail.

The ON UPDATE CASCADE clause specifies that if the value of the department_id column in the department table is updated, the corresponding values in the department_id column of the course_advisors table will also be updated.

The ON DELETE CASCADE clause specifies that if a row in the department table is deleted, all corresponding rows in the course_advisors table will also be deleted.

The INDEX statement creates an index on the advisor_name column of the course_advisors table. This index will improve the performance of queries that involve searching or sorting by the advisor_name column.






This SQL command creates a table called "lab" with columns for lab_id, lab_name, course_id, instructor_id, timeslot_id, and classroom_id. The lab_id is set as the primary key, and each of the foreign keys is used to reference the corresponding primary keys in other tables.

Let's take a closer look at each of the foreign key constraints:

CONSTRAINT fk_lab_course: This constraint sets the course_id column as a foreign key that references the course_id column in the course table. It uses ON UPDATE CASCADE and ON DELETE CASCADE to ensure that if the referenced course_id is updated or deleted, the changes will be reflected in the lab table as well.

CONSTRAINT fk_lab_instructor: This constraint sets the instructor_id column as a foreign key that references the instructor_id column in the instructor table. It uses ON UPDATE CASCADE and ON DELETE CASCADE to ensure that if the referenced instructor_id is updated or deleted, the changes will be reflected in the lab table as well.

CONSTRAINT fk_lab_timeslot: This constraint sets the timeslot_id column as a foreign key that references the timeslot_id column in the timeslot table. It uses ON UPDATE CASCADE and ON DELETE CASCADE to ensure that if the referenced timeslot_id is updated or deleted, the changes will be reflected in the lab table as well.

CONSTRAINT fk_lab_classroom: This constraint sets the classroom_id column as a foreign key that references the classroom_id column in the classroom table. It uses ON UPDATE CASCADE and ON DELETE CASCADE to ensure that if the referenced classroom_id is updated or deleted, the changes will be reflected in the lab table as well.

The INDEX command on the lab_name column creates an index on that column, which can speed up searches that use that column as a condition.

An example use case for this table could be a university lab scheduling system, where each lab is associated with a specific course, instructor, timeslot, and classroom. By using foreign key constraints, the system can ensure that each of these elements is valid and consistent with data in the corresponding tables. The index on the lab_name column can speed up searches for specific labs by name.

Overall, this table design with foreign key constraints and indexing is a best practice in relational database design, as it helps ensure data consistency and improve performance for common queries.






SELECT * FROM result;
This command will return all the rows and columns from the result table. You should see something like this:
id | student_id | course_id | grade
1 | 1 | 1 | 90 2 | 1 | 2 | 85 3 | 2 | 1 | 80 4 | 2 | 3 | 75 5 | 3 | 2 | 95 6 | 3 | 3 | 90






I hope this helps you understand how to insert data into a table using SQL commands.

Source: Conversation with Bing, 4/2/2023(1) Create and Update Tables - Visual Database Tools | Microsoft Learn. https://learn.microsoft.com/en-us/sql/ssms/visual-db-tools/design-tables-visual-database-tools?view=sql-server-ver16 Accessed 4/2/2023.
(2) Tutors, Students, Courses database design - Stack Overflow. https://stackoverflow.com/questions/49341255/tutors-students-courses-database-design Accessed 4/2/2023.
(3) School Sample Database - EF6 | Microsoft Learn. https://learn.microsoft.com/en-us/ef/ef6/resources/school-database Accessed 4/2/2023.
(4) Database Schema for Student Report - Stack Overflow. https://stackoverflow.com/questions/26725133/database-schema-for-student-report Accessed 4/2/2023.
(5) Database Design for a Learning Management System. https://vertabelo.com/blog/database-design-management-system/ Accessed 4/2/2023.
(6) Creating a database for a scenario involving students, teachers and courses. https://dba.stackexchange.com/questions/238478/creating-a-database-for-a-scenario-involving-students-teachers-and-courses Accessed 4/2/2023.



*/


-- MS SQL command to create a database named "StudentCourseRegAndResults"


CREATE DATABASE StudentCourseRegAndResults_MidTerm;

use StudentCourseRegAndResults_MidTerm;


CREATE TABLE student (
  student_id NVARCHAR(25) PRIMARY KEY,
  student_name NVARCHAR(150) NOT NULL,
  student_email NVARCHAR(50) NOT NULL,
  student_address NVARCHAR(100) NOT NULL,
  student_session NVARCHAR(20) NOT NULL,
  student_tel_number NVARCHAR(20) NOT NULL
);


INSERT INTO student (student_id, student_name, student_email, student_address, student_session, student_tel_number) VALUES
(1, 'Shyed', 'shyed@example.com', 'Dhaka', 2003-2004, 01840395957),
(2, 'Shahriar', 'shahriar@example.com', 'Shantinagar', 1998, 01552381955),
(3, 'Housaini', 'housaini@example.com', 'Bangladesh', 2000, 02402393);   

INSERT INTO student (student_id, student_name, student_email, student_address, student_session, student_tel_number) VALUES
(4, 'Mohammad', 'mohammad@example.com', 'Gulshan', 2002-2003, 01736363636),
(5, 'Fatima', 'fatima@example.com', 'Dhanmondi', 1999-2000, 01821212121),
(6, 'Ahmed', 'ahmed@example.com', 'Mohammadpur', 2004-2005, 01914141414),
(7, 'Aisha', 'aisha@example.com', 'Uttara', 2001-2002, 01696969696),
(8, 'Abdullah', 'abdullah@example.com', 'Mirpur', 1998-1999, 01777777777),
(9, 'Sara', 'sara@example.com', 'Banani', 1999-2000, 01823232323),
(10, 'Yousef', 'yousef@example.com', 'Rampura', 2000-2001, 01585858585),
(11, 'Nadia', 'nadia@example.com', 'Motijheel', 2003-2004, 01913131313),
(12, 'Munir', 'munir@example.com', 'Badda', 1998-1999, 01666666666),
(13, 'Mariam', 'mariam@example.com', 'Farmgate', 2005-2006, 01717171717),
(14, 'Zaid', 'zaid@example.com', 'Mohakhali', 1997-1998, 01816161616),
(15, 'Rukhsar', 'rukhsar@example.com', 'Mirpur', 2002-2003, 01626262626),
(16, 'Asad', 'asad@example.com', 'Banani', 1999-2000, 01919191919),
(17, 'Naima', 'naima@example.com', 'Uttara', 2001-2002, 01545454545),
(18, 'Kamal', 'kamal@example.com', 'Dhanmondi', 2003-2004, 01747474747),
(19, 'Farhana', 'farhana@example.com', 'Mohammadpur', 1998-1999, 01818181818),
(20, 'Shamim', 'shamim@example.com', 'Gulshan', 2004-2005, 01911111111),
(21, 'Nafis', 'nafis@example.com', 'Banani', 1999-2000, 01646464646),
(22, 'Rahim', 'rahim@example.com', 'Badda', 2002-2003, 01727272727),
(23, 'Sultana', 'sultana@example.com', 'Rampura', 2005-2006, 01868686868),
(24, 'Shahin', 'shahin@example.com', 'Mohakhali', 2000-2001, 01686868686),
(25, 'Fahim', 'fahim@example.com', 'Farmgate', 2003-2004, 01535353535);


--CREATE TABLE course (
--  course_id NVARCHAR(25) PRIMARY KEY,
--  course_name NVARCHAR(150) NOT NULL,
--  course_category NVARCHAR(50) NOT NULL,
--  course_instructor NVARCHAR(150) NOT NULL,
--  course_department NVARCHAR(150) NOT NULL,
--  course_timeslot TIME NOT NULL,
--  course_type NVARCHAR(50) NOT NULL
--);



-- Department table
CREATE TABLE department (
  department_id NVARCHAR(25) PRIMARY KEY,
  department_name NVARCHAR(100) NOT NULL,
  department_head NVARCHAR(100) NOT NULL
);


CREATE INDEX department_name_index ON department(department_name);

INSERT INTO department (department_id, department_name, department_head) VALUES
('DPT01', 'Computer Science and Engineering', 'Prof. John Smith'),
('DPT02', 'Electrical and Electronic Engineering', 'Dr. Mary Johnson'),
('DPT03', 'Civil Engineering', 'Dr. James Anderson'),
('DPT04', 'Mechanical Engineering', 'Prof. Emily Wilson'),
('DPT05', 'Mathematics', 'Dr. Robert Brown'),
('DPT06', 'Physics', 'Dr. Sarah Davis'),
('DPT07', 'Chemistry', 'Prof. Michael Taylor'),
('DPT08', 'Biology', 'Dr. Laura Adams'),
('DPT09', 'English', 'Dr. David Lee'),
('DPT10', 'History', 'Dr. Jennifer Moore'),
('DPT11', 'Political Science', 'Dr. Steven Johnson'),
('DPT12', 'Psychology', 'Dr. Elizabeth Martin'),
('DPT13', 'Sociology', 'Dr. Daniel Thompson'),
('DPT14', 'Economics', 'Dr. William Brown'),
('DPT15', 'Business Administration', 'Prof. Jennifer Garcia'),
('DPT16', 'Marketing', 'Dr. Christopher Davis'),
('DPT17', 'Finance', 'Dr. Sarah Jackson'),
('DPT18', 'Accounting', 'Prof. Michael Thomas'),
('DPT19', 'Information Systems', 'Dr. Robert Wilson'),
('DPT20', 'Statistics', 'Dr. Emily Jones'),
('DPT21', 'Architecture', 'Dr. Laura Clark'),
('DPT22', 'Urban Planning', 'Dr. Thomas Lewis'),
('DPT23', 'Art', 'Prof. Jessica Davis'),
('DPT24', 'Music', 'Dr. Matthew Robinson'),
('DPT25', 'Drama', 'Dr. Elizabeth Taylor');


-- Instructor table
CREATE TABLE instructor (
  instructor_id NVARCHAR(25) PRIMARY KEY,
  instructor_name NVARCHAR(100) NOT NULL,
  department_id NVARCHAR(25) NOT NULL,
  FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE INDEX instructor_name_index ON instructor(instructor_name);

INSERT INTO instructor (instructor_id, instructor_name, department_id)
VALUES
  ('ins001', 'Prof. Md. Ali', 'DPT01'),
  ('ins002', 'Asst Prof. Dr. Fatima Begum', 'DPT02'),
  ('ins003', 'Engr. Md. Hasan', 'DPT01'),
  ('ins004', 'Prof. Dr. Ayesha Akhter', 'DPT02'),
  ('ins005', 'Asst Prof. Md. Abdul Aziz', 'DPT03'),
  ('ins006', 'Prof. Dr. Sabrina Rahman', 'DPT04'),
  ('ins007', 'Engr. Md. Kamal Hossain', 'DPT03'),
  ('ins008', 'Asst Prof. Dr. Sultana Akter', 'DPT04'),
  ('ins009', 'Prof. Dr. Mohammad Abdullah', 'DPT05'),
  ('ins010', 'Asst Prof. Fatima Begum', 'DPT06'),
  ('ins011', 'Engr. Md. Nurul Haque', 'DPT05'),
  ('ins012', 'Asst Prof. Dr. Rabeya Akhter', 'DPT06'),
  ('ins013', 'Prof. Md. Ali Khan', 'DPT07'),
  ('ins014', 'Asst Prof. Dr. Mahmuda Akhter', 'DPT08'),
  ('ins015', 'Engr. Md. Jahangir Alam', 'DPT07'),
  ('ins016', 'Asst Prof. Sultana Akter', 'DPT08'),
  ('ins017', 'Prof. Dr. Md. Aminul Islam', 'DPT09'),
  ('ins018', 'Asst Prof. Dr. Taslima Begum', 'DPT10'),
  ('ins019', 'Engr. Md. Abu Bakar Siddique', 'DPT09'),
  ('ins020', 'Asst Prof. Fatima Akhter', 'DPT10'),
  ('ins021', 'Prof. Dr. Md. Shahidul Islam', 'DPT11'),
  ('ins022', 'Asst Prof. Dr. Israt Jahan', 'DPT12'),
  ('ins023', 'Engr. Md. Ashikur Rahman', 'DPT11'),
  ('ins024', 'Asst Prof. Dr. Shahnaz Akhter', 'DPT12'),
  ('ins025', 'Prof. Md. Abdul Karim', 'DPT13');


    -- Course table
CREATE TABLE course (
  course_id NVARCHAR(25) PRIMARY KEY,
  course_name NVARCHAR(100) NOT NULL,
  course_category NVARCHAR(50) NOT NULL,
  course_department NVARCHAR(25) NOT NULL,
  course_type NVARCHAR(50) NOT NULL,
  course_timeslot TIME NOT NULL,
  instructor_id NVARCHAR(25) NOT NULL,
  department_id NVARCHAR(25) NOT NULL,
  FOREIGN KEY (department_id) REFERENCES department(department_id),
  FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id),
  );
-- Insert 20 rows of data into the course table
INSERT INTO course (course_id, course_name, course_category, course_department, course_type, course_timeslot, instructor_id, department_id) 
VALUES 
('MATH501', 'Math', 'Science', 'EEE', 'PreReq', '09:00:00', 'ins001', 'DPT01'),
('ENG402', 'English', 'Arts', 'ME', 'Misc', '10:00:00', 'ins002', 'DPT02'),
('HIST303', 'History', 'Social Studies', 'CSE', 'Misc', '11:00:00', 'ins003', 'DPT03'),
('CSE234', 'CSE', 'Engineering', 'CSE', 'Core', '12:00:00', 'ins004', 'DPT04'),
('MATH101', 'Math', 'Science', 'EEE', 'PreReq', '09:00:00', 'ins005', 'DPT05'),
('ENG101', 'English', 'Arts', 'ME', 'Misc', '10:00:00', 'ins006', 'DPT06'),
('HIST101', 'History', 'Social Studies', 'CSE', 'Misc', '11:00:00', 'ins007', 'DPT07'),
('CSE301', 'Programming', 'Engineering', 'CSE', 'Core', '12:00:00', 'ins008', 'DPT08'),
('PHY101', 'Physics', 'Science', 'PHY', 'Misc', '13:00:00', 'ins009', 'DPT09'),
('CHEM101', 'Chemistry', 'Science', 'CHE', 'PreReq', '14:00:00', 'ins010', 'DPT10'),
('BIO101', 'Biology', 'Science', 'BIO', 'Misc', '15:00:00', 'ins011', 'DPT11'),
('PSY101', 'Psychology', 'Social Studies', 'SS', 'Elective', '16:00:00', 'ins012', 'DPT12'),
('POL101', 'Political Science', 'Social Studies', 'SS', 'Misc', '17:00:00', 'ins013', 'DPT13'),
('ART101', 'Art History', 'Arts', 'FA', 'Elective', '18:00:00', 'ins014', 'DPT14'),
('THE101', 'Theater Arts', 'Arts', 'FA', 'Misc', '19:00:00', 'ins015', 'DPT15'),
('MUS101', 'Music Theory', 'Arts', 'FA', 'Elective', '20:00:00', 'ins016', 'DPT16'),
('CS101', 'Computer Science', 'Engineering', 'CSE', 'Core', '09:30:00', 'ins017', 'DPT17'),
('ECE101', 'Electronics', 'Engineering', 'ECE', 'PreReq', '10:30:00', 'ins018', 'DPT18'),
('CE101', 'Civil Engineering', 'Engineering', 'CE', 'Core', '11:30:00', 'ins019', 'DPT19'),
('ME101', 'Mechanical Engineering', 'Engineering', 'ME', 'Elective', '12:30:00', 'ins020', 'DPT20');

CREATE INDEX course_name_index ON course(course_name);

-- Classroom table
CREATE TABLE classroom (
  classroom_id NVARCHAR(25) PRIMARY KEY,
  building_name NVARCHAR(50) NOT NULL,
  room_number NVARCHAR(25) NOT NULL
);

CREATE INDEX building_name_index ON classroom(building_name);

INSERT INTO classroom (classroom_id, building_name, room_number) VALUES
('CR001', 'Engineering Building', '101'),
('CR002', 'Engineering Building', '102'),
('CR003', 'Engineering Building', '103'),
('CR004', 'Engineering Building', '104'),
('CR005', 'Engineering Building', '105'),
('CR006', 'Science Building', '201'),
('CR007', 'Science Building', '202'),
('CR008', 'Science Building', '203'),
('CR009', 'Science Building', '204'),
('CR010', 'Science Building', '205'),
('CR011', 'Arts Building', '301'),
('CR012', 'Arts Building', '302'),
('CR013', 'Arts Building', '303'),
('CR014', 'Arts Building', '304'),
('CR015', 'Arts Building', '305'),
('CR016', 'Business Building', '401'),
('CR017', 'Business Building', '402'),
('CR018', 'Business Building', '403'),
('CR019', 'Business Building', '404'),
('CR020', 'Business Building', '405'),
('CR021', 'Language Building', '501'),
('CR022', 'Language Building', '502'),
('CR023', 'Language Building', '503'),
('CR024', 'Language Building', '504'),
('CR025', 'Language Building', '505');



-- Session table
CREATE TABLE session (
  session_id NVARCHAR(25) PRIMARY KEY,
  session_year NVARCHAR(4) NOT NULL,
  session_term NVARCHAR(10) NOT NULL
);

INSERT INTO session (session_id, session_year, session_term) VALUES
('S21T1', '2021', 'Term 1'),
('S21T2', '2021', 'Term 2'),
('S21T3', '2021', 'Term 3'),
('S22T1', '2022', 'Term 1'),
('S22T2', '2022', 'Term 2'),
('S22T3', '2022', 'Term 3'),
('S23T1', '2023', 'Term 1'),
('S23T2', '2023', 'Term 2'),
('S23T3', '2023', 'Term 3'),
('S24T1', '2024', 'Term 1'),
('S24T2', '2024', 'Term 2'),
('S24T3', '2024', 'Term 3'),
('S25T1', '2025', 'Term 1'),
('S25T2', '2025', 'Term 2'),
('S25T3', '2025', 'Term 3'),
('S26T1', '2026', 'Term 1'),
('S26T2', '2026', 'Term 2'),
('S26T3', '2026', 'Term 3'),
('S27T1', '2027', 'Term 1'),
('S27T2', '2027', 'Term 2'),
('S27T3', '2027', 'Term 3'),
('S28T1', '2028', 'Term 1'),
('S28T2', '2028', 'Term 2'),
('S28T3', '2028', 'Term 3');



CREATE INDEX session_year_index ON session(session_year);

-- Timeslot table
CREATE TABLE timeslot (
  timeslot_id NVARCHAR(25) PRIMARY KEY,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL
);

INSERT INTO timeslot (timeslot_id, start_time, end_time)
VALUES
  ('ts001', '08:00:00', '09:30:00'),
  ('ts002', '09:30:00', '11:00:00'),
  ('ts003', '11:00:00', '12:30:00'),
  ('ts004', '12:30:00', '14:00:00'),
  ('ts005', '14:00:00', '15:30:00'),
  ('ts006', '15:30:00', '17:00:00'),
  ('ts007', '17:00:00', '18:30:00'),
  ('ts008', '18:30:00', '20:00:00'),
  ('ts009', '20:00:00', '21:30:00'),
  ('ts010', '21:30:00', '23:00:00'),
  ('ts011', '08:00:00', '10:00:00'),
  ('ts012', '10:00:00', '12:00:00'),
  ('ts013', '12:00:00', '14:00:00'),
  ('ts014', '14:00:00', '16:00:00'),
  ('ts015', '16:00:00', '18:00:00'),
  ('ts016', '18:00:00', '20:00:00'),
  ('ts017', '20:00:00', '22:00:00'),
  ('ts018', '08:00:00', '11:00:00'),
  ('ts019', '11:00:00', '14:00:00'),
  ('ts020', '14:00:00', '17:00:00'),
  ('ts021', '17:00:00', '20:00:00'),
  ('ts022', '08:00:00', '12:00:00'),
  ('ts023', '12:00:00', '16:00:00'),
  ('ts024', '16:00:00', '20:00:00'),
  ('ts025', '08:00:00', '16:00:00');


    DROP TABLE section;


  CREATE TABLE section (
  section_id NVARCHAR(25) PRIMARY KEY,
--  course_id NVARCHAR(25) NOT NULL,
  classroom_id NVARCHAR(25) NOT NULL,
--  timeslot_id NVARCHAR(25) NOT NULL,
--  instructor_id NVARCHAR(25) NOT NULL,
  section_capacity INT NOT NULL,
  section_enrollment INT DEFAULT 0,
--  FOREIGN KEY (course_id) REFERENCES course(course_id),
  FOREIGN KEY (classroom_id) REFERENCES classroom(classroom_id),
--  FOREIGN KEY (timeslot_id) REFERENCES timeslot(timeslot_id),
--  FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id)
);

select * from section;

INSERT INTO section (section_id, classroom_id, section_capacity, section_enrollment)
VALUES 
('SEC001', 'CR001', 30, 10),
('SEC002', 'CR002', 25, 15),
('SEC003', 'CR003', 20, 20),
('SEC004', 'CR004', 35, 5),
('SEC005', 'CR005', 40, 10),
('SEC006', 'CR006', 30, 10),
('SEC007', 'CR007', 25, 15),
('SEC008', 'CR008', 20, 20),
('SEC009', 'CR009', 35, 5),
('SEC010', 'CR010', 40, 10),
('SEC011', 'CR011', 30, 10),
('SEC012', 'CR012', 25, 15),
('SEC013', 'CR013', 20, 20),
('SEC014', 'CR014', 35, 5),
('SEC015', 'CR015', 40, 10),
('SEC016', 'CR016', 30, 10),
('SEC017', 'CR017', 25, 15),
('SEC018', 'CR018', 20, 20),
('SEC019', 'CR019', 35, 5),
('SEC020', 'CR020', 40, 10),
('SEC021', 'CR021', 30, 10),
('SEC022', 'CR022', 25, 15),
('SEC023', 'CR023', 20, 20),
('SEC024', 'CR024', 35, 5),
('SEC025', 'CR025', 40, 10);


-- Index on course_id in section table
CREATE INDEX section_id_index ON section(section_id);

-- Enrollment table
CREATE TABLE enrollment (
  enrollment_id NVARCHAR(25) PRIMARY KEY,
  student_id NVARCHAR(25) NOT NULL,
  section_id NVARCHAR(25) NOT NULL,
  course_id NVARCHAR(25) NOT NULL,
  enrollment_date DATETIME DEFAULT GETDATE(),
  FOREIGN KEY (student_id) REFERENCES student(student_id),
  FOREIGN KEY (section_id) REFERENCES section(section_id),
  FOREIGN KEY (course_id) REFERENCES course(course_id)
);
INSERT INTO enrollment (enrollment_id, student_id, section_id, course_id)
VALUES
('ENR001', '1', 'SEC001', 'ART101'),
('ENR002', '2', 'SEC002', 'BIO101'),
('ENR003', '3', 'SEC003', 'CHEM101'),
('ENR004', '4', 'SEC004', 'CE101'),
('ENR005', '5', 'SEC005', 'CS101'),
('ENR006', '6', 'SEC006', 'CSE234'),
('ENR007', '7', 'SEC007', 'ECE101'),
('ENR008', '8', 'SEC008', 'ENG101'),
('ENR009', '9', 'SEC009', 'ENG402'),
('ENR010', '10', 'SEC010', 'HIST101'),
('ENR011', '11', 'SEC011', 'HIST303'),
('ENR012', '12', 'SEC012', 'MATH101'),
('ENR013', '13', 'SEC013', 'MATH501'),
('ENR014', '14', 'SEC014', 'ME101'),
('ENR015', '15', 'SEC015', 'MUS101'),
('ENR016', '16', 'SEC016', 'PHY101'),
('ENR017', '17', 'SEC017', 'POL101'),
('ENR018', '18', 'SEC018', 'CSE301'),
('ENR019', '19', 'SEC019', 'PSY101'),
('ENR020', '20', 'SEC020', 'THE101'),
('ENR021', '21', 'SEC021', 'ART101'),
('ENR022', '22', 'SEC022', 'BIO101'),
('ENR023', '23', 'SEC023', 'CHEM101'),
('ENR024', '24', 'SEC024', 'CE101'),
('ENR025', '25', 'SEC025', 'CS101');

--DROP TABLE enrollment;
select student_id from student;
select course_id from course;
select section_id from section;



-- Index on student_id in enrollment table
CREATE INDEX student_id_index ON enrollment(student_id);

-- Result table
CREATE TABLE result (
  result_id NVARCHAR(25) PRIMARY KEY,
  student_id NVARCHAR(25) NOT NULL,
  course_id NVARCHAR(25) NOT NULL,
  section_id NVARCHAR(25) NOT NULL,
  result_grade VARCHAR(2) NOT NULL,
  FOREIGN KEY (student_id) REFERENCES student(student_id),
  FOREIGN KEY (course_id) REFERENCES course(course_id),
  FOREIGN KEY (section_id) REFERENCES section(section_id)
);

INSERT INTO result (result_id, student_id, course_id, section_id, result_grade)
VALUES
('RES001', '1', 'ART101', 'SEC001', 'A'),
('RES002', '2', 'BIO101', 'SEC002', 'B'),
('RES003', '3', 'CHEM101', 'SEC003', 'C'),
('RES004', '4', 'CE101', 'SEC004', 'D'),
('RES005', '5', 'CS101', 'SEC005', 'F'),
('RES006', '6', 'CSE234', 'SEC006', 'A'),
('RES007', '7', 'ECE101', 'SEC007', 'B'),
('RES008', '8', 'ENG101', 'SEC008', 'C'),
('RES009', '9', 'ENG402', 'SEC009', 'D'),
('RES010', '10', 'HIST101', 'SEC010', 'F'),
('RES011', '11', 'HIST303', 'SEC011', 'A'),
('RES012', '12', 'MATH101', 'SEC012', 'B'),
('RES013', '13', 'MATH501', 'SEC013', 'C'),
('RES014', '14', 'ME101', 'SEC014', 'D'),
('RES015', '15', 'MUS101', 'SEC015', 'F'),
('RES016', '16', 'PHY101', 'SEC016', 'A'),
('RES017', '17', 'POL101', 'SEC017', 'B'),
('RES018', '18', 'CSE301', 'SEC018', 'C'),
('RES019', '19', 'PSY101', 'SEC019', 'D'),
('RES020', '20', 'THE101', 'SEC020', 'F'),
('RES021', '21', 'ART101', 'SEC021', 'A'),
('RES022', '22', 'BIO101', 'SEC022', 'B'),
('RES023', '23', 'CHEM101', 'SEC023', 'C'),
('RES024', '24', 'CE101', 'SEC024', 'D'),
('RES025', '25', 'CS101', 'SEC025', 'F');



-- Index on student_id in result table
CREATE INDEX student_id_index ON result(student_id);

-- Course advisors table

CREATE TABLE course_advisors (
  advisor_id NVARCHAR(25) PRIMARY KEY,
  advisor_name NVARCHAR(150) NOT NULL,
  department_id NVARCHAR(25) NOT NULL,
  CONSTRAINT fk_course_advisors_department
    FOREIGN KEY (department_id)
    REFERENCES department (department_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  INDEX idx_advisor_name (advisor_name)
);

INSERT INTO course_advisors (advisor_id, advisor_name, department_id)
VALUES
('ADV001', 'John Smith', 'DPT05'),
('ADV002', 'Jane Doe', 'DPT18'),
('ADV003', 'Michael Brown', 'DPT12'),
('ADV004', 'Emily Johnson', 'DPT23'),
('ADV005', 'David Lee', 'DPT06');

INSERT INTO course_advisors (advisor_id, advisor_name, department_id)
VALUES 
('ADV008', 'Jennifer Lee', 'DPT12'),
('ADV009', 'Samuel Rodriguez', 'DPT17'),
('ADV010', 'Rachel Patel', 'DPT03'),
('ADV011', 'Michael Johnson', 'DPT22'),
('ADV012', 'Natalie Nguyen', 'DPT20'),
('ADV013', 'Steven Kim', 'DPT09'),
('ADV014', 'Emily Wilson', 'DPT25');





 CREATE TABLE lab (
  lab_id NVARCHAR(25) PRIMARY KEY,
  lab_name NVARCHAR(150) NOT NULL,
  course_id NVARCHAR(25) NOT NULL,
  instructor_id NVARCHAR(25) NOT NULL,
  timeslot_id NVARCHAR(25) NOT NULL,
  classroom_id NVARCHAR(25) NOT NULL,
  CONSTRAINT fk_lab_course
    FOREIGN KEY (course_id)
    REFERENCES course (course_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT fk_lab_instructor
    FOREIGN KEY (instructor_id)
    REFERENCES instructor (instructor_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT fk_lab_timeslot
    FOREIGN KEY (timeslot_id)
    REFERENCES timeslot (timeslot_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT fk_lab_classroom
    FOREIGN KEY (classroom_id)
    REFERENCES classroom (classroom_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  INDEX idx_lab_name (lab_name)
);

INSERT INTO lab (lab_id, lab_name, course_id, instructor_id, timeslot_id, classroom_id)
VALUES 
('L001', 'Art Lab 1', 'ART101', 'ins001', 'ts001', 'CR001'),
('L002', 'Bio Lab 1', 'BIO101', 'ins002', 'ts002', 'CR002'),
('L003', 'Chem Lab 1', 'CHEM101', 'ins003', 'ts003', 'CR003'),
('L004', 'CE Lab 1', 'CE101', 'ins004', 'ts004', 'CR004'),
('L005', 'CS Lab 1', 'CS101', 'ins005', 'ts005', 'CR005'),
('L006', 'CSE Lab 1', 'CSE234', 'ins006', 'ts006', 'CR006'),
('L007', 'ECE Lab 1', 'ECE101', 'ins007', 'ts007', 'CR007'),
('L008', 'Eng Lab 1', 'ENG101', 'ins008', 'ts008', 'CR008'),
('L009', 'Eng Lab 2', 'ENG402', 'ins009', 'ts009', 'CR009'),
('L010', 'Hist Lab 1', 'HIST101', 'ins010', 'ts010', 'CR010'),
('L011', 'Hist Lab 2', 'HIST303', 'ins011', 'ts011', 'CR011'),
('L012', 'Math Lab 1', 'MATH101', 'ins012', 'ts012', 'CR012'),
('L013', 'Math Lab 2', 'MATH501', 'ins013', 'ts013', 'CR013'),
('L014', 'ME Lab 1', 'ME101', 'ins014', 'ts014', 'CR014'),
('L015', 'Mus Lab 1', 'MUS101', 'ins015', 'ts015', 'CR015'),
('L016', 'Phy Lab 1', 'PHY101', 'ins016', 'ts016', 'CR016'),
('L017', 'Pol Lab 1', 'POL101', 'ins017', 'ts017', 'CR017'),
('L018', 'CSE Lab 2', 'CSE301', 'ins018', 'ts018', 'CR018'),
('L019', 'Psy Lab 1', 'PSY101', 'ins019', 'ts019', 'CR019'),
('L020', 'The Lab 1', 'THE101', 'ins020', 'ts020', 'CR020'),
('L021', 'Art Lab 2', 'ART101', 'ins021', 'ts021', 'CR021'),
('L022', 'Bio Lab 2', 'BIO101', 'ins022', 'ts022', 'CR022'),
('L023', 'Chem Lab 2', 'CHEM101', 'ins023', 'ts023', 'CR023'),
('L024', 'CE Lab 2', 'CE101', 'ins024', 'ts024', 'CR024'),
('L025', 'CS Lab 2', 'CS101', 'ins025', 'ts025', 'CR025');

SELECT table_name FROM INFORMATION_SCHEMA.TABLES WHERE table_type = 'BASE TABLE'  -- list all the tables in the database.

select * from student;
select * from session;
select * from timeslot;
select * from section;
select * from enrollment;
select * from result; 
select * from course_advisors; 
select * from lab; 
select * from course; 
select * from instructor;
select * from timeslot;
select * from classroom;
select * from department;

  --- include Views

  --- Include triggers

