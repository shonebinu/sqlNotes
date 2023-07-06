/*

Time - contains only time
Date - Contains only date 
Timestamp - contains date and time
Timestamptz - contains date, time, and timezone

*/

SHOW ALL;

SHOW TIMEZONE;

SELECT NOW(); -- current timestamptz

SELECT TIMEOFDAY(); -- same info in string

SELECT CURRENT_TIME;

SELECT CURRENT_DATE;

/*

Extract() -- allows to extract or obtain the following

YEAR, MONTH, DAY, WEEK, QUARTER

AGE() - calculates and returns the current age given a timestamp

TO_CHAR() -- to convert data types to text

*/

SELECT EXTRACT(YEAR FROM payment_date) 
FROM payment;

SELECT EXTRACT(YEAR FROM payment_date) AS year
FROM payment;

SELECT EXTRACT(MONTH FROM payment_date) AS pay_month
FROM payment;

SELECT EXTRACT(QUARTER FROM payment_date) 
FROM payment;



SELECT AGE(payment_date) FROM payment;


SELECT TO_CHAR(payment_date, 'MONTH-YYYY') FROM payment; -- https://www.postgresql.org/docs/current/functions-formatting.html


SELECT TO_CHAR(payment_date, 'mon/dd/YYYY') FROM payment;

SELECT TO_CHAR(payment_date, 'MM/dd/YYYY') FROM payment;


SELECT DISTINCT(TO_CHAR(payment_date, 'MONTH')) AS payment_month FROM payment;


SELECT COUNT(*) FROM payment
WHERE trim(TO_CHAR(payment_date, 'Day')) = 'Monday'; -- TO_CHAR pad's the result to 9 blanks, so use trim() --https://stackoverflow.com/questions/62540961/how-many-payments-happened-on-monday-from-payment-date-column-the-below-code-g


SELECT COUNT(*) FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1; -- dow = day of week, starts at 0 - sunday



-- https://www.postgresql.org/docs/9.5/functions-math.html

SELECT ROUND((rental_rate/replacement_cost)*100, 2) AS percent_cost FROM film;

SELECT .1*replacement_cost AS deposit FROM film;


-- https://www.postgresql.org/docs/9.5/functions-string.html

SELECT first_name || ' ' || last_name AS full_name FROM customer;

SELECT LENGTH(first_name) FROM customer;

SELECT UPPER(first_name) || ' ' || last_name AS full_name FROM customer;


SELECT LOWER(LEFT(first_name, 1) || last_name || '@gmail.com') AS custom_email FROM customer;


-- A sub query allows you to construct complex queries, essentially performing a query on the results of another query

SELECT title, rental_rate FROM film
WHERE rental_rate >
(SELECT AVG(rental_rate) FROM film); -- here the subquery returns a single value, hence comparison can be done


SELECT film_id, title FROM film 
WHERE film_id IN
(SELECT inventory.film_id FROM rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')
ORDER BY film_id;


SELECT * FROM inventory 
WHERE inventory.inventory_id IN
(SELECT inventory_id FROM rental
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30');


SELECT first_name, last_name FROM customer AS c -- here we've given alias to tables
WHERE EXISTS
(SELECT * FROM payment AS p 
 WHERE p.customer_id = c.customer_id
AND amount > 11);


SELECT first_name, last_name FROM customer AS c -- here we've given alias to tables
WHERE NOT EXISTS
(SELECT * FROM payment AS p 
 WHERE p.customer_id = c.customer_id
AND amount > 11);


-- A self-join is a query in which a table is joined to itself

-- same tables, so one should use alias for it to work properly 


SELECT f1.title, f2.title, f1.length 
FROM film AS f1
INNER JOIN film AS f2 
ON f1.film_id != f2.film_id
AND f1.length = f2.length;



