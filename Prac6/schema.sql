CREATE DATABASE IF NOT EXISTS student_db;
USE student_db;

CREATE TABLE IF NOT EXISTS students_info (
    stud_id INT PRIMARY KEY,
    stud_name VARCHAR(100),
    class VARCHAR(50),
    division VARCHAR(10),
    city VARCHAR(50)
);

INSERT INTO students_info (stud_id, stud_name, class, division, city) VALUES
(101, 'Rahul Sharma', 'TE Computer', 'A', 'Pune'),
(102, 'Priya Singh', 'TE Computer', 'B', 'Mumbai'),
(103, 'Amit Patel', 'TE IT', 'A', 'Ahmedabad'),
(104, 'Neha Gupta', 'SE ENTC', 'C', 'Delhi');
