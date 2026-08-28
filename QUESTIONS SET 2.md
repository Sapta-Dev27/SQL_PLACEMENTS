# SQL Interview Practice — Employees & Departments

This README contains the complete SQL practice setup and all queries in **one single Markdown file**. The examples use the `Departments` and `Employees` tables and are written primarily for **Microsoft SQL Server**.

---

## 1. Database Setup

### Departments Table

```sql
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance'),
(104, 'FinanceIT');
```

### Employees Table

```sql
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    DeptID INT,
    Salary INT,
    JoinDate DATE,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, Name, DeptID, Salary, JoinDate) VALUES
(1, 'Amit', 101, 50000, '2020-01-15'),
(2, 'Priya', 102, 60000, '2021-03-10'),
(3, 'Raj', 101, 45000, '2019-07-23'),
(4, 'Neha', 103, 70000, '2021-06-01'),
(5, 'Karan', 102, 55000, '2020-11-11');
```

---

# 2. View the Sample Data

## Departments

| DeptID | DeptName |
|---:|---|
| 101 | HR |
| 102 | IT |
| 103 | Finance |
| 104 | FinanceIT |

## Employees

| EmpID | Name | DeptID | Salary | JoinDate |
|---:|---|---:|---:|---|
| 1 | Amit | 101 | 50000 | 2020-01-15 |
| 2 | Priya | 102 | 60000 | 2021-03-10 |
| 3 | Raj | 101 | 45000 | 2019-07-23 |
| 4 | Neha | 103 | 70000 | 2021-06-01 |
| 5 | Karan | 102 | 55000 | 2020-11-11 |

---

# 3. Find Employees Working in the IT Department

### Query

```sql
SELECT 
    e1.EmpID,
    e1.Name,
    d1.DeptName
FROM Employees AS e1
LEFT JOIN Departments AS d1
    ON e1.DeptID = d1.DeptID
WHERE d1.DeptName = 'IT';
```

### Output

| EmpID | Name | DeptName |
|---:|---|---|
| 2 | Priya | IT |
| 5 | Karan | IT |

### Concept

The `JOIN` connects employees with their department using `DeptID`. The `WHERE` condition then keeps only employees whose department name is `IT`.

---

# 4. Find the Second Highest Salary

### Query

```sql
SELECT 
    MAX(e1.Salary) AS second_highest_salary
FROM Employees AS e1
WHERE e1.Salary NOT IN (
    SELECT MAX(Salary)
    FROM Employees
);
```

### Output

| second_highest_salary |
|---:|
| 60000 |

### How it works

The inner query finds the highest salary:

```sql
SELECT MAX(Salary)
FROM Employees;
```

Result:

```text
70000
```

The outer query removes `70000` using:

```sql
WHERE e1.Salary NOT IN (70000)
```

Then `MAX()` finds the largest remaining salary:

```text
60000
```

### Important Note

`MAX()` can find the maximum value of a column, but `MAX(Name)` would mean the alphabetically greatest name. It does not return the employee associated with the highest salary.

---

# 5. Count Employees in Each Department

### Query

```sql
SELECT 
    d1.DeptName AS dept_name,
    d1.DeptID AS dept_id,
    COUNT(DISTINCT e1.EmpID) AS total_employees
FROM Departments AS d1
LEFT JOIN Employees AS e1
    ON e1.DeptID = d1.DeptID
GROUP BY d1.DeptID, d1.DeptName;
```

### Output

| dept_name | dept_id | total_employees |
|---|---:|---:|
| HR | 101 | 2 |
| IT | 102 | 2 |
| Finance | 103 | 1 |
| FinanceIT | 104 | 0 |

### Concept

`LEFT JOIN` keeps every department, including departments that have no employees.

`GROUP BY` creates one group for each unique department.

`COUNT(DISTINCT e1.EmpID)` counts the employees in each department.

---

# 6. Find Employees Who Joined After 2021-01-01

### Query

```sql
SELECT
    Name,
    EmpID,
    DeptID,
    JoinDate
FROM Employees
WHERE JoinDate > '2021-01-01';
```

### Output

| Name | EmpID | DeptID | JoinDate |
|---|---:|---:|---|
| Priya | 2 | 102 | 2021-03-10 |
| Neha | 4 | 103 | 2021-06-01 |

### Concept

The `WHERE` clause filters rows based on the `JoinDate` column.

---

# 7. Find Average Salary of Each Department

### Query

```sql
SELECT
    d1.DeptName AS dept_name,
    d1.DeptID AS dept_id,
    AVG(e1.Salary) AS avg_salary
FROM Departments AS d1
LEFT JOIN Employees AS e1
    ON d1.DeptID = e1.DeptID
GROUP BY d1.DeptID, d1.DeptName;
```

### Output

| dept_name | dept_id | avg_salary |
|---|---:|---:|
| HR | 101 | 47500 |
| IT | 102 | 57500 |
| Finance | 103 | 70000 |
| FinanceIT | 104 | NULL |

### How GROUP BY Works

After the join, the data can be viewed as:

| DeptID | DeptName | Employee | Salary |
|---:|---|---|---:|
| 101 | HR | Amit | 50000 |
| 101 | HR | Raj | 45000 |
| 102 | IT | Priya | 60000 |
| 102 | IT | Karan | 55000 |
| 103 | Finance | Neha | 70000 |
| 104 | FinanceIT | NULL | NULL |

`GROUP BY d1.DeptID, d1.DeptName` creates a separate group for each department.

For HR:

```text
(50000 + 45000) / 2 = 47500
```

For IT:

```text
(60000 + 55000) / 2 = 57500
```

For Finance:

```text
70000 / 1 = 70000
```

FinanceIT has no employees, so its average salary is `NULL`.

### Key Idea

Think of `GROUP BY` as putting rows into buckets:

```text
HR
├── 50000
└── 45000
    ↓ AVG()
   47500

IT
├── 60000
└── 55000
    ↓ AVG()
   57500

Finance
└── 70000
    ↓ AVG()
   70000
```

---

# 8. Find the Department with the Maximum Number of Employees

### MySQL/PostgreSQL Version

```sql
SELECT 
    d1.DeptID AS dept_id,
    d1.DeptName AS dept_name,
    COUNT(DISTINCT e1.EmpID) AS count_employees
FROM Departments AS d1
LEFT JOIN Employees AS e1
    ON d1.DeptID = e1.DeptID
GROUP BY d1.DeptID, d1.DeptName
ORDER BY count_employees DESC
LIMIT 1;
```

### SQL Server Version

Since Microsoft SQL Server does not support `LIMIT`, use `TOP 1`:

```sql
SELECT TOP 1
    d1.DeptID AS dept_id,
    d1.DeptName AS dept_name,
    COUNT(DISTINCT e1.EmpID) AS count_employees
FROM Departments AS d1
LEFT JOIN Employees AS e1
    ON d1.DeptID = e1.DeptID
GROUP BY d1.DeptID, d1.DeptName
ORDER BY count_employees DESC;
```

### Output

Because HR and IT both have 2 employees, `TOP 1` returns one of them unless a tie-breaking rule is specified.

### Important SQL Syntax Difference

| Database | Syntax |
|---|---|
| SQL Server | `SELECT TOP 1 ...` |
| MySQL | `... LIMIT 1` |
| PostgreSQL | `... LIMIT 1` |
| Oracle | `FETCH FIRST 1 ROW ONLY` |

### Interview Pattern

```sql
GROUP BY ...
ORDER BY COUNT(...) DESC
```

means:

> Group the rows, count each group, and put the largest group first.

Then `TOP 1` or `LIMIT 1` takes the first group.

---

# 9. Employees Earning More Than Their Department Average

### Query

```sql
SELECT 
    e1.EmpID,
    e1.Name,
    e1.Salary
FROM Employees AS e1
WHERE e1.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employees AS e2
    WHERE e2.DeptID = e1.DeptID
);
```

### Output

| EmpID | Name | Salary |
|---:|---|---:|
| 1 | Amit | 50000 |
| 2 | Priya | 60000 |

### Why?

The subquery is correlated because it refers to the outer query:

```sql
WHERE e2.DeptID = e1.DeptID
```

For every employee, SQL calculates the average salary of that employee's department.

Department averages:

```text
HR      → 47500
IT      → 57500
Finance → 70000
```

Comparisons:

```text
Amit   → 50000 > 47500  → YES
Raj    → 45000 > 47500  → NO

Priya  → 60000 > 57500  → YES
Karan  → 55000 > 57500  → NO

Neha   → 70000 > 70000  → NO
```

### Interview Pattern

```sql
WHERE value > (
    SELECT AVG(value)
    FROM table t2
    WHERE t2.group_id = t1.group_id
)
```

Think:

> Find rows whose value is greater than the average of their own group.

---

# 10. Employees Earning More Than the Overall Company Average

### Query

```sql
SELECT 
    e1.EmpID,
    e1.Name,
    e1.Salary
FROM Employees AS e1
WHERE e1.Salary > (
    SELECT AVG(Salary)
    FROM Employees
);
```

### Overall Average

```text
(50000 + 60000 + 45000 + 70000 + 55000) / 5
= 56000
```

### Output

| EmpID | Name | Salary |
|---:|---|---:|
| 2 | Priya | 60000 |
| 4 | Neha | 70000 |

### Difference from the Previous Query

Previous query:

```sql
WHERE e2.DeptID = e1.DeptID
```

means:

> Compare with the employee's department average.

This query:

```sql
SELECT AVG(Salary)
FROM Employees
```

means:

> Compare with the overall company average.

### Quick Comparison

```text
Department Average:

Amit   → HR average
Raj    → HR average
Priya  → IT average
Karan  → IT average
Neha   → Finance average


Company Average:

Amit   → company average
Raj    → company average
Priya  → company average
Karan  → company average
Neha   → company average
```

---

# 11. Departments Whose Total Salary Exceeds 100000

### Query

```sql
SELECT 
    d1.DeptID,
    d1.DeptName
FROM Departments AS d1
LEFT JOIN Employees AS e1
    ON e1.DeptID = d1.DeptID
GROUP BY d1.DeptID, d1.DeptName
HAVING SUM(e1.Salary) > 100000;
```

### Output

| DeptID | DeptName |
|---:|---|
| 101 | HR |
| 102 | IT |

### Calculation

HR:

```text
50000 + 45000 = 95000
```

So HR does NOT exceed 100000.

IT:

```text
60000 + 55000 = 115000
```

So IT qualifies.

Finance:

```text
70000
```

Does not qualify.

Therefore, with the exact sample data, the expected output is actually:

| DeptID | DeptName |
|---:|---|
| 102 | IT |

### Important: WHERE vs HAVING

Use `WHERE` to filter individual rows:

```sql
WHERE Salary > 50000
```

Use `HAVING` to filter groups after aggregation:

```sql
HAVING SUM(Salary) > 100000
```

Think:

```text
WHERE  → filters rows
GROUP BY → creates groups
HAVING → filters groups
```

---

# 12. Earliest Employee in Each Department

### Query

```sql
SELECT 
    e1.EmpID,
    e1.Name,
    e1.JoinDate
FROM Employees AS e1
WHERE e1.JoinDate = (
    SELECT MIN(e2.JoinDate)
    FROM Employees AS e2
    WHERE e2.DeptID = e1.DeptID
);
```

### Output

| EmpID | Name | JoinDate |
|---:|---|---|
| 3 | Raj | 2019-07-23 |
| 5 | Karan | 2020-11-11 |
| 4 | Neha | 2021-06-01 |

### How It Works

For every employee, the subquery finds the minimum joining date in that employee's department.

```text
HR:
Amit → 2020-01-15
Raj  → 2019-07-23
Minimum → 2019-07-23 → Raj

IT:
Priya → 2021-03-10
Karan → 2020-11-11
Minimum → 2020-11-11 → Karan

Finance:
Neha → 2021-06-01
Minimum → 2021-06-01 → Neha
```

### Interview Pattern

```sql
WHERE date_column = (
    SELECT MIN(date_column)
    FROM table t2
    WHERE t2.group_id = t1.group_id
);
```

This means:

> Find the earliest record in each group.

Replacing `MIN()` with `MAX()` can be used to find the latest record in each group.

---

# 13. Find Departments With No Employees

### Query

```sql
SELECT 
    d1.DeptID,
    d1.DeptName
FROM Departments AS d1
LEFT JOIN Employees AS e1
    ON e1.DeptID = d1.DeptID
WHERE e1.EmpID IS NULL;
```

### Output

| DeptID | DeptName |
|---:|---|
| 104 | FinanceIT |

### Why?

`LEFT JOIN` keeps every department, even if there is no employee.

The joined data conceptually looks like:

| DeptID | DeptName | EmpID |
|---:|---|---:|
| 101 | HR | 1 |
| 101 | HR | 3 |
| 102 | IT | 2 |
| 102 | IT | 5 |
| 103 | Finance | 4 |
| 104 | FinanceIT | NULL |

Then:

```sql
WHERE e1.EmpID IS NULL
```

keeps only the department that has no matching employee.

### Important Interview Pattern

```sql
FROM A
LEFT JOIN B
    ON ...
WHERE B.some_column IS NULL
```

Think:

> Find records in A that have NO matching record in B.

Examples:

```sql
Customers
LEFT JOIN Orders
WHERE Orders.OrderID IS NULL
```

→ Customers who never placed an order.

```sql
Departments
LEFT JOIN Employees
WHERE Employees.EmpID IS NULL
```

→ Departments with no employees.

---

# 14. Core SQL Concepts Covered

## JOIN

Connect rows from two tables:

```sql
FROM Departments d
JOIN Employees e
    ON d.DeptID = e.DeptID
```

## LEFT JOIN

Keep every row from the left table:

```sql
FROM Departments d
LEFT JOIN Employees e
    ON d.DeptID = e.DeptID
```

Useful for finding unmatched records.

## WHERE

Filters individual rows:

```sql
WHERE Salary > 50000
```

## GROUP BY

Creates groups:

```sql
GROUP BY DeptID, DeptName
```

## Aggregate Functions

Common aggregate functions:

```sql
COUNT()
SUM()
AVG()
MIN()
MAX()
```

## HAVING

Filters groups after aggregation:

```sql
HAVING SUM(Salary) > 100000
```

## ORDER BY

Sorts the result:

```sql
ORDER BY Salary DESC
```

## TOP

SQL Server:

```sql
SELECT TOP 1 ...
```

## LIMIT

MySQL/PostgreSQL:

```sql
LIMIT 1
```

## Correlated Subquery

A subquery that depends on the outer query:

```sql
WHERE e2.DeptID = e1.DeptID
```

---

# 15. SQL Execution Order

A useful mental model for SQL query execution is:

```text
FROM
  ↓
JOIN / ON
  ↓
WHERE
  ↓
GROUP BY
  ↓
HAVING
  ↓
SELECT
  ↓
DISTINCT
  ↓
ORDER BY
  ↓
TOP / LIMIT
```

For example:

```sql
SELECT TOP 1
    DeptName,
    COUNT(EmpID) AS EmployeeCount
FROM Departments d
JOIN Employees e
    ON d.DeptID = e.DeptID
GROUP BY DeptName
HAVING COUNT(EmpID) > 0
ORDER BY EmployeeCount DESC;
```

Conceptually:

```text
1. FROM        → choose tables
2. JOIN        → connect matching rows
3. WHERE       → filter rows
4. GROUP BY    → create groups
5. HAVING      → filter groups
6. SELECT      → produce columns
7. ORDER BY    → sort result
8. TOP 1       → take first row
```

---

# 16. Important Interview Patterns to Remember

### Pattern 1 — Second Highest Value

```sql
SELECT MAX(Salary)
FROM Employees
WHERE Salary < (
    SELECT MAX(Salary)
    FROM Employees
);
```

### Pattern 2 — Above Group Average

```sql
SELECT *
FROM Employees e1
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees e2
    WHERE e2.DeptID = e1.DeptID
);
```

### Pattern 3 — Above Overall Average

```sql
SELECT *
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);
```

### Pattern 4 — Earliest Row Per Group

```sql
SELECT *
FROM Employees e1
WHERE JoinDate = (
    SELECT MIN(JoinDate)
    FROM Employees e2
    WHERE e2.DeptID = e1.DeptID
);
```

### Pattern 5 — Groups Above a Total

```sql
SELECT DeptID
FROM Employees
GROUP BY DeptID
HAVING SUM(Salary) > 100000;
```

### Pattern 6 — Find Unmatched Rows

```sql
SELECT d.*
FROM Departments d
LEFT JOIN Employees e
    ON d.DeptID = e.DeptID
WHERE e.EmpID IS NULL;
```

### Pattern 7 — Maximum Group Count

```sql
SELECT TOP 1
    d.DeptID,
    d.DeptName,
    COUNT(e.EmpID) AS EmployeeCount
FROM Departments d
JOIN Employees e
    ON d.DeptID = e.DeptID
GROUP BY d.DeptID, d.DeptName
ORDER BY EmployeeCount DESC;
```

---

# 17. Final Quick Revision

```text
JOIN
→ Connect related tables.

LEFT JOIN
→ Keep all rows from the left table.

WHERE
→ Filter rows.

GROUP BY
→ Create groups.

COUNT()
→ Count rows/values.

SUM()
→ Add values.

AVG()
→ Calculate average.

MIN()
→ Find minimum.

MAX()
→ Find maximum.

HAVING
→ Filter groups.

ORDER BY
→ Sort results.

TOP 1
→ SQL Server: return first row.

LIMIT 1
→ MySQL/PostgreSQL: return first row.

Correlated Subquery
→ Inner query depends on the outer query.

LEFT JOIN + IS NULL
→ Find rows with no matching record.
```

---

# SQL Interview Practice Checklist

- [x] JOIN employees with departments
- [x] Find second highest salary
- [x] Count employees per department
- [x] Filter employees by joining date
- [x] Calculate average salary per department
- [x] Find department with maximum employees
- [x] Find employees above department average
- [x] Find employees above company average
- [x] Find departments with total salary above a threshold
- [x] Find earliest employee in each department
- [x] Find departments with no employees
- [x] Understand `GROUP BY`
- [x] Understand `HAVING`
- [x] Understand correlated subqueries
- [x] Understand `LEFT JOIN ... IS NULL`
- [x] Understand SQL Server `TOP` vs MySQL/PostgreSQL `LIMIT`
