DROP DATABASE IF EXISTS ita_benotung_2023_v2; -- If the database already exists, the script can be executed again

CREATE DATABASE ita_benotung_2023_v2 DEFAULT CHARSET=utf8;

USE ita_benotung_2023_v2;

CREATE TABLE tbl_teacher
	(
		pk_id_teacher INT AUTO_INCREMENT,
		teacher_lastname VARCHAR(45) NOT NULL, -- must be provided
		teacher_firstname VARCHAR(45) NULL,
		PRIMARY KEY(pk_id_teacher) -- becomes the primary key
	)
ENGINE=InnoDB;
  
CREATE TABLE tbl_class
	(
		pk_classname CHAR(10) NOT NULL, -- 10-character unique identifier for the class
		fk_class_teacher INT,
		FOREIGN KEY(fk_class_teacher)
			REFERENCES tbl_teacher(pk_id_teacher)
				ON UPDATE CASCADE -- if updated, the information is adjusted here as well
				ON DELETE RESTRICT, -- If the teacher is deleted, it is not possible because the class must remain
		PRIMARY KEY(pk_classname)
	)
ENGINE=InnoDB;

CREATE TABLE tbl_subject
	(
		pk_subject VARCHAR(35) NOT NULL,
		PRIMARY KEY(pk_subject)
	)
ENGINE=InnoDB;

CREATE TABLE tbl_assessment_type
	(
		pk_type VARCHAR(15) NOT NULL, -- specifies the type of assessment
		PRIMARY KEY(pk_type)
	)
ENGINE=InnoDB;

CREATE TABLE tbl_student
	(
		pk_id_student INT NOT NULL AUTO_INCREMENT,
		student_lastname VARCHAR(45) NOT NULL, -- otherwise only ID would be possible
		student_firstname VARCHAR(45) NOT NULL, -- every student has a first name
		fk_class CHAR(10) NULL,
		gender CHAR(1) NOT NULL,
		birth_date DATE NOT NULL,
		PRIMARY KEY(pk_id_student),
		INDEX tbl_student_tbl_class(fk_class), -- the index name is automatically created
		FOREIGN KEY(fk_class)
			REFERENCES tbl_class(pk_classname)
				ON UPDATE CASCADE -- a new class name will be adopted
				ON DELETE SET NULL -- class can be deleted, but the student should not be deleted for database purposes
	)
ENGINE=InnoDB;

CREATE TABLE tbl_grading
	(
		pk_id_grading INT AUTO_INCREMENT PRIMARY KEY,
		fk_subject VARCHAR(35) NOT NULL,
		fk_teacher INT NOT NULL,
		fk_student INT NOT NULL,
		grade ENUM('1','2','3','4','5','6') NOT NULL,
		date DATE NOT NULL,
		fk_type VARCHAR(15) NULL,
		INDEX tbl_grading_tbl_subject(fk_subject),
		INDEX tbl_grading_tbl_teacher(fk_teacher),
		INDEX tbl_grading_tbl_student(fk_student),
		INDEX tbl_grading_tbl_assessment_type(fk_type),
		FOREIGN KEY(fk_subject)
			REFERENCES tbl_subject(pk_subject)
				ON UPDATE CASCADE
				ON DELETE NO ACTION,      
		FOREIGN KEY(fk_teacher)
			REFERENCES tbl_teacher(pk_id_teacher)
				ON UPDATE CASCADE
				ON DELETE NO ACTION,
		FOREIGN KEY(fk_student)
			REFERENCES tbl_student(pk_id_student)
				ON UPDATE CASCADE
				ON DELETE RESTRICT, -- record should remain if a student is accidentally deleted
		FOREIGN KEY(fk_type)
			REFERENCES tbl_assessment_type(pk_type)
				ON UPDATE CASCADE
				ON DELETE SET NULL
	)
ENGINE=InnoDB;
