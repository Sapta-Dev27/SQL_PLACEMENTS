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

# ⚠️ SQL Dialect Note

The Question 10 solution uses:

```sql
TOP 1
