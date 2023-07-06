# FreeCodeCamp DBMS course notes 

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
- To drop a table entirely `DROP TABLE table_name;`
- To rename a database `ALTER DATABASE database_name RENAME TO new_database_name;`
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
