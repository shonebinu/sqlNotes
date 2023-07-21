# sqlNotes
PostgreSQL notes taken from multiple online resources

## FreeCodeCamp DBMS course notes 

### Learn Relational Databases by Building a Mario Database

- `psql --username=user_name --dbname=db_name` to connect to the PostGreSQL shell from the terminal. `user_name` and `db_name` is `postgres` if none created.
- `\l` command is used to list all the databases available in PostGreSQL.
- `CREATE DATABASE name;` to create a new database.
- `\c database_name` to connect to a database.
- `\d` to display all the tables in a database.
- `CREATE TABLE table_name();` to create a new table in the current database.
- We can know more details about a table by `\d table_name`
- To add a new column in an existing table `ALTER TABLE table_name ADD COLUMN column_name DATATYPE;`
- To drop a column `ALTER TABLE table_name DROP COLUMN column_name;`
- `VARCHAR(max)` is a common data type, it's a short string of characters with `max` length.
- To rename a column `ALTER TABLE table_name RENAME COLUMN column_name TO new_name;`
- To add rows(aka, to add values to the table) `INSERT INTO table_name(column_1, column_2) VALUES(value1, value2);`. In PostGreSQL, strings are within single quotes `'string'`;
- We can view the date in a table by querying it with the `SELECT` statement. `SELECT columns FROM table_name;`. If I want to list out all the columns, I should use an asterisk `*` which denotes that I want to see all the columns.
- To delete a record (to delete a row) `DELETE FROM table_name WHERE condition;`
  Condition can be something like `username='Shone'`
- To delete all records from a table `DELETE FROM table_name;`
- To drop a table entirely `DROP TABLE table_name;`
- To rename a database `ALTER DATABASE database_name RENAME TO new_database_name;`
- To drop a database `DROP DATABASE second_database;`
- `SERIAL` datatype will make a column `INT` with a `NOT NULL` constraint, and automatically increment the integer when a new row is added.
- To add a not null constraint `ALTER TABLE table_name ADD COLUMN column_name data_type NOT NULL;`.
- To insert more than one row at a time -> eg:
  ```sql
  INSERT INTO characters(name, homeland, favorite_color)
  VALUES('Mario', 'Mushroom Kingdom', 'Red'),
  ('Luigi', 'Mushroom Kingdom', 'Green'),
  ('Peach', 'Mushroom Kingdom', 'Pink');
  ```
- To update a value in the table `UPDATE table_name SET column_name=new_value WHERE condition;`
- To order by column_name, `SELECT columns FROM table_name ORDER BY column_name;`
- **PRIMARY KEY** is a column that uniquely identifies each row in the table. To set, `ALTER TABLE table_name ADD PRIMARY KEY(column_name);`. Usually PRIMARY KEY is set on every table and there can only be one per table.
- To drop a constraint, `ALTER TABLE table_name DROP CONSTRAINT constraint_name;`
    - To get the constraint_name, use `SELECT` keyword to print the records and the constraint name will appear at the bottom. Alternatively use the `\d table_name`.
    - Eg. `ALTER TABLE characters DROP CONSTRAINT characters_pkey;`
- When we add a column with SERIAL data type, a new field with type *sequence* is created in the database. Check it out with `\d`
- `DATE` datatype is used for storing date's and `NUMERIC(4, 1)` is for decimals that has up to four digits and one of them has to be to the right of the decimal.
- To create a link between two tables, we use foreign key.
  - `ALTER TABLE table_name ADD COLUMN column_name DATATYPE REFERENCES referenced_table_name(referenced_column_name);`
- To set a `NOT NULL` constraint `ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;`
- To add the columns and constraints while creating the table `CREATE TABLE table_name(column_name DATATYPE CONSTRAINTS);`
    - `CREATE TABLE sounds(sound_id SERIAL PRIMARY KEY);`
    - Eg. of adding the constraints while altering a table `ALTER TABLE sounds ADD COLUMN filename VARCHAR(40) NOT NULL UNIQUE;`
- `ALTER TABLE sounds ADD COLUMN character_id INT NOT NULL REFERENCES  characters(character_id);` this is an **one-to-many** relationship, but if we want an one-to-one relation, we can add the UNIQUE constraint while altering the table.
- **Many-to-many** relationships usually use a *junction* table to link two tables together, forming **two one-to-many** relationships.
- To set foreign key in an existing column `ALTER TABLE table_name ADD FOREIGN KEY(column_name) REFERENCES referenced_table(referenced_column);`
- Every table should have a primary key, In some cases, we have to create multiple primary key's in a single table. We can create a primary key from two columns, known as a **composite** primary key.
    - `ALTER TABLE table_name ADD PRIMARY KEY(column1, column2);`
    - "This table will have multiple rows with the same `character_id`, and multiple rows the same `action_id`. So neither of them are unique. But you will never have the same (`character_id`, `action_id`) pair in a second row. So the two columns together can be used to uniquely identify each row."
      - here, this is an junction table with name character_actions which connects characters and actions tables to employ many-to-many relation 
- Enter a join command to see all the info from both tables. `SELECT columns FROM table_1 FULL JOIN table_2 ON table_1.primary_key_column = table_2.foreign_key_column;`
    - If I have two related tables and have the same `some_id` in two tables as primary key - foreign key pair, I can use the above syntax to connect those two tables.
- To join three tables `SELECT columns FROM junction_table
FULL JOIN table_1 ON junction_table.foreign_key_column = table_1.primary_key_column
FULL JOIN table_2 ON junction_table.foreign_key_column = table_2.primary_key_column;`
- To add a constraint using the ALTER command, `ALTER TABLE table_name ADD UNIQUE(column_name);`

## udemySql
Sample DataBase(PostGreSQL with PgAdmin4) : [dvdrental](./udemySql/dvdrental.tar)

Course Notes : [SQLNotes](./udemySql/SQLNotes.pdf)

Short Glance : [tldr](./udemySql/Screen%2BShot%2B2016-04-17%2Bat%2B12.22.49%2BPM.png)

### SQL commands of each section

1. [SQL Statement Fundamentals](./udemySql/SQL%20Statement%20Fundamentals/fundamentals.sql)
2. [GROUP BY Statements](./udemySql/GROUP%20BY%20Statements/groupByStatements.sql)
3. [JOINS](./udemySql/JOINS/joins.sql)
4. [Advanced SQL Commands](./udemySql/Advanced%20SQL%20Commands/advancedSqlCommands.sql)
5. [Creating Databases and Tables](./udemySql/Creating%20Databases%20and%20Tables/databasesAndTables.sql)
6. [Conditional Expressions and Procedures Introduction](./udemySql/Condition%20Expressions%20and%20Procedures%20Introduction/conditionexpressions.sql)


#### Assessment Test 2

[DateBase](./udemySql/Assessment%20Test%202/exercises.tar)

[Questions and Expected Results](https://docs.google.com/document/d/1wiuYbTQslmfolQWgeVPB356csjK6yqOUBhgC7fM44o8/edit)
    
[Solutions](https://docs.google.com/document/d/1swGZ0RG3KKqWqzmsI_qrMgjJ3lt39mtAJqRSMZy6Z-8/edit)

[My Solutions](./udemySql/Assessment%20Test%202/assessment2.sql)
