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

