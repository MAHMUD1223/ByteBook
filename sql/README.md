# SQL aka Structured Query Language

SQL, which stands for Structured Query Language, is a programming language used for managing and manipulating relational databases. It provides a standardized way to interact with databases and perform various operations such as querying, inserting, updating, and deleting data.

## History

SQL was first developed in the 1970s by IBM researchers Donald D. Chamberlin and Raymond F. Boyce. It was initially called SEQUEL (Structured English Query Language) and was designed to manipulate and retrieve data from IBM's System R relational database management system. Over time, SQL became an industry standard and was adopted by various database vendors.

## Use Cases

SQL is widely used in the field of database management and has numerous use cases. Some of the common use cases of SQL include:

1. Data Retrieval: SQL allows users to retrieve specific data from a database by using SELECT statements. It provides powerful querying capabilities, allowing users to filter, sort, and aggregate data based on specific criteria.

2. Data Manipulation: SQL enables users to modify data in a database using statements such as INSERT, UPDATE, and DELETE. These statements allow for adding new records, updating existing records, and removing unwanted data from the database.

3. Database Administration: SQL is used for managing and administering databases. It allows users to create and modify database schemas, define access controls and permissions, and optimize database performance.

4. Reporting and Analysis: SQL is often used for generating reports and performing data analysis. It allows users to aggregate and summarize data, calculate metrics, and generate meaningful insights from large datasets.

## Getting started

we will go with mysql for learning sql. So, lets get started.

> [!NOTE]
> This tutorial is written based on ubuntu.

### Installing mysql

Just type in terminal

```sh
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
