-- Select all teachers from the tbl_teacher table
SELECT * FROM tbl_teacher;

-- Select all classes from the tbl_class table
SELECT * FROM tbl_class;

-- Select all students from the tbl_student table
SELECT * FROM tbl_student;

-- Select only the last names of the students from the tbl_student table
SELECT tbl_student.student_lastname FROM tbl_student;

-- Select the last name of students with the last name "Parker"
-- This query will return all student last names that exactly match "Parker"
SELECT tbl_student.student_lastname FROM tbl_student
WHERE tbl_student.student_lastname LIKE "Parker";

-- Display all distinct classes from the tbl_student table
-- This query will return all unique class names from the students (no duplicates)
SELECT DISTINCT tbl_student.fk_class FROM tbl_student;

-- Select the last names of students and their class names for the class "Math101"
-- The "\G" at the end ensures the output is displayed in a vertical (block) format instead of a table format
SELECT tbl_student.student_lastname, tbl_student.fk_class FROM tbl_student 
WHERE tbl_student.fk_class LIKE "Math101"\G;

-- Select first names, last names, and gender of all students who are either female ('w') or male ('m')
-- This query will return first name, last name, and gender for all students who match either gender "w" or "m"
SELECT tbl_student.student_firstname, tbl_student.student_lastname, tbl_student.gender FROM tbl_student
WHERE tbl_student.gender LIKE "w" OR tbl_student.gender LIKE "m";

-- Select first names, last names, and birth dates of all female students (gender = 'w')
SELECT tbl_student.student_firstname, tbl_student.student_lastname, tbl_student.birth_date FROM tbl_student
WHERE tbl_student.gender LIKE "w";

-- Select first names, last names, and birth dates of all male students (gender = 'm')
SELECT tbl_student.student_firstname, tbl_student.student_lastname, tbl_student.birth_date FROM tbl_student
WHERE tbl_student.gender LIKE "m";

-- Count the number of female students in each class
-- This query groups the students by class and counts how many female students are in each class
SELECT tbl_student.fk_class, COUNT(tbl_student.gender), tbl_student.gender FROM tbl_student
WHERE tbl_student.gender LIKE "w"
GROUP BY tbl_student.fk_class;

-- Count the total number of students per class
-- This query counts the number of students in each class and groups them by class
SELECT COUNT(tbl_student.student_lastname) AS "Number of pupils", tbl_student.fk_class AS "Class" 
FROM tbl_student
GROUP BY tbl_student.fk_class;

-- Select student last names and class names by joining the tbl_student and tbl_class tables
-- This query will display student last names and their respective class names
SELECT tbl_student.student_lastname, tbl_class.pk_id_classname 
FROM tbl_class, tbl_student
WHERE tbl_student.fk_class = tbl_class.pk_id_classname;

-- Select student last names and class names using an INNER JOIN between tbl_student and tbl_class
-- This query will return only students that are assigned to a class, joining the two tables on the class ID
SELECT tbl_student.student_lastname, tbl_class.pk_id_classname 
FROM tbl_class
INNER JOIN tbl_student ON tbl_class.pk_id_classname = tbl_student.fk_class;

-- Select teachers' last names and their respective class names for teachers with no class assigned
-- This query uses a LEFT JOIN to include teachers who are not assigned to any class
-- The WHERE clause filters for rows where the class assignment is NULL
SELECT tbl_teacher.teacher_lastname, tbl_class.pk_id_classname 
FROM tbl_teacher
LEFT JOIN tbl_class ON tbl_teacher.pk_id_teacher = tbl_class.fk_class_teacher
WHERE tbl_class.fk_class_teacher IS NULL;

-- Select teachers' last names and their respective class names, even if the teacher is not assigned to a class
-- This query returns all teachers and the classes they are assigned to, including those with no class assigned
SELECT tbl_teacher.teacher_lastname, tbl_class.pk_id_classname 
FROM tbl_teacher
LEFT JOIN tbl_class ON tbl_teacher.pk_id_teacher = tbl_class.fk_class_teacher;
