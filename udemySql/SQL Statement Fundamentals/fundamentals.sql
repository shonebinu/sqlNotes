SELECT * FROM film; -- select all column's from the table film

SELECT title FROM film; -- select the column 'title' from the table film

SELECT * FROM actor;

SELECT first_name, last_name FROM actor; -- the column's are printed according to the order we've given in the syntax

SELECT first_name, last_name, email FROM customer;

SELECT * FROM film;

SELECT DISTINCT release_year FROM film; -- to avoid duplicate entries 

SELECT DISTINCT(rental_rate) FROM film; -- paranthesis can be used

SELECT DISTINCT(rating) FROM film;

SELECT COUNT(rating) FROM film; -- it simply returns the number of rows in the table, and it's same for every column
SELECT COUNT(*) FROM film; -- therefore, we can also use * as the argument

SELECT COUNT(DISTINCT rating) FROM film; -- to count the distinct values

SELECT * FROM payment;
SELECT COUNT(amount) FROM payment;


SELECT amount FROM payment;

SELECT COUNT(DISTINCT (amount)) FROM payment;


SELECT * FROM customer 
WHERE first_name = 'Jared'; -- string's needs to be in single quotes


SELECT title FROM film
where rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';

SELECT COUNT(title) FROM film
where rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';


SELECT COUNT(title) FROM film
where rating='R' OR rating='PG-13';

SELECT COUNT(title) FROM film
where rating != 'R';


SELECT first_name, last_name, email FROM customer 
WHERE first_name = 'Nancy' AND last_name = 'Thomas';

SELECT description FROM film
WHERE title = 'Outlaw Hanky';

SELECT phone FROM address
WHERE address = '259 Ipoh Drive'; -- from is the table and where is the column


-- in postgresql, sometimes the returned results are in different order

SELECT * FROM customer
ORDER BY first_name; -- order by default's to ascending order

SELECT * FROM customer 
ORDER BY first_name ASC; -- both are the same

SELECT * FROM customer
ORDER BY first_name DESC; -- descending order


SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id, first_name; -- first it order's by store_id and if there's duplicate store_id's then it's orderd by the first_name


SELECT first_name, last_name FROM customer
ORDER BY store_id, first_name; -- order by work's even if we don't select the column


SELECT * FROM payment
ORDER BY payment_date DESC -- order by works with date's as well
LIMIT 5; -- to show the first 5 results


SELECT * FROM payment
WHERE amount != 0.00
ORDER BY payment_date DESC -- the statement's should be in this order
LIMIT 5;


SELECT customer_id FROM payment
WHERE amount != 0
ORDER BY payment_date
LIMIT 10;



SELECT title, length FROM film -- length is also highlighted, since 'length' is a postgresql keyword.
ORDER BY length ASC
LIMIT 5;



SELECT COUNT(title) FROM film
WHERE length <= 50;


-- date format is 'YYYY-MM-DD'

SELECT * FROM payment
WHERE amount BETWEEN 8 AND 9; -- instead of between, i can also chain logical operators such as 'AND'


SELECT COUNT(*) FROM payment
WHERE amount NOT BETWEEN 8 AND 9;


SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-14'; -- here it's 2007-02-14 and time 00:00, so it doesn't include the payment's that happened on 14th



SELECT DISTINCT(amount) FROM payment
ORDER BY amount;

SELECT * FROM payment
WHERE amount IN(0.99, 1.98, 1.99);

SELECT COUNT(*) FROM payment
WHERE amount NOT IN(0.99, 1.98, 1.99);


SELECT * FROM customer
WHERE first_name IN('John', 'Jake', 'Julie');


/* WILDCARD characters

Percent % - matches any sequence of characters
Underscore _ - matches any single character 

We use these for LIKE operator, eg: WHERE name LIKE 'A%'

LIKE is case-sensitive, we can use ILIKE which is case-insensitive

*/


SELECT * FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';


SELECT * FROM customer
WHERE first_name ILIKE 'j%' AND last_name ILIKE 's%';

SELECT * FROM customer 
WHERE first_name LIKE '_er%'; -- for percent, it's okay even if there's no characters

SELECT * FROM customer 
WHERE first_name NOT LIKE '_er%'; 

SELECT * FROM customer
WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
ORDER BY last_name;



SELECT COUNT(*) FROM payment
WHERE amount > 5;

SELECT COUNT(*) FROM actor
WHERE first_name LIKE 'P%';


SELECT COUNT(DISTINCT district) FROM address;

SELECT DISTINCT district FROM address;

SELECT COUNT(*) FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;


SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%';



