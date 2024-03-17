# SQL - Structured Query Language

SQL, which stands for Structured Query Language, is a programming language used for managing and manipulating relational databases. It provides a standardized way to interact with databases and perform various operations such as querying, inserting, updating, and deleting data.

## History

SQL was first developed in the 1970s by IBM researchers Donald D. Chamberlin and Raymond F. Boyce. It was initially called SEQUEL (Structured English Query Language) and was designed to manipulate and retrieve data from IBM's System R relational database management system. Over time, SQL became an industry standard and was adopted by various database vendors.

## Use Cases

SQL is widely used in the field of database management and has numerous use cases. Some of the common use cases of SQL include:

1. Data Retrieval: SQL allows users to retrieve specific data from a database by using SELECT statements. It provides powerful querying capabilities, allowing users to filter, sort, and aggregate data based on specific criteria.

2. Data Manipulation: SQL enables users to modify data in a database using statements such as INSERT, UPDATE, and DELETE. These statements allow for adding new records, updating existing records, and removing unwanted data from the database.

3. Database Administration: SQL is used for managing and administering databases. It allows users to create and modify database schemas, define access controls and permissions, and optimize database performance.

4. Reporting and Analysis: SQL is often used for generating reports and performing data analysis. It allows users to aggregate and summarize data, calculate metrics, and generate meaningful insights from large datasets.

# Getting started

main command in sql is `SELECT`, `UPDATE`, `DELETE`, `INSERT`, `WHERE`
>[!NOTE]
>SQL keywords are NOT case sensitive: select is the same as SELECT
Here are some useful commads in sql

1. `SELECT` - extracts data from a database
2. `SELECT DISTINCT` - statement is used to return only distinct (different) values
3. `WHERE` - clause is used to filter records
4. `ORDER` - BY keyword is used to sort the result-set in ascending or descending order <br> for example
   ```sql
   ORDER BY column1, column2, ... ASC|DESC|None-for-alphabetically;
   ```
6. 
7. `UPDATE` - updates data in a database e.g.
   ```sql
   UPDATE table_name
   SET column1 = value1, column2 = value2, ...
   WHERE condition;
   ```
9. `DELETE` - deletes data from a database e.g.
    ```sql
    DELETE FROM table_name WHERE condition;
    ```
11. `INSERT INTO` - inserts new data into a database e.g.
   ```sql
   INSERT INTO table_name (column1, column2, column3, ...)
   VALUES (value1, value2, value3, ...);
   --or sequncially
   INSERT INTO table_name
   VALUES (value1, value2, value3, ...);
   --Insert multiple data
   INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
   VALUES
   ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'),
   ('Greasy Burger', 'Per Olsen', 'Gateveien 15', 'Sandnes', '4306', 'Norway'),
   ('Tasty Tee', 'Finn Egan', 'Streetroad 19B', 'Liverpool', 'L1 0AA', 'UK');
   ```
11. `CREATE DATABASE` - creates a new database
12. `ALTER DATABASE` - modifies a database
13. `CREATE TABLE` - creates a new table
14. `ALTER TABLE` - modifies a table
15. `DROP TABLE` - deletes a table e.g.
    ```sql
    DROP TABLE Customers;
    ```
17. `CREATE INDEX` - creates an index (search key)
18. `DROP INDEX` - deletes an index

## Operators in sql

1. `AND` - is used to filter records based on more than one condition e.g. `WHERE Country = 'Spain' AND CustomerName LIKE 'G%';`
2. `OR` - operator displays a record if any of the conditions are TRUE
Here is an example with both of'em
```sql
SELECT * FROM Customers
WHERE Country = 'Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');
```
3. `NOT` - operator is used in combination with other operators to give the opposite result, also called the negative result e.g. `WHERE NOT Country = 'Spain';`
4. `LIKE` - This operator is used in a WHERE clause to search for a specified pattern in a column
   There are two wildcards often used in conjunction with the LIKE operator:
   - The percent sign % represents zero, one, or multiple characters
   - The underscore sign _ represents one, single character
5. `IN` - This operator allows you to specify multiple values in a WHERE clause
   ```sql
   SELECT column_name(s)
   FROM table_name
   WHERE column_name IN (value1, value2, ...);
   ```
6. `BETWEEN` - This operator selects values within a given range. The values can be numbers, text, or dates
   ```sql
   SELECT column_name(s)
   FROM table_name
   WHERE column_name BETWEEN value1 AND value2;
   ```
7. `AS` - To set alias
   ```sql
   SELECT column_name AS alias_name
   FROM table_name;
   ```
9.  Some other operators in sql:
```sql
WHERE CustomerName NOT LIKE 'A%'; --Select customers that does not start with the letter 'A'
WHERE CustomerID NOT BETWEEN 10 AND 60; --Select customers with a customerID not between 10 and 60
WHERE City NOT IN ('Paris', 'London'); --Select customers that are not from Paris or London:
WHERE NOT CustomerID > 50;
WHERE NOT CustomerId < 50;
WHERE Address IS NULL;
```
### WIDCARD
Wildcard character is used to substitute one or more characters in a string

1. `% `	Represents zero or more characters e.g.
   ```sql
   SELECT * FROM Customers
   WHERE CustomerName LIKE '%es';
   --Return all customers that ends with the pattern 'es'
   WHERE CustomerName LIKE '%mer%';
   --Return all customers that contains the pattern 'mer
   ```
3. `_` 	Represents a single character e.g.
   ```sql
   SELECT * FROM Customers
   WHERE City LIKE '_ondon';
   --It can be any character or number, but each _ represents one, and only one, character
   WHERE City LIKE 'L___on';
   --Return all customers with a City starting with "L", followed by any 3 characters, ending with "on"
   ```
4. `[]` 	Represents any single character within the brackets *
5. `^` 	Represents any character not in the brackets *
6. `-` 	Represents any single character within the specified range *
7. `{}` Represents any escaped character **
>[!NOTE]
>`*` Not supported in PostgreSQL and MySQL databases.
>`**` Supported only in Oracle databases.

# Example

we will go with mysql for this example sql. So, lets get started.

> [!NOTE]
> This tutorial is written based on ubuntu.

### Installing mysql

Just type in terminal

```sh
--All of'em are ran on ubuntu
apt update && apt install mysql-server -y
```

After installing just type

```sh
service mysql start
```

to start mysql server and

```sh
service mysql status
```

to check status.

### Creating Database

To cerate database first start mysql then get into its terminal by typing

```sh
mysql
```

And you will get something like this `mysql>`
<br>
To see the databases

```sql
SHOW DATABASES;
```

And now to create a database

```sql
CREATE DATABASE <database_name>
```

To connect with the database

```sql
USE <database_name>
```

### Interact with database
Now that we are connected with our database lets do some works
- To show tables
```sql
SHOW TABLES;
```
- To create tables
```sql
CREATE TABLE <table_name> (<column_name> <data_type>, <column_name> <data_type>, ..., ..., ...);
```
An example:
```sql
CREATE TABLE coffee_table (id int primary, nameCoffee varchar(255), region varchar(255), roast varchar(255));
```
- To see the created table (detailed)
```sql
DESCRIBE <table_name>
```
#### Insert data into table
To insert data into the created table type
```sql
INSERT INTO <table_name> VALUES (<corresponding_values>)
```
e.g.
```sql
INSERT INTO coffee_table VALUES (1, "default route", "ethiopia", "light");
```
#### Query data
To query the data saved in table
```sql
SELECT <column> FROM <table_name>;
```
e.g.
```sql
SELECT * FROM coffee_table;
```
