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
