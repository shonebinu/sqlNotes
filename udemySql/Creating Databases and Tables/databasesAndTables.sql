/* Constraints 

Column constraints ->

NOT NULL
UNIQUE
PRIMARY Key
FOREIGN Key
CHECK -> Ensures that all values in a column satisfy certain conditions


Table constraints ->

CHECK
REFERENCES -> should reference the column in another table
UNIQUE -> unique within multiple columns
PRIMARY KEY -> Primary key which consists of multiple columns

*/


/* TABLE CREATION GENERAL SYNTAX

CREATE TABLE table_name(
	column_name TYPE column_constraint,
	column_name TYPE column_constraint,
	table_constraint table_constraint
) INHERITS existing_table_name;

COMMON SIMPLE SYNTAX

CREATE TABLE table_name(
	column_name TYPE column_constraint,
	column_name TYPE column_constraint
);

*/

-- SERIAL -> autoincrementing integer used for primary key's

CREATE TABLE account (
	user_id SERIAL PRIMARY KEY, 
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
);

CREATE TABLE job (
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
);

CREATE TABLE account_job (
	user_id INTEGER REFERENCES account(user_id), -- integer, references the serial primary key
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP
);

SELECT * FROM account;

INSERT INTO account(username, password, email, created_on)
VALUES
('Shone', 'passwordInsteadOfHash', 'shone@Mail.com', CURRENT_TIMESTAMP);

INSERT INTO job(job_name)
VALUES
('Astronaut');

SELECT * FROM job;

INSERT INTO job(job_name)
VALUES
('President');

INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
(1, 1, CURRENT_TIMESTAMP);

SELECT * FROM account_job;

INSERT INTO account_job(user_id, job_id, hire_date) 
VALUES
(10, 10, CURRENT_TIMESTAMP); -- doesn't work since it violates foreign key constraint


UPDATE account
SET last_login = CURRENT_TIMESTAMP; -- doesn't output anything

UPDATE account
SET last_login = created_on;

UPDATE account_job 
SET hire_date = account.created_on
FROM account -- from account table
WHERE account_job.user_id = account.user_id;

UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email, created_on, last_login; -- returns the table with those updated fields....


INSERT INTO job(job_name) 
VALUES ('Software Engineer');

DELETE FROM job 
WHERE job_name = 'Software Engineer'
RETURNING job_id, job_name;


CREATE TABLE information(
	info_id SERIAL PRIMARY KEY,
	title VARCHAR(500) NOT NULL,
	person VARCHAR(50) NOT NULL UNIQUE
);

ALTER TABLE information 
RENAME TO new_info; -- change table name

ALTER TABLE new_info
RENAME COLUMN person TO people;

SELECT * FROM new_info;

ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL; -- to drop the not null constraint, we can set constraint's with SET... not only 'NOT NULL', we can also work with 'UNIQUE' etc

ALTER TABLE new_info
DROP COLUMN people;

ALTER TABLE new_info
DROP COLUMN IF EXISTS people;

CREATE TABLE employees(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthdate DATE CHECK (birthdate > '1900-01-01'),
	hire_date DATE CHECK (hire_date > birthdate),
	salary INTEGER CHECK (salary > 0)
);

INSERT INTO employees(first_name, last_name, birthdate, hire_date, salary)
VALUES ('Shone', 'Binu', '1899-11-03', '2010-01-01', 100); -- doesn't work, violates CHECK constraint

