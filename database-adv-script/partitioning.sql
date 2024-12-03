-- Step 1: Implement Partitioning on the Booking Table

-- First, we will create a partitioned table based on the 'start_date' column. 
-- We will partition by range, dividing the data by year.

-- Create a new partitioned table for Booking
CREATE TABLE Booking_partitioned (
    booking_id UUID PRIMARY KEY,
    user_id UUID,
    property_id UUID,
    start_date DATE,
    end_date DATE,
    total_price DECIMAL,
    status ENUM('pending', 'confirmed', 'canceled'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Create partitions for each year. Adjust the range accordingly based on your data.
CREATE TABLE Booking_2020 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2020-01-01') TO ('2021-01-01');

CREATE TABLE Booking_2021 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2021-01-01') TO ('2022-01-01');

CREATE TABLE Booking_2022 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE Booking_2023 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

-- Continue creating partitions as necessary for each year

-- Step 2: Testing Queries Before and After Partitioning

-- Before partitioning: Test performance of a query that retrieves bookings in a date range.
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE start_date BETWEEN '2022-01-01' AND '2022-12-31';

-- After partitioning: Test performance of the same query on the partitioned table.
EXPLAIN ANALYZE
SELECT * FROM Booking_partitioned WHERE start_date BETWEEN '2022-01-01' AND '2022-12-31';
