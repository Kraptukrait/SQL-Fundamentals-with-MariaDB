/* 
   Work Kraptukrait: high_school_management
   Example data records
*/

-- Inserting 20 teachers into tbl_teacher
INSERT INTO tbl_teacher (teacher_lastname, teacher_firstname) VALUES
('Smith', 'John'),
('Johnson', 'Emily'),
('Williams', 'Michael'),
('Brown', 'Sarah'),
('Jones', 'David'),
('Miller', 'Linda'),
('Davis', 'James'),
('Garcia', 'Maria'),
('Rodriguez', 'Carlos'),
('Martinez', 'Jessica'),
('Hernandez', 'George'),
('Lopez', 'Megan'),
('Gonzalez', 'Brian'),
('Wilson', 'Sophia'),
('Anderson', 'Kevin'),
('Thomas', 'Ashley'),
('Taylor', 'Robert'),
('Moore', 'Patricia'),
('Jackson', 'Daniel'),
('White', 'Karen');

-- Inserting 20 classes into tbl_class (assigned random teachers for simplicity)
INSERT INTO tbl_class (pk_id_classname, fk_class_teacher) VALUES
('Math101', 1),
('Eng102', 2),
('Hist103', 3),
('Bio104', 4),
('Chem105', 5),
('Phy106', 6),
('Geo107', 7),
('Lit108', 8),
('Art109', 9),
('PE110', 10),
('Music111', 11),
('CS112', 12),
('Spn113', 13),
('Frn114', 14),
('Bio115', 15),
('Chem116', 16),
('Math117', 17),
('Eng118', 18),
('Hist119', 19),
('Art120', 20);

-- Inserting 20 students into tbl_student (assigned to different classes)
INSERT INTO tbl_student (student_lastname, student_firstname, birth_date, gender, fk_class) VALUES
('Adams', 'Zoe', '2006-01-15', 'F', 'Math101'),
('Baker', 'Eli', '2006-02-20', 'M', 'Eng102'),
('Chavez', 'Lily', '2006-03-05', 'F', 'Hist103'),
('Davis', 'Owen', '2006-04-10', 'M', 'Bio104'),
('Evans', 'Maya', '2006-05-22', 'F', 'Chem105'),
('Fox', 'Liam', '2006-06-18', 'M', 'Phy106'),
('Green', 'Sophia', '2006-07-30', 'F', 'Geo107'),
('Hill', 'Ella', '2006-08-12', 'F', 'Lit108'),
('Ivy', 'Jacob', '2006-09-01', 'M', 'PE110'),
('James', 'Emily', '2006-10-03', 'F', 'Music111'),
('King', 'Nathan', '2006-11-14', 'M', 'CS112'),
('Lewis', 'Samantha', '2006-12-07', 'F', 'Spn113'),
('Morris', 'Luke', '2006-01-27', 'M', 'Frn114'),
('Nelson', 'Chloe', '2006-02-18', 'F', 'Bio115'),
('Owens', 'Noah', '2006-03-25', 'M', 'Chem116'),
('Parker', 'Ava', '2006-04-11', 'F', 'Math117'),
('Quinn', 'Jack', '2006-05-05', 'M', 'Eng118'),
('Riley', 'Megan', '2006-06-09', 'F', 'Hist119'),
('Stewart', 'Lucas', '2006-07-23', 'M', 'Art120'),
('Turner', 'Zara', '2006-08-04', 'F', 'Art109');
