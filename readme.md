# DBMS Interview Preparation 🚀

> Short, easy and interview-focused DBMS notes for SWE interviews.

## 1. What is SQL?

**SQL (Structured Query Language)** is used to communicate with and manage relational databases.

It is used for:
- Creating data
- Retrieving data
- Updating data
- Deleting data
- Managing relationships and transactions

**Interview Answer:**  
> SQL is a standard language used to interact with relational databases and perform operations such as storing, retrieving, updating and deleting structured data.

**Why SQL instead of files?**  
> Databases provide efficient querying, indexing, concurrency control, transactions, security and data integrity, which become difficult to manage manually with files.

---

## 2. SQL vs NoSQL

| SQL | NoSQL |
|---|---|
| Relational | Non-relational |
| Tables & rows | Documents, key-value, graph, etc. |
| Usually predefined schema | Flexible schema |
| Strong relationships | Flexible data models |
| MySQL, PostgreSQL | MongoDB, Redis |

**Interview Answer:**  
> SQL is generally preferred when we have structured data, relationships and strong transaction or consistency requirements. NoSQL can be useful when we need flexible data models, high scalability or distributed storage.

**Important:**  
> Neither is universally better. The choice depends on the data model, consistency requirements, query patterns and scalability needs.

---

## 3. Explain ACID Properties

ACID ensures reliable database transactions.

- **Atomicity** → All or nothing
- **Consistency** → Database rules remain valid
- **Isolation** → Concurrent transactions don't incorrectly interfere
- **Durability** → Committed changes survive failures

**Interview Answer:**  
> ACID represents four properties that make database transactions reliable. Atomicity means all operations succeed or none do. Consistency means database rules remain valid. Isolation prevents concurrent transactions from incorrectly interfering. Durability ensures committed changes survive failures.

**Example:**  
> In a bank transfer, money should either be deducted from one account and added to another together, or the entire transaction should be rolled back.

---

## 4. What is a Primary Key?

A **Primary Key uniquely identifies each row** in a table.

**Properties:**
- Unique
- Cannot be `NULL`
- One primary-key constraint per table
- Can contain multiple columns → Composite Key

**Interview Answer:**  
> A primary key is a column or combination of columns that uniquely identifies each record in a table and maintains entity integrity.

---

## 5. What is a Foreign Key?

A **Foreign Key establishes a relationship between tables**.

**Interview Answer:**  
> A foreign key is a column or combination of columns that references a key in another table and helps maintain referential integrity.

---

## 6. What is Referential Integrity?

Referential integrity ensures that a **foreign key refers to a valid existing record**.

**Example:**

Students:
- 101 → Rahul
- 102 → Amit

Orders:
- 101 → Valid
- 999 → Invalid if student 999 doesn't exist

**Interview Answer:**  
> Referential integrity ensures that relationships between tables remain valid and prevents invalid or orphan references.

**Easy Memory:**

> Primary Key → Parent  
> Foreign Key → Child  
> Referential Integrity → Child cannot reference a non-existent parent.

---

## 7. What is Normalization?

**Normalization** is the process of organizing data into related tables to reduce redundancy and improve data integrity.

**Benefits:**
- Reduces duplicate data
- Improves consistency
- Easier maintenance
- Prevents anomalies

**Common Anomalies:**
- Update Anomaly
- Insert Anomaly
- Delete Anomaly

**Normal Forms:**
- **1NF** → Atomic values
- **2NF** → No partial dependency
- **3NF** → No transitive dependency

**Interview Answer:**  
> Normalization is the process of organizing data into related tables to reduce redundancy and improve data integrity while preventing insertion, update and deletion anomalies.

---

## 8. What is Denormalization?

**Denormalization** intentionally introduces some redundancy to improve read performance.

**Useful when:**
- Application is read-heavy
- Frequent JOINs are expensive
- Faster reads are more important than minimizing storage

**Trade-off:**
- Faster reads
- More storage
- More complex updates

**Interview Answer:**  
> Denormalization intentionally duplicates some data to reduce joins and improve read performance, especially in read-heavy systems.

---

## 9. INNER JOIN vs LEFT JOIN vs RIGHT JOIN

### INNER JOIN
Returns **only matching rows** from both tables.

### LEFT JOIN
Returns **all rows from the left table + matching rows from the right table**.

### RIGHT JOIN
Returns **all rows from the right table + matching rows from the left table**.

**Easy Memory:**

> INNER → Matching only  
> LEFT → Keep LEFT  
> RIGHT → Keep RIGHT

**Interview Answer:**  
> INNER JOIN returns only matching records. LEFT JOIN keeps every record from the left table and adds matching records from the right. RIGHT JOIN does the opposite.

**Interview Tip:**  
> A RIGHT JOIN can usually be rewritten as a LEFT JOIN by swapping the table order.

---

## 10. What is a Self JOIN?

A **Self JOIN joins a table with itself** using aliases.

**Common Example:** Employee → Manager

Suppose an `Employees` table has:

- `id`
- `name`
- `manager_id`

We can join the table to itself to find each employee's manager.

**Interview Answer:**  
> A self join is when a table is joined with itself using different aliases. It is useful for hierarchical relationships such as employees and managers.

**Remember:**

> Self JOIN = Same table + Different aliases

---

## 11. What is a Subquery?

A **subquery is a query inside another query**.

**Example:**

Find employees earning more than the average salary:

> The inner query calculates the average salary, and the outer query finds employees whose salary is greater than that value.

**Interview Answer:**  
> A subquery is a query nested inside another query. Its result can be used by the outer query for filtering, comparison or other operations.

---

## 12. Subquery vs JOIN

**JOIN:**
> Mainly used to combine related data from multiple tables.

**Subquery:**
> A query inside another query, often used to provide values for filtering or comparison.

**Interview Answer:**  
> A JOIN combines related data from multiple tables, while a subquery is a nested query whose result is used by the outer query.

**Strong Follow-up:**  
> Often the same problem can be solved using either approach. The choice depends on readability, query semantics, performance and the database optimizer.

---

## 13. UNION vs UNION ALL

**UNION:**
> Combines result sets and removes duplicate rows.

**UNION ALL:**
> Combines result sets and keeps duplicate rows.

**Easy Memory:**

> UNION → Remove duplicates  
> UNION ALL → Keep all rows

**Interview Answer:**  
> UNION removes duplicate rows from combined result sets, while UNION ALL keeps duplicates. UNION ALL is generally faster when duplicate removal isn't required.

**Example:**

Query 1:
- Rahul
- Amit

Query 2:
- Amit
- Priya

**UNION:**
- Rahul
- Amit
- Priya

**UNION ALL:**
- Rahul
- Amit
- Amit
- Priya

---

## 14. What is an Alias?

An **alias is a temporary name** given to a table or column within a query.

**Table Alias:**

> `Employees e`

Here, `e` is the temporary alias for `Employees`.

**Column Alias:**

> `salary AS monthly_salary`

Here, `monthly_salary` is the temporary name for `salary` in the query result.

**Why use aliases?**
- Shorter queries
- Better readability
- Useful in JOINs
- Essential for Self JOINs
- Helps distinguish columns from different tables

**Interview Answer:**  
> An alias is a temporary name assigned to a table or column within a SQL query. It improves readability and is especially useful when the same table is referenced multiple times, such as in a self join.

**Important:**  
> An alias does not change the actual database schema.

---
# DBMS Interview Preparation 🚀

> Interview-focused notes for the DBMS questions I studied today — Questions 15 onwards.

---

## 15. What is the difference between a Stored Procedure and a Function?

### Stored Procedure

A **stored procedure** is a set of SQL statements stored in the database that can be executed when needed.

It can:
- Accept input parameters
- Use output parameters
- Perform `INSERT`, `UPDATE`, `DELETE`, etc.
- Execute multiple database operations

### Function

A **function** is generally designed to **return a value** and is commonly used for calculations or transformations.

### Interview Answer

> A stored procedure is mainly used to perform database operations and may have input/output parameters, while a function is generally designed to return a value. Functions can often be used inside SQL expressions such as `SELECT` or `WHERE`, while procedures are normally invoked separately. Exact capabilities depend on the database system.

### Easy Memory

> **Procedure → Perform operations**  
> **Function → Return a value**

---

## 16. How do you optimize a slow-performing SQL query?

Don't immediately say **"add an index."**

Follow a systematic approach:

1. Analyze the **execution plan** using `EXPLAIN` or DBMS-specific tools.
2. Check whether appropriate **indexes** exist.
3. Reduce unnecessary **rows and columns**.
4. Optimize **JOINs and subqueries**.
5. Check statistics, locking and database resources.
6. Measure the query again after optimization.

### Interview Answer

> I would first analyze the execution plan to identify the bottleneck. Then I would check indexes, reduce unnecessary data, optimize joins or subqueries, and investigate database resources or locking if necessary. Finally, I would benchmark the query again to verify that the optimization actually improved performance.

### Strong Interview Point

> **Don't assume an optimization worked — measure it.**

---

## 17. What is an Index, and why is it important?

An **index is a database data structure used to speed up data retrieval**.

### Simple Example

Think of a book:

> Without an index → Search through many pages  
> With an index → Locate the topic quickly

For example, if we frequently run a query like:

    SELECT *
    FROM Employees
    WHERE employee_id = 101;

An appropriate index on `employee_id` can make this lookup much faster.

### Interview Answer

> An index is a data structure maintained by the database to speed up data retrieval. It allows the database to locate matching rows more efficiently instead of scanning the entire table.

### Trade-offs

Indexes:
- Improve read performance
- Consume additional storage
- Add overhead to `INSERT`, `UPDATE` and `DELETE`

### Interview Tip

> Don't create an index on every column. Index based on actual query patterns and workload.

---

## 18. What is a Clustered Index and a Non-Clustered Index?

### Clustered Index

A **clustered index determines how table data is organized according to the indexed key**, depending on the DBMS.

A table can generally have **only one clustered organization**.

### Non-Clustered Index

A **non-clustered index is a separate index structure** that stores indexed values and references to the corresponding table rows.

A table can have **multiple non-clustered indexes**.

### Simple Understanding

Think about a library.

**Clustered:**

The books themselves are organized according to a particular order.

**Non-Clustered:**

There is a separate index that tells you where each book is located.

### Interview Answer

> A clustered index determines how the table's data is organized according to the indexed key, so there can generally be only one clustered organization per table. A non-clustered index is a separate structure that points to the underlying rows, so a table can have multiple non-clustered indexes.

> **Note:** Exact implementation details vary between database systems.

---

## 19. What is the difference between a Super Key, Candidate Key and Primary Key?

### Super Key

A **super key** is any set of columns that can uniquely identify a row.

For example, if `student_id` and `email` are unique:

    {student_id}
    {email}
    {student_id, name}

can all be super keys.

Even `{student_id, name}` is a super key, although `name` is unnecessary because `student_id` already uniquely identifies the row.

### Candidate Key

A **candidate key is a minimal super key**.

It uniquely identifies a row without containing unnecessary attributes.

### Primary Key

The **primary key is the candidate key selected as the main identifier** for the table.

### Relationship

    Super Keys
         ↓
    Candidate Keys
         ↓
    One chosen as Primary Key

### Interview Answer

> A super key is any set of attributes that uniquely identifies a row. A candidate key is a minimal super key with no unnecessary attributes. The primary key is the candidate key selected as the main identifier for the table.

### Easy Memory

> **Super Key → Any unique combination**  
> **Candidate Key → Minimal unique combination**  
> **Primary Key → Chosen candidate key**

---

## 20. What is a Trigger in SQL, and how is it used?

A **trigger** is a database mechanism that automatically executes when a specified event occurs.

Common events include:

- `INSERT`
- `UPDATE`
- `DELETE`

### Example Use Case

Suppose an employee's salary changes:

    UPDATE Employee
           ↓
        Trigger
           ↓
    Insert record into Audit_Log

The trigger can automatically create an audit record.

### Common Uses

- Audit logging
- Tracking changes
- Enforcing certain database-level rules
- Maintaining related data

### Interview Answer

> A trigger is a database mechanism that automatically executes a predefined action when a specified event occurs, such as `INSERT`, `UPDATE` or `DELETE`. It can be useful for auditing, enforcing certain database-level rules and maintaining related data.

### Important Trade-off

> Triggers can make application behavior harder to trace because some operations happen implicitly, so they should be used carefully.

---

## 21. Explain the Concept of Database Transactions

A **transaction is a group of database operations treated as one logical unit of work**.

### Example: Bank Transfer

Suppose Rahul transfers ₹1000 to Amit.

Two operations are required:

    1. Rahul's balance → -₹1000
    2. Amit's balance  → +₹1000

Both operations should succeed together.

If successful:

    COMMIT;

If something goes wrong:

    ROLLBACK;

### Interview Answer

> A database transaction is a sequence of one or more operations treated as a single logical unit of work. The transaction either commits successfully or is rolled back, and database systems use ACID properties to ensure reliable transaction behavior.

### Why Do We Need Transactions?

> Transactions prevent related operations from leaving the database in an inconsistent state if something fails midway.

### Real-World Example

In a banking system, we don't want money to be deducted from one account without being credited to the other.

---

## 22. What is the difference between a UNIQUE Constraint and a PRIMARY KEY Constraint?

Both can enforce uniqueness, but they have different purposes.

| PRIMARY KEY | UNIQUE |
|---|---|
| Main identifier of a row | Enforces uniqueness |
| Cannot be `NULL` | NULL behavior depends on DBMS |
| One primary-key constraint per table | Multiple UNIQUE constraints allowed |
| Commonly referenced by foreign keys | Can be referenced where supported |

### Example

A `Users` table might have:

    id        → PRIMARY KEY
    email     → UNIQUE
    username  → UNIQUE

Here:

- `id` is the main identity of the user.
- `email` must be unique.
- `username` must also be unique.

### Interview Answer

> Both primary keys and unique constraints enforce uniqueness, but a primary key is the main identifier for each row and cannot be `NULL`. A table can have multiple unique constraints, while it has only one primary-key constraint.

### Easy Memory

> **PRIMARY KEY → Main identity**  
> **UNIQUE → Additional uniqueness rule**

---

## 23. How do you handle NULL values in SQL?

`NULL` represents **missing, unknown or absent information**.

It is not the same as:

- `0`
- `''`
- `FALSE`

### Checking NULL

Use:

    WHERE email IS NULL;

or:

    WHERE email IS NOT NULL;

### Don't Use

    WHERE email = NULL;

This does not work as expected.

### Replacing NULL

Use `COALESCE()`:

    SELECT COALESCE(phone, 'Not Provided')
    FROM Users;

If `phone` is `NULL`, the query returns:

    Not Provided

### Interview Answer

> NULL represents missing or unknown data. We check NULL values using `IS NULL` or `IS NOT NULL` rather than the equals operator. Functions such as `COALESCE()` can be used to provide a default value when a column is NULL.

### Why doesn't `= NULL` work?

> Because NULL represents an unknown value, comparisons with NULL do not evaluate to TRUE. SQL provides `IS NULL` and `IS NOT NULL` specifically for this purpose.

---

## 24. What is the purpose of the SQL CASE statement?

`CASE` is used to implement **conditional logic in SQL**. It works similar to `if-else`.

### Example

    SELECT
        name,
        salary,
        CASE
            WHEN salary < 40000 THEN 'Low'
            WHEN salary <= 80000 THEN 'Medium'
            ELSE 'High'
        END AS salary_level
    FROM Employees;

### Interview Answer

> The CASE statement is used to implement conditional logic in SQL. It evaluates conditions and returns different values depending on which condition is satisfied. It can be used in SELECT, WHERE, ORDER BY and other SQL clauses.

### Remember

> **CASE = IF / ELSE in SQL**

---

## 25. What is a View in SQL?

A **view is a virtual table created from a SQL query**.

### Example

    CREATE VIEW IT_Employees AS
    SELECT name, email
    FROM Employees
    WHERE department = 'IT';

Now we can use:

    SELECT *
    FROM IT_Employees;

A normal view generally stores the **query definition**, not a separate physical copy of the result data.

### Why Use Views?

- Simplify complex queries
- Improve security by exposing selected data
- Provide abstraction over underlying tables
- Reuse commonly needed queries

### Interview Answer

> A view is a virtual table based on a SQL query. It is useful for simplifying complex queries, providing controlled access to data and presenting a specific representation of the underlying tables.

### Remember

> **View = Virtual table based on a query**

---

## 26. How does EXISTS work, and when would you use it?

`EXISTS` checks whether a subquery returns **at least one row**.

It returns:

    TRUE  → At least one matching row exists
    FALSE → No matching row exists

### Example

Find customers who have placed at least one order:

    SELECT c.name
    FROM Customers c
    WHERE EXISTS (
        SELECT 1
        FROM Orders o
        WHERE o.customer_id = c.id
    );

### Why `SELECT 1`?

With `EXISTS`, we only care whether a row exists, not what value the subquery returns.

### Interview Answer

> EXISTS is used to check whether a subquery returns at least one row. It is commonly used with correlated subqueries when we only care about the existence of related records.

### Remember

> **EXISTS = "Does at least one matching row exist?"**

### EXISTS vs IN

> `IN` compares a value against a set of values, while `EXISTS` checks whether a matching row exists.

---

## 27. What is the purpose of the SQL COUNT() function?

`COUNT()` is an **aggregate function** used to count rows or non-NULL values.

### Count All Rows

    SELECT COUNT(*)
    FROM Employees;

### Count Non-NULL Values

    SELECT COUNT(email)
    FROM Employees;

`COUNT(email)` ignores NULL values.

### With GROUP BY

    SELECT
        customer_id,
        COUNT(*) AS total_orders
    FROM Orders
    GROUP BY customer_id;

This gives the number of orders for each customer.

### Interview Answer

> COUNT() is an aggregate function used to count rows or non-NULL values. It is commonly used with GROUP BY to calculate the number of records in each group.

### Important Difference

> **COUNT(*) → Counts rows**  
> **COUNT(column) → Counts non-NULL values**

---

## 28. What is the difference between CHAR and VARCHAR?

Both are used to store character strings, but they differ in their length behavior.

### CHAR

`CHAR` is a **fixed-length** character type.

Example:

    CHAR(10)

It is suitable when values have a predictable fixed size.

### VARCHAR

`VARCHAR` is a **variable-length** character type.

Example:

    VARCHAR(100)

It is generally suitable for values whose lengths vary, such as names, emails and addresses.

### Interview Answer

> CHAR is a fixed-length character type, while VARCHAR is a variable-length character type. CHAR is useful when values have a predictable fixed size, whereas VARCHAR is generally more appropriate when string lengths vary.

### Remember

> **CHAR → Fixed**  
> **VARCHAR → Variable**

---

## 29. What is the difference between UNION and JOIN?

### UNION

`UNION` combines the **rows from multiple SELECT result sets**.

Example:

    SELECT name FROM Customers_2025
    UNION
    SELECT name FROM Customers_2026;

`UNION` removes duplicate rows.

### JOIN

`JOIN` combines **related data from multiple tables based on a condition**.

Example:

    SELECT
        c.name,
        o.order_id
    FROM Customers c
    JOIN Orders o
        ON c.id = o.customer_id;

### Interview Answer

> UNION combines the result sets of SELECT statements vertically, while JOIN combines related data from multiple tables horizontally based on a join condition.

### Easy Memory

> **UNION → Stack rows**  
> **JOIN → Combine related columns**

---

## 30. What is the purpose of SQL DDL and DML statements?

SQL commands can be categorized based on what they do.

### DDL — Data Definition Language

DDL is used to **define or modify database structures**.

Common commands:

- `CREATE`
- `ALTER`
- `DROP`
- `TRUNCATE`

### Example

    CREATE TABLE Employees (
        id INT,
        name VARCHAR(100)
    );

Here we are creating the **structure** of a table.

### Interview Answer

> DDL stands for Data Definition Language. It is used to define and modify database structures such as tables, indexes and views. Common DDL commands include CREATE, ALTER, DROP and TRUNCATE.

---

### DML — Data Manipulation Language

DML is used to **insert, modify and delete data** stored in database tables.

Common commands:

- `INSERT`
- `UPDATE`
- `DELETE`

### Example

    INSERT INTO Employees
    VALUES (1, 'Rahul');

Here we are modifying the **data**, not the table structure.

### Interview Answer

> DML stands for Data Manipulation Language. It is used to insert, update and delete data stored in database tables. Common DML commands include INSERT, UPDATE and DELETE.

---

## DDL vs DML

| DDL | DML |
|---|---|
| Defines database structure | Manipulates stored data |
| CREATE | INSERT |
| ALTER | UPDATE |
| DROP | DELETE |
| TRUNCATE | — |

### Easy Memory

> **DDL → What does the database structure look like?**  
> **DML → What data is inside it?**

---
# DBMS Interview Preparation — Today's Notes 🚀

> Easy, practical and interview-focused notes for SWE interviews.

---

## 1. What are CTEs (Common Table Expressions), and how are they used?

A **CTE (Common Table Expression)** is a temporary named result set defined using the `WITH` keyword.

It exists only for the duration of a single SQL statement and makes complex queries easier to read and maintain.

### Example

    WITH avg_salary AS (
        SELECT AVG(salary) AS avg_sal
        FROM Employees
    )
    SELECT name, salary
    FROM Employees, avg_salary
    WHERE salary > avg_sal;

### Why use CTEs?

- Makes complex queries easier to understand
- Improves readability
- Avoids repeating the same subquery
- Can be used with `SELECT`, `INSERT`, `UPDATE`, and `DELETE`
- Can support recursive queries for hierarchical data

### Interview Answer

> A CTE, or Common Table Expression, is a temporary named result set defined using the WITH keyword. It exists only for the duration of a single SQL statement and is mainly used to make complex queries more readable and maintainable. CTEs can also be recursive, which is useful for hierarchical data.

### Remember

> **CTE = Temporary named result used inside a query**

---

## 2. How do you perform Data Paging in SQL?

**Data paging (pagination)** means retrieving a large dataset in smaller chunks instead of returning all rows at once.

For example:

    Page 1 → Users 1–20
    Page 2 → Users 21–40
    Page 3 → Users 41–60

### Using LIMIT and OFFSET

For 10 records per page:

    SELECT *
    FROM Employees
    LIMIT 10 OFFSET 0;

Page 2:

    SELECT *
    FROM Employees
    LIMIT 10 OFFSET 10;

Page 3:

    SELECT *
    FROM Employees
    LIMIT 10 OFFSET 20;

### Formula

    OFFSET = (page_number - 1) × page_size

For page 4 with 10 records:

    OFFSET = (4 - 1) × 10
           = 30

### Interview Answer

> Data paging is used to retrieve a large dataset in smaller chunks instead of returning all rows at once. A common approach is LIMIT and OFFSET, where LIMIT specifies the number of rows and OFFSET specifies how many rows to skip. For very large datasets, keyset or cursor-based pagination can be more efficient than large OFFSET values.

### Important Interview Point

Large `OFFSET` values can become inefficient because the database may still need to process or skip many rows.

For large datasets, **keyset pagination** can be more efficient.

Example:

    SELECT *
    FROM Employees
    WHERE id > 1000
    ORDER BY id
    LIMIT 20;

### Remember

> **Pagination = Return data in small pages instead of everything at once.**

---

## 3. Explain the Concept of SQL Cursors

A **cursor** allows us to iterate through the rows returned by a query **one row at a time**.

Normally, SQL is designed to work with sets of rows. A cursor is useful when row-by-row processing is specifically required.

### Simple Idea

    100 rows
       ↓
    Cursor
       ↓
    Row 1 → Process
    Row 2 → Process
    Row 3 → Process
       ...
    Row 100 → Process

Cursors are commonly used inside stored procedures or database programs.

### Interview Answer

> A cursor is a database mechanism that allows us to iterate through the rows returned by a query one row at a time. It is commonly used in stored procedures when row-by-row processing is required. However, cursors can be slower than set-based SQL operations, so I would prefer normal SQL operations when possible.

### Important Follow-up

**Are cursors always a good choice?**

> No. Set-based SQL operations are generally more efficient because databases are optimized to process sets of rows. I would use a cursor only when row-by-row processing is actually necessary.

### Remember

> **Cursor = Process query results row by row**

---

## 4. What is the Purpose of the SQL TRUNCATE Statement?

`TRUNCATE` is used to **remove all rows from a table quickly**.

Example:

    TRUNCATE TABLE Employees;

After execution, the table remains but its data is removed.

### TRUNCATE vs DELETE

| DELETE | TRUNCATE |
|---|---|
| Can delete selected rows | Removes all rows |
| Can use `WHERE` | Cannot use `WHERE` |
| Processes row deletions | Typically deallocates/removes data pages more directly |
| Usually slower for clearing an entire table | Usually faster for clearing an entire table |
| DELETE triggers may fire | DELETE triggers generally do not fire |
| Transaction behavior depends on DBMS | Transaction behavior depends on DBMS |

### Example

Delete selected employees:

    DELETE FROM Employees
    WHERE department = 'HR';

Remove all rows:

    TRUNCATE TABLE Employees;

### Interview Answer

> TRUNCATE is a command used to quickly remove all rows from a table. Unlike DELETE, it does not allow a WHERE condition. It is generally faster for removing all data because it can deallocate data pages rather than processing rows individually. Its transaction, logging and trigger behavior depends on the database system.

### Important Interview Point

Don't simply say:

> "TRUNCATE can never be rolled back."

That is **DBMS-dependent**. Transaction and rollback behavior can differ between database systems.

### Remember

> **DELETE → Remove selected rows**  
> **TRUNCATE → Remove all rows quickly**

---

## 5. How Can You Prevent and Handle Deadlocks in a Database?

### What is a Deadlock?

A **deadlock occurs when two or more transactions are waiting for resources held by each other, so none of them can continue.**

### Example

    Transaction A
        ↓
    Locks Row 1
        ↓
    Wants Row 2

    Transaction B
        ↓
    Locks Row 2
        ↓
    Wants Row 1

Now:

    A waits for B
    B waits for A

    → DEADLOCK

### How to Prevent Deadlocks?

#### 1. Access resources in a consistent order

For example, always lock:

    Account A → Account B

instead of sometimes:

    A → B

and sometimes:

    B → A

#### 2. Keep transactions short

Don't hold locks longer than necessary.

#### 3. Use appropriate isolation levels

Choose an isolation level based on the application's consistency requirements.

#### 4. Implement retry logic

Databases can detect deadlocks and abort one transaction. The application can then retry the transaction.

### Interview Answer

> A deadlock occurs when two or more transactions hold locks and wait for resources held by each other, so none of them can proceed. To reduce deadlocks, I would keep transactions short, access resources in a consistent order, use appropriate isolation levels and implement retry logic when the database detects a deadlock.

### Remember

> **Deadlock = Transactions waiting for each other**

---

## 6. What is the Difference Between a LEFT OUTER JOIN and a RIGHT OUTER JOIN?

### LEFT OUTER JOIN

Returns:

> **All rows from the LEFT table + matching rows from the RIGHT table.**

If no match is found, the right-side columns contain `NULL`.

Example:

    SELECT
        c.name,
        o.order_id
    FROM Customers c
    LEFT JOIN Orders o
        ON c.id = o.customer_id;

Even customers who have no orders will appear.

### RIGHT OUTER JOIN

Returns:

> **All rows from the RIGHT table + matching rows from the LEFT table.**

If no match is found, the left-side columns contain `NULL`.

### Easy Memory

    LEFT JOIN
    → Keep everything from LEFT

    RIGHT JOIN
    → Keep everything from RIGHT

### Interview Answer

> A LEFT OUTER JOIN returns all rows from the left table and matching rows from the right table. If there is no match, the right-side columns contain NULL. A RIGHT OUTER JOIN does the opposite: it keeps all rows from the right table and returns matching rows from the left.

### Interview Tip

A `RIGHT JOIN` can usually be rewritten as a `LEFT JOIN` by swapping the table order.

Conceptually:

    A RIGHT JOIN B

is equivalent to:

    B LEFT JOIN A

### Remember

> **LEFT → Keep left**  
> **RIGHT → Keep right**

---

## 7. What is the Purpose of the SQL ROLLBACK Statement?

`ROLLBACK` is used to **undo changes made during a transaction that have not been committed**.

### Example

    BEGIN;

    UPDATE Accounts
    SET balance = balance - 1000
    WHERE id = 1;

    ROLLBACK;

The update is undone according to the transaction semantics of the database.

### Example: Bank Transfer

    Before:
    Rahul = ₹5000

    UPDATE:
    Rahul = ₹4000

    Something goes wrong...

    ROLLBACK

    After:
    Rahul = ₹5000

### COMMIT vs ROLLBACK

    COMMIT
       ↓
    Save transaction changes

    ROLLBACK
       ↓
    Undo uncommitted transaction changes

### Interview Answer

> ROLLBACK is used to undo changes made by a transaction before those changes are committed. It is useful when an error occurs or when we want to cancel the transaction and restore the database to the previous transactionally consistent state.

### Example

A bank transfer:

    BEGIN
       ↓
    Deduct ₹1000 from Rahul
       ↓
    Credit ₹1000 to Amit
       ↓
    Something fails
       ↓
    ROLLBACK
       ↓
    Undo the transaction

### Remember

> **COMMIT → Save transaction**  
> **ROLLBACK → Undo uncommitted transaction**

---

# 🎯 Quick Interview Cheat Sheet

| Question | Easy Memory |
|---|---|
| **CTE** | Temporary named result set |
| **Data Paging** | Retrieve data in smaller pages |
| **Cursor** | Process rows one by one |
| **TRUNCATE** | Quickly remove all rows |
| **Deadlock** | Transactions waiting for each other |
| **LEFT vs RIGHT JOIN** | Keep LEFT vs Keep RIGHT |
| **ROLLBACK** | Undo uncommitted transaction changes |

---

