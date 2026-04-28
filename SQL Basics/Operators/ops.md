# 📊 SQL Queries – DISTINCT, Operators & Filtering

This document covers important SQL concepts including:
- DISTINCT keyword
- Arithmetic, Comparison, Logical operators
- IN, BETWEEN
- LIKE operator (pattern matching)

---

## 📌 Database Selection

```sql
USE college;
SELECT * FROM employee_details;
```

---

# 🔹 DISTINCT Keyword

Used to retrieve **unique values** from a column or combination of columns.

```sql
SELECT DISTINCT age FROM employee_details;

SELECT DISTINCT salary FROM employee_details;

SELECT DISTINCT age, salary FROM employee_details;
```

### ✅ Key Points
- Removes duplicate values  
- Works on single or multiple columns  

---

# 🔹 SQL OPERATORS

---

## ➕ 1. Arithmetic Operators

Includes: `+ , - , * , / , %`

```sql
SELECT * FROM employee_details WHERE age + 1 = 20;

SELECT * FROM employee_details WHERE age - 1 <= 18;
```

---

## 🔍 2. Comparison Operators

Includes: `> , < , >= , <= , !=`

```sql
SELECT * FROM employee_details WHERE age >= 18;

SELECT * FROM employee_details WHERE age != 19;

SELECT * FROM employee_details WHERE age < 18;
```

---

## 🔗 3. Logical Operators

Includes: `AND , OR , NOT`

```sql
SELECT * FROM employee_details WHERE age = 19 AND salary >= 55000;

SELECT * FROM employee_details WHERE age = 19 AND salary > 55000;

SELECT * FROM employee_details WHERE age > 18 OR salary > 50000;
```

---

## 🔹 IN & NOT IN

```sql
SELECT * FROM employee_details WHERE age NOT IN (20, 21, 22, 23, 24, 25, 19);

SELECT * FROM employee_details WHERE age IN (30, 32);

SELECT * FROM employee_details WHERE age IN (19, 20);
```

---

## 🔹 BETWEEN Operator

```sql
SELECT * FROM employee_details WHERE age BETWEEN 20 AND 25;

SELECT * FROM employee_details WHERE age BETWEEN 18 AND 20;

SELECT * FROM employee_details WHERE salary BETWEEN 50000 AND 55000;
```

---

# 🔹 LIKE Operator (Pattern Matching)

Used for searching patterns in strings.

---

## 🔸 Ending with a Character

```sql
SELECT * FROM employee_details WHERE name LIKE "%A";
SELECT * FROM employee_details WHERE name LIKE "%i";
```

---

## 🔸 Starting with a Character

```sql
SELECT * FROM employee_details WHERE name LIKE "A%";
```

---

## 🔸 Containing a Character

```sql
SELECT * FROM employee_details WHERE name LIKE "%Y%";
SELECT * FROM employee_details WHERE name LIKE "%n%";
```

---

## 🔸 Position-Based Matching

```sql
SELECT * FROM employee_details WHERE name LIKE "_A%";    -- 2nd position

SELECT * FROM employee_details WHERE name LIKE "__A%";   -- 3rd position

SELECT * FROM employee_details WHERE name LIKE "%h_";    -- 2nd last position

SELECT * FROM employee_details WHERE name LIKE "%t__";   -- 3rd last position
```

---

## 🔸 Fixed Length Matching

```sql
SELECT * FROM employee_details WHERE name LIKE "_____";  -- length = 5

SELECT * FROM employee_details WHERE name LIKE "S____";  -- length = 5 starting with S
```

---

## 🔸 Starts and Ends with Specific Characters

```sql
SELECT * FROM employee_details WHERE name LIKE "A%Y";   -- starts with A, ends with Y

SELECT * FROM employee_details WHERE name LIKE "%AN%";  -- contains A and N
```

---

# ⚡ Key Concepts Summary

- **DISTINCT** → Removes duplicate values  
- **Arithmetic Operators** → Perform calculations  
- **Comparison Operators** → Compare values  
- **Logical Operators** → Combine conditions  
- **IN / NOT IN** → Match multiple values  
- **BETWEEN** → Range filtering  
- **LIKE** → Pattern matching  

---

# 🚀 Final One-Line Answer (Interview)

> SQL operators and clauses like DISTINCT, IN, BETWEEN, and LIKE are used to filter, compare, and retrieve meaningful data efficiently from databases.

---

# 👨‍💻 Author
**Saptarshi Paul**