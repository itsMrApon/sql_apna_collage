# 📚 SQL Learning Repository - Apna College

This repository contains comprehensive SQL examples and practice code covering fundamental to advanced SQL concepts. All examples are based on MySQL and cover everything needed for database management and querying.

## 📖 Table of Contents

1. [Database & Table Creation](#database--table-creation)
2. [SQL Language Types](#sql-language-types)
3. [Constraints](#constraints)
4. [Basic CRUD Operations](#basic-crud-operations)
5. [Querying Data](#querying-data)
6. [Operators](#operators)
7. [Aggregate Functions](#aggregate-functions)
8. [GROUP BY & HAVING](#group-by--having)
9. [UPDATE & DELETE](#update--delete)
10. [Foreign Keys & Cascading](#foreign-keys--cascading)
11. [ALTER Operations](#alter-operations)
12. [Joins](#joins)
13. [Subqueries](#subqueries)
14. [Views](#views)

---

## Database & Table Creation

### Creating a Database
```sql
-- Create database
CREATE DATABASE college;

-- Create database if not exists (prevents errors)
CREATE DATABASE IF NOT EXISTS school;

-- Use a database
USE college;

-- Show all databases
SHOW DATABASES;

-- Drop database
DROP DATABASE IF EXISTS school;
```

### Creating Tables
```sql
-- Basic table creation
CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);

-- Show tables
SHOW TABLES;

-- View table structure
SELECT * FROM student;
```

**Example Practice:**
```sql
-- Create company database
CREATE DATABASE IF NOT EXISTS SUDOTECHSERVE;
USE SUDOTECHSERVE;

CREATE TABLE SALARY(
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    SALARY INT NOT NULL
);
```

[🔝 Back to Top](#-table-of-contents)

---

## SQL Language Types

SQL commands are categorized into five main types:

| Type | Full Form | Commands | Purpose |
|------|-----------|----------|---------|
| **DDL** | Data Definition Language | CREATE, ALTER, RENAME, TRUNCATE, DROP | Define and modify database structure |
| **DQL** | Data Query Language | SELECT | Query and retrieve data |
| **DML** | Data Manipulation Language | INSERT, UPDATE, DELETE | Manipulate data in tables |
| **DCL** | Data Control Language | GRANT, REVOKE | Control access permissions |
| **TCL** | Transaction Control Language | START TRANSACTION, COMMIT, ROLLBACK | Manage transactions |

[🔝 Back to Top](#-table-of-contents)

---

## Constraints

Constraints ensure data integrity and enforce rules on table columns.

### Primary Key
```sql
-- Single column primary key
CREATE TABLE temp1 (
    id INT, 
    name VARCHAR(50), 
    age INT, 
    city VARCHAR(20), 
    PRIMARY KEY (id)
);

-- Composite primary key
CREATE TABLE temp2 (
    id INT, 
    name VARCHAR(50), 
    age INT, 
    city VARCHAR(20), 
    PRIMARY KEY (id, name)
);
```

### Unique Key
```sql
CREATE TABLE temp1 (
    id INT UNIQUE
);

INSERT INTO temp1 VALUES (101);
INSERT INTO temp1 VALUES (101); -- Error: Duplicate entry
```

### Default Constraint
```sql
CREATE TABLE emp (
    id INT,
    salary INT DEFAULT 25000
);

INSERT INTO emp (id) VALUES (101); -- salary will be 25000
```

### Check Constraint
```sql
-- Named constraint
CREATE TABLE City (
    id INT PRIMARY KEY,
    city VARCHAR(50),
    age INT,
    CONSTRAINT age_check CHECK (age >= 18 AND city="Delhi")
);

-- Inline check
CREATE TABLE newTab (
    age INT CHECK (age >= 18)
);
```

### Foreign Key
```sql
CREATE TABLE temp (
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customer(id)
);
```

[🔝 Back to Top](#-table-of-contents)

---

## Basic CRUD Operations

### INSERT - Adding Data
```sql
-- Insert single row
INSERT INTO student VALUES (1, "ALIF", 19);

-- Insert multiple rows
INSERT INTO student
(rollno, name)
VALUES
(1, "alif"),
(2, "mithi"),
(3, "shafee");
```

### SELECT - Reading Data
```sql
-- Select all columns
SELECT * FROM student;

-- Select specific columns
SELECT name, marks FROM student;

-- Select distinct values
SELECT DISTINCT city FROM student;
```

**Complete Example:**
```sql
CREATE TABLE student (
    rollno INT PRIMARY KEY, 
    name VARCHAR(50), 
    marks INT NOT NULL, 
    grade VARCHAR(1), 
    city VARCHAR(20)
);

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"), 
(105, "emanuel", 12, "F", "Delhi"), 
(106, "farah", 82, "B", "Delhi");
```

[🔝 Back to Top](#-table-of-contents)

---

## Querying Data

### WHERE Clause
Filter records based on conditions.

```sql
-- Basic condition
SELECT * FROM student
WHERE marks > 80;

-- AND operator
SELECT * FROM student
WHERE marks > 80 AND city = "Mumbai";

-- OR operator
SELECT * FROM student
WHERE marks > 80 OR city = "Mumbai";

-- BETWEEN operator
SELECT * FROM student
WHERE marks BETWEEN 80 AND 90;

-- IN operator
SELECT * FROM student
WHERE city IN ("Mumbai", "Delhi", "Dhaka");

-- NOT IN operator
SELECT * FROM student
WHERE city NOT IN ("Mumbai", "Delhi", "Dhaka");
```

### LIMIT
```sql
-- Limit results
SELECT * FROM student 
WHERE marks < 75
LIMIT 3;
```

### ORDER BY
```sql
-- Ascending order
SELECT * FROM student
ORDER BY city ASC;

SELECT * FROM student
ORDER BY marks ASC;

-- Descending order
SELECT * FROM student
ORDER BY marks DESC
LIMIT 3;
```

[🔝 Back to Top](#-table-of-contents)

---

## Operators

### Arithmetic Operators
- `+` Addition
- `-` Subtraction
- `*` Multiplication
- `/` Division
- `%` Modulus

### Comparison Operators
- `=` Equal to
- `!=` Not equal to
- `>` Greater than
- `>=` Greater than or equal to
- `<` Less than
- `<=` Less than or equal to

### Logical Operators
- `AND` - Both conditions must be true
- `OR` - Either condition must be true
- `NOT` - Negates a condition
- `IN` - Value exists in a list
- `BETWEEN` - Value within a range
- `LIKE` - Pattern matching

[🔝 Back to Top](#-table-of-contents)

---

## Aggregate Functions

Aggregate functions perform calculations on multiple rows and return a single value.

```sql
-- Maximum value
SELECT MAX(marks) FROM student;

-- Minimum value
SELECT MIN(marks) FROM student;

-- Average value
SELECT AVG(marks) FROM student;

-- Count rows
SELECT COUNT(rollno) FROM student;

-- Sum values
SELECT SUM(marks) FROM student;
```

[🔝 Back to Top](#-table-of-contents)

---

## GROUP BY & HAVING

### GROUP BY Clause
Groups rows with the same values into summary rows.

```sql
-- Group by single column
SELECT city, AVG(marks)
FROM student
GROUP BY city;

-- Group by multiple columns
SELECT city, name, COUNT(rollno)
FROM student
GROUP BY city, name;

-- Count by grade
SELECT grade, COUNT(rollno)
FROM student
GROUP BY grade
ORDER BY grade;
```

**Practice Example:**
```sql
-- Find average marks in each city in ascending order
SELECT city, AVG(marks)
FROM student
GROUP BY city 
ORDER BY city ASC;
```

### HAVING Clause
Applies conditions after grouping (similar to WHERE but for groups).

```sql
-- Having with aggregate function
SELECT city, COUNT(rollno)
FROM student
GROUP BY city
HAVING MAX(marks) > 90;
```

### Complete Query Order
```sql
SELECT city
FROM student
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) >= 93
ORDER BY city ASC;
```

**Query Execution Order:**
1. `FROM` - Select table
2. `WHERE` - Filter rows
3. `GROUP BY` - Group rows
4. `HAVING` - Filter groups
5. `SELECT` - Select columns
6. `ORDER BY` - Sort results

[🔝 Back to Top](#-table-of-contents)

---

## UPDATE & DELETE

### UPDATE
Modify existing records.

```sql
-- Disable safe mode for updates
SET SQL_SAFE_UPDATES = 0;

-- Update single column
UPDATE student
SET grade = "O"
WHERE grade = "A";

-- Update with condition
UPDATE student
SET marks = 20
WHERE rollno = 105;

-- Update with BETWEEN
UPDATE student
SET grade = "B"
WHERE marks BETWEEN 80 AND 90;

-- Update all rows
UPDATE student
SET marks = marks + 1;
```

### DELETE
Remove records from table.

```sql
-- Delete specific rows
DELETE FROM student
WHERE marks < 30;

-- TRUNCATE - Delete all rows (faster than DELETE)
TRUNCATE TABLE student;
```

[🔝 Back to Top](#-table-of-contents)

---

## Foreign Keys & Cascading

### Creating Foreign Keys
```sql
-- Create parent table
CREATE TABLE dept (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Create child table with foreign key
CREATE TABLE teacher (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
);
```

### Cascading Operations
Automatically update/delete child records when parent is modified.

```sql
CREATE TABLE teacher (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

-- Insert data
INSERT INTO dept VALUES (101, "english"), (102, "IT");

INSERT INTO teacher VALUES 
(101, "adam", 101),
(102, "mafee", 102),
(103, "shafe", 101);

-- Update parent - child automatically updates
UPDATE dept
SET id = 105
WHERE id = 101;
```

[🔝 Back to Top](#-table-of-contents)

---

## ALTER Operations

ALTER modifies the structure (schema) of existing tables.

### Add Column
```sql
ALTER TABLE student
ADD COLUMN age INT DEFAULT 18;
```

### Drop Column
```sql
ALTER TABLE student
DROP COLUMN age;
```

### Rename Column
```sql
ALTER TABLE student
CHANGE COLUMN age user INT;
```

### Modify Column Datatype
```sql
ALTER TABLE student
MODIFY COLUMN user VARCHAR(3);
```

### Rename Table
```sql
ALTER TABLE student
RENAME TO stu;

ALTER TABLE stu
RENAME TO student;
```

[🔝 Back to Top](#-table-of-contents)

---

## Joins

Joins combine rows from two or more tables based on related columns.

### Sample Tables
```sql
CREATE TABLE student(
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO student VALUES
(101, "rono"),
(102, "saiful"),
(103, "rupon"),
(104, "tanjim");

CREATE TABLE courses(
    id INT PRIMARY KEY,
    courses VARCHAR(50)
);

INSERT INTO courses VALUES
(102, "EEE"),
(101, "civil"),
(105, "CSE"),
(104, "BBA");
```

### INNER JOIN
Returns records with matching values in both tables.

```sql
SELECT * FROM student
INNER JOIN courses
ON student.id = courses.id;

-- With aliases
SELECT * FROM student AS s
INNER JOIN courses AS c
ON s.id = c.id;
```

### LEFT JOIN
Returns all records from left table and matched records from right table.

```sql
SELECT * FROM student AS a
LEFT JOIN courses AS b
ON a.id = b.id;
```

### RIGHT JOIN
Returns all records from right table and matched records from left table.

```sql
SELECT * FROM student AS a
RIGHT JOIN courses AS b
ON a.id = b.id;
```

### FULL JOIN (UNION)
Returns all records when there's a match in either table.

```sql
SELECT * FROM student AS a
LEFT JOIN courses AS b
ON a.id = b.id
UNION
SELECT * FROM student AS a
RIGHT JOIN courses AS b
ON a.id = b.id;
```

### LEFT EXCLUSIVE JOIN
Returns records from left table with no match in right table.

```sql
SELECT * FROM student AS a
LEFT JOIN courses AS b
ON a.id = b.id
WHERE b.id IS NULL;
```

### RIGHT EXCLUSIVE JOIN
Returns records from right table with no match in left table.

```sql
SELECT * FROM student AS a
RIGHT JOIN courses AS b
ON a.id = b.id
WHERE a.id IS NULL;
```

### FULL EXCLUSIVE JOIN
Returns records with no match in either table.

```sql
SELECT * FROM student AS a
LEFT JOIN courses AS b
ON a.id = b.id
WHERE b.id IS NULL
UNION
SELECT * FROM student AS a
RIGHT JOIN courses AS b
ON a.id = b.id
WHERE a.id IS NULL;
```

### SELF JOIN
Join a table with itself.

```sql
-- Sample data
CREATE TABLE employee (
    id INT PRIMARY KEY, 
    name VARCHAR(50), 
    manager_id INT
);

INSERT INTO employee (id, name, manager_id) VALUES
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", NULL),
(104, "donald", 103);

-- Self join to find manager names
SELECT a.name AS manager_name, b.name
FROM employee AS a
JOIN employee AS b
ON a.id = b.manager_id;
```

### UNION & UNION ALL
```sql
-- UNION - Removes duplicates
SELECT name FROM employee
UNION
SELECT name FROM employee;

-- UNION ALL - Keeps duplicates
SELECT name FROM employee
UNION ALL
SELECT name FROM employee;
```

[🔝 Back to Top](#-table-of-contents)

---

## Subqueries

A subquery is a query nested inside another query.

### Sample Data
```sql
CREATE TABLE friend (
    rollno INT PRIMARY KEY, 
    name VARCHAR(50), 
    marks INT NOT NULL, 
    grade VARCHAR(1), 
    city VARCHAR(20)
);

INSERT INTO friend
(rollno, name, marks, grade, city)
VALUES
(101, "anik", 78, "C", "Polton"),
(102, "bhuttu", 93, "A", "Mirpur"),
(103, "kajol", 85, "B", "Mohammadpur"),
(104, "dhrubo", 96, "A", "Dhanmondi"), 
(105, "emanuel", 82, "F", "Badda"), 
(106, "fahad", 82, "B", "Mohammadpur");
```

### WHERE Subquery
Find students with marks greater than average.

```sql
-- Complete query with subquery
SELECT name, marks
FROM friend
WHERE marks > (SELECT AVG(marks) FROM friend);

-- Step 1: Find average
SELECT AVG(marks) FROM friend;  -- Result: 87.6667

-- Step 2: Use in main query
SELECT name, marks
FROM friend
WHERE marks > 87.6667;
```

### IN Subquery
Find names of students with even roll numbers.

```sql
-- Find even roll numbers
SELECT rollno 
FROM friend 
WHERE rollno % 2 = 0;

-- Use in main query
SELECT name, rollno
FROM friend
WHERE rollno IN (
    SELECT rollno 
    FROM friend 
    WHERE rollno % 2 = 0
);
```

### FROM Subquery
Find maximum marks from a specific city.

```sql
-- Find max marks in Mohammadpur
SELECT MAX(marks)
FROM (
    SELECT *
    FROM friend
    WHERE city = "Mohammadpur"
) AS temp;
```

### SELECT Subquery
```sql
SELECT (SELECT MAX(marks) FROM friend), name
FROM friend;
```

[🔝 Back to Top](#-table-of-contents)

---

## Views

Views are virtual tables created from SQL queries. They don't store data but provide a way to simplify complex queries.

### Creating Views
```sql
-- Create a view
CREATE VIEW view1 AS
SELECT rollno, name, marks FROM friend;

-- Query the view
SELECT * FROM view1;
```

**Benefits of Views:**
- Simplify complex queries
- Provide data security (show only specific columns)
- Create reusable query logic
- Present data in different formats

[🔝 Back to Top](#-table-of-contents)

---

## 📊 Output Files

This repository includes CSV output files demonstrating various SQL operations:

- `college.student.csv` - Student table data
- `college.courses.csv` - Courses table data
- `college.student.courses_inner_join.csv` - INNER JOIN results
- `college.student.courses_left_join.csv` - LEFT JOIN results
- `college.student.courses_right_join.csv` - RIGHT JOIN results
- `college.student.courses_full_exlucsiv_join.csv` - FULL EXCLUSIVE JOIN results
- `college.student.courses_leftexlucsiv_join.csv` - LEFT EXCLUSIVE JOIN results
- `college.student.courses_rightexlucsiv_join.csv` - RIGHT EXCLUSIVE JOIN results
- `college.student.courses_union_join.csv` - UNION JOIN results
- `college.employee.csv` - Employee table data
- `college.employee.self_join.csv` - Self JOIN results
- `college.employee.UNION.csv` - UNION results
- `college.employee.UNION.ALL.csv` - UNION ALL results
- `friend.where.csv` - WHERE clause results
- `friend.where_sub.csv` - WHERE subquery results
- `friend.from_sub.csv` - FROM subquery results
- `friend.select_sub.csv` - SELECT subquery results
- `friend.veiw1.view_virtual_table.csv` - View results
- `stu.distinct.csv` - DISTINCT results

---

## 🎯 Key Concepts Summary

| Concept | Description |
|---------|-------------|
| **DDL** | Structure definition (CREATE, ALTER, DROP, TRUNCATE) |
| **DML** | Data manipulation (INSERT, UPDATE, DELETE) |
| **DQL** | Data querying (SELECT) |
| **Constraints** | Data integrity rules (PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, DEFAULT) |
| **Aggregate Functions** | Calculations on data sets (COUNT, SUM, AVG, MIN, MAX) |
| **GROUP BY** | Group rows sharing property |
| **HAVING** | Filter grouped results |
| **Joins** | Combine data from multiple tables |
| **Subqueries** | Nested queries for complex operations |
| **Views** | Virtual tables for reusable queries |

---

## 💡 Best Practices

1. **Always use `IF NOT EXISTS`** when creating databases to avoid errors
2. **Disable safe mode** when performing bulk updates: `SET SQL_SAFE_UPDATES = 0;`
3. **Use aliases** in joins for better readability
4. **Use TRUNCATE instead of DELETE** for faster deletion of all rows
5. **Implement cascading** on foreign keys for automatic updates/deletes
6. **Use views** to simplify complex, frequently-used queries
7. **Add constraints** to maintain data integrity
8. **Use proper indexing** (Primary Keys) for better performance

---

## 📚 Resources

- **Main SQL File:** `classroom.sql` - Contains all practice code
- **Visual Reference:** `Screenshot 2025-05-23 at 8.39.17 PM.png` - Database diagram

---

## 🤝 Contributing

This is a personal learning repository. Feel free to fork and use for your own learning purposes!

---

## 📝 License

This repository is for educational purposes.

---

**Happy Learning! 🚀**

*Last Updated: 2025*
