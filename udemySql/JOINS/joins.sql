-- JOINS

/* 

INNER JOINS
OUTER JOINS
FULL JOINS
UNIONS

*/

-- The AS operator gets executed at the very end of a query, meaning that we can't use the ALIAS inside a WHERE operator

SELECT COUNT(amount) AS num_transactions FROM payment;

SELECT customer_id, SUM(amount) AS total_spent FROM payment
GROUP BY customer_id HAVING SUM(amount) > 100;

/* SELECT customer_id, SUM(amount) AS total_spent FROM payment
GROUP BY customer_id HAVING total_spent > 100; -- this doesn't work */

-- https://www.w3schools.com/sql/sql_join.asp

-- An INNER JOIN will result with the set of records that match in both tables

-- JOIN is an alias of INNER JOIN in postgresql


SELECT * FROM payment 
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

 
SELECT payment_id, payment.customer_id, first_name -- if the column is in both the tables, we need to specify which table's column should be used
FROM payment 
INNER JOIN customer
ON payment.customer_id = customer.customer_id; -- in INNER join, the order of tables in the FROM and INNER JOIN generally doesn't matter, since it only shows the records that match in both tables



-- Outer Joins

/* They will allow us to specify how to deal with values only present in one of the tables being joined */

-- FULL Outer Join

SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id;

SELECT * FROM customer 
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id -- order doesn't matter
WHERE customer.customer_id IS null
OR payment.payment_id IS null;

/* A LEFT OUTER JOIN results in the set of records that are in the left table, 
if there is no match with the right table, the results are null */


-- on left outer join and right outer join, the order matters

-- LEFT OUTER JOIN == LEFT JOIN

SELECT film.film_id, title, inventory_id, store_id
FROM film
LEFT JOIN inventory ON 
inventory.film_id = film.film_id;


SELECT film.film_id, title, inventory_id, store_id
FROM film
LEFT JOIN inventory ON 
inventory.film_id = film.film_id;


SELECT film.film_id, title, inventory_id, store_id
FROM film
LEFT JOIN inventory ON 
inventory.film_id = film.film_id
WHERE inventory.film_id IS null;


-- Right Joins

-- A right join is essentially the same as a left join, except the tables are switched 

-- RIGHT OUTER JOIN == RIGHT JOIN


-- UNION

/* combine the result-set of two or more SELECT statements 


SELECT * FROM Sales2021_Q1 
UNION
SELECT * FROM Sales2021_Q2
ORDER BY name;

*/


SELECT * 
FROM address 
WHERE district = 'California';


SELECT district, email FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'California';


SELECT district, COUNT(email) FROM address -- done myself to check the theory
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'California'
GROUP BY district;



SELECT * FROM actor
WHERE first_name = 'Nick' AND last_name = 'Wahlberg';



SELECT * FROM film;

SELECT first_name, last_name, actor.actor_id, film.film_id, film.title FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film_actor.film_id = film.film_id
WHERE first_name = 'Nick' AND last_name = 'Wahlberg';


