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
CREATE TABLE City ( id INT PRIMARY KEY, city VARCHAR (50), age INT,
CONSTRAINT age_check CHECK (age >= 18 AND city="Delhi")
);
-- instaint check
CREATE TABLE newTab (
age INT CHECK (age >= 18)
) ;
-- foreign key
CREATE TABLE temp ( cust_id int,
FOREIGN KEY (cust_id) references customer (id)
);

-- ------------
-- select
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

-- find individual column
SELECT name, marks FROM student; 
-- find distinct/unique
SELECT DISTINCT city FROM student;
-- where clauses /conditions
SELECT * FROM student
WHERE marks > 80