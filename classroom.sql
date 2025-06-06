CREATE DATABASE college;

USE college;

CREATE TABLE student (
 id INT PRIMARY KEY,
 name VARCHAR (50),
 age INT NOT NULL
);

INSERT INTO student VALUES (1,"ALIF",19);
INSERT INTO student VALUES (2,"MITHI",22);
INSERT INTO student VALUES (3,"SHAFE",25);

SELECT * FROM student;

/* 
DDL (Data Definition Language): create, alter, rename, truncate & drop
DQL (Data Query Language) : select
DML (Data Manipulation Language) : add, insert, update & delete
DCL (Data Control Language) : grant & revoke permission to users
TCL (Transaction Control Language) : start transaction, commit, rollback 
*/

--  ------------
-- opeartions
-- -------------
-- same line use na korar jonno
CREATE DATABASE IF NOT EXISTS school;
-- same line use na korar jonno
DROP DATABASE IF EXISTS school;
-- side show korar jonon
SHOW DATABASES;
SHOW TABLES;
-- create 
CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR(50)
);
-- show data in table
SELECT * FROM student;
-- insert
INSERT INTO student
(rollno, name)
VALUES
(1, alif),
(2, mithi),
(3, shafee);
-- single data insert
INSERT INTO student VALUES(4, rono);

/*Qs: Create a database for your company named SUDOTECHSERVE.
Step1: create a table inside this DB to store employee info (id, name and salary).
Step2: Add following information in the DB : 1, "adam", 25000 2, "bob",, 30000 3, "casey", 40000
Step3: Select & view all your table data.*/

CREATE DATABASE IF NOT EXISTS SUDOTECHSERVE;
USE SUDOTECHSERVE;

CREATE TABLE SALARY(
ID INT PRIMARY KEY ,
NAME VARCHAR(50),
SALARY INT NOT NULL
);

INSERT INTO SALARY
(ID, NAME, SALARY)
VALUES
(1, "ADAM", 2500),
(2, "BOB", 3000),
(3, "CASEY", 4000);

SELECT * FROM SALARY;
-- ------------------
-- Constraints
-- ------------------
-- unique key 
CREATE TABLE temp1 ( id INT UNIQUE);
INSERT INTO temp1 VALUES (101);
INSERT INTO temp1 VALUES(101); -- will not exicute cause of unique
SELECT * FROM temp1;
-- primary key
CREATE TABLE temp1 (
id INT, name VARCHAR (50) , age INT, city VARCHAR (20), PRIMARY KEY (id) 
);
CREATE TABLE temp2 (
id INT, name VARCHAR (50) , age INT, city VARCHAR (20), PRIMARY KEY (id, name) 
);
-- default 
CREATE TABLE emp (
id INT,
salary INT DEFAULT 25000);
INSERT INTO emp (id) VALUES (101);
-- check 
CREATE TABLE City ( 
id INT PRIMARY KEY, city VARCHAR (50), age INT,
CONSTRAINT age_check CHECK (age >= 18 AND city="Delhi")
);
-- instaint check
CREATE TABLE newTab (
age INT CHECK (age >= 18)
) ;
-- foreign key
CREATE TABLE temp ( 
cust_id int,FOREIGN KEY (cust_id) references customer (id)
);

-- ------------
-- operator
-- ------------
-- sample
CREATE TABLE student (
rollno INT PRIMARY KEY, name VARCHAR (50), marks INT NOT NULL, grade VARCHAR (1), city VARCHAR (20)
) ;

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"), 
(105, "emanuel", 12, "F", "Delhi"), 
(106, "farah", 82, "B", "Delhi");
TRUNCATE TABLE student;

-- find individual column
SELECT name, marks FROM student; 
-- find distinct/unique
SELECT DISTINCT city FROM student;

-- where clause operators
/*Where Clause
Using Operators in WHERE
Arithmetic Operators: +(addition), -(subtraction), *(multiplication), /(division), %(modulus)
Comparison Operators: = (equal to), != (not equal to), > , >=, <, <=
Logical Operators: AND, OR, NOT, IN, BETWEEN, ALL, LIKE, ANY
Bitwise Operators: & (Bitwise AND), | (Bitwise OR)*/

-- where clauses /conditions example
SELECT * FROM student
WHERE marks > 80;
-- and 
SELECT *
FROM student
WHERE marks > 80 AND city = "Mumbai";
-- or
SELECT *
FROM student
WHERE marks > 80 OR city = "Mumbai";
-- between
SELECT *
FROM student
WHERE marks BETWEEN 80 AND 90;
-- in
SELECT *
FROM student
WHERE city IN ( "Mumbai, delhi", "Dhaka" );
-- in
SELECT *
FROM student
WHERE city NOT IN ( "Mumbai, delhi", "Dhaka" );
-- limit
SELECT *
FROM student where marks < 75
LIMIT 3;
-- order by ase 
SELECT *
FROM student
ORDER BY city ASC;
SELECT *
FROM student
ORDER BY marks ASC;
-- order by desc
SELECT *
FROM student
ORDER BY marks DESC
LIMIT 3;

/*Aggregate Functions
Aggregare functions perform a calculation on a set of values, and return a single value.
• COUNT()
• MAX()
• MIN()
• SUM()
• AVG()*/
-- max
SELECT MAX(marks)
FROM student;
-- min
SELECT MIN(marks)
FROM student;
-- avg
SELECT AVG(marks)
FROM student;
-- count
SELECT COUNT(rollno)
FROM student;
-- Group By Clause
/*Groups rows that have the same values into summary rows.
It collects data from multiple records and groups the result by one or more column.*/
-- group by
SELECT city,name, COUNT(rollno)
FROM student
GROUP BY city,name;
SELECT city, AVG(marks)
FROM student
GROUP BY city;

/*Practice Qs
Write the Query to find avg marks in each city in ascending order.*/
SELECT city, AVG(marks)
FROM student
GROUP BY city 
ORDER BY city ASC;

SELECT grade, count(rollno)
FROM student
GROUP BY grade
ORDER BY grade;
-- Having Clause
/*Similar to Where i.e. applies some condition on rows.
Used when we want to apply any condition after grouping.*/
-- having example
SELECT city, count(rollno)
FROM student
GROUP BY city
HAVING MAX(marks) > 90;
-- order
/*General Order
SELECT column(s)
FROM table_name
WHERE condition
GROUP BY column(s)
HAVING condition
ORDER BY column(s) ASC;*/
-- example 
SELECT city
FROM student
WHERE grade ="A"
GROUP BY city
HAVING MAX(marks) >= 93
ORDER BY city ASC;

-- safe moode off
SET SQL_SAFE_UPDATES = 0;
-- update set
UPDATE student
SET grade="O"
WHERE grade="A";
UPDATE student
SET marks=20
WHERE rollno=105;
UPDATE student
SET grade ="B"
WHERE marks BETWEEN 80 AND 90;
UPDATE student
SET marks=marks+1;
-- delete set
Insert student VALUES (111, "anik", 29, "C", "Dhaka");

DELETE FROM student
WHERE marks < 30;

SELECT * FROM student;
-- -----------
-- Forign key
-- -----------
-- dept create
CREATE TABLE dept (
id INT PRIMARY KEY,
name VARCHAR (50));
-- teacher create
CREATE TABLE teacher (
id INT PRIMARY KEY,
name VARCHAR (50) ,
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
);
-- Cascading for FK child & parents on update/delete 
DROP TABLE teacher;
-- teacher drop and create
CREATE TABLE teacher (
id INT PRIMARY KEY,
name VARCHAR (50) ,
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON DELETE CASCADE 
ON UPDATE CASCADE
);
INSERT INTO dept
VALUES
(101, "english"),
(102, "IT");
INSERT INTO teacher
VALUES
(101, "adam", 101),
(102, "mafee", 102),
(103, "shafe", 101);
-- update korle duitai pudate hoya jay
UPDATE dept
SET id =105
WHERE id =101;

Select * FROM teacher;
-- --------------------
-- Alter (to change the schema)
-- -------------------
-- add column
ALTER TABLE student
ADD COLUMN age INT DEFAULT 18;
-- drop column
ALTER TABLE student
DROP COLUMN age;
-- change/rename column
ALTER TABLE student
CHANGE COLUMN age user INT ;
-- rename table
ALTER TABLE student
RENAME TO stu ;
ALTER TABLE stu
RENAME TO student ;
-- modify column
ALTER TABLE student
MODIFY COLUMN user VARCHAr(3);

INSERT INTO student
values
(111,"rono", 87, "A", "dhaka", "rn");

SELECT * FROM student;
-- truncate delete all from table
TRUNCATE TABLE SALARY;

SELECT * FROM SALARY;

/*Joins in SQL
Join is used to combine rows from two or more tables, based on a related column between them.
Inner Join
Outer Joins Left Join RightJoin Full Join*/
CREATE DATABASE college;
USE college;

CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO student
VALUES
(101, "rono"),
(102, "saiful"),
(103, "rupon"),
(104, "tanjim");

CREATE TABLE courses(
id INT PRIMARY KEY,
courses VARCHAR(50)
);

INSERT INTO courses
VALUES
(102, "EEE"),
(101, "civil"),
(105, "CSE"),
(104, "BBA");

TRUNCATE table courses;
SELECT * FROM student;
-- iner join 
SELECT * FROM student
INNER JOIN courses
ON student.id = courses.id;
-- alies name inner join
SELECT * FROM student AS s
INNER JOIN courses AS c
ON s.id = c.id;
-- left join
SELECT *
FROM student as a
LEFT JOIN courses as b
ON a.id = b.id;
-- right join
SELECT *
FROM student as a
RIGHT JOIN courses as b
ON a.id = b.id;
-- full/union join 
SELECT *
FROM student as a
LEFT JOIN courses as b
ON a.id = b.id
UNION
SELECT *
FROM student as a
RIGHT JOIN courses as b
ON a.id = b.id;
-- left exclusive join
SELECT *
FROM student as a
LEFT JOIN courses as b
ON a.id = b.id
WHERE b.id IS NULL;
-- right exclusive join
SELECT *
FROM student as a
RIGHT JOIN courses as b
ON a.id = b.id
WHERE a.id IS NULL;
-- full exclusive join
SELECT *
FROM student as a
LEFT JOIN courses as b
ON a.id = b.id
WHERE b.id IS NULL
UNION
SELECT *
FROM student as a
RIGHT JOIN courses as b
ON a.id = b.id
WHERE a.id IS NULL;
-- self join data
CREATE TABLE employee ( id INT PRIMARY KEY, name VARCHAR (50), manager_id INT);
INSERT INTO employee (id, name, manager_id)
VALUES
(101, "adam", 103),
(102,"bob", 104),
(103,"casey", NULL),
(104, "donald", 103);
SELECT * FROM employee;
-- self join
SELECT a.name AS manager_name, b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;
-- union 
SELECT name FROM employee
UNION
SELECT name FROM employee;
-- union all
SELECT name FROM employee
UNION ALL
SELECT name FROM employee;
-- sub quary
-- sample
CREATE TABLE friend (
rollno INT PRIMARY KEY, name VARCHAR (50), marks INT NOT NULL, grade VARCHAR (1), city VARCHAR (20)
) ;

INSERT INTO friend
(rollno, name, marks, grade, city)
VALUES
(101, "anik", 78, "C", "Polton"),
(102, "bhuttu", 93, "A", "Mirpur"),
(103, "kajol", 85, "B", "Mohammadpur"),
(104, "dhrubo", 96, "A", "Dhanmondi"), 
(105, "emanuel", 82, "F", "Badda"), 
(106, "fahad", 82, "B", "Mohammadpur");
TRUNCATE TABLE friend;

-- find the students who has greater score then avg students 
-- where sub final query
SELECT name, marks
FROM friend
WHERE marks > (SELECT AVG(marks) FROM friend);
-- 2 query
SELECT AVG (marks)
FROM friend;
-- 1 query 
SELECT name, marks
FROM friend
WHERE marks > 87.6667;
-- 1st query find the even number
SELECT 	rollno 
FROM friend 
WHERE rollno % 2= 0;
-- call the name of the even number final query
SELECT name, rollno
FROM friend
WHERE rollno IN (
      SELECT rollno 
      FROM friend 
      WHERE rollno % 2= 0
);
-- from sub
-- find a specific city friend max number 
-- 1st query table of the specific city
SELECT *
FROM friend
WHERE city = "Mohammadpur";
-- max number final query
SELECT MAX(marks)
FROM (
SELECT *
FROM friend
WHERE city = "Mohammadpur"
) AS temp;
-- select sub
SELECT (SELECT MAX(marks) FROM friend), name
FROM friend;
-- views / virtual table
CREATE VIEW view1 AS
SELECT rollno, name, marks FROM friend;

SELECT * FROM view1