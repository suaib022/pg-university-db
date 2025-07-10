-- Active: 1751897670034@@127.0.0.1@5432@university_db
CREATE DATABASE university_db;

-- table creations
-- Create "students" table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    age INT CHECK (age > 0),
    email VARCHAR(100) UNIQUE,
    frontend_mark INT CHECK (frontend_mark BETWEEN 0 AND 100),
    backend_mark INT CHECK (backend_mark BETWEEN 0 AND 100),
    status VARCHAR(50)
);
-- Create "courses" table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0)
);
-- Create "enrollment" table
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id) ON DELETE CASCADE,
    course_id INT REFERENCES courses(course_id) ON DELETE CASCADE
);

-- data insertions into the tables
-- insertion into students table
INSERT INTO students ( student_name, age, email, frontend_mark, backend_mark, status)
VALUES
( 'Sameer', 21, 'sameer@example.com', 48, 60, NULL),
( 'Zoya', 23, 'zoya@example.com', 52, 58, NULL),
( 'Nabil', 22, 'nabil@example.com', 37, 46, NULL),
( 'Rafi', 24, 'rafi@example.com', 41, 40, NULL),
( 'Sophia', 22, 'sophia@example.com', 50, 52, NULL),
( 'Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);
-- insertion into course table
INSERT INTO courses (course_id, course_name, credits)
VALUES
(1, 'Next.js', 3),
(2, 'React.js', 4),
(3, 'Databases', 3),
(4, 'Prisma', 3);
-- insertion into enrollment table
INSERT INTO enrollment (enrollment_id, student_id, course_id)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 3, 2);

-- view tables contents
SELECT * FROM students;
SELECT * from courses;
SELECT * FROM enrollment;

-- drop tables
DROP TABLE students;
DROP Table courses;
DROP Table enrollment;



-- Query 1: Insert a new student 
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES
('Safi', 21, 'ssa222158@gmail.com', 45, 56, NULL);

-- query 2: Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
SELECT student_name FROM enrollment 
JOIN students USING (student_id)
JOIN courses USING (course_id)
where course_name = 'Next.js';

-- query 3: Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.
UPDATE students
SET status = 'Awarded'
where (frontend_mark + backend_mark) = (
    SELECT MAX(frontend_mark + backend_mark)
    FROM students
);

-- query 4 : delete all courses that have no students enrolled
delete FROM courses
WHERE course_id NOT IN (
    SELECT DISTINCT course_id
    FROM enrollment
);

-- query 5: Retrieve the names of students using a limit of 2, starting from the 3rd student.
SELECT student_name FROM students
ORDER BY student_id
OFFSET 2
LIMIT 2;

-- query 6: Retrieve the course names and the number of students enrolled in each course.
SELECT c.course_name, COUNT(e.student_id) AS students_enrolled
FROM courses c 
LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name; 

-- query 7: Calculate and display the average age of all students.
SELECT AVG(age) AS average_age
FROM students;

-- query 8: Retrieve the names of students whose email addresses contain 'example.com'.
SELECT student_name
FROM students
WHERE email LIKE '%example.com%';
