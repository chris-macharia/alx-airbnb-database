# Database Normalization to Third Normal Form (3NF)

## **Normalization Overview**
Normalization ensures that a database design:
1. Eliminates redundant data.
2. Maintains data integrity by reducing anomalies.

The Airbnb database schema was reviewed and found to be in **Third Normal Form (3NF)**. Below are the steps taken to ensure compliance.

---

## **Normalization Steps**

### 1. First Normal Form (1NF)
- Ensured that all attributes contain atomic values.
- Verified that no columns have repeating groups or arrays.
- Confirmed that each table has a unique identifier (primary key).

### 2. Second Normal Form (2NF)
- Verified that all non-key attributes are fully functionally dependent on the whole primary key.
- Ensured that there are no partial dependencies.

### 3. Third Normal Form (3NF)
- Confirmed that there are no transitive dependencies (non-key attributes depending on other non-key attributes).

---

## **Schema Review and Analysis**

### **Entities and Relationships**
- **User Table**: Attributes depend directly on the primary key `user_id`.
- **Property Table**: Attributes depend directly on the primary key `property_id`, with `host_id` properly referenced as a foreign key.
- **Booking Table**: Attributes depend on `booking_id`, with proper foreign key references to `property_id` and `user_id`.
- **Payment Table**: Attributes depend directly on the primary key `payment_id`.
- **Review Table**: Attributes depend directly on `review_id`, with foreign keys referencing `property_id` and `user_id`.
- **Message Table**: Attributes depend directly on `message_id`, with `sender_id` and `recipient_id` correctly referenced.

### **Findings**
- No partial or transitive dependencies were identified.
- All tables comply with 3NF by design.

---

## **Conclusion**
The Airbnb database schema is normalized to **Third Normal Form (3NF)**. No further modifications were required.
