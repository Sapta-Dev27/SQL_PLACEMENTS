# 🏢 Employee & Project Database (SQL Practice)

This project demonstrates SQL concepts like:
- Table Creation
- Constraints (PRIMARY KEY, CHECK, DEFAULT)
- FOREIGN KEY with CASCADE
- INSERT, UPDATE, DELETE operations
- Filtering Queries

---

# 📌 Database Selection

```sql
USE college;
```

---

# 📌 Table Creation

## 🔹 Employee Table

```sql
CREATE TABLE IF NOT EXISTS Employee (
    empID INT PRIMARY KEY,
    age INT NOT NULL CHECK(age > 18),
    name VARCHAR(100) NOT NULL,
    dept VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    joiningDate DATE DEFAULT "2026-01-01"
);
```

---

## 🔹 Project Table

```sql
CREATE TABLE IF NOT EXISTS project (
    pid INT PRIMARY KEY,
    name VARCHAR(100),
    employeeID INT,
    FOREIGN KEY(employeeID) REFERENCES Employee(empID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
```

---

# 📌 Insert Data

## 🔹 Employee Data

```sql
INSERT INTO Employee (empID, age, name, dept, salary) VALUES
(100, 19, 'Sapta', 'IT', 50000),
(101, 20, 'Anuska', 'IT', 51000),
(102, 19, 'Anu', 'IT', 50000),
(104, 23, 'Satya', 'IT', 40000),
(105, 22, 'Ranit', 'IT', 52000);
```

---

## 🔹 Project Data

```sql
INSERT INTO project (pid, name, employeeID) VALUES
(1000, 'US-CLIENT', 101),
(1001, 'US-CLIENT', 102),
(1002, 'US-CLIENT', 101),
(1003, 'US-CLIENT', 102),
(1004, 'US-CLIENT', 105);
```

---

# 📌 Update Operations

```sql
UPDATE Employee SET salary = 55000 WHERE dept = 'IT';

SET SQL_SAFE_UPDATES = 0;

UPDATE Employee SET name = "Saptarshi" WHERE name = "Sapta";

SET SQL_SAFE_UPDATES = 0;

UPDATE Employee SET name = "Anuska Babby" WHERE name = "Anu";
```

---

# 📌 Insert Additional Data

```sql
INSERT INTO Employee (empID, age, name, dept, salary) VALUES
(1002, 19, 'Sapta-2', 'HR', 50000),
(1011, 20, 'Anuska-2', 'HR', 51000);
```

---

# 📌 Delete Operations

```sql
DELETE FROM Employee WHERE dept = "HR";

DELETE FROM Employee WHERE name = "Anuska";

DELETE FROM project WHERE pid = 1000;
```

---

# 📌 Select Queries

```sql
SELECT * FROM Employee;

SELECT * FROM project;

SELECT pid FROM project;

SELECT empID, age, name FROM Employee;

SELECT * FROM Employee WHERE age < 21;

SELECT * FROM Employee WHERE (salary > 50000 AND salary <= 55000);
```

---

# 📌 FOREIGN KEY CASCADING

## 🔹 Concept

Foreign Key Cascading ensures that changes in the parent table are reflected in the child table.

---

## 🔹 Types of Actions

### 1. CASCADE
- If parent row is updated or deleted  
- Changes automatically reflect in child table  

### 2. SET NULL
- Child records become NULL when parent is modified  

### 3. RESTRICT / NO ACTION
- Prevents deletion or update of parent row  
- Ensures referential integrity  

---

## 🔹 Used in this Project

```sql
ON DELETE CASCADE
ON UPDATE CASCADE
```

---

# 🚀 Key Learnings

- How to design relational tables  
- Use of constraints (PK, FK, CHECK, DEFAULT)  
- Handling cascading operations  
- Performing CRUD operations  
- Writing filtered queries  

---

# 👨‍💻 Author
Saptarshi Paul