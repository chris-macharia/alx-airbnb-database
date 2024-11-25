-- Insert sample data into User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
  ('c8a23fbd-8d19-4c30-bb90-2d789fbbaf16', 'John', 'Doe', 'john.doe@example.com', 'hashedpassword1', '123-456-7890', 'guest'),
  ('47ab26e5-d12e-4a93-8752-5f2f43a8011a', 'Jane', 'Smith', 'jane.smith@example.com', 'hashedpassword2', '123-456-7891', 'host'),
  ('8f44f402-2d04-42d7-9e7c-540a756cb3a0', 'Michael', 'Johnson', 'michael.johnson@example.com', 'hashedpassword3', '123-456-7892', 'admin');

-- Insert sample data into Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('7b9c5fe5-c4cc-4da7-8a57-7d984b76234b', '47ab26e5-d12e-4a93-8752-5f2f43a8011a', 'Oceanfront Villa', 'A luxurious villa by the beach', 'Malibu, CA', 500.00),
  ('8d02a506-02db-44c1-8f93-14a91e8a0e9b', '47ab26e5-d12e-4a93-8752-5f2f43a8011a', 'Mountain Retreat', 'A peaceful cabin in the mountains', 'Aspen, CO', 250.00),
  ('c8b84088-8e59-4748-bd8c-4129b76841a7', '47ab26e5-d12e-4a93-8752-5f2f43a8011a', 'City Loft', 'Modern apartment in downtown', 'New York, NY', 350.00);

-- Insert sample data into Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('d39e3d78-0280-4515-8a2f-380f1dbadcc7', '7b9c5fe5-c4cc-4da7-8a57-7d984b76234b', 'c8a23fbd-8d19-4c30-bb90-2d789fbbaf16', '2024-12-01', '2024-12-07', 3000.00, 'confirmed'),
  ('fb6b9a22-3b2b-42fa-bd93-522f1bc1abf3', '8d02a506-02db-44c1-8f93-14a91e8a0e9b', 'c8a23fbd-8d19-4c30-bb90-2d789fbbaf16', '2024-12-10', '2024-12-15', 1250.00, 'pending'),
  ('b79bfa88-818e-4ec6-b939-d330aeb03e4b', 'c8b84088-8e59-4748-bd8c-4129b76841a7', '47ab26e5-d12e-4a93-8752-5f2f43a8011a', '2024-12-20', '2024-12-25', 1750.00, 'confirmed');

-- Insert sample data into Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  ('8c9e0e23-f865-4ed1-bc0c-278b8fef2d35', 'd39e3d78-0280-4515-8a2f-380f1dbadcc7', 3000.00, '2024-11-28', 'credit_card'),
  ('92e2de69-8d9b-489f-b2b7-2c6fe8b5365a', 'b79bfa88-818e-4ec6-b939-d330aeb03e4b', 1750.00, '2024-12-05', 'paypal');

-- Insert sample data into Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  ('67c9bbf4-c2be-4a22-b9cd-5152643da07d', '7b9c5fe5-c4cc-4da7-8a57-7d984b76234b', 'c8a23fbd-8d19-4c30-bb90-2d789fbbaf16', 5, 'Amazing place, loved every moment!'),
  ('315b2050-7de0-4d87-b84b-e1979831b11c', '8d02a506-02db-44c1-8f93-14a91e8a0e9b', 'c8a23fbd-8d19-4c30-bb90-2d789fbbaf16', 4, 'Very peaceful, but a bit isolated from town.');

-- Insert sample data into Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  ('bc4aeb7e-bdef-4f2a-b010-08e96d2de67e', 'c8a23fbd-8d19-4c30-bb90-2d789fbbaf16', '47ab26e5-d12e-4a93-8752-5f2f43a8011a', 'Hi, I would like to confirm the booking for the Oceanfront Villa.'),
  ('7be2fe35-0a66-48a1-9a8b-217d28f7a58b', '47ab26e5-d12e-4a93-8752-5f2f43a8011a', 'c8a23fbd-8d19-4c30-bb90-2d789fbbaf16', 'Your booking has been confirmed, enjoy your stay!');
