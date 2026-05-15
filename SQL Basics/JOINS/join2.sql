use ecom ;

---- LEFT EXCLUSIVE JOIN : Left exclusive join : INCLUDES ROWS of left table that are only present in the left table and not in the right table --
---- RIGHT EXCLUSIVE JOIN : Right exclusive join : INCLUDES ROWS of right table that are only present in the right table and not in the left table---
------ FULL EXCLUSIVE JOIN : COMBINATION OF BOTH ----

SELECT * from customers LEFT JOIN orderes ON customers.id = orderes.id WHERE orderes.id is NULL ;

SELECT * from customers RIGHT JOIN orderes ON customers.id = orderes.id WHERE customers.id is NULL ;

SELECT * from customers LEFT JOIN orderes ON customers.id = orderes.id WHERE orderes.id is NULL 
UNION 
SELECT * from customers RIGHT JOIN orderes ON customers.id = orderes.id  WHERE customers.id is NULL ;


--- SELF JOIN : A SELF JOIN in SQL is when a table is joined with itself. It is mainly used when rows inside the same table are related to each other---

-- CREATE DATABASE
CREATE DATABASE school;

-- USE DATABASE
USE school;

-- CREATE TABLE
CREATE TABLE student (
    s_id INT PRIMARY KEY,
    name VARCHAR(50),
    mentor_id INT
);

-- INSERT DATA
INSERT INTO student (s_id, name, mentor_id)
VALUES
(1, 'Ram', NULL),
(2, 'Rahul', 1),
(3, 'Riti', 1),
(4, 'Riya', 3);

-- VIEW TABLE
SELECT * FROM student;

SELECT  s1.name as mentor_name , s2.name as student_name 
FROM student as s1 JOIN student as s2 where s1.s_id = s2.mentor_id;
