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

/* -- 2. how many flights have departed in the
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
