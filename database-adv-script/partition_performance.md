# Report: Implementing Table Partitioning on the Booking Table

## Objective

The objective of this task was to implement table partitioning on the `Booking` table to optimize query performance on large datasets. The table was partitioned based on the `start_date` column, and the performance of queries was tested before and after partitioning.

## Problem Statement

The `Booking` table is large, and querying performance becomes slow when filtering by the `start_date` column, especially when retrieving data for specific date ranges. The goal was to partition the table by year, improving performance for such queries.

## Steps Taken

### Step 1: Partitioning the Booking Table

To optimize query performance, the `Booking` table was partitioned using the `start_date` column. We chose to partition the data by year using the `PARTITION BY RANGE` clause in PostgreSQL.

1. **Created a new partitioned table**: The `Booking` table was recreated with partitioning enabled on the `start_date` column.
2. **Created partitions**: Separate partitions were created for each year, such as `Booking_2020`, `Booking_2021`, etc., to ensure efficient data organization and faster queries based on the year.
3. **Adjusted partitions**: More partitions can be added as the dataset grows to maintain efficiency.

### Step 2: Testing Query Performance Before and After Partitioning

To measure the improvements in performance, we tested the query execution times using the `EXPLAIN ANALYZE` command.

1. **Before partitioning**: A query was run to retrieve bookings for a specific date range (e.g., for the year 2022) on the original `Booking` table.
2. **After partitioning**: The same query was run on the new partitioned table `Booking_partitioned` to evaluate the performance improvement.

### Step 3: Performance Analysis

- **Before Partitioning**: The query had to scan the entire `Booking` table, which led to slower execution times, especially when filtering for specific date ranges.
- **After Partitioning**: The query performance improved significantly because the database only needed to scan the relevant partition(s) for the specified date range.

## Observed Improvements

- **Faster Query Performance**: The query performance improved because partitioning allowed the database to focus on smaller subsets of data rather than scanning the entire table.
- **Reduced Disk I/O**: Partitioning resulted in reduced disk I/O by limiting the number of rows scanned for each query.
- **Improved Efficiency**: Queries filtering by specific date ranges (e.g., bookings for a given year) were executed more efficiently due to the partitioned data.

## Conclusion

Partitioning the `Booking` table by the `start_date` column significantly improved the performance of queries that filter by date range. The use of `PARTITION BY RANGE` allowed for more efficient data retrieval by reducing the number of rows scanned during query execution. As the dataset continues to grow, partitioning will be essential for maintaining optimal query performance.

The implementation of partitioning in this case demonstrates a powerful technique for optimizing queries on large datasets, particularly when working with time-based data.

