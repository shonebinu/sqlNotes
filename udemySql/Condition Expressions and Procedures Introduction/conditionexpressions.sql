SELECT customer_id,
CASE 
	WHEN (customer_id <= 100) THEN 'Premium'
	WHEN (customer_id BETWEEN 100 and 200) THEN 'Plus'
	ELSE 'Normal'
END AS customer_class
FROM customer;


SELECT customer_id,
CASE customer_id
	WHEN 2 THEN 'Winner'
	WHEN 5 THEN 'Second Place'
	ELSE 'Normal'
END AS raffle_results
FROM customer;

SELECT rental_rate, 
CASE rental_rate 
	WHEN 0.99 THEN 1
	ELSE 0
END
FROM film;

SELECT
CASE rental_rate 
	WHEN 0.99 THEN 1
	ELSE 0
END
FROM film;



SELECT 
SUM(CASE rental_rate 
	WHEN 0.99 THEN 1
	ELSE 0
END) AS bargains,
SUM(CASE rental_rate
   WHEN 2.99 THEN 1
   ELSE 0
END) AS regular,
SUM(CASE rental_rate
   WHEN 4.99 THEN 1
   ELSE 0
END) AS premium
FROM film;



SELECT
SUM(CASE rating
	WHEN 'R' THEN 1
	ELSE 0
END) AS r,
SUM(CASE rating
	WHEN 'PG' THEN 1
	ELSE 0
END) AS pg,
SUM(CASE rating
	WHEN 'PG-13' THEN 1
	ELSE 0
END) AS pg13
FROM film;




-- The COALESCE function accepts an unlimited number of arguments. It returns the first argument that is not null. If all arguments are null, the COALESCE function will return null

SELECT title, (rental_rate * rental_duration) AS total_rent 
FROM film; -- but what if one value of rental_duration is null, it will result in a null answer, so we use COALESCE(rental_duration, 1) something that acts as a backup


-- CAST operator let's us convert from one data type into another

SELECT CAST('5' AS INTEGER) AS new_int;

SELECT '10'::INTEGER AS new_int_ps;-- this is postgresql specific

SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) AS length FROM rental;

-- NULLIF function takes in 2 inputs and returns NULL if both are equal, otherwise it will return the first argument passed

CREATE TABLE depts (
	first_name VARCHAR(50),
	department VARCHAR(50)
)

INSERT INTO depts(first_name, department)
VALUES 
('Vinton', 'A'), 
('Lauren', 'A'),
('Claire', 'B');

SELECT * FROM depts;

SELECT (
	SUM(CASE WHEN department='A' THEN 1 ELSE 0 END) / SUM(CASE WHEN department='B' THEN 1 ELSE 0 END)
) AS department_ratio
FROM depts;

DELETE FROM depts 
WHERE department = 'B';

SELECT (
	SUM(CASE WHEN department='A' THEN 1 ELSE 0 END) / 
		NULLIF( 	SUM(CASE WHEN department='B' THEN 1 ELSE 0 END),  0   )
) AS department_ratio
FROM depts;




-- View -> virtual table

CREATE VIEW customer_info AS -- creating view 

SELECT first_name, last_name, address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;


SELECT * FROM customer_info; -- calling view

CREATE OR REPLACE VIEW customer_info AS
SELECT first_name, last_name, address, district FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;


SELECT * FROM customer_info;


ALTER VIEW customer_info RENAME TO c_info;

DROP VIEW IF EXISTS c_info;

