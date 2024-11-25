# AirBnB Database Schema and Sample Data

## Overview
This repository contains the SQL scripts used to define the database schema for an AirBnB clone application, as well as sample data to populate the database. The schema follows the principles of normalization and is designed to ensure data integrity and optimized performance.

## Database Schema

The database consists of several key entities, each representing a core component of the AirBnB system:

1. **User**  
2. **Property**  
3. **Booking**  
4. **Payment**  
5. **Review**  
6. **Message**

Each entity has its own table with relevant attributes, constraints, and relationships between the tables. The tables are normalized to Third Normal Form (3NF) to minimize redundancy and ensure data integrity.

## Entity-Relationship Overview

The following entities and their relationships form the core of the schema:

### 1. **User**
- Contains information about users (guests, hosts, admins).
- Attributes: `user_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`.

### 2. **Property**
- Represents properties listed by hosts.
- Attributes: `property_id`, `host_id` (foreign key to `User`), `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`.

### 3. **Booking**
- Tracks bookings made by users for properties.
- Attributes: `booking_id`, `property_id` (foreign key to `Property`), `user_id` (foreign key to `User`), `start_date`, `end_date`, `total_price`, `status`, `created_at`.

### 4. **Payment**
- Records payments made for bookings.
- Attributes: `payment_id`, `booking_id` (foreign key to `Booking`), `amount`, `payment_date`, `payment_method`.

### 5. **Review**
- Contains reviews made by users for properties.
- Attributes: `review_id`, `property_id` (foreign key to `Property`), `user_id` (foreign key to `User`), `rating`, `comment`, `created_at`.

### 6. **Message**
- Enables communication between users.
- Attributes: `message_id`, `sender_id` (foreign key to `User`), `recipient_id` (foreign key to `User`), `message_body`, `sent_at`.

## SQL Schema Definitions

The schema was defined using SQL `CREATE TABLE` statements, with appropriate primary keys, foreign keys, and constraints to ensure referential integrity. The script also includes necessary indexes for performance optimization.

### Key Features:
- **Primary Keys**: Uniquely identify each record in the respective tables.
- **Foreign Keys**: Establish relationships between entities (e.g., `user_id` in the `Booking` table).
- **Constraints**: Enforce data integrity, including `CHECK` constraints for ratings and `ENUM` values for roles and payment methods.
- **Indexes**: Created on frequently queried columns like `email`, `host_id`, `property_id`, `user_id`, etc.

## Sample Data

The `INSERT` statements populate the database with realistic sample data, reflecting the typical usage of the AirBnB system. The data includes:
- Multiple users (guests, hosts, and admins).
- Several properties with associated hosts.
- Bookings made by users for different properties.
- Payments made for those bookings.
- Reviews written by users about the properties they stayed in.
- Messages exchanged between users.

### Example Data Insertions:
- **User**: A guest (`John Doe`), a host (`Jane Smith`), and an admin (`Michael Johnson`).
- **Property**: Three properties are listed, including an oceanfront villa, a mountain retreat, and a city loft.
- **Booking**: Multiple bookings made for different properties, with statuses of `confirmed` and `pending`.
- **Payment**: Payments linked to the bookings.
- **Review**: Reviews with ratings between 1 and 5 stars.
- **Message**: Messages exchanged between a guest and a host regarding booking confirmation.

## SQL Scripts

### 1. **Database Schema Creation**
The `CREATE TABLE` SQL statements define the tables and relationships for the database schema.

### 2. **Populating Sample Data**
The `INSERT` SQL statements populate the tables with sample data, ensuring realistic test cases for the application.

## How to Use

1. **Run the Schema**:  
   First, execute the `CREATE TABLE` SQL script to define the database schema.

2. **Insert Sample Data**:  
   Then, run the `INSERT` SQL script to populate the database with sample data.

3. **Database Interaction**:  
   After executing the scripts, you can interact with the database (e.g., running queries to test functionality or use it in your application).

## Conclusion

This schema and data setup provide a robust foundation for building an AirBnB clone application. It includes essential features such as user management, property listings, booking system, payments, reviews, and messaging.

Feel free to extend or modify the schema as needed to fit specific project requirements.

---

## Contact

For any questions or further assistance, feel free to contact us at `support@example.com`.

