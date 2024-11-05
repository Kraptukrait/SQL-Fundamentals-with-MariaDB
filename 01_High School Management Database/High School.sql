/* 
   Work Kraptukrait: high_school_management
   This database manages teachers, classes, and students 
*/
-- Drop the database if it already exists to start fresh
DROP DATABASE IF EXISTS high_school_management;
-- Create a new database for managing high school data
CREATE DATABASE high_school_management;
-- Use the newly created database for subsequent operations
USE high_school_management;

-- Create a table to store information about teachers
CREATE TABLE tbl_teacher
(
    pk_id_teacher INT AUTO_INCREMENT NOT NULL,  -- Primary key for the teacher ID
    teacher_lastname VARCHAR(25) NOT NULL,  
    teacher_firstname VARCHAR(25) NOT NULL, 
    PRIMARY KEY(pk_id_teacher)
) ENGINE=InnoDB;

-- Create a table to store information about classes
CREATE TABLE tbl_class
(
    pk_id_classname CHAR(10) PRIMARY KEY,  -- Primary key for the class
    fk_class_teacher INT NOT NULL,
    FOREIGN KEY(fk_class_teacher)
        REFERENCES tbl_teacher(pk_id_teacher)
            ON UPDATE CASCADE 
            ON DELETE RESTRICT 
) ENGINE=InnoDB;

-- Create a table to store information about students
CREATE TABLE tbl_student(
    pk_id_student INT AUTO_INCREMENT NOT NULL,  -- Primary key for the student ID
    student_lastname VARCHAR(25) NOT NULL,    
    student_firstname VARCHAR(25) NULL, 
    birth_date DATE NOT NULL,
    gender CHAR(1), 
    fk_class CHAR(10) NOT NULL, 
    PRIMARY KEY(pk_id_student),
    FOREIGN KEY(fk_class)
        REFERENCES tbl_class(pk_id_classname)
            ON UPDATE CASCADE 
            ON DELETE RESTRICT 
) ENGINE=InnoDB;
