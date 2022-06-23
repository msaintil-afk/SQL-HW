-- 1. List all customers who live in Texas (use
-- JOINs)
SELECT *
FROM address

SELECT  first_name, last_name, district
FROM customer
FULL JOIN address 
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE district = 'Texas'



-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
SELECT *
FROM payment

SELECT *
FROM customer

SELECT payment.customer_id, payment.amount,first_name, last_name
FROM payment
FULL JOIN customer
ON payment.customer_id = customer.customer_id
GROUP BY payment.customer_id, first_name, last_name, payment.amount
HAVING SUM(payment.amount) > 6.99
ORDER BY SUM(payment.amount);


-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
SELECT first_name, last_name, store_id
FROM customer
WHERE customer_id IN (
    SELECT customer_id--, SUM(amount) as total
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175.00
    ORDER BY SUM(amount) DESC
);

-- 4. List all customers that live in Nepal (use the city
-- table)
SELECT *
FROM city

SELECT *
FROM customer

SELECT  first_name, last_name, city
FROM customer
FULL JOIN city 
ON customer = city
WHERE city = 'Nepal'


-- 5. Which staff member had the most
-- transactions?
SELECT *
FROM staff


-- 6. How many movies of each rating are
-- there?
SELECT *
FROM film

SELECT  film_id,title,rating, count(rating)
FROM film
GROUP BY film_id,title,rating
ORDER BY film_id;

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
SELECT *
FROM payment

SELECT first_name, last_name, store_id
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id, payment.amount
    ORDER BY amount > 6.99
);
-- 8. How many free rentals did our stores give away? 24
SELECT *
FROM payment

SELECT  rental_id, staff_id, amount
FROM payment
GROUP BY rental_id, staff_id, amount
ORDER BY amount;