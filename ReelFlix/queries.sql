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

-- 7. What is the last name of our customer with the first name 'ERICA'?
SELECT first_name
FROM customer
WHERE first_name = 'ERICA'

-- 8. How many rentals have not been returned yet
SELECT COUNT(*)
FROM rental
WHERE return_date is null

-- 9. List all the payment_ids with an amount less than or equal to $2.
SELECT payment_id, amount
FROM payment
WHERE amount <= 2

-- 10. List all the payments from customers 322, 346, and 354 where the amount is either less than $2 or greater than $10.
-- Ordered by the customer first (ascending) and then as second condition order by the amount in descending order.
SELECT * 
FROM payment
WHERE (customer_id IN (322, 346, 354)) AND (amount < 2 OR amount > 10)
ORDER BY customer_id ASC, amount DESC

-- 11. How many payments have been made on January 26th and 27th 2020 with an amount between 1.99 and 3.99?
SELECT COUNT(*) 
FROM payment
WHERE payment_date BETWEEN '2020-01-26' AND '2020-01-28'
AND amount BETWEEN 1.99 AND 3.99

-- 12. Write a SQL query to get a list of the concerned payments with customer_id: 12,25,67,93,124,234. Customers with amounts 4.99, 7.99, and 9.99 in January 2020.
SELECT * FROM payment
WHERE customer_id IN(12,25,67,93,124,234)
AND amount IN (4.99, 7.99, 9.99)
AND payment_date BETWEEN '2020-01-01' AND '2020-02-01'
