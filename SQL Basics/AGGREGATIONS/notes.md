# 📊 SQL Clauses & Aggregate Functions – Interview Notes

This document covers important SQL clauses and aggregate functions frequently asked in interviews.

---

## 📌 Database Usage

```sql
USE college;
SELECT * FROM employee_details;
```

---

# 🔹 1. WHERE Clause

Used to retrieve specific data based on conditions.

```sql
SELECT * FROM employee_details WHERE age > 20;
```

### ✅ Key Points
- Filters rows  
- Works on non-aggregated data  

---

# 🔹 2. LIMIT Clause

Used to restrict the number of rows returned.

```sql
SELECT * FROM employee_details WHERE age > 20 LIMIT 1;
```

---

# 🔹 3. ORDER BY Clause

Used to sort results.

- Default: ASC (Ascending)

```sql
SELECT * FROM employee_details ORDER BY age ASC;

SELECT * FROM employee_details ORDER BY age DESC;
```

---

## 🔹 Combined Queries

```sql
SELECT * FROM employee_details WHERE empId = 104;

SELECT * FROM employee_details WHERE empID = 104 AND age > 20;

SELECT * FROM employee_details WHERE age NOT IN (20, 21, 22, 23);

SELECT * FROM employee_details ORDER BY age DESC LIMIT 3;

SELECT * FROM employee_details ORDER BY age ASC LIMIT 2;
```

---

# 🔹 GROUP BY Clause

Used to group rows with the same values.

```sql
SELECT dept, AVG(salary) FROM employee_details GROUP BY dept;

SELECT dept, AVG(salary) AS avgsalary FROM employee_details GROUP BY dept;
```

---

# 🔹 HAVING Clause

Used to filter aggregated data.

```sql
SELECT dept, AVG(salary) AS avgsalary 
FROM employee_details 
GROUP BY dept 
HAVING avgsalary > 50000;
```

---

# 🔹 Aggregate Functions

## COUNT

```sql
SELECT dept, COUNT(dept) AS total_count 
FROM employee_details 
GROUP BY dept;
```

---

## AVG

```sql
SELECT dept, AVG(salary) AS avg_salary 
FROM employee_details 
GROUP BY dept;

SELECT dept, AVG(age) AS avg_age 
FROM employee_details 
GROUP BY dept 
HAVING avg_age > 18;
```

---

## MAX & MIN

```sql
SELECT dept, MAX(age) AS max_age 
FROM employee_details 
GROUP BY dept;

SELECT dept, MIN(age) AS min_age 
FROM employee_details 
GROUP BY dept;

SELECT dept, MAX(salary) AS max_salary 
FROM employee_details 
GROUP BY dept;

SELECT dept, MIN(salary) AS min_salary 
FROM employee_details 
GROUP BY dept;
```

---

## SUM + COUNT + AVG (Combined)

```sql
SELECT dept, 
       SUM(salary) AS avg_salary, 
       COUNT(empID) AS total_employees, 
       AVG(age) AS avg_age 
FROM employee_details 
GROUP BY dept;
```

---

# 🔹 Advanced Queries

```sql
SELECT dept, COUNT(empID) AS total_count 
FROM employee_details 
GROUP BY dept;

SELECT dept, MAX(salary) AS max_salary 
FROM employee_details 
GROUP BY dept 
ORDER BY max_salary DESC;

SELECT dept, MIN(salary) AS min_salary 
FROM employee_details 
GROUP BY dept 
HAVING min_salary > 10000 
ORDER BY min_salary DESC;

SELECT dept, COUNT(empID) AS total_count 
FROM employee_details 
GROUP BY dept 
ORDER BY total_count DESC;

SELECT dept, AVG(salary) AS avg_salary 
FROM employee_details 
GROUP BY dept 
HAVING avg_salary > 20000;
```

---

# 🔥 Difference: WHERE vs HAVING

| Clause | Used On | Purpose |
|------|--------|--------|
| WHERE | Non-aggregated data | Filters rows before grouping |
| HAVING | Aggregated data | Filters grouped results |

---

# 🔄 General Order of SQL Execution

```sql
SELECT → FROM → WHERE → GROUP BY → HAVING → ORDER BY → LIMIT
```

---

# 🚀 Final One-Line Answer (Interview)

> WHERE filters raw data, HAVING filters grouped data, and clauses like GROUP BY, ORDER BY, and LIMIT help organize and control query results efficiently.

---

# 👨‍💻 Author
Saptarshi Paul