
--Q.3(a). Suppose three different courses (C1, C2 and C3) were conducted by three instructors (I1,  I2  and  I3)  in  a  particular  semester  in  Stamford  University  Bangladesh  (SUB). Instructors submitted their evaluations on Performance, MidTerm and FinalExam out of  100  individually.  An  operator  entered  the  marks  creating  three  tables  MarkC1, MarkC2   and   MarkC3   having   identical   structure   MarkC*(Roll,   Performance, MidTerm,  FinalExam),  here  *  indicates  course  index  1,  2  or  3.  University  marks distribution   for   Performance,   MidTerm,   FinalExam   are   30%,   30%   and   40%, (12)
--respectively. Now authority  wants to look combined ResultSheet with subject wise mark out of 100for the three courses like below.
--Roll Sub1 Sub2 Sub3 Total 
--10001 50   80   60   190
--Design View (One or More) to visible the combined ResultSheet.

--(b)Looking  the  Tables  mentioned  for  Q3(a),  a  database expert says  one  single  table  is enough instead of three individual tablesto keep the marks. What will be structure of the single table ‘Mark’ for the marks of three subjects? Design View (One or More) to visible combined result from the Mark table.

create database FinalCourseResult
go

use FinalCourseResult
go

 -- Create the MarkC1 table
CREATE TABLE MarkC1 (
    Roll INT PRIMARY KEY,
    Performance INT,
    MidTerm INT,
    FinalExam INT
);
go

-- Create the MarkC2 table
CREATE TABLE MarkC2 (
    Roll INT PRIMARY KEY,
    Performance INT,
    MidTerm INT,
    FinalExam INT
);
go

-- Create the MarkC3 table
CREATE TABLE MarkC3 (
    Roll INT PRIMARY KEY,
    Performance INT,
    MidTerm INT,
    FinalExam INT
);
go

-- Insert data into the MarkC1 table
INSERT INTO MarkC1 (Roll, Performance, MidTerm, FinalExam)
VALUES (10001, 50, 80, 60);
go

-- Insert data into the MarkC2 table
INSERT INTO MarkC2 (Roll, Performance, MidTerm, FinalExam)
VALUES (10001, 50, 80, 60);
go

-- Insert data into the MarkC3 table
INSERT INTO MarkC3 (Roll, Performance, MidTerm, FinalExam)
VALUES (10001, 50, 80, 60);
go

-- Create the Mark table with a combined structure for all subjects
CREATE TABLE Mark (
    Roll INT PRIMARY KEY,
    Sub1 INT,
    Sub2 INT,
    Sub3 INT
);
go

-- Insert data into the Mark table by combining data from MarkC1, MarkC2, and MarkC3
INSERT INTO Mark (Roll, Sub1, Sub2, Sub3)
SELECT C1.Roll, C1.Performance, C2.Performance, C3.Performance
FROM MarkC1 C1
JOIN MarkC2 C2 ON C1.Roll = C2.Roll
JOIN MarkC3 C3 ON C1.Roll = C3.Roll;
go

-- Create a view to display the combined ResultSheet
CREATE VIEW CombinedResultSheet
AS
SELECT Roll, Sub1, Sub2, Sub3, (Sub1 + Sub2 + Sub3) AS Total
FROM Mark;
go

-- Select data from the CombinedResultSheet view
SELECT Roll, Sub1, Sub2, Sub3, Total
FROM CombinedResultSheet;
go

--If we want to combine the three individual tables (MarkC1, MarkC2, MarkC3) into a single table 'Mark' to keep the marks of three subjects, we can create the following structure for the 'Mark' table:

-- Create the MARK2 table
CREATE TABLE MARK2 (
    Roll INT PRIMARY KEY,
    CourseIndex INT,
    Performance INT,
    MidTerm INT,
    FinalExam INT
);
GO

-- Insert modified data into the MARK2 table
INSERT INTO MARK2 (Roll, CourseIndex, Performance, MidTerm, FinalExam)
VALUES
    (10001, 1, 50, 80, 60),
    (10002, 2, 80, 80, 80),
    (10003, 3, 60, 60, 60);
GO

CREATE VIEW CombinedResultSheet2
AS
SELECT Roll,
       MAX(CASE WHEN CourseIndex = 1 THEN Performance END) AS Sub1,
       MAX(CASE WHEN CourseIndex = 2 THEN Performance END) AS Sub2,
       MAX(CASE WHEN CourseIndex = 3 THEN Performance END) AS Sub3,
       SUM(Performance) + SUM(MidTerm) + SUM(FinalExam) AS Total
FROM MARK2
GROUP BY Roll;
go

SELECT Roll, Sub1, Sub2, Sub3, Total
FROM CombinedResultSheet2;


--4(a) Write  a  stored  procedure  to  prepare Grade Sheet(Shown  below)from mark tablesMarkC* in Q.3(a)
--Roll Sub1 Sub2 Sub3 GPA 
--10001 C    A    B   3.0
--Consider Letter Grades A, B, C and F for marks =>80%, =>60% and <80%, =>40% and <60%, and <40%, respectively. The grade points for Letter Grades A, B, C and F are 4, 3, 2, 0, respectively. 

go




USE FinalCourseResult;
GO

-- (a) Create a view to display the combined ResultSheet

-- Drop the view if it already exists
IF EXISTS (SELECT * FROM sys.views WHERE name = 'CombinedResultSheet')
    DROP VIEW CombinedResultSheet;
GO

-- Create the CombinedResultSheet view
CREATE VIEW CombinedResultSheet AS
SELECT Roll,
       MAX(CASE WHEN CourseIndex = 1 THEN Performance END) AS Sub1,
       MAX(CASE WHEN CourseIndex = 2 THEN Performance END) AS Sub2,
       MAX(CASE WHEN CourseIndex = 3 THEN Performance END) AS Sub3,
       MAX(CASE WHEN CourseIndex = 1 THEN Performance END) +
       MAX(CASE WHEN CourseIndex = 2 THEN Performance END) +
       MAX(CASE WHEN CourseIndex = 3 THEN Performance END) AS Total
FROM
(
    SELECT Roll, 1 AS CourseIndex, Performance FROM MarkC1
    UNION ALL
    SELECT Roll, 2 AS CourseIndex, Performance FROM MarkC2
    UNION ALL
    SELECT Roll, 3 AS CourseIndex, Performance FROM MarkC3
) AS CombinedMarks
GROUP BY Roll;
GO

-- Select data from the CombinedResultSheet view
SELECT Roll, Sub1, Sub2, Sub3, Total
FROM CombinedResultSheet;
GO

-- (b) Create a single table 'Mark' for the marks of three subjects

-- Drop the table if it already exists
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Mark')
    DROP TABLE Mark;
GO

-- Create the Mark table
CREATE TABLE Mark (
    Roll INT PRIMARY KEY,
    Sub1 INT,
    Sub2 INT,
    Sub3 INT,
    GPA DECIMAL(3, 1)
);
GO

-- Insert data into the Mark table
INSERT INTO Mark (Roll, Sub1, Sub2, Sub3)
SELECT Roll,
       MAX(CASE WHEN CourseIndex = 1 THEN Performance END) AS Sub1,
       MAX(CASE WHEN CourseIndex = 2 THEN Performance END) AS Sub2,
       MAX(CASE WHEN CourseIndex = 3 THEN Performance END) AS Sub3
FROM
(
    SELECT Roll, 1 AS CourseIndex, Performance FROM MarkC1
    UNION ALL
    SELECT Roll, 2 AS CourseIndex, Performance FROM MarkC2
    UNION ALL
    SELECT Roll, 3 AS CourseIndex, Performance FROM MarkC3
) AS CombinedMarks
GROUP BY Roll;
GO

-- Update the GPA column in the Mark table
UPDATE Mark
SET GPA = 
    CASE
        WHEN Sub1 >= 80 AND Sub2 >= 80 AND Sub3 >= 80 THEN 4.0
        WHEN Sub1 >= 60 AND Sub2 >= 60 AND Sub3 >= 60 THEN 3.0
        WHEN Sub1 >= 40 AND Sub2 >= 40 AND Sub3 >= 40 THEN 2.0
        ELSE 0.0
    END;
GO

-- Select data from the Mark table
SELECT Roll, Sub1, Sub2, Sub3, GPA
FROM Mark;
GO

-- (4a) Write a stored procedure to prepare the Grade Sheet from the Mark tables

-- Drop the stored procedure if it already exists
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'PrepareGradeSheet')
    DROP PROCEDURE PrepareGradeSheet;
GO

-- Create the PrepareGradeSheet stored procedure
CREATE PROCEDURE PrepareGradeSheet
AS
BEGIN
    SET NOCOUNT ON;

    -- Create a temporary table to store the Grade Sheet
    CREATE TABLE GradeSheet (
        Roll INT PRIMARY KEY,
        Sub1 INT,
        Sub2 INT,
        Sub3 INT,
        Total INT,
        Grade CHAR(1)
    );

    -- Insert data into the GradeSheet table
    INSERT INTO GradeSheet (Roll, Sub1, Sub2, Sub3, Total, Grade)
    SELECT Roll, Sub1, Sub2, Sub3, Total,
        CASE
            WHEN Total >= 240 THEN 'A'
            WHEN Total >= 200 THEN 'B'
            WHEN Total >= 160 THEN 'C'
            WHEN Total >= 120 THEN 'D'
            ELSE 'F'
        END AS Grade
    FROM CombinedResultSheet;

    -- Select data from the GradeSheet table
    SELECT Roll, Sub1, Sub2, Sub3, Total, Grade
    FROM GradeSheet;

    -- Drop the temporary table
    DROP TABLE GradeSheet;
END;
GO


SELECT * FROM CombinedResultSheet;
go



--Modify  the  Stored  Procedure  to  calculate  GPA  excluding  the  failure  (i.e.,  F  grade) subjects.
-- Drop the stored procedure if it already exists
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'PrepareGradeSheet')
    DROP PROCEDURE PrepareGradeSheet;
GO

-- Create the PrepareGradeSheet stored procedure
CREATE PROCEDURE PrepareGradeSheet
AS
BEGIN
    SET NOCOUNT ON;

    -- Create a temporary table to store the Grade Sheet
    CREATE TABLE GradeSheet (
        Roll INT PRIMARY KEY,
        Sub1 INT,
        Sub2 INT,
        Sub3 INT,
        Total INT,
        Grade CHAR(1),
        ExcludedSubjects INT
    );

    -- Insert data into the GradeSheet table
    INSERT INTO GradeSheet (Roll, Sub1, Sub2, Sub3, Total, Grade, ExcludedSubjects)
    SELECT Roll, Sub1, Sub2, Sub3, Total,
        CASE
            WHEN Total >= 240 THEN 'A'
            WHEN Total >= 200 THEN 'B'
            WHEN Total >= 160 THEN 'C'
            WHEN Total >= 120 THEN 'D'
            ELSE 'F'
        END AS Grade,
        CASE
            WHEN Total >= 120 THEN 0  -- ExcludedSubjects will be 0 for passed students
            ELSE 3  -- ExcludedSubjects will be 3 for failed students (assuming 3 subjects)
        END AS ExcludedSubjects
    FROM CombinedResultSheet;

    -- Select data from the GradeSheet table
    SELECT Roll, Sub1, Sub2, Sub3, Total, Grade
    FROM GradeSheet
    WHERE ExcludedSubjects = 0;  -- Filter out the failed subjects

    -- Drop the temporary table
    DROP TABLE GradeSheet;
END;
GO


EXEC PrepareGradeSheet;
go

--5(a)  Design a sample SQL Trigger to update Garde Table if individual subjects’ marks (% marks) entered in a Mark table. For grading follow Q4(a).  Grade Table                                                                                                          Roll    Sub1 Sub2 Sub3 GPA                                                              
--10001 C        A         B        3.0                                                                                         
--         Mark Table                                   
-- Roll    Sub1  Sub2  Sub3  Total                                                              
-- 10001  70      80       60        210

-- Create the Grade Table if it doesn't exist



go
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Grade')
BEGIN
    CREATE TABLE Grade (
        Roll INT PRIMARY KEY,
        Sub1 CHAR(1),
        Sub2 CHAR(1),
        Sub3 CHAR(1),
        GPA DECIMAL(3, 1)
    );
END
GO

-- Create the Trigger
CREATE TRIGGER UpdateGrade
ON Mark
AFTER INSERT
AS
BEGIN
    -- Update the Grade Table based on the inserted values in the Mark Table
    UPDATE g
    SET g.Sub1 = CASE
                    WHEN m.Sub1 >= 80 THEN 'A'
                    WHEN m.Sub1 >= 60 THEN 'B'
                    WHEN m.Sub1 >= 40 THEN 'C'
                    ELSE 'F'
                END,
        g.Sub2 = CASE
                    WHEN m.Sub2 >= 80 THEN 'A'
                    WHEN m.Sub2 >= 60 THEN 'B'
                    WHEN m.Sub2 >= 40 THEN 'C'
                    ELSE 'F'
                END,
        g.Sub3 = CASE
                    WHEN m.Sub3 >= 80 THEN 'A'
                    WHEN m.Sub3 >= 60 THEN 'B'
                    WHEN m.Sub3 >= 40 THEN 'C'
                    ELSE 'F'
                END,
        g.GPA = CASE
                    WHEN m.Sub1 >= 80 AND m.Sub2 >= 80 AND m.Sub3 >= 80 THEN 4.0
                    WHEN m.Sub1 >= 60 AND m.Sub2 >= 60 AND m.Sub3 >= 60 THEN 3.0
                    WHEN m.Sub1 >= 40 AND m.Sub2 >= 40 AND m.Sub3 >= 40 THEN 2.0
                    ELSE 0.0
                END
    FROM Grade g
    INNER JOIN inserted m ON g.Roll = m.Roll;

END;
GO

-- View the definition of the trigger
SELECT OBJECT_DEFINITION(OBJECT_ID('UpdateGrade')) AS TriggerDefinition;
go

UPDATE Mark
SET Sub1 = 70, Sub2 = 80, Sub3 = 60
WHERE Roll = 10001;


SELECT Roll, Sub1, Sub2, Sub3, GPA
FROM Grade;


SELECT Roll, Sub1, Sub2, Sub3
FROM Mark
WHERE Roll = 10001;



SELECT * FROM Mark WHERE Roll = 10001;



