/* 1. • Low price ticket: total_amount < 20,000 
      • Mid price ticket: total_amount between 20,000 and 150,000 
      • High price ticket: total_amount >= 150,000
*/
SELECT
COUNT(*) AS tickets,
CASE 
WHEN total_amount < 20000 THEN 'low price ticket'
WHEN total_amount < 150000 THEN 'mid-price ticket'
ELSE 'high price ticket'
END as ticket_price
FROM bookings

/* -- 2. How many flights have departed in the
following seasons:
• Winter: December, January, February
• Spring: March, April, May
• Summer: June, July, August
• Fall: September, October, November
*/

SELECT 
COUNT(*) as flights,
CASE
WHEN EXTRACT(month from scheduled_departure) IN (12,1,2) THEN 'Winter'
WHEN EXTRACT (month from scheduled_departure) <= 5 THEN 'Spring' WHEN EXTRACT (month from scheduled_departure) <= 8 THEN 'Summer'
ELSE 'Fall' 
END as season
FROM flights
GROUP BY season

--3. How many people choose seats in the categories, Business, Economy, and Comfort?
SELECT fare_conditions, COUNT(*)
FROM boarding_passes b
INNER JOIN seats s
ON s.seat_no = b.seat_no
GROUP BY fare_conditions

--4. find out which seat has been chosen most frequently.
SELECT s.seat_no, COUNT(*) as total
FROM seats s
LEFT JOIN boarding_passes b
ON s.seat_no = b.seat_no
GROUP BY s.seat_no
ORDER BY total DESC

--5.The average amount of seats
SELECT seat_no, ROUND(AVG(amount),2) 
FROM boarding_passes b
LEFT JOIN ticket_flights t
ON b.ticket_no = t.ticket_no
AND b.flight_id = t.flight_id
GROUP BY seat_no
ORDER by 2 DESC

--6. Which passenger (passenger_name) has spent most amount in their bookings (total_amount)?
      
SELECT passenger_name,SUM(total_amount) FROM tickets t
INNER JOIN bookings b
ON t.book_ref=b.book_ref
GROUP BY passenger_name
ORDER BY SUM(total_amount) DESC

--7. Which fare_condition has ALEKSANDR IVANOV used the most?
      
SELECT passenger_name, fare_conditions, COUNT(*) FROM tickets t
INNER JOIN bookings b
ON t.book_ref=b.book_ref
INNER JOIN ticket_flights tf
ON t.ticket_no=tf.ticket_no
WHERE passenger_name = 'ALEKSANDR IVANOV'
GROUP BY fare_conditions, passenger_name

--8. Which title has GEORGE LINTON rented the most often?
      
SELECT first_name, last_name, title, COUNT(*)
FROM customer cu
INNER JOIN rental re
ON cu.customer_id = re.customer_id
INNER JOIN inventory inv
ON inv.inventory_id=re.inventory_id
INNER JOIN film fi
ON fi.film_id = inv.film_id
WHERE first_name='GEORGE' and last_name='LINTON'
GROUP BY title, first_name, last_name
ORDER BY 4 DESC
