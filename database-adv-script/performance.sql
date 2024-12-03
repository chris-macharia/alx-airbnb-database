-- Initial Query: Retrieve all bookings along with user details, property details, and payment details

SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    pay.amount AS payment_amount,
    pay.payment_date
FROM
    Booking b
INNER JOIN
    User u ON b.user_id = u.user_id
INNER JOIN
    Property p ON b.property_id = p.property_id
LEFT JOIN
    Payment pay ON b.booking_id = pay.booking_id;

-- Performance Analysis: EXPLAIN the initial query

EXPLAIN SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    pay.amount AS payment_amount,
    pay.payment_date
FROM
    Booking b
INNER JOIN
    User u ON b.user_id = u.user_id
INNER JOIN
    Property p ON b.property_id = p.property_id
LEFT JOIN
    Payment pay ON b.booking_id = pay.booking_id;

-- Refactored Query: Optimize the performance by reducing unnecessary joins and adding filters

SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    pay.amount AS payment_amount,
    pay.payment_date
FROM
    Booking b
INNER JOIN
    User u ON b.user_id = u.user_id
INNER JOIN
    Property p ON b.property_id = p.property_id
LEFT JOIN
    Payment pay ON b.booking_id = pay.booking_id
WHERE
    b.start_date >= '2024-01-01'  -- Add filter to reduce rows processed
ORDER BY
    b.start_date;  -- Sort by start_date to ensure correct order

-- Indexing Recommendations for Better Performance:
-- Create indexes on frequently queried columns

CREATE INDEX idx_booking_user_property ON Booking(user_id, property_id, booking_id);
CREATE INDEX idx_user_user_id ON User(user_id);
CREATE INDEX idx_property_property_id ON Property(property_id);
