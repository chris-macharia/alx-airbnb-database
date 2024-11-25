# Airbnb Clone Database Schema

## Overview

This project defines the database schema for an Airbnb clone application. The schema includes tables for users, properties, bookings, payments, reviews, and messages. The goal is to ensure efficient data management and enforce data integrity across the application.

## Entities and Attributes

The database consists of the following key entities, each with its attributes:

### 1. **User Table**
- **Attributes**:
  - `user_id`: Primary Key, UUID
  - `first_name`: VARCHAR, NOT NULL
  - `last_name`: VARCHAR, NOT NULL
  - `email`: VARCHAR, UNIQUE, NOT NULL
  - `password_hash`: VARCHAR, NOT NULL
  - `phone_number`: VARCHAR, NULL
  - `role`: ENUM ('guest', 'host', 'admin'), NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 2. **Property Table**
- **Attributes**:
  - `property_id`: Primary Key, UUID
  - `host_id`: Foreign Key, references `User(user_id)`
  - `name`: VARCHAR, NOT NULL
  - `description`: TEXT, NOT NULL
  - `location`: VARCHAR, NOT NULL
  - `pricepernight`: DECIMAL, NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
  - `updated_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

### 3. **Booking Table**
- **Attributes**:
  - `booking_id`: Primary Key, UUID
  - `property_id`: Foreign Key, references `Property(property_id)`
  - `user_id`: Foreign Key, references `User(user_id)`
  - `start_date`: DATE, NOT NULL
  - `end_date`: DATE, NOT NULL
  - `total_price`: DECIMAL, NOT NULL
  - `status`: ENUM ('pending', 'confirmed', 'canceled'), NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 4. **Payment Table**
- **Attributes**:
  - `payment_id`: Primary Key, UUID
  - `booking_id`: Foreign Key, references `Booking(booking_id)`
  - `amount`: DECIMAL, NOT NULL
  - `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
  - `payment_method`: ENUM ('credit_card', 'paypal', 'stripe'), NOT NULL

### 5. **Review Table**
- **Attributes**:
  - `review_id`: Primary Key, UUID
  - `property_id`: Foreign Key, references `Property(property_id)`
  - `user_id`: Foreign Key, references `User(user_id)`
  - `rating`: INTEGER, CHECK (rating >= 1 AND rating <= 5), NOT NULL
  - `comment`: TEXT, NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 6. **Message Table**
- **Attributes**:
  - `message_id`: Primary Key, UUID
  - `sender_id`: Foreign Key, references `User(user_id)`
  - `recipient_id`: Foreign Key, references `User(user_id)`
  - `message_body`: TEXT, NOT NULL
  - `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

## Relationships Between Entities

### 1. **User to Property**:
   - One-to-many relationship. A user (host) can have many properties.

### 2. **User to Booking**:
   - One-to-many relationship. A user can book multiple properties.

### 3. **User to Review**:
   - One-to-many relationship. A user can leave many reviews.

### 4. **User to Message**:
   - One-to-many relationship. A user can send and receive many messages.

### 5. **Property to Booking**:
   - One-to-many relationship. A property can have many bookings.

### 6. **Property to Review**:
   - One-to-many relationship. A property can have many reviews.

### 7. **Booking to Payment**:
   - One-to-one relationship. Each booking has one payment associated with it.

## Constraints and Data Integrity

### 1. **Primary Keys**:
   - Each table has a primary key that ensures each record is unique.

### 2. **Foreign Keys**:
   - Foreign keys are used to link tables, ensuring referential integrity. For example, `user_id` links `Booking`, `Review`, and `Message` tables to the `User` table.

### 3. **Unique Constraints**:
   - Enforced on the `email` field in the `User` table to ensure uniqueness.

### 4. **Check Constraints**:
   - `Review.rating` ensures values are between 1 and 5.

### 5. **Not Null Constraints**:
   - Enforced on fields like `first_name`, `email`, `start_date`, and `pricepernight` to ensure they are always provided.

## Indexes for Performance Optimization

Indexes are created on the following columns to improve query performance:

- `User.email`
- `Property.property_id`
- `Booking.property_id`, `Booking.user_id`
- `Payment.booking_id`
- `Review.property_id`, `Review.user_id`
- `Message.sender_id`, `Message.recipient_id`

## Conclusion

This schema is designed to manage user data, property listings, bookings, payments, reviews, and messages effectively. By enforcing data integrity with constraints and optimizing performance through indexes, this schema provides a robust foundation for building the Airbnb clone application.
