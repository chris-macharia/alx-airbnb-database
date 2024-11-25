# DataScape: Mastering Database Design

## Overview

In this project, we embarked on a journey to create a robust and efficient database schema for a simulated AirBnB application, designed to manage users, properties, bookings, payments, reviews, and messaging. The database was built with optimization and data integrity in mind, following key principles of normalization to ensure the system can scale effectively and handle real-world data.

## Project Phases

### 1. **Database Schema Design**
   - We began by defining key entities such as **User**, **Property**, **Booking**, **Payment**, **Review**, and **Message**, each with their respective attributes and relationships.
   - The **User** table captures user-specific data like email, password, and role (guest, host, admin).
   - **Property** represents the listings by hosts, with data about location, price, and description.
   - **Booking** tracks reservations made by users, while **Payment** records transactions for those bookings.
   - **Review** allows users to rate properties, and **Message** enables communication between users.

### 2. **Normalization**
   - The database schema was carefully reviewed and normalized up to the **Third Normal Form (3NF)**.
   - Redundant data was eliminated, and relationships were streamlined. Each table was designed to hold unique information with minimal duplication, enhancing efficiency and maintaining data integrity.
   - The schema ensures that any updates or deletions in one table won’t result in inconsistent data across the database.

### 3. **SQL Schema Creation**
   - Using SQL `CREATE TABLE` statements, we defined all the tables and their relationships, ensuring foreign key constraints were in place to link the tables effectively.
   - Primary keys were used to uniquely identify each entity, and additional indexes were created on frequently queried columns to optimize performance.
   - Constraints such as `ENUM` types and `CHECK` were applied where necessary to enforce valid data entry.

### 4. **Sample Data Population**
   - The database was populated with realistic sample data, including multiple users (guests, hosts, admins), properties, bookings, payments, reviews, and messages.
   - SQL `INSERT` statements were crafted to simulate typical interactions within the application, reflecting real-world usage of the system.

### 5. **ER Diagram & UML Representation**
   - The relationships between entities were clearly defined in an Entity-Relationship (ER) diagram, and UML code was provided to visually represent the structure of the database.
   - Each entity was linked according to its real-world relationship with other entities, such as **User** making **Bookings**, **Property** having multiple **Reviews**, and **Payments** linked to **Bookings**.

### 6. **Optimization**
   - In addition to the relational structure, the schema was designed to optimize data retrieval and system performance by utilizing indexing and ensuring foreign key integrity.
   - By adhering to best practices in database design, the database is capable of handling large-scale datasets efficiently while maintaining consistency.

## Summary of Key Features

- **Entity Definitions**: A set of six core entities representing users, properties, bookings, payments, reviews, and messages.
- **Relationships**: Carefully designed foreign key relationships between the entities to maintain data integrity and consistency.
- **Normalization**: The schema was normalized to 3NF to eliminate redundancy and ensure data consistency.
- **SQL Scripts**: `CREATE TABLE` and `INSERT` SQL statements were provided to define the schema and populate the database with sample data.
- **Optimization**: Indexing and constraints were added to improve query performance and enforce valid data entry.

## Conclusion

By following the principles of database design and normalization, this project provides a solid foundation for building an AirBnB-like application. The schema supports essential functionality such as user management, property listings, bookings, payments, reviews, and messaging. 

This design can be expanded to include additional features, making it adaptable to various requirements. Through this project, we have mastered the essential skills of database design, ensuring scalability, data integrity, and performance optimization.

## Future Work

- **Scalability**: We can explore techniques such as sharding and partitioning to handle larger datasets.
- **Advanced Features**: Adding additional tables for features like promotions, discounts, and more granular user roles.

## Contact

For any questions or further clarifications, please reach out to us at `christophermaina003@gmail.com`.
