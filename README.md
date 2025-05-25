1. What is PostgresSQL

Ans: PostgresSQL is powerfull, open source object relational database system that uses and extents SQL language combined with many features that safely store and scale the most complicated data workloads.It's known for its robust features, flexibility, and standards compliance. PostgreSQL supports both relational and non-relational querying, making it suitable for a wide range of applications.

2.What is the purpose of a database schema in PostgreSQL?

Ans: The purpose of a database schema in PostgreSQL is to organize and manage database objects like tables, views, functions, indexes, and more — within a logical structure. A schema in PostgreSQL is like a folder inside a database, used to logically separate and organize your data, manage security, and avoid conflicts between objects.

3.How can you modify data using UPDATE statements? 

Ans: I can modify data in a PostgreSQL table using the UPDATE statement. It allows to change values in one or more columns of one or more rows in a table. Here is the example with the Syntax

<Bold>Syntax:<Bold/>
UPDATE table_name
SET column1 = new_value1,
    column2 = new_value2,
    ...
WHERE condition;

Example: 
UPDATE employees
SET salary = 50000
WHERE employee_id = 101;

4.Explain the purpose of the WHERE clause in a SELECT statement.

Ans: The WHERE clause is a filtering condition used in SQL queries to specify which rows from a table should be included in the result set. Without a WHERE clause, a query retrieves all the records from the table, which is often unnecessary and inefficient. The WHERE clause helps in narrowing down results by returning only those rows that match a given condition or set of conditions.

5.Explain the Primary Key and Foreign Key concepts in PostgreSQL.

Ans: 
Primary Key: A Primary Key is a column (or set of columns) in a table that uniquely identifies each row in that table. Think of it like an ID card number — it must be unique and not null for every row.

Foreign Key: A Foreign Key is a column in one table that refers to the primary key in another table. It’s used to create a relationship between two tables.
