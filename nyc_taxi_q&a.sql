-- Q1 How many unique passengers uptill now have used the taxi service?

SELECT COUNT(DISTINCT passenger_count) as unique_passengers FROM taxi_trips;

-- Q2 What is the average trip distance?

SELECT ROUND(CAST(AVG(trip_distance) AS NUMERIC),2) as avg_trip_distance FROM taxi_trips;

-- Q3 How many trips were paid by cash? [1.Credit card 2.Cash 3.No charge 4.Dispute 5.Unknown 6.Voided trip]

SELECT COUNT(*)as cash_based_transactions FROM taxi_trips WHERE payment_type=2;

-- Q4 What is the longest trip that was paid by credit card?

SELECT MAX(trip_distance) as longest_trip_paid_by_credit_card FROM taxi_trips WHERE payment_type=2;

-- Q5 What is the total fare amount (fare_amount) collected from all trips?

SELECT CONCAT('$',ROUND(CAST(SUM(fare_amount)/1000000.0 AS NUMERIC),2),' ','million') as total_fare FROM taxi_trips;

-- Q6 How many trips were stored and forwarded (store_and_fwd_flag)?

SELECT COUNT(*) as trips_that_are_stored_and_forwarded FROM taxi_trips WHERE store_and_fwd_flag IN ('Y');

-- Q7 What is the total amount collected from all trips that were not stored and forwarded?

SELECT SUM(total_amount) as total_amount_from_non_stored FROM taxi_trips WHERE store_and_fwd_flag='N';

-- Q8 What is the average trip distance for each unique number of passengers?

SELECT passenger_count,AVG(trip_distance) as avg_distance FROM taxi_trips GROUP BY passenger_count;

-- Q9 Using a window function, rank the payment_types based on the fare_amount in descending order.

SELECT payment_type, RANK() OVER(ORDER BY SUM(fare_amount) DESC) AS ranking 
FROM taxi_trips
GROUP BY payment_type;

-- Q10 Calculate the cumulative sum of fare_amount for each payment_type.

SELECT payment_type, CONCAT('$',ROUND(CAST(SUM(fare_amount) AS NUMERIC),2))  AS total_fare_amount
FROM taxi_trips
GROUP BY payment_type;

-- Q11 Find the average trip_distance for each payment_type, and then rank these averages.

WITH CTE AS (

SELECT payment_type, AVG(trip_distance) as avg_trip_distance
FROM taxi_trips
GROUP BY payment_type
	
)

SELECT CTE.payment_type, RANK() OVER(ORDER BY CTE.avg_trip_distance) as ranking FROM CTE;

-- Q12 Classify payment types into ‘Electronic’ (Credit card) and ‘Non-Electronic’ (Cash, No charge, Dispute, Unknown, Voided trip) and find the total number of trips for each category.

SELECT *,
      CASE
          WHEN payment_type IN (2, 3, 4,5,6) THEN 'Non-Electronic'
          ELSE 'Electronic'
      END as verdict

FROM taxi_trips LIMIT 10;

-- Q13 How does the average trip distance vary by the hour of the day?


SELECT ROUND(CAST(AVG(trip_distance) AS NUMERIC),2),EXTRACT(HOUR FROM tpep_pickup_datetime) as hours
FROM taxi_trips
GROUP BY EXTRACT(HOUR FROM tpep_pickup_datetime)
ORDER BY EXTRACT(HOUR FROM tpep_pickup_datetime) ASC


-- Q14 What is the average fare amount for each day of the week?

SELECT CONCAT('$',ROUND(CAST(AVG(fare_amount) AS NUMERIC),2))as avg_fare_amount,EXTRACT(DOW FROM tpep_pickup_datetime) as day_of_week
FROM taxi_trips
GROUP BY EXTRACT(DOW FROM tpep_pickup_datetime)
ORDER BY EXTRACT(DOW FROM tpep_pickup_datetime) DESC


-- Q15 What is the total fare amount for each month of the year?

SELECT CONCAT('$',ROUND(CAST(SUM(fare_amount)/1000000.0 AS NUMERIC),2),' ','million') as total_fare_amount,EXTRACT(MONTH FROM tpep_pickup_datetime) as months,EXTRACT(YEAR FROM tpep_pickup_datetime) as years
FROM taxi_trips
GROUP BY EXTRACT(MONTH FROM tpep_pickup_datetime),EXTRACT(YEAR FROM tpep_pickup_datetime)
ORDER BY EXTRACT(MONTH FROM tpep_pickup_datetime) ASC, EXTRACT(YEAR FROM tpep_pickup_datetime) ASC


-- Q16 What is the 90th percentile of trip distance for each passenger count?

WITH CTE AS(

SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY trip_distance) as ans,passenger_count
FROM taxi_trips 
GROUP BY passenger_count
	
)	

SELECT ROUND(CAST(CTE.ans AS NUMERIC),2),CTE.passenger_count
FROM CTE
ORDER BY CTE.passenger_count


-- Q17 What is the average number of passengers for trips with a fare amount above the overall average fare amount?

SELECT AVG(passenger_count)
FROM taxi_trips
WHERE fare_amount > (SELECT AVG(fare_amount) FROM taxi_trips)


-- Q17 What is the average fare amount for each month of the year, only considering trips that are shorter than the average trip distance?

SELECT CONCAT('$',ROUND(CAST(AVG(fare_amount) AS NUMERIC),2)) as avg_fare_amount,EXTRACT(MONTH FROM tpep_pickup_datetime) as months,EXTRACT(YEAR FROM tpep_pickup_datetime) as years
FROM taxi_trips
WHERE trip_distance < (SELECT AVG(trip_distance) FROM taxi_trips)
GROUP BY EXTRACT(MONTH FROM tpep_pickup_datetime), EXTRACT(YEAR FROM tpep_pickup_datetime) 


-- Q18 Find the top 5 pickup locations (latitude and longitude) with the highest average fare amount. Exclude trips with zero passengers?

WITH CTE AS (

SELECT pickup_latitude,pickup_longitude,AVG(fare_amount) as fare
FROM taxi_trips
WHERE passenger_count > 0 
GROUP BY pickup_latitude,pickup_longitude

)

SELECT CTE.pickup_latitude,CTE.pickup_longitude 
FROM CTE
ORDER BY CTE.fare DESC
LIMIT 5;

-- Q18 Write a SQL query to find the difference in total_amount between each trip and its preceding trip for each payment_type.

WITH CTE AS (

SELECT payment_type, total_amount - COALESCE(LAG(total_amount) OVER(PARTITION BY payment_type ORDER BY tpep_pickup_datetime),0) as difference
FROM taxi_trips
	
)

SELECT CTE.payment_type, CTE.difference
FROM CTE


-- Q19 Write a SQL query to find the maximum fare_amount for each hour of the day. Assume that the tpep_pickup_datetime is stored in the format ‘YYYY-MM-DD HH:MI:SS’.

WITH CTE AS(

SELECT EXTRACT(HOUR FROM tpep_pickup_datetime) as hours,MAX(fare_amount) as max_fare
FROM taxi_trips
GROUP BY EXTRACT(HOUR FROM tpep_pickup_datetime)
	
)	

SELECT hours,max_fare
FROM CTE
ORDER BY hours


-- Q20 Write a SQL query to find all taxi trips where the absolute difference between pickup_longitude and dropoff_longitude is greater than 1. Use the ABS function to calculate the absolute difference.


SELECT ROUND(CAST(ABS(pickup_longitude - dropoff_longitude) AS NUMERIC),2) as difference
FROM taxi_trips
WHERE ABS(pickup_longitude - dropoff_longitude) >1
	

-- Q21 Write a SQL query to find the average total_amount for each passenger_count, but only include those passenger_count groups having more than 100 trips.?

WITH CTE AS (


SELECT ROUND(CAST(AVG(total_amount) AS NUMERIC),2) as avg_total_amount,passenger_count,COUNT(*) as trips
FROM taxi_trips
GROUP BY passenger_count
HAVING COUNT(*) >100 
	
)

SELECT avg_total_amount,passenger_count, trips 
FROM CTE


