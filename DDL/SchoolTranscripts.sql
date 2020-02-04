/* *********
 * File: SchoolTranscrpits.sql
 * Author: Yan Xia
 *
 * CREATE DATABASE SchoolTranscripts
 ********** */
 USE SchoolTranscripts
 GO

 /* === Drop Statements === */
  IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'StudentCourses')
    DROP TABLE StudentCourses
  IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Courses')
    DROP TABLE Courses
 IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Students')
    DROP TABLE Students
 
 
 /* ===  Create Table === */
 CREATE TABLE Students
 (
    StudentID     int  
    CONSTRAINT PK_Students_StudentsID
        PRIMARY KEY              NOT NULL,
    GivenName     varchar(50)    NOT NULL,
    Surname       varchar(50)    NOT NULL,
    DateOfBirth   datetime       NOT NULL,
    Enrolled      bit            NOT NULL,
 )
 CREATE TABLE Courses
 (
    Number         varchar(10)     
        CONSTRAINT PK_Courses_Number
            PRIMARY KEY              NOT NULL,
    [Name]         varchar(50)       NOT NULL,
    Credits        decimal(3,1)      NOT NULL,
    [Hours]        tinyint           NOT NULL,
    Activate       bit               NOT NULL,
    Cost           money             NOT NULL,
 )
 CREATE TABLE StudentCourses
 (
    StudentID       int            
    CONSTRAINT FK_StudentCourses_StudentID_Students_StudentID_
        FOREIGN KEY REFERENCES Students(StudentID)
                                     NOT NULL,

    CourseNumber    varchar(10)    
       CONSTRAINT FK_StudentCourses_CourseNumber_Courses_Number
        FOREIGN KEY REFERENCES Courses(Number) 
                                     NOT NULL,
    [Year]          tinyint          NOT NULL,
    Term            char(3)          NOT NULL,
    FinalMark       tinyint              NULL,
    [Status]        char(1)          NOT NULL,
    -- Table-level constraint for composite keys
    CONSTRAINT PK_StudentCourses_StudentID_CourseNumber
        PRIMARY KEY (StudentID,CourseNumber)
 )