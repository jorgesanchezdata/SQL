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

-- 12. Get a list of the concerned payments with customer_id: 12,25,67,93,124,234. Customers with amounts 4.99, 7.99, and 9.99 in January 2020.
SELECT * FROM payment
WHERE customer_id IN(12,25,67,93,124,234)
AND amount IN (4.99, 7.99, 9.99)
AND payment_date BETWEEN '2020-01-01' AND '2020-02-01'

-- 13. How many movies are there that contain the "Documentary" in the description?
SELECT COUNT(*) FROM film
WHERE description ILIKE '%doc%'

-- 14, How many movies are there that contain 'Saga' in the description and where the title starts either with 'A' or ends with 'R'?
SELECT COUNT(*) AS number_of_films 
FROM film
WHERE description LIKE '%Saga%'
AND (title LIKE 'A%' 
OR title LIKE '%R') 

-- 15. Create a list of all customers where the first name contains 'ER' and has an 'A' as the second letter. Order the results by the last name descendingly.
SELECT * FROM customer
WHERE first_name LIKE '%ER%' 
AND first_name LIKE '_A%' 
ORDER BY last_name DESC

-- 16. How many payments are there where the amount is either 0 or is between 3.99 and 7.99 and in the same time has happened on 2020-05-01
SELECT COUNT(*) FROM payment
WHERE (amount =  0 OR amount BETWEEN 3.99 AND 7.99)
AND payment_date BETWEEN '2020-05-01' AND '2020-05-02'

-- 17. Your manager wants to which of the two employees (staff_id) is responsible for more payments?
SELECT staff_id, SUM(amount), COUNT(*) 
FROM payment
GROUP BY staff_id

-- 18. Which employee had the highest sales amount in a single day? Which employee had the most sales in a single day.
SELECT staff_id, DATE(payment_date), SUM(amount), COUNT(amount) 
FROM payment
GROUP BY staff_id, DATE(payment_date)
ORDER BY SUM(amount) DESC

/*19. n 2020, April 28, 29, and 30 were days with very high revenue.
That's why we want to focus on this task only these days.
Find out what is the average payment amount grouped by
customer and day – consider only the days/customers with
more than 1 payment (per customer and day).
Order by the average amount in descending order.*/

SELECT customer_id, DATE(payment_date), ROUND(AVG(amount),2) AS average_amount, COUNT(*)
FROM payment
WHERE DATE(payment_date) IN ('2020-04-28','2020-04-29', '2020-04-30')
GROUP BY customer_id, DATE(payment_date)
HAVING COUNT(*) > 1
ORDER BY average_amount DESC

-- 20. Find these customers and output the list of these first and last names in all lowercase  
SELECT LOWER(first_name), LOWER(last_name), LOWER(email)
FROM customer

--21. Extract the last 5 characters of the email address first. The email address always ends with '.org'.
SELECT LEFT(RIGHT(email,4), 1), RIGHT(email,3)
FROM customer

-- 22. What's the month with the highest total payment amount?
SELECT EXTRACT(month from payment_date) as Month,
SUM(amount) as total_payment_amount
FROM payment
GROUP BY Month
ORDER by total_payment_amount DESC

-- 23. What's the day of the week with the highest total payment amount? (0 is Sunday)
SELECT EXTRACT(dow from payment_date) as day_of_week,
SUM(amount) as total_payment_amount
FROM payment
GROUP BY day_of_week

-- 24. What's the highest amount one customer has spent in a week?
SELECT customer_id, EXTRACT(week from payment_date) as week,
SUM(amount) as total_payment_amount
FROM payment
GROUP BY week, customer_id

--25. You need to create a list for the suppcity team of all rental durations of customers with customer_id 35.
SELECT customer_id, return_date-rental_date as rental_duration
FROM rental
WHERE customer_id = 35

-- 26. Also you need to find out for the suppcity team which customer has the longest average rental duration.
SELECT customer_id, AVG(return_date-rental_date) as rental_duration
FROM rental
GROUP BY customer_id 
ORDER BY rental_duration DESC
