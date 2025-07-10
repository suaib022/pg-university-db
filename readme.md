## 1. What is PostgreSQL?
PostgreSQL is a open-source object-relational database system that uses the SQL language and extends it. It is known for its robustness, scalability, and extensibility.

## 2. What is the purpose of a database schema in PostgreSQL?
Schemas in PostgreSQL are logical containers that allow us to organize database objects such as tables, procedures, functions, etc. Schemas provide a way to rationally group related objects and separate them based on their functionalities or business domains.

## 3. Explain the primary key and foreign key concepts in PostgreSQL.
Primary key is a chosen candidate key that uniquely identifies a record/row in a table. Foreign key links two tables together.

## 4. What is the difference between the VARCHAR and CHAR data types?
CHAR is a fixed length string data type, so any remaining space in the field is padded with blanks, while VARCHAR is variable length and stores data based on its actual length.

## 5. Explain the purpose of the WHERE clause in a SELECT statement.
WHERE clause is used to specify a condition while fetching or modifying data in a database.

## 6. What are the LIMIT and OFFSET clauses used for?
The LIMIT clause restricts the amount of rows fetched. The OFFSET clause indicates at which position to start reading the values

## 7. How can you perform data modification using UPDATE statements?
We can use UPDATE to modify existing records like this:  
`UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;`  
It updates rows that match the WHERE condition.

## 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
Combines rows from two or more tables based on a related column (JOIN ON table1.id = table2.id) to retrieve related data.

## 9. Explain the GROUP BY clause and its role in aggregation operations.
Groups rows sharing the same values in specified columns, used with aggregate functions (COUNT, SUM) to perform calculations per group.

## 10. How can you calculate aggregate functions like COUNT, SUM, and AVG in PostgreSQL?
Use COUNT(), SUM(), AVG() to calculate totals, sums, or averages over columns, often with GROUP BY.  
Example: `SELECT department, AVG(salary) FROM employee GROUP BY department.`

## 11. What is the purpose of an index in PostgreSQL, and how does it optimize query performance?
Speeds up data retrieval by allowing the database to find rows faster, like a book index, especially helpful on large datasets.

## 12. Explain the concept of a PostgreSQL view and how it differs from a table.
A view is a virtual table based on a query. it doesn’t store data itself, unlike a table which physically stores data.
