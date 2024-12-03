-- Query 1: Non-Correlated Subquery to find all properties where the average rating is greater than 4.0
SELECT property_id, name
FROM Property
WHERE property_id IN (
    SELECT property_id
    FROM Review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- Query 2: Correlated Subquery to find users who have made more than 3 bookings
SELECT user_id, first_name, last_name
FROM User
WHERE (
    SELECT COUNT(*)
    FROM Booking
    WHERE Booking.user_id = User.user_id
) > 3;
