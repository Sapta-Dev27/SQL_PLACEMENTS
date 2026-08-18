# SQL Interview Practice — Employees, Customers & Orders

This README contains **10 SQL interview-style questions** based on the `Employees`, `Customers`, and `Orders` tables.

Each question includes:

- 📌 **Question**
- 💡 **Concept Tested**
- ✅ **Solution**
- 🧠 **Explanation**

---

# 📊 Database Schema

## Employees

| employee_id | employee_name | department | salary | manager_id |
|---:|---|---|---:|---:|
| 101 | Aarav | Engineering | 95000 | 105 |
| 102 | Meera | Engineering | 72000 | 105 |
| 103 | Kabir | Sales | 65000 | 104 |
| 104 | Isha | Sales | 92000 | NULL |
| 105 | Rohan | Engineering | 90000 | NULL |
| 106 | Neha | Sales | 88000 | NULL |

## Customers

| customer_id | customer_name | city |
|---:|---|---|
| 1 | Aditi Sharma | Delhi |
| 2 | Rahul Verma | Mumbai |
| 3 | Simran Kaur | Chandigarh |
| 4 | Arjun Nair | Bengaluru |

## Orders

| order_id | customer_id | amount | status |
|---:|---:|---:|---|
| 501 | 1 | 2400 | Delivered |
| 502 | 1 | 3200 | Delivered |
| 503 | 2 | 1800 | Delivered |
| 504 | 2 | 4100 | Pending |
| 505 | 3 | 950 | Cancelled |

---

# Question 1 — Find Engineering Employees Ordered by Salary

## 📌 Question

**Find all employees who work in the Engineering department and display them in descending order of salary.**

## 💡 Concept Tested

- `WHERE`
- `ORDER BY`
- Filtering rows
- Sorting results

## ✅ Solution

```sql
SELECT 
    employee_id,
    employee_name,
    department,
    salary
FROM Employees
WHERE department = 'Engineering'
ORDER BY salary DESC;
```

## 🧠 Explanation

First, we filter employees using:

```sql
WHERE department = 'Engineering'
```

This keeps only employees from the Engineering department.

Then:

```sql
ORDER BY salary DESC
```

sorts the employees from **highest salary to lowest salary**.

### Expected Result

| employee_id | employee_name | department | salary |
|---:|---|---|---:|
| 101 | Aarav | Engineering | 95000 |
| 105 | Rohan | Engineering | 90000 |
| 102 | Meera | Engineering | 72000 |

---

# Question 2 — Count Employees in Each Department

## 📌 Question

**Find the number of employees in each department.**

## 💡 Concept Tested

- `GROUP BY`
- `COUNT()`
- Aggregate functions

## ✅ Solution

```sql
SELECT
    department,
    COUNT(DISTINCT employee_id) AS employee_count
FROM Employees
GROUP BY department;
```

## 🧠 Explanation

```sql
GROUP BY department
```

creates one group for each department.

For example:

```text
Engineering → Aarav, Meera, Rohan
Sales       → Kabir, Isha, Neha
```

Then:

```sql
COUNT(DISTINCT employee_id)
```

counts the employees inside each department.

### Expected Result

| department | employee_count |
|---|---:|
| Engineering | 3 |
| Sales | 3 |

> Since `employee_id` is a primary key, `COUNT(employee_id)` would also work here. `DISTINCT` simply makes the intention of counting unique employees explicit.

---

# Question 3 — Find the Second Highest Salary

## 📌 Question

**Find the second highest salary among all employees.**

## 💡 Concept Tested

- Subquery
- `MAX()`
- `NOT IN`

## ✅ Solution

```sql
SELECT 
    MAX(salary) AS second_highest_salary
FROM Employees
WHERE salary NOT IN (
    SELECT MAX(salary)
    FROM Employees
);
```

## 🧠 Explanation

The inner query:

```sql
SELECT MAX(salary)
FROM Employees;
```

finds the highest salary.

Here:

```text
Highest salary = 95000
```

The outer query removes that salary:

```sql
WHERE salary NOT IN (95000)
```

Then `MAX(salary)` finds the highest salary remaining.

Therefore:

```text
Second highest salary = 92000
```

### Expected Result

| second_highest_salary |
|---:|
| 92000 |

## ⭐ Important

This approach works when we want the **second distinct highest salary**.

For example:

```text
95000
95000
92000
90000
```

The answer would still be:

```text
92000
```

---

# Question 4 — Employees Earning More Than the Average Salary

## 📌 Question

**Find all employees whose salary is greater than the average salary of all employees.**

## 💡 Concept Tested

- `AVG()`
- Subquery
- `WHERE`

## ✅ Solution

```sql
SELECT 
    employee_id,
    employee_name,
    department,
    salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);
```

## 🧠 Explanation

The subquery:

```sql
SELECT AVG(salary)
FROM Employees;
```

calculates the average salary of all employees.

The outer query then selects employees whose salary is greater than that average:

```sql
WHERE salary > average_salary
```

### Expected Result

| employee_id | employee_name | department | salary |
|---:|---|---|---:|
| 101 | Aarav | Engineering | 95000 |
| 104 | Isha | Sales | 92000 |
| 105 | Rohan | Engineering | 90000 |
| 106 | Neha | Sales | 88000 |

---

# Question 5 — Find the Highest-Paid Employee in Each Department

## Question 5A — With Employee Names

### 📌 Question

**Find the highest-paid employee from each department. If multiple employees have the same highest salary, return all of them.**

## 💡 Concept Tested

- Correlated subquery
- `MAX()`
- Finding maximum value within each group

## ✅ Solution

```sql
SELECT 
    e1.employee_id,
    e1.employee_name,
    e1.department,
    e1.salary
FROM Employees AS e1
WHERE e1.salary IN (
    SELECT MAX(e2.salary)
    FROM Employees AS e2
    WHERE e1.department = e2.department
);
```

## 🧠 Explanation

The inner query finds the maximum salary **for the department of the current employee**.

For example:

```sql
WHERE e1.department = e2.department
```

means:

> Find the maximum salary among employees belonging to the same department as `e1`.

### Engineering

```text
Aarav → 95000
Rohan → 90000
Meera → 72000

Maximum = 95000
```

### Sales

```text
Isha  → 92000
Neha  → 88000
Kabir → 65000

Maximum = 92000
```

The outer query then returns the employee whose salary matches that departmental maximum.

### Expected Result

| employee_id | employee_name | department | salary |
|---:|---|---|---:|
| 101 | Aarav | Engineering | 95000 |
| 104 | Isha | Sales | 92000 |

## ⭐ Why Does This Handle Ties?

Suppose Engineering had:

```text
Aarav → 95000
Rohan → 95000
Meera → 72000
```

Both Aarav and Rohan have the department's maximum salary.

Because we use:

```sql
WHERE e1.salary IN (...)
```

**both employees would be returned.**

---

# Question 5B — Highest Salary of Each Department

## 📌 Question

**Find the highest salary in each department.**

## 💡 Concept Tested

- `GROUP BY`
- `MAX()`
- Aggregate functions

## ✅ Solution

```sql
SELECT 
    department,
    MAX(salary) AS highest_salary_dept
FROM Employees
GROUP BY department;
```

## 🧠 Explanation

```sql
GROUP BY department
```

creates separate groups:

```text
Engineering
Sales
```

Then:

```sql
MAX(salary)
```

finds the maximum salary inside each group.

### Expected Result

| department | highest_salary_dept |
|---|---:|
| Engineering | 95000 |
| Sales | 92000 |

## 🔑 Difference Between 5A and 5B

### 5A

Returns the **employee details**:

```text
employee_id
employee_name
department
salary
```

### 5B

Returns only:

```text
department
highest salary
```

---

# Question 6 — Find Managers Who Earn More Than Their Employees

## 📌 Question

**Find managers whose salary is greater than the salary of their employees.**

## 💡 Concept Tested

- Self Join
- Joining a table with itself
- Table aliases
- Comparing rows from the same table

## ✅ Solution

```sql
SELECT 
    manager.employee_id AS manager_id,
    manager.employee_name AS manager_name,
    employee.employee_id AS employee_id,
    employee.employee_name AS employee_name,
    manager.salary AS manager_salary,
    employee.salary AS employee_salary,
    employee.department
FROM Employees AS manager
JOIN Employees AS employee
    ON manager.employee_id = employee.manager_id
WHERE manager.salary > employee.salary;
```

## 🧠 Explanation

We use the `Employees` table **twice**:

```sql
Employees AS manager
```

and:

```sql
Employees AS employee
```

This is called a **Self Join**.

The important condition is:

```sql
ON manager.employee_id = employee.manager_id
```

This means:

> Match a manager's `employee_id` with an employee's `manager_id`.

For example:

```text
Rohan = employee_id 105
```

Aarav has:

```text
manager_id = 105
```

So Rohan is Aarav's manager.

Then we compare:

```text
Rohan salary = 90000
Aarav salary = 95000
```

Since:

```text
90000 < 95000
```

Rohan is not included.

For Sales:

```text
Isha = 92000
Kabir = 65000
```

Since:

```text
92000 > 65000
```

Isha is included.

### Expected Result

| manager_id | manager_name | employee_id | employee_name | manager_salary | employee_salary | department |
|---:|---|---:|---|---:|---:|---|
| 104 | Isha | 103 | Kabir | 92000 | 65000 | Sales |

## ⭐ Important Self Join Pattern

Remember this pattern:

```sql
FROM Employees AS manager
JOIN Employees AS employee
    ON manager.employee_id = employee.manager_id
```

It allows us to compare **two different rows from the same table**.

---

# Question 7 — Display All Orders With Customer Information

## 📌 Question

**Display every order along with the corresponding customer's ID, name, and city.**

## 💡 Concept Tested

- `JOIN`
- `LEFT JOIN`
- Foreign key relationship

## ✅ Solution

```sql
SELECT 
    o.order_id,
    c.customer_id,
    c.customer_name,
    c.city
FROM Orders AS o
LEFT JOIN Customers AS c
    ON o.customer_id = c.customer_id;
```

## 🧠 Explanation

The relationship is:

```text
Customers.customer_id
        ↓
Orders.customer_id
```

We join the two tables using:

```sql
ON o.customer_id = c.customer_id
```

Because the query starts with:

```sql
FROM Orders AS o
```

and uses:

```sql
LEFT JOIN Customers AS c
```

all orders are preserved.

### Expected Result

| order_id | customer_id | customer_name | city |
|---:|---:|---|---|
| 501 | 1 | Aditi Sharma | Delhi |
| 502 | 1 | Aditi Sharma | Delhi |
| 503 | 2 | Rahul Verma | Mumbai |
| 504 | 2 | Rahul Verma | Mumbai |
| 505 | 3 | Simran Kaur | Chandigarh |

---

# Question 8 — Find Customers Who Have Never Placed an Order

## 📌 Question

**Find all customers who have never placed an order.**

## 💡 Concept Tested

- `LEFT JOIN`
- `NULL`
- Finding unmatched rows

## ✅ Solution

```sql
SELECT 
    c.customer_id,
    c.customer_name,
    c.city
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
```

## 🧠 Explanation

We start with:

```sql
FROM Customers AS c
```

because we want **all customers**, including those without orders.

Then:

```sql
LEFT JOIN Orders AS o
```

keeps every customer.

If a customer has no matching order, the order columns become:

```text
NULL
```

Therefore:

```sql
WHERE o.order_id IS NULL
```

finds customers who have never placed an order.

### Expected Result

| customer_id | customer_name | city |
|---:|---|---|
| 4 | Arjun Nair | Bengaluru |

## ⭐ Important Pattern

This is a very common SQL interview pattern:

```sql
LEFT JOIN
WHERE right_table.id IS NULL
```

It means:

> Find records from the left table that have **no matching record** in the right table.

---

# Question 9 — Customers With More Than One Order

## 📌 Question

**Find customers who have placed more than one order.**

## 💡 Concept Tested

- `LEFT JOIN`
- `GROUP BY`
- `HAVING`
- `COUNT()`

## ✅ Solution

```sql
SELECT 
    c.customer_id,
    c.customer_name
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id,
    c.customer_name
HAVING COUNT(DISTINCT o.order_id) > 1;
```

## 🧠 Explanation

First, the `JOIN` connects customers with their orders.

For example:

```text
Aditi Sharma → Order 501
Aditi Sharma → Order 502

Rahul Verma → Order 503
Rahul Verma → Order 504
```

Then:

```sql
GROUP BY c.customer_id, c.customer_name
```

creates one group for each customer.

Then:

```sql
COUNT(DISTINCT o.order_id)
```

counts the number of unique orders for each customer.

Finally:

```sql
HAVING COUNT(DISTINCT o.order_id) > 1
```

keeps only customers with more than one order.

### Expected Result

| customer_id | customer_name |
|---:|---|
| 1 | Aditi Sharma |
| 2 | Rahul Verma |

## ⭐ WHERE vs HAVING

A very important interview concept:

### `WHERE`

**Filters rows before grouping.**

```sql
WHERE salary > 50000
```

### `HAVING`

**Filters groups after `GROUP BY`.**

```sql
HAVING COUNT(order_id) > 1
```

Since `COUNT()` is an aggregate function, we use `HAVING`.

---

# Question 10 — Find the Customer With the Highest Total Order Amount

## 📌 Question

**Find the customer who has spent the highest total amount across all their orders.**

## 💡 Concept Tested

- `JOIN`
- `GROUP BY`
- `SUM()`
- `ORDER BY`
- `TOP 1`

## ✅ Solution

```sql
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(o.amount) AS total_amount
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id,
    c.customer_name
ORDER BY total_amount DESC
LIMIT 1;
```

## 🧠 Explanation

First, customers are joined with their orders.

Then:

```sql
GROUP BY 
    c.customer_id,
    c.customer_name
```

creates one group for each customer.

Next:

```sql
SUM(o.amount)
```

calculates the total order amount for each customer.

### Aditi Sharma

```text
2400 + 3200 = 5600
```

### Rahul Verma

```text
1800 + 4100 = 5900
```

### Simran Kaur

```text
950
```

Then:

```sql
ORDER BY total_amount DESC
```

sorts customers from highest total amount to lowest.

Finally:

```sql
TOP 1
```

returns only the first customer.

### Expected Result

| customer_id | customer_name | total_amount |
|---:|---|---:|
| 2 | Rahul Verma | 5900 |

---

# 🧠 Important SQL Concepts Covered

| Question | Main Concept |
|---|---|
| Q1 | `WHERE`, `ORDER BY` |
| Q2 | `GROUP BY`, `COUNT()` |
| Q3 | Subquery, `MAX()` |
| Q4 | Subquery, `AVG()` |
| Q5A | Correlated Subquery |
| Q5B | `GROUP BY`, `MAX()` |
| Q6 | Self Join |
| Q7 | `LEFT JOIN` |
| Q8 | `LEFT JOIN` + `IS NULL` |
| Q9 | `GROUP BY` + `HAVING` |
| Q10 | `GROUP BY` + `SUM()` + `TOP 1` |

---

# 🔥 SQL Interview Patterns to Remember

## 1. Filter Rows

```sql
SELECT *
FROM Employees
WHERE salary > 50000;
```

Use `WHERE` when filtering individual rows.

---

## 2. Group Rows

```sql
SELECT department, COUNT(*)
FROM Employees
GROUP BY department;
```

Use `GROUP BY` when you want to perform calculations for each group.

---

## 3. Filter Groups

```sql
SELECT department, COUNT(*)
FROM Employees
GROUP BY department
HAVING COUNT(*) > 2;
```

Use `HAVING` when filtering the result of an aggregate/group.

---

## 4. Find Maximum Value

```sql
SELECT MAX(salary)
FROM Employees;
```

---

## 5. Find Maximum Value Per Group

```sql
SELECT department, MAX(salary)
FROM Employees
GROUP BY department;
```

---

## 6. Find Records Without a Match

```sql
SELECT c.*
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
```

This is a very common interview pattern.

---

## 7. Count Records Per Group

```sql
SELECT customer_id, COUNT(order_id)
FROM Orders
GROUP BY customer_id;
```

---

## 8. Self Join

```sql
SELECT *
FROM Employees AS e1
JOIN Employees AS e2
    ON e1.employee_id = e2.manager_id;
```

Useful when a table has a relationship with **itself**, such as:

```text
Employee → Manager
```

---



# DBMS Interview Preparation — Questions 11 to 15

> Easy, practical and interview-focused notes for SWE interviews.

---

## 11. A table has 100 million records. You want to remove all rows as quickly as possible while keeping the table. Which SQL command will you use?

### Answer

Use `TRUNCATE TABLE`.

    TRUNCATE TABLE Employees;

`TRUNCATE` removes all rows from the table but **keeps the table structure**.

### Why TRUNCATE?

- Removes all rows quickly
- Keeps the table structure
- Generally faster than `DELETE` for clearing an entire table
- Does not require a `WHERE` condition

### TRUNCATE vs DELETE

| DELETE | TRUNCATE |
|---|---|
| Can delete selected rows | Removes all rows |
| Supports `WHERE` | Does not support `WHERE` |
| Generally processes row deletions | Typically removes/deallocates data pages more directly |
| Usually slower for full-table cleanup | Usually faster for full-table cleanup |
| DELETE triggers may fire | DELETE triggers generally do not fire |
| Transaction behavior depends on DBMS | Transaction behavior depends on DBMS |

### Interview Answer

> "If I need to remove all 100 million rows while keeping the table structure, I would use TRUNCATE TABLE. It is generally faster than DELETE for full-table cleanup because it can deallocate data pages more efficiently."

### Important Point

Do not blindly say:

> "TRUNCATE can never be rolled back."

Rollback behavior is **database-dependent**.

### Remember

> **TRUNCATE = Remove all data, keep the table**

---

## 12. A new intern should only be able to view the Employees table but should not modify it. Which SQL command will you use?

### Answer

Use the `GRANT` statement to give the intern only `SELECT` permission.

    GRANT SELECT ON Employees TO intern_user;

This allows the user to read data from the `Employees` table.

Do not give:

    INSERT
    UPDATE
    DELETE

permissions if the user should only be able to view the data.

### Example

    GRANT SELECT ON Employees TO intern_user;

Now:

    SELECT * FROM Employees;

will be allowed.

But operations such as:

    UPDATE Employees
    SET salary = 50000;

should not be allowed if the user has no `UPDATE` privilege.

### Interview Answer

> "I would use GRANT to provide the intern with only SELECT permission on the Employees table. This follows the principle of least privilege, meaning the user receives only the permissions required for their job."

### Important Interview Concept: Principle of Least Privilege

Give a user **only the minimum permissions they actually need**.

For example:

    Intern
      ↓
    SELECT only

    Developer
      ↓
    SELECT + INSERT + UPDATE

    Admin
      ↓
    Higher-level privileges

### Remember

> **GRANT = Give permission**

---

## 13. An alias created in the SELECT list cannot be referenced in the WHERE clause of the same query. How does SQL's logical execution order explain this?

### The Problem

Consider:

    SELECT
        salary * 12 AS annual_salary
    FROM Employees
    WHERE annual_salary > 600000;

In many SQL databases, this is invalid.

### Why?

Because of SQL's **logical query processing order**.

Conceptually, SQL processes the query like this:

    FROM
      ↓
    WHERE
      ↓
    GROUP BY
      ↓
    HAVING
      ↓
    SELECT
      ↓
    ORDER BY

The `WHERE` clause is evaluated **before** the `SELECT` list.

Therefore, when `WHERE` is evaluated:

    annual_salary

has not been created yet.

The alias is created when the `SELECT` list is evaluated later.

### Correct Approach

Repeat the expression:

    SELECT
        salary * 12 AS annual_salary
    FROM Employees
    WHERE salary * 12 > 600000;

Or use a subquery:

    SELECT *
    FROM (
        SELECT
            salary * 12 AS annual_salary
        FROM Employees
    ) AS t
    WHERE annual_salary > 600000;

Or use a CTE:

    WITH employee_salary AS (
        SELECT
            salary * 12 AS annual_salary
        FROM Employees
    )
    SELECT *
    FROM employee_salary
    WHERE annual_salary > 600000;

### Important Exception

A SELECT alias can generally be used in `ORDER BY` because `ORDER BY` is logically processed after `SELECT`.

Example:

    SELECT
        salary * 12 AS annual_salary
    FROM Employees
    ORDER BY annual_salary DESC;

### Interview Answer

> "A SELECT alias generally cannot be used in the WHERE clause because WHERE is logically evaluated before SELECT. The alias does not exist yet when WHERE is processed. If I need to filter using that calculated value, I can repeat the expression or use a subquery or CTE."

### Remember

> **WHERE happens before SELECT → SELECT alias is not available in WHERE**

---

## 14. A ranking query contains duplicate salaries. How will ROW_NUMBER(), RANK(), and DENSE_RANK() assign values differently?

Suppose we have:

| Employee | Salary |
|---|---:|
| Aman | 90000 |
| Neha | 80000 |
| Ravi | 80000 |
| Simran | 70000 |

Query:

    SELECT
        employee,
        salary,
        ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_no,
        RANK() OVER (ORDER BY salary DESC) AS rank_no,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_no
    FROM Employees;

### Result

| Employee | Salary | ROW_NUMBER | RANK | DENSE_RANK |
|---|---:|---:|---:|---:|
| Aman | 90000 | 1 | 1 | 1 |
| Neha | 80000 | 2 | 2 | 2 |
| Ravi | 80000 | 3 | 2 | 2 |
| Simran | 70000 | 4 | 4 | 3 |

### 1. ROW_NUMBER()

Gives every row a **unique sequential number**.

Even if salaries are equal:

    80000 → 2
    80000 → 3

There is no tie in the row numbers.

### 2. RANK()

Rows with the same salary get the **same rank**.

But after a tie, it **skips ranks**.

    90000 → 1
    80000 → 2
    80000 → 2
    70000 → 4

Rank `3` is skipped.

### 3. DENSE_RANK()

Rows with the same salary get the **same rank**, but there are **no gaps**.

    90000 → 1
    80000 → 2
    80000 → 2
    70000 → 3

### Easy Comparison

| Function | Handles Ties? | Gaps After Tie? |
|---|---|---|
| `ROW_NUMBER()` | No, each row gets a unique number | No |
| `RANK()` | Yes | Yes |
| `DENSE_RANK()` | Yes | No |

### Easy Memory Trick

> **ROW_NUMBER → Everyone gets a different number**

> **RANK → Same rank for ties, but gaps**

> **DENSE_RANK → Same rank for ties, no gaps**

### Interview Answer

> "`ROW_NUMBER()` assigns a unique sequential number to every row, even when values are tied. `RANK()` gives the same rank to tied values but leaves gaps after the tie. `DENSE_RANK()` also gives the same rank to tied values, but it does not leave gaps."

### Real-World Use Cases

**ROW_NUMBER()**

Useful when you need to select one specific row from each group.

**RANK()**

Useful when competition-style ranking matters and ties should create gaps.

**DENSE_RANK()**

Useful when you want ranking based on distinct values without gaps.

---

## 15. A table contains duplicate and NULL email values. How will COUNT(*), COUNT(email), and COUNT(DISTINCT email) differ?

Suppose the table contains:

| id | email |
|---:|---|
| 1 | a@gmail.com |
| 2 | b@gmail.com |
| 3 | a@gmail.com |
| 4 | NULL |
| 5 | NULL |

Now consider:

    SELECT
        COUNT(*) AS total_rows,
        COUNT(email) AS non_null_emails,
        COUNT(DISTINCT email) AS unique_non_null_emails
    FROM Customers;

### 1. COUNT(*)

`COUNT(*)` counts **every row**, including rows containing NULL values.

For the example:

    COUNT(*) = 5

### 2. COUNT(email)

`COUNT(email)` counts only rows where `email` is **NOT NULL**.

NULL values are ignored.

For the example:

    COUNT(email) = 3

because:

    a@gmail.com
    b@gmail.com
    a@gmail.com

are the three non-NULL values.

### 3. COUNT(DISTINCT email)

`COUNT(DISTINCT email)` counts only **unique non-NULL email values**.

The values are:

    a@gmail.com
    b@gmail.com
    a@gmail.com

Unique values:

    a@gmail.com
    b@gmail.com

Therefore:

    COUNT(DISTINCT email) = 2

### Final Result

| Function | Result | What it counts |
|---|---:|---|
| `COUNT(*)` | 5 | Every row |
| `COUNT(email)` | 3 | Non-NULL email values |
| `COUNT(DISTINCT email)` | 2 | Unique non-NULL email values |

### Interview Answer

> "`COUNT(*)` counts every row, including rows where email is NULL. `COUNT(email)` counts only non-NULL email values. `COUNT(DISTINCT email)` counts only unique non-NULL email values, so duplicates and NULLs are excluded."

### Easy Memory

> **COUNT(*) → All rows**

> **COUNT(column) → Non-NULL values**

> **COUNT(DISTINCT column) → Unique non-NULL values**

---

# 🎯 Quick Interview Cheat Sheet

| Question | Key Concept | Easy Memory |
|---|---|---|
| **11. Remove 100M rows** | `TRUNCATE` | Remove all data, keep table |
| **12. Give intern read-only access** | `GRANT SELECT` | Give only required permission |
| **13. SELECT alias in WHERE** | Logical execution order | WHERE happens before SELECT |
| **14. ROW_NUMBER vs RANK vs DENSE_RANK** | Window functions | Unique vs gaps vs no gaps |
| **15. COUNT variations** | Aggregate functions | All vs non-NULL vs unique |

---

# 🔥 SWE Interview Tip

For these questions, don't stop at the definition.

Try to answer using:

> **Definition → How it works → Small example → Important difference/trade-off**

For example:

**Interviewer:** "What's the difference between RANK and DENSE_RANK?"

A strong answer would be:

> "Both assign the same rank to tied values. The difference is that RANK leaves gaps after a tie, while DENSE_RANK does not. For example, if two employees are ranked second, the next employee gets rank 4 with RANK but rank 3 with DENSE_RANK."

That sounds much stronger than simply memorizing:

> "RANK has gaps and DENSE_RANK doesn't."

---

# 🧠 Most Important Things to Remember

    TRUNCATE
    → Remove all rows
    → Keep table structure

    GRANT SELECT
    → Give read-only access

    WHERE
    → Comes before SELECT logically
    → Cannot generally use SELECT aliases

    ROW_NUMBER
    → Unique number for every row

    RANK
    → Same rank for ties
    → Gaps exist

    DENSE_RANK
    → Same rank for ties
    → No gaps

    COUNT(*)
    → Counts every row

    COUNT(column)
    → Counts non-NULL values

    COUNT(DISTINCT column)
    → Counts unique non-NULL values
