Create database cmsdb;
use cmsdb;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(10),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(200),
    batch_id INT,
    FOREIGN KEY (batch_id) REFERENCES Batches(batch_id)
    
);
desc Students;
select * from Students;
drop table Students;
CREATE TABLE Professors (
    professor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(10),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(200),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
    );
 drop table Professors;   
    CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
    
);
drop table Courses;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    hod_id INT
);
ALTER TABLE Departments
ADD CONSTRAINT FK_hod_id
FOREIGN KEY (hod_id)
REFERENCES Professors(professor_id);
Drop Table Departments;
CREATE TABLE Batches (
    batch_id INT PRIMARY KEY,
    batch_name VARCHAR(50),
    department_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
select * from Batches;
desc Enrollments;
Drop Table Batches;
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
drop table Enrollments;
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    date DATE,
    status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
drop table Attendance;
CREATE TABLE Grades (
    grade_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
drop table Grades;
CREATE TABLE Library (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(100),
    author VARCHAR(100),
    publication VARCHAR(100),
    quantity_available INT
);

CREATE TABLE Library_Records (
    record_id INT PRIMARY KEY,
    student_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (book_id) REFERENCES Library(book_id)
);
drop table Library_Records;
SET FOREIGN_KEY_CHECKS=0;

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, gender, email, phone_number, address, batch_id)
VALUES (1, 'John', 'Doe', '2000-05-15', 'Male', 'john.doe@example.com', '123-456-7890', '123 Main St, City', 1),
       (2, 'Ram', 'Pal', '2000-06-15', 'Male', 'Ram.doe@example.com', '124-456-7890', '609 Main St, City', 2),
	   (3, 'Pooja', 'deol', '2000-06-15', 'Femal', 'pooja.deol@example.com', '124-456-7882', '302 Morya St, City2', 3),
	   (4, 'nikki', 'sharma', '2000-01-22', 'Femal', 'nikki.sharma@example.com', '678-436-6680', '334 poonam Enpire ,vasai', 4),
		(5, 'Pihu', 'sharma', '1999-04-29', 'Femal', 'pihu.sharma@example.com', '678-7387-66832', '890 Funfista Emo ,vasai', 5);

select * from Students;
UPDATE Students
SET email = 'newemail@example.com', phone_number = '987-654-3210'
WHERE student_id = 1;

INSERT INTO Professors (professor_id, first_name, last_name, date_of_birth, gender, email, phone_number, address, department_id)
VALUES (1, 'John', 'Doe', '1980-01-15', 'Male', 'john.doe@example.com', '123-456-7890', '456 Elm St, City', 1),
	   (2,'Sharad', 'Mishra', '2001-03-15', 'Male', 'sharad.mishra@example.com', '123-456-76560', '123 Elm St, City2', 2),
       (3,'Jane', 'Smith', '1985-08-10', 'Female', 'jane.smith@example.com', '987-654-3210', '456 Oak St, Town', 3),
       (4,'Michael', 'Johnson', '1970-11-25', 'Male', 'michael.johnson@example.com', '555-123-4567', '789 Maple Rd, Village', 1),
       (5,'Emily', 'Brown', '1988-04-03', 'Female', 'emily.brown@example.com', '444-789-0123', '567 Pine Ave, Town', 4);
DELETE FROM Professors WHERE professor_id=1;

UPDATE Professors
SET email = 'newemail@example.com', phone_number = '123-456-7890'
WHERE professor_id = 1;

INSERT INTO Courses (course_id,course_name, department_id)
VALUES (1,'Introduction to Computer Science', 1),
       (2,'Advanced Mathematics', 4),
       (3,'History of Art', 3),
       (4,'English Literature', 3),
       (5,'Chemistry Basics',2);
DELETE FROM  Courses WHERE course_id=1;

UPDATE Courses
SET course_name = "B.sc in CS "
WHERE course_id = 1;

INSERT INTO Departments (department_id,department_name, hod_id)
VALUES (1,'Physics Department', 1),
       (2,'Mathematics', 2),
       (3,'Art History', 3),
       (4,'Literature', 4),
       (5,'Chemistry', 5);
DELETE FROM Departments WHERE department_id = 1;
UPDATE Departments 
SET department_name = " CS department "
WHERE department_id = 1;

INSERT INTO Batches (batch_id,batch_name, department_id, start_date, end_date)
VALUES (1,'Batch 2023', 1, '2023-09-01', '2024-06-30'),
       (2,'Batch 2024', 2, '2024-08-15', '2024-06-30'),
       (3,'Batch 2025', 3, '2025-09-01', '2026-06-30'),
       (4,'Batch 2026', 4, '2026-08-15', '2027-07-31'),
       (5,'Batch 2027', 5, '2027-09-01', '2028-06-30');
DELETE FROM Batches WHERE batch_id = 1;

UPDATE Batches
SET end_date = '2024-07-15'
WHERE batch_id = 1;

INSERT INTO Enrollments (enrollment_id ,student_id, course_id, enrollment_date)
VALUES (1,1, 1, '2023-08-10'),
       (2,2, 1, '2023-08-12'),
       (3,3, 2, '2023-08-15'),
       (4,4, 3, '2023-08-18'),
       (5,5, 4, '2023-08-20');
DELETE FROM Enrollments WHERE enrollment_id = 1;
UPDATE Enrollments
SET enrollment_date = '2023-08-15'
WHERE enrollment_id = 1;

INSERT INTO Attendance (attendance_id,student_id, course_id, date, status)
VALUES (1,1, 1, '2023-08-10', 'Present'),
       (2,2, 1, '2023-08-12', 'Present'),
       (3,3, 2, '2023-08-15', 'Absent'),
       (4,4, 3, '2023-08-18', 'Present'),
       (5,5, 4, '2023-08-20', 'Absent');
DELETE FROM Attendance WHERE attendance_id = 1;

UPDATE Attendance
SET status = 'Absent'
WHERE attendance_id = 1;

INSERT INTO Grades (Grade_id,student_id, course_id, grade)
VALUES (1,1, 1, 'A'),
       (2,3,4,"B"),
       (3,2,1,"C"),
       (4,4,2,"A"),
       (5,3,3,"B");
DELETE FROM Grades WHERE Grade_id = 2;

UPDATE Grades
SET grade = 'B'
WHERE grade_id = 1;

INSERT INTO Library_Records (record_id,student_id, book_id, issue_date, return_date)
VALUES (1,1, 1, '2023-08-10', '2023-08-20'),
       (2,2, 1, '2023-08-12', '2023-08-22'),
       (3,3, 2, '2023-08-15', '2023-08-25'),
       (4,4, 3, '2023-08-18', '2023-08-28'),
       (5,5, 4, '2023-08-20', '2023-08-30');
DELETE FROM Library_Records WHERE record_id = 1;

UPDATE Library_Records
SET return_date = '2023-08-25'
WHERE record_id = 1;

INSERT INTO Library (book_id,book_name, author, publication, quantity_available)
VALUES (1,'Introduction to Programming', 'John Smith', 'ABC Publications', 10),
       (2,'Data Structures and Algorithms', 'Jane Doe', 'XYZ Books', 5),
       (3,'History of Art', 'Emily Brown', 'Art Press', 8),
       (4,'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic Publishers', 12),
       (5,'Chemistry Basics', 'Michael Johnson', 'ScienceBooks Inc.', 7);
DELETE FROM Library WHERE book_id = 1;

UPDATE Library
SET quantity_available = 12
WHERE book_id = 1;

SELECT * FROM Students WHERE student_id = 1;
SELECT * FROM Courses WHERE course_name = 'Introduction to Computer Science';
SELECT * FROM Departments WHERE department_id = 2;
SELECT * FROM Batches WHERE batch_id = 4;
SELECT * FROM Enrollments WHERE enrollment_id = 2;
SELECT * FROM Attendance WHERE attendance_id = 1;
SELECT * FROM Grades WHERE grade_id = 4;
SELECT * FROM Library WHERE book_id = 3;
SELECT * FROM Library_Records WHERE record_id = 1;


SELECT Students.*
FROM Students
JOIN Enrollments ON Students.student_id = Enrollments.student_id
WHERE Enrollments.course_id = 1;

UPDATE Grades
SET grade = 'B'
WHERE student_id = 1 AND course_id = 2;

UPDATE Courses
SET department_id = 2 
WHERE department_id = 3 ;
  
DELETE FROM Professors
WHERE professor_id = 1; 

SELECT Students.*
FROM Students
JOIN Library_Records ON Students.student_id = Library_Records.student_id
WHERE Library_Records.book_id = 1; 

DELIMITER //
CREATE PROCEDURE GetStudentsWithBatchAndDepartment()
BEGIN
    SELECT 
        Students.*,
        Batches.batch_name,
        Departments.department_name
    FROM Students
    JOIN Batches ON Students.batch_id = Batches.batch_id
    JOIN Departments ON Batches.department_id = Departments.department_id;
END //
DELIMITER ;

CALL GetStudentsWithBatchAndDepartment();

DELIMITER //
CREATE PROCEDURE GetCourseDetailsWithProfessorAndDepartment()
BEGIN
    SELECT 
        Courses.*,
        CONCAT(Professors.first_name, ' ', Professors.last_name) AS professor_name,
        Departments.department_name
    FROM Courses
    JOIN Professors ON Courses.professor_id = Professors.professor_id
    JOIN Departments ON Courses.department_id = Departments.department_id;
END //
DELIMITER ;

CALL GetCourseDetailsWithProfessorAndDepartment();

DELIMITER //
CREATE PROCEDURE CalculateAverageAttendance(
    IN course_id_param INT
)
BEGIN
    DECLARE total_students INT;
    DECLARE total_attendance INT;
    DECLARE avg_attendance DECIMAL(5, 2);

    SELECT COUNT(DISTINCT student_id) INTO total_students
    FROM Enrollments
    WHERE course_id = course_id_param;

    SELECT COUNT(*) INTO total_attendance
    FROM Attendance
    WHERE course_id = course_id_param;

    SET avg_attendance = (total_attendance / total_students) * 100;

    SELECT avg_attendance;
END //
DELIMITER ;

CALL CalculateAverageAttendance(1);


DELIMITER //
CREATE PROCEDURE GetStudentDetailsWithGrades(
    IN course_id_param INT
)
BEGIN
    SELECT 
        S.*,G.grade
    FROM students S
    JOIN Grades G ON S.student_id = G.student_id
    WHERE G.course_id = course_id_param;
END //
DELIMITER ;
drop procedure GetStudentDetailsWithGrades;

CALL GetStudentDetailsWithGrades(2);

DELIMITER //
CREATE PROCEDURE UpdateBookQuantity(
    IN book_id_param INT,
    IN new_quantity INT
)
BEGIN
    UPDATE Library
    SET quantity_available = new_quantity
    WHERE book_id = book_id_param;
END //
DELIMITER ;
CALL UpdateBookQuantity(1, 20);

SELECT Students.*
FROM Students
JOIN Batches ON Students.batch_id = Batches.batch_id
JOIN Departments ON Batches.department_id = Departments.department_id
WHERE Departments.department_name = 'Computer Science';

SELECT Professors.professor_id, 
       Professors.first_name, 
       Professors.last_name, 
       COUNT(Courses.course_id) AS courses_taught
FROM Professors
JOIN Courses ON Professors.department_id = Courses.department_id
GROUP BY Professors.professor_id, Professors.first_name, Professors.last_name;



SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY','');

SELECT Students.student_id,
       Students.first_name,
       Students.last_name,
       Grades.grade,
       Departments.department_name
FROM Students
JOIN Batches ON Students.batch_id = Batches.batch_id
JOIN Departments ON Batches.department_id = Departments.department_id
JOIN Grades ON Students.student_id = Grades.student_id
WHERE Departments.department_name = 'Art History'; 

DELIMITER //
CREATE EVENT UpdateBookQuantityEvent
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    UPDATE Library
    SET quantity_available = quantity_available - 1
    WHERE book_id = 1;

    UPDATE Library
    SET quantity_available = 0
    WHERE book_id = 1 AND quantity_available < 0; 
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER DecrementStudentCount
AFTER DELETE ON Students
FOR EACH ROW
BEGIN
    DECLARE department_id_val INT;
    
    SELECT batch_id INTO department_id_val
    FROM Students
    WHERE Students.student_id = OLD.student_id;
    
    SELECT department_id INTO department_id_val
    FROM Batches
    WHERE Batches.batch_id = department_id_val;
    
    UPDATE Departments
    SET student_count = student_count - 1
    WHERE department_id = department_id_val;
END;
//

DELIMITER ;






    
