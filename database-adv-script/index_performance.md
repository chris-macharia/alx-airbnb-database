### Step 1: Identify High-Usage Columns
To improve query performance, you need to identify the columns that are frequently used in the following clauses:
- `WHERE`: Columns that are often filtered on.
- `JOIN`: Columns used for joining tables.
- `ORDER BY`: Columns used for sorting results.

For the **User**, **Booking**, and **Property** tables, the following columns are likely candidates for indexing:
- **User Table**: `user_id`, `email`
- **Booking Table**: `booking_id`, `user_id`, `property_id`, `start_date`
- **Property Table**: `property_id`, `host_id`, `location`

### Step 2: Create SQL Indexes

Now, you can create indexes on these columns using the `CREATE INDEX` command. Here is an example SQL script that creates indexes for the columns identified:

```sql
-- database_index.sql

-- Creating an index on user_id in User table to speed up joins and lookups
CREATE INDEX idx_user_id ON User(user_id);

-- Creating an index on email in User table to speed up searches by email
CREATE INDEX idx_email ON User(email);

-- Creating an index on booking_id in Booking table for faster lookups
CREATE INDEX idx_booking_id ON Booking(booking_id);

-- Creating an index on user_id in Booking table to speed up queries that filter or join on user_id
CREATE INDEX idx_user_id_booking ON Booking(user_id);

-- Creating an index on property_id in Booking table to speed up queries that filter or join on property_id
CREATE INDEX idx_property_id_booking ON Booking(property_id);

-- Creating an index on start_date in Booking table for faster filtering on dates
CREATE INDEX idx_start_date_booking ON Booking(start_date);

-- Creating an index on property_id in Property table to speed up joins and lookups
CREATE INDEX idx_property_id ON Property(property_id);

-- Creating an index on host_id in Property table to speed up queries filtering by host
CREATE INDEX idx_host_id_property ON Property(host_id);

-- Creating an index on location in Property table to speed up searches by location
CREATE INDEX idx_location_property ON Property(location);
```

### Step 3: Measure Query Performance

To measure the performance before and after adding indexes, you can use the `EXPLAIN` (or `EXPLAIN ANALYZE` in PostgreSQL) to analyze query execution plans.

#### Before Adding Indexes:
Run your queries and use `EXPLAIN` to check how the database is executing them:
```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = 1;
EXPLAIN SELECT * FROM Property WHERE location = 'New York';
```
The output will show the query plan, including the number of rows scanned and whether a sequential scan or an index scan is being used.

#### After Adding Indexes:
Once the indexes are created, run the same queries with `EXPLAIN` again:
```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = 1;
EXPLAIN SELECT * FROM Property WHERE location = 'New York';
```

### Expected Results:
- **Before indexing**, the query plan might indicate **sequential scans**, which means the database is scanning all rows in the table.
- **After indexing**, the query plan should show **index scans**, indicating that the database is using the indexes to quickly retrieve the required data without scanning the entire table.

#### Example:
Before indexing:
```
Seq Scan on booking  (cost=0.00..431.00 rows=1000 width=100)
```

After indexing:
```
Index Scan using idx_user_id_booking on booking  (cost=0.00..10.00 rows=100 width=100)
```
