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

--5. What are the customers (first_name, last_name, phone number, and their district) from Texas?

--6. Are there any (old) addresses that are not related to any customer?
