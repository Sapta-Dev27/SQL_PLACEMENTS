# 🔗 JOINS IN SQL – Detailed Notes

## 📌 Introduction

JOINS in SQL are used for linking two or more tables if they have a same/common column.

👉 FOREIGN KEY is NOT necessary for JOINS.

---

# 🔥 Types of JOINS

1. INNER JOIN  
2. LEFT OUTER JOIN  
3. RIGHT OUTER JOIN  
4. SELF JOIN  
5. CROSS JOIN  

---

# 📌 Database Creation

```sql
CREATE DATABASE IF NOT EXISTS ecom;
USE ecom;
```

---

# 📌 Table Creation

## 🔹 Customers Table

```sql
CREATE TABLE IF NOT EXISTS customers(
    id INT PRIMARY KEY,
    name VARCHAR(100)
);
```

---

## 🔹 Orders Table

```sql
CREATE TABLE IF NOT EXISTS orderes(
    id INT PRIMARY KEY,
    order_name VARCHAR(100)
);
```

---

# 📌 Insert Data

## 🔹 Customers Data

```sql
INSERT INTO customers(id, name)
VALUES
(1, 'SAPTA'),
(2, 'ANU'),
(3, 'ANUSKA'),
(4, 'ANUSKA BABY'),
(5, 'PORI');
```

```sql
SELECT * FROM customers;
```

---

## 🔹 Orders Data

```sql
INSERT INTO orderes(id, order_name)
VALUES
(1, 'CONDOM'),
(2, 'DILDO'),
(3, 'PUSSY'),
(6, 'FLUID GEL'),
(7, 'VIBRATOR');
```

```sql
SELECT * FROM orderes;
```

---

# 🔥 INNER JOIN

## 📌 Definition

INNER JOIN is used for getting the rows that have the SAME MATCHING VALUES in both the tables.

👉 It returns the INTERSECTION of both tables.

---

## 📌 Query

```sql
SELECT * 
FROM customers
INNER JOIN orderes
ON customers.id = orderes.id;
```

---

## 📌 Matching IDs

| customers.id | orderes.id |
|---|---|
| 1 | 1 |
| 2 | 2 |
| 3 | 3 |

---

## 📌 Result Explanation

Only rows having matching IDs in BOTH tables are returned.

Rows:
- 4, 5 from customers ❌
- 6, 7 from orders ❌

are excluded because they do not exist in both tables.

---

# 🔥 LEFT JOIN ( LEFT OUTER JOIN )

## 📌 Definition

LEFT JOIN is used for getting:
- ALL rows from the LEFT table
- Matching rows from the RIGHT table

If any row does not have a match in the RIGHT table,
👉 columns from RIGHT table become NULL.

---

## 📌 Important Rule

- LEFT TABLE → BEFORE `LEFT JOIN`
- RIGHT TABLE → AFTER `LEFT JOIN`

---

## 📌 Query 1

```sql
SELECT *
FROM customers
LEFT JOIN orderes
ON customers.id = orderes.id;
```

---

## 📌 Explanation

All rows from `customers` table will appear.

Matching:
- 1 → matched
- 2 → matched
- 3 → matched

Non-matching:
- 4 → NULL values from orderes
- 5 → NULL values from orderes

---

## 📌 Query 2

```sql
SELECT *
FROM orderes
LEFT JOIN customers
ON orderes.id = customers.id;
```

---

## 📌 Explanation

Now `orderes` becomes the LEFT table.

All rows from orderes appear:
- 1 → matched
- 2 → matched
- 3 → matched
- 6 → NULL values from customers
- 7 → NULL values from customers

---

# 🔥 RIGHT JOIN ( RIGHT OUTER JOIN )

## 📌 Definition

RIGHT JOIN is used for getting:
- ALL rows from RIGHT table
- Matching rows from LEFT table

If any row does not have a match in LEFT table,
👉 LEFT table columns become NULL.

---

## 📌 Important Rule

- LEFT TABLE → LEFT of RIGHT JOIN keyword
- RIGHT TABLE → RIGHT of RIGHT JOIN keyword

---

## 📌 Query 1

```sql
SELECT *
FROM customers
RIGHT JOIN orderes
ON customers.id = orderes.id;
```

---

## 📌 Explanation

All rows from `orderes` table will appear.

Matching:
- 1 → matched
- 2 → matched
- 3 → matched

Non-matching:
- 6 → NULL values from customers
- 7 → NULL values from customers

---

## 📌 Query 2

```sql
SELECT *
FROM orderes
RIGHT JOIN customers
ON customers.id = orderes.id;
```

---

## 📌 Explanation

Now `customers` becomes the RIGHT table.

All rows from customers appear:
- 1 → matched
- 2 → matched
- 3 → matched
- 4 → NULL values from orders
- 5 → NULL values from orders

---

# 🔥 Visual Understanding of JOINS

## 📌 INNER JOIN

```text
customers ∩ orders
```

Only matching rows.

---

## 📌 LEFT JOIN

```text
ALL customers + matching orders
```

---

## 📌 RIGHT JOIN

```text
ALL orders + matching customers
```

---

# ⚡ Important Interview Notes

## ✅ FOREIGN KEY is NOT mandatory for JOINS

JOINS only require:
- Common columns
- Matching condition

---

## ✅ ON Clause

Used for specifying matching condition.

```sql
ON customers.id = orderes.id
```

---

## ✅ NULL Values in JOINS

When rows do not match:
- LEFT JOIN → RIGHT table becomes NULL
- RIGHT JOIN → LEFT table becomes NULL

---

# 🔥 Difference Between INNER, LEFT & RIGHT JOIN

| JOIN Type | Returns |
|---|---|
| INNER JOIN | Only matching rows |
| LEFT JOIN | All left rows + matching right rows |
| RIGHT JOIN | All right rows + matching left rows |

---

# 🚀 Final One-Line Interview Answer

> SQL JOINS are used to combine rows from multiple tables using common columns, helping retrieve related data efficiently.

---

# 👨‍💻 Author

**Saptarshi Paul**