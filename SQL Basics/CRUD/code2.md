# 🛠️ SQL ALTER & Table Operations – Notes

This document covers important SQL operations like:
- ALTER TABLE
- MODIFY / CHANGE / RENAME
- DELETE / TRUNCATE / DROP
- SAFE UPDATE MODE

---

## 🔹 ALTER TABLE

Used to **change the schema** of a table.

---

### ➕ Add Column

```sql
ALTER TABLE Employee
ADD phoneNo INT NOT NULL;
```

✔ Adds a new column `phoneNo`  
✔ NOT NULL → value required for all rows  

---

### 🔍 View Column

```sql
SELECT phoneNo FROM Employee;
```

---

### ❌ Drop Column

```sql
ALTER TABLE Employee 
DROP phoneNo;
```

✔ Removes the column permanently  

---

### 🔄 Modify Column (Change Constraint)

```sql
ALTER TABLE Employee
MODIFY dept VARCHAR(20) DEFAULT "Not Assigned";
```

✔ Changes:
- Data type
- Constraints (DEFAULT here)

---

### ⚠️ Error Case

```sql
ALTER TABLE Employee
MODIFY phoneNo INT NOT NULL;
```

❌ Error because:
- `phoneNo` column does not exist

---

### ➕ Add Another Column

```sql
ALTER TABLE Employee
ADD email VARCHAR(100) NOT NULL;
```

---

### 🔁 Change Column Name + Type + Constraints

```sql
ALTER TABLE Employee
CHANGE email email_employee VARCHAR(100) NOT NULL;
```

✔ Renames column  
✔ Can also change datatype & constraints  

---

### 🔁 Rename Column (MySQL 8+)

```sql
ALTER TABLE Employee
RENAME COLUMN age TO employee_age;
```

✔ Only renames column  

---

### 🔁 Rename Table

```sql
RENAME TABLE Employee TO Employee_details;
```

✔ Changes table name  

---

## 🔹 TABLE OPERATIONS

---

### 🔍 Show Tables

```sql
SHOW TABLES;
```

---

### 🧹 TRUNCATE TABLE

```sql
TRUNCATE TABLE fees;
SELECT * FROM fees;
```

✔ Deletes all data  
✔ Faster than DELETE  
✔ Cannot be rolled back  

---

### ❌ DELETE Row (Using Primary Key)

```sql
DELETE FROM employee_details WHERE empId = 101;
SELECT * FROM employee_details;
```

✔ Works because `empId` is a key column  

---

### ⚠️ Safe Update Mode Issue

```sql
SET SQL_SAFE_UPDATES = 0;

DELETE FROM employee_details WHERE age < 19;
```

✔ Required because:
- `age` is NOT a key column  
- Safe mode blocks such queries  

---

### ❌ DROP TABLE

```sql
DROP TABLE fees;
SHOW TABLES;
```

✔ Deletes entire table + structure  

---

### ❌ Drop Another Table

```sql
DROP TABLE courses;
```

---

### 🔍 Show Databases

```sql
SHOW DATABASES;
```

---

## ⚡ Key Concepts Summary

- **ALTER** → Change table structure  
- **ADD** → Add new column  
- **DROP** → Remove column/table  
- **MODIFY** → Change datatype/constraint  
- **CHANGE** → Rename + modify column  
- **RENAME COLUMN** → Rename column (MySQL 8+)  
- **RENAME TABLE** → Rename table  
- **DELETE** → Remove specific rows  
- **TRUNCATE** → Remove all rows (fast)  
- **DROP TABLE** → Delete entire table  
- **SAFE UPDATE MODE** → Prevents unsafe DELETE/UPDATE  

---

## 🚀 Final One-Line Interview Answer

> ALTER is used to modify table structure, while DELETE, TRUNCATE, and DROP are used to remove data or tables with different levels of impact and safety.

---

## 👨‍💻 Author
Saptarshi Paul