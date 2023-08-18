-- 1. access different prices
SELECT amount
FROM payment
ORDER by amount DESC
LIMIT 10

-- 2. Create a list of all the distinct districts customers are from.
SELECT DISTINCT district
FROM address

-- 3. What is the latest rental date?
SELECT DISTINCT rental_date
FROM rental
ORDER by rental_date DESC
LIMIT 1

-- 4. How many films does the company have?
SELECT COUNT(*) FROM film

-- 5. How many distinct last names of the customers are there?
SELECT COUNT(DISTINCT last_name) 
FROM customer

-- 6. How many payments were made by the customer with customer_id = 100?
SELECT COUNT(*)
FROM payment
WHERE customer_id = 100

-- 7. What is the last name of our customer with first name 'ERICA'?
SELECT first_name
FROM customer
WHERE first_name = 'ERICA'

-- 8. How many rentals have not been returned yet
SELECT COUNT(*)
FROM rental
WHERE return_date is null

--9. List of all the payment_ids with an amount less than or equal to $2.
SELECT payment_id, amount
FROM payment
WHERE amount <= 2





