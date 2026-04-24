# 🎓 SQL Constraints – Complete Guide (With Examples)

A complete hands-on guide to SQL constraints with working queries.  
Perfect for **interviews, viva, and quick revision**.

---

## 📌 Database Setup

```sql
CREATE DATABASE IF NOT EXISTS College;
USE College;
```

---

# 🔹 1. NOT NULL Constraint

Ensures a column cannot store `NULL` values.

```sql
CREATE TABLE student1 (
    age INT,
    rollNo INT NOT NULL
);

INSERT INTO student1 (age, rollNo)
VALUES (18, 101), (19, 102);

INSERT INTO student1 (age, rollNo)
VALUES (19, 104);

SELECT * FROM student1;
```

### ✅ Key Points
- Mandatory field  
- Prevents missing values  
- `NULL ≠ 0`

---

# 🔹 2. CHECK Constraint

Restricts values based on conditions.

```sql
CREATE TABLE IF NOT EXISTS student3 (
    age INT CHECK(age >= 18),
    rollNo INT
);

INSERT INTO student3 (age, rollNo)
VALUES (19, 101), (18, 102);

SELECT * FROM student3;
```

### ✅ Key Points
- Enforces rules like age ≥ 18  
- Invalid data is rejected  

---

# 🔹 3. DEFAULT Constraint

Assigns a default value if none is provided.

```sql
CREATE TABLE IF NOT EXISTS student4 (
    age INT CHECK(age >= 18),
    rollNo INT NOT NULL,
    schoolName VARCHAR(50) DEFAULT 'XYZ'
);

INSERT INTO student4 (age, rollNo)
VALUES (19, 101), (20, 102), (21, 103);

SELECT * FROM student4;
```

### ✅ Key Points
- Default applies only when column is not specified  

---

# 🔹 4. PRIMARY KEY Constraint

Uniquely identifies each row.

```sql
CREATE TABLE IF NOT EXISTS student5 (
    age INT CHECK(age >= 18),
    rollNo INT NOT NULL,
    schoolName VARCHAR(50) DEFAULT 'XYZ',
    studentID INT PRIMARY KEY
);

INSERT INTO student5 (age, rollNo, studentID)
VALUES (19, 101, 1),
       (20, 102, 2),
       (21, 103, 3),
       (22, 104, 4);

SELECT * FROM student5;
```

### ✅ Key Points
- Unique + Not Null  
- Only one per table  

---

# 🔹 5. FOREIGN KEY Constraint

Links two tables.

```sql
CREATE TABLE IF NOT EXISTS courses (
    courseName VARCHAR(100),
    cid INT PRIMARY KEY,
    studentId INT,
    FOREIGN KEY (studentId) REFERENCES student5(studentId)
);

INSERT INTO courses (courseName, cid, studentId)
VALUES ('CSE', 1001, 1),
       ('CSDS', 1002, 2);

SELECT * FROM courses;
```

### ✅ Key Points
- Maintains referential integrity  
- Prevents invalid references  

---

# 🔹 6. Combined Constraints (fees table)

```sql
CREATE TABLE IF NOT EXISTS fees (
    paymentID INT PRIMARY KEY,
    studentID INT NOT NULL,
    paymentStatus BOOLEAN,
    paymentTime DATE,
    semester INT NOT NULL,
    examEligibilty BOOLEAN,
    FOREIGN KEY (studentID) REFERENCES student5(studentID)
);

INSERT INTO fees (paymentID, studentID, paymentStatus, paymentTime, semester, examEligibilty)
VALUES 
(9999, 1, TRUE, '2026-04-10', 6, TRUE),
(99998, 2, TRUE, '2026-04-10', 6, TRUE),
(99997, 3, TRUE, '2026-04-10', 6, TRUE);

SELECT * FROM fees;
```

---

# 🔥 Common Interview Questions

### ❓ PRIMARY KEY vs UNIQUE
| Feature        | PRIMARY KEY | UNIQUE |
|----------------|------------|--------|
| NULL Allowed   | ❌ No      | ✅ Yes |
| Count per Table| 1          | Multiple |

---

### ❓ What is Referential Integrity?
Ensures child table values exist in the parent table.

---

### ❓ Common Errors
- Duplicate PRIMARY KEY → ❌ Error  
- Invalid FOREIGN KEY → ❌ Error  
- CHECK constraint fail → ❌ Rejected  

---

# ⚡ Important Concepts Summary

- **NOT NULL** → No empty values  
- **CHECK** → Condition-based validation  
- **DEFAULT** → Auto value  
- **PRIMARY KEY** → Unique identifier  
- **FOREIGN KEY** → Table relationship  
- **BOOLEAN** → TRUE (1), FALSE (0)  
- **DATE** → `'YYYY-MM-DD'`

---

# 🚀 Final One-Line Answer (Interview)

> Constraints in SQL enforce rules on data to maintain accuracy, consistency, and relationships between tables.

---

# 👨‍💻 Author
**Saptarshi Paul**