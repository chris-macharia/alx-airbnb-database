-- Refactored query to improve performance by reducing unnecessary joins and optimizing with indexes
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
    -- Add a condition if necessary to limit results or improve efficiency, e.g., based on date
    b.start_date >= '2024-01-01'
ORDER BY
    b.start_date;
