# SQL Employee Database Practice

This README contains SQL practice questions and their solutions based on the `EmployeeDetails` and `EmployeeSalary` tables.

---

## 1. Display All Employees

### Question

Display all records from the `EmployeeDetails` table.

### Answer

```sql
SELECT *
FROM EmployeeDetails;
```

---

## 2. Find Employee by ID

### Question

Find the details of the employee whose `EmpId` is `1`.

### Answer

```sql
SELECT *
FROM EmployeeDetails
WHERE EmpId = 1;
```

---

## 3. Find Employees by Manager and City

### Question

Find employees who work under `ManagerId = 100` and are located in `Jhansi`.

### Answer

```sql
SELECT *
FROM EmployeeDetails
WHERE ManagerId = 100
  AND City = 'Jhansi';
```

---

## 4. Find All Distinct Projects

### Question

Display all unique projects available in the `EmployeeSalary` table.

### Answer

```sql
SELECT DISTINCT Project
FROM EmployeeSalary;
```

---

## 5. Count Employees Working on Project P1

### Question

Find the number of distinct employees working on project `P1`.

### Answer

```sql
SELECT COUNT(DISTINCT EmpId)
FROM EmployeeSalary
WHERE Project = 'P1';
```

---

## 6. Find Maximum, Minimum and Average Salary

### Question

Find the maximum salary, minimum salary, and average salary of all employees.

### Answer

```sql
SELECT
    MAX(Salary) AS max_salary,
    MIN(Salary) AS min_salary,
    AVG(Salary) AS avg_salary
FROM EmployeeSalary;
```

---

## 7. Find Employees with Salary Between 9000 and 15000

### Question

Find the employee IDs of employees whose salary is between `9000` and `15000`, including both values.

### Answer

```sql
SELECT EmpId
FROM EmployeeSalary
WHERE Salary >= 9000
  AND Salary <= 15000;
```

### Alternative Using `BETWEEN`

```sql
SELECT EmpId
FROM EmployeeSalary
WHERE Salary BETWEEN 9000 AND 15000;
```

---

## 8. Find Employees Managed by Manager 100 OR Living in Jhansi

### Question

Find employees whose `ManagerId` is `100` or whose city is `Jhansi`.

### Answer

```sql
SELECT EmpId
FROM EmployeeDetails
WHERE ManagerId = 100
   OR City = 'Jhansi';
```

---

## 9. Find Employees Not Working on Project P2

### Question

Find employee IDs of employees whose project is not `P2`.

### Answer

```sql
SELECT EmpId
FROM EmployeeSalary
WHERE Project != 'P2';
```

---

## 10. Find Employees Who Never Worked on Project P2

### Question

Find employee IDs of employees who do not have any record for project `P2`.

### Answer

```sql
SELECT e1.EmpId
FROM EmployeeSalary AS e1
WHERE e1.EmpId NOT IN
(
    SELECT e2.EmpId
    FROM EmployeeSalary AS e2
    WHERE e2.Project = 'P2'
);
```

### Explanation

The subquery first finds employees who worked on `P2`.

The outer query then removes those employees using `NOT IN`.

> **Difference from Question 9:**
> `Project != 'P2'` checks individual rows, while `NOT IN` checks whether an employee has **ever** worked on `P2`.

---

## 11. Calculate Total Salary Including Variable Pay

### Question

Calculate the total salary paid to all employees, including their variable pay.

### Answer

```sql
SELECT
    SUM(Salary) + SUM(Variable) AS total_salary
FROM EmployeeSalary;
```

---

## 12. Find Names Starting with Any Character Followed by 'a'

### Question

Find employees whose second character in their name is `a`.

### Answer

```sql
SELECT FullName
FROM EmployeeDetails
WHERE FullName LIKE '_a%';
```

### Explanation

The pattern:

```text
_a%
```

means:

* `_` → exactly one character
* `a` → second character must be `a`
* `%` → any number of characters after that

For example:

```text
Rahul
Karan
```

match the pattern because their second character is `a`.

---

# JOIN Questions

## 13. Find Employees Present in Both Tables

### Question

Find employee IDs that exist in both `EmployeeDetails` and `EmployeeSalary`.

### Answer

```sql
SELECT e1.EmpId
FROM EmployeeDetails AS e1
INNER JOIN EmployeeSalary AS e2
    ON e1.EmpId = e2.EmpId;
```

### Explanation

`INNER JOIN` returns only records where a matching `EmpId` exists in both tables.

---

## 14. Find All Employees from EmployeeDetails

### Question

Display all employees from `EmployeeDetails`, including employees who do not have salary information.

### Answer

```sql
SELECT e1.EmpId
FROM EmployeeDetails AS e1
LEFT JOIN EmployeeSalary AS e2
    ON e1.EmpId = e2.EmpId;
```

### Explanation

A `LEFT JOIN` keeps **all records from the left table**, even if there is no matching record in the right table.

---

## 15. Find Employees with Salary Information

### Question

Find employee IDs from `EmployeeDetails` along with matching records from `EmployeeSalary`.

### Answer

```sql
SELECT
    e1.EmpId
FROM EmployeeDetails AS e1
LEFT JOIN EmployeeSalary AS e2
    ON e1.EmpId = e2.EmpId;
```

> Note: The above query returns every employee from `EmployeeDetails`. If you only want employees having salary records, use `INNER JOIN`.

```sql
SELECT
    e1.EmpId
FROM EmployeeDetails AS e1
INNER JOIN EmployeeSalary AS e2
    ON e1.EmpId = e2.EmpId;
```

---

# UNION Questions

## 16. Combine Employee IDs from Two Queries

### Question

Combine employee IDs returned from two different queries and remove duplicates.

### Answer

```sql
SELECT e1.EmpId
FROM EmployeeDetails AS e1
LEFT JOIN EmployeeSalary AS e2
    ON e1.EmpId = e2.EmpId

UNION

SELECT e3.EmpId
FROM EmployeeDetails AS e3
RIGHT JOIN EmployeeDetails AS e4
    ON e3.EmpId = e4.EmpId;
```

### Explanation

`UNION` combines the results of two `SELECT` statements and removes duplicate rows.

> In this particular example, the second query does not add useful information because it joins `EmployeeDetails` with itself on the primary key. A simpler example of `UNION` would be:

```sql
SELECT EmpId
FROM EmployeeDetails
WHERE ManagerId = 100

UNION

SELECT EmpId
FROM EmployeeDetails
WHERE City = 'Kolkata';
```

---

# String Functions

## 17. Replace Spaces with Hyphens

### Question

Replace every space in an employee's full name with a hyphen (`-`).

### Answer

```sql
SELECT
    REPLACE(FullName, ' ', '-') AS NewName
FROM EmployeeDetails;
```

### Example

```text
Prafull Sharma
```

becomes:

```text
Prafull-Sharma
```

---

## 18. Concatenate Employee ID and Manager ID

### Question

Combine `EmpId` and `ManagerId` into a single value called `NewID`.

### Answer

```sql
SELECT
    CONCAT(EmpId, ManagerId) AS NewID
FROM EmployeeDetails;
```

### Example

For:

```text
EmpId = 1
ManagerId = 100
```

the result is:

```text
1100
```

---

# Database Setup

## EmployeeDetails Table

```sql
CREATE TABLE EmployeeDetails
(
    EmpId INT PRIMARY KEY,
    FullName VARCHAR(100),
    ManagerId INT,
    DateOfJoining DATE,
    City VARCHAR(50)
);
```

## EmployeeSalary Table

```sql
CREATE TABLE EmployeeSalary
(
    EmpId INT,
    Project VARCHAR(50),
    Salary INT,
    Variable INT
);
```

---

# Important SQL Concepts Covered

| Concept      | Used In                           |
| ------------ | --------------------------------- |
| `SELECT`     | Basic data retrieval              |
| `WHERE`      | Filtering records                 |
| `AND`        | Multiple conditions               |
| `OR`         | Alternative conditions            |
| `DISTINCT`   | Removing duplicates               |
| `COUNT()`    | Counting records                  |
| `MAX()`      | Finding maximum value             |
| `MIN()`      | Finding minimum value             |
| `AVG()`      | Finding average                   |
| `SUM()`      | Calculating totals                |
| `LIKE`       | Pattern matching                  |
| `NOT IN`     | Excluding matching values         |
| `INNER JOIN` | Matching records from both tables |
| `LEFT JOIN`  | All records from left table       |
| `RIGHT JOIN` | All records from right table      |
| `UNION`      | Combining query results           |
| `REPLACE()`  | Replacing characters              |
| `CONCAT()`   | Combining strings/values          |

---

# Quick Revision

### Filtering

```sql
WHERE Salary >= 9000
```

### Multiple Conditions

```sql
WHERE ManagerId = 100
AND City = 'Jhansi'
```

### OR Condition

```sql
WHERE ManagerId = 100
OR City = 'Jhansi'
```

### Pattern Matching

```sql
WHERE FullName LIKE '_a%'
```

### Aggregation

```sql
SELECT
    MAX(Salary),
    MIN(Salary),
    AVG(Salary),
    SUM(Salary)
FROM EmployeeSalary;
```

### Inner Join

```sql
SELECT *
FROM EmployeeDetails e
INNER JOIN EmployeeSalary s
    ON e.EmpId = s.EmpId;
```

### Left Join

```sql
SELECT *
FROM EmployeeDetails e
LEFT JOIN EmployeeSalary s
    ON e.EmpId = s.EmpId;
```

### Distinct Values

```sql
SELECT DISTINCT Project
FROM EmployeeSalary;
```

### String Replacement

```sql
SELECT REPLACE(FullName, ' ', '-')
FROM EmployeeDetails;
```

### Concatenation

```sql
SELECT CONCAT(EmpId, ManagerId)
FROM EmployeeDetails;
```
