-- 1. INNER JOIN - Retrieve All Bookings and the Respective Users Who Made Those Bookings
-- This query retrieves all bookings along with the respective users who made those bookings.
-- It uses an INNER JOIN to ensure that only records with matching users and bookings are retrieved.

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id;

-- 2. LEFT JOIN - Retrieve All Properties and Their Reviews, Including Properties Without Reviews
-- This query retrieves all properties and their respective reviews.
-- It uses a LEFT JOIN to ensure that properties with no reviews are also included in the result, with NULL values for the review fields.

SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM 
    Property p
LEFT JOIN 
    Review r ON p.property_id = r.property_id;

-- 3. FULL OUTER JOIN - Retrieve All Users and All Bookings, Even if the User Has No Booking or the Booking Is Not Linked to a User
-- This query retrieves all users and all bookings, even if a user has no bookings or if a booking is not linked to any user.
-- It uses a FULL OUTER JOIN to include all records from both tables, filling in NULLs where there is no match.

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price
FROM 
    User u
FULL OUTER JOIN 
    Booking b ON u.user_id = b.user_id;
