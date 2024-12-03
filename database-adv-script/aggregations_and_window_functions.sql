-- Query 1: Use COUNT function and GROUP BY to find the total number of bookings made by each user
SELECT user_id, COUNT(booking_id) AS total_bookings
FROM Booking
GROUP BY user_id;

-- Query 2: Use a window function (ROW_NUMBER) to rank properties based on the total number of bookings they have received
SELECT property_id, name, COUNT(booking_id) AS total_bookings,
       ROW_NUMBER() OVER (ORDER BY COUNT(booking_id) DESC) AS booking_rank
FROM Property
LEFT JOIN Booking ON Property.property_id = Booking.property_id
GROUP BY property_id
ORDER BY booking_rank;
