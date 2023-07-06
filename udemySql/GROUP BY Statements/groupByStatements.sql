/* Aggregate function take multiple inputs and return a single output

AVG() - returns a floating point value, can use ROUND() to specify precision
COUNT()
MAX()
MIN()
SUM()

Aggregate function calls happen only in the SELECT clause or the HAVING clause */

SELECT MIN(replacement_cost) FROM film;

SELECT MAX(replacement_cost) FROM film;

SELECT MIN(replacement_cost), MAX(replacement_cost) FROM film;

-- SELECT MAX(replacement_cost), film_id FROM film; -- this doesn't work cuz, MAX function only returns one column while the other it's different


SELECT MAX(title) FROM film; -- works with characters

SELECT AVG(replacement_cost) FROM film;

SELECT ROUND(AVG(replacement_cost), 2) FROM film; -- two decimal precision 

SELECT SUM(replacement_cost) FROM film;

SELECT COUNT(*) FROM film;


-- group by

-- The group by clause must appear right after a FROM or WHERE statement

-- In the SELECT statement, columns must either have an aggregate function or be in the GROUP BY call.

-- WHERE statements should not refer to the aggregation result

SELECT * FROM payment;

SELECT customer_id, SUM(amount), COUNT(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC; -- order by should also contain the aggregate function if we want to sort a statement containing group by


SELECT staff_id, customer_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY staff_id, customer_id;


SELECT DATE(payment_date) FROM payment -- to filter out the time and only have the date
GROUP BY DATE(payment_date); -- this is just printing distinct dates...

SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC;


SELECT staff_id, COUNT(amount) FROM payment 
GROUP BY staff_id;


SELECT rating, AVG(replacement_cost) FROM film
GROUP BY rating;


SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;


-- Having

/*

SELECT company, SUM(sales) FROM finance_table
WHERE company != 'Google'
GROUP BY company;

The above GROUP BY everything except's the company Google.

But we can not use WHERE to filter based off of aggregate results, because those happen after a WHERE is executed


SELECT company, SUM(sales) FROM finance_table
WHERE company != 'Google'
GROUP BY company
HAVING SUM(sales) > 100;

HAVING allows us to use the aggregate result as a filter along with a GROUP BY

*/


SELECT customer_id, SUM(amount) FROM payment
WHERE customer_id NOT IN(184, 87, 477)
GROUP By customer_id
HAVING SUM(amount) > 100;

SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300;


SELECT customer_id, COUNT(customer_id) FROM payment -- since it's COUNT, any column can be passed into it
GROUP BY customer_id
HAVING COUNT(customer_id) >= 40;


SELECT staff_id, customer_id, SUM(amount) FROM payment -- every column inside the SELECT should be either in the GROUP BY clause or in the aggregate functions
WHERE staff_id = 2
GROUP BY staff_id, customer_id
HAVING SUM(amount) > 100; -- the clauses should be in this order.

-- Assessment

SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 110;


SELECT COUNT(*) FROM film
WHERE title LIKE 'J%';

SELECT first_name, last_name, customer_id FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;




