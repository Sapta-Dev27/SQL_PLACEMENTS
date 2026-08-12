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

