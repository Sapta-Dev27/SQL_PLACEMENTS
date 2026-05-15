# 🔗 Advanced JOINS in SQL – Detailed Notes

This document covers:
- LEFT EXCLUSIVE JOIN
- RIGHT EXCLUSIVE JOIN
- FULL EXCLUSIVE JOIN
- SELF JOIN

---

# 📌 Database Selection

```sql
USE ecom;
```

---

# 🔥 LEFT EXCLUSIVE JOIN

## 📌 Definition

LEFT EXCLUSIVE JOIN includes:
- Rows ONLY present in the LEFT table
- Rows NOT present in the RIGHT table

---

## 📌 Query

```sql
SELECT *
FROM customers
LEFT JOIN orderes
ON customers.id = orderes.id
WHERE orderes.id IS NULL;
```

---

## 📌 Explanation

- LEFT JOIN first returns:
  - All rows from customers
  - Matching rows from orderes

Then:

```sql
WHERE orderes.id IS NULL
```

filters only those rows that DO NOT have a match in `orderes`.

---

## 📌 Result

Rows present only in `customers` table:

| id | name |
|---|---|
| 4 | ANUSKA BABY |
| 5 | PORI |

---

# 🔥 RIGHT EXCLUSIVE JOIN

## 📌 Definition

RIGHT EXCLUSIVE JOIN includes:
- Rows ONLY present in RIGHT table
- Rows NOT present in LEFT table

---

## 📌 Query

```sql
SELECT *
FROM customers
RIGHT JOIN orderes
ON customers.id = orderes.id
WHERE customers.id IS NULL;
```

---

## 📌 Explanation

- RIGHT JOIN returns:
  - All rows from orderes
  - Matching rows from customers

Then:

```sql
WHERE customers.id IS NULL
```

filters rows without matches in customers.

---

## 📌 Result

Rows present only in `orderes` table:

| id | order_name |
|---|---|
| 6 | FLUID GEL |
| 7 | VIBRATOR |

---

# 🔥 FULL EXCLUSIVE JOIN

## 📌 Definition

FULL EXCLUSIVE JOIN is:
- Combination of LEFT EXCLUSIVE JOIN
- + RIGHT EXCLUSIVE JOIN

Returns:
- Non-matching rows from BOTH tables

---

## 📌 Query

```sql
SELECT *
FROM customers
LEFT JOIN orderes
ON customers.id = orderes.id
WHERE orderes.id IS NULL

UNION

SELECT *
FROM customers
RIGHT JOIN orderes
ON customers.id = orderes.id
WHERE customers.id IS NULL;
```

---

## 📌 Explanation

### First Query:
Returns rows only present in customers.

### Second Query:
Returns rows only present in orderes.

### UNION:
Combines both results.

---

# 🔥 SELF JOIN

## 📌 Definition

A SELF JOIN in SQL is when:
- A table is joined with itself

Used when:
- Rows inside same table are related to each other

Examples:
- Employee ↔ Manager
- Student ↔ Mentor
- Parent ↔ Child

---

# 📌 Database Creation

```sql
CREATE DATABASE school;
```

---

# 📌 Use Database

```sql
USE school;
```

---

# 📌 Create Table

```sql
CREATE TABLE student (
    s_id INT PRIMARY KEY,
    name VARCHAR(50),
    mentor_id INT
);
```

---

# 📌 Insert Data

```sql
INSERT INTO student (s_id, name, mentor_id)
VALUES
(1, 'Ram', NULL),
(2, 'Rahul', 1),
(3, 'Riti', 1),
(4, 'Riya', 3);
```

---

# 📌 View Table

```sql
SELECT * FROM student;
```

---

# 🔥 SELF JOIN Query

```sql
SELECT s1.name AS mentor_name,
       s2.name AS student_name
FROM student AS s1
JOIN student AS s2
WHERE s1.s_id = s2.mentor_id;
```

---

# 📌 Explanation

Two aliases are created:

| Alias | Represents |
|---|---|
| s1 | Mentor |
| s2 | Student |

---

## 📌 Matching Condition

```sql
s1.s_id = s2.mentor_id
```

Meaning:
- mentor's ID matches student's mentor_id

---

# 📌 Result

| mentor_name | student_name |
|---|---|
| Ram | Rahul |
| Ram | Riti |
| Riti | Riya |

---

# 🔥 Important Interview Notes

## ✅ SELF JOIN uses aliases

Because:
- Same table used multiple times
- SQL needs different references

---

## ✅ FULL EXCLUSIVE JOIN

MySQL does NOT directly support:
```sql
FULL OUTER JOIN
```

So we simulate it using:
```sql
LEFT EXCLUSIVE JOIN
UNION
RIGHT EXCLUSIVE JOIN
```

---

# 🔥 Difference Between Exclusive JOINS

| JOIN Type | Returns |
|---|---|
| LEFT EXCLUSIVE JOIN | Only unmatched rows from LEFT table |
| RIGHT EXCLUSIVE JOIN | Only unmatched rows from RIGHT table |
| FULL EXCLUSIVE JOIN | Unmatched rows from BOTH tables |

---

# 🚀 Final One-Line Interview Answer

> SQL JOINS combine related data from multiple tables, while SELF JOIN is used when rows within the same table are related to each other.

---

# 👨‍💻 Author

**Saptarshi Paul**