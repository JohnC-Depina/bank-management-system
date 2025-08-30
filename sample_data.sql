-- sample data for Banking Management System

USE my_BMS;

-- sample addresses
INSERT INTO addresses (line1, line2, city, state, zip_code, phone, disabled) VALUES
('123 Main Street', 'Apt 4B', 'New York', 'NY', '10001', '212-555-0101', 0),
('456 Oak Avenue', NULL, 'Los Angeles', 'CA', '90210', '310-555-0202', 0),
('789 Pine Road', 'Suite 100', 'Chicago', 'IL', '60601', '312-555-0303', 0),
('321 Elm Street', 'Unit 5', 'Houston', 'TX', '77001', '713-555-0404', 0),
('654 Maple Drive', NULL, 'Phoenix', 'AZ', '85001', '602-555-0505', 0),
('987 Cedar Lane', 'Apt 2A', 'Philadelphia', 'PA', '19101', '215-555-0606', 0),
('147 Birch Way', 'Floor 3', 'San Antonio', 'TX', '78201', '210-555-0707', 0),
('258 Spruce Court', NULL, 'San Diego', 'CA', '92101', '619-555-0808', 0),
('369 Willow Place', 'Suite 200', 'Dallas', 'TX', '75201', '214-555-0909', 0),
('741 Aspen Circle', 'Unit 10', 'San Jose', 'CA', '95101', '408-555-1010', 0);

-- sample customers
INSERT INTO customers (first_name, last_name, email_address, phone_number, address_id, created_at) VALUES
('John', 'Smith', 'john.smith@email.com', '212-555-0101', 1, '2023-01-15 09:30:00'),
('Sarah', 'Johnson', 'sarah.johnson@email.com', '310-555-0202', 2, '2023-02-20 14:15:00'),
('Michael', 'Williams', 'michael.williams@email.com', '312-555-0303', 3, '2023-03-10 11:45:00'),
('Emily', 'Brown', 'emily.brown@email.com', '713-555-0404', 4, '2023-04-05 16:20:00'),
('David', 'Jones', 'david.jones@email.com', '602-555-0505', 5, '2023-05-12 10:00:00'),
('Lisa', 'Garcia', 'lisa.garcia@email.com', '215-555-0606', 6, '2023-06-18 13:30:00'),
('Robert', 'Miller', 'robert.miller@email.com', '210-555-0707', 7, '2023-07-22 08:45:00'),
('Jennifer', 'Davis', 'jennifer.davis@email.com', '619-555-0808', 8, '2023-08-14 15:10:00'),
('Christopher', 'Rodriguez', 'chris.rodriguez@email.com', '214-555-0909', 9, '2023-09-30 12:00:00'),
('Amanda', 'Martinez', 'amanda.martinez@email.com', '408-555-1010', 10, '2023-10-25 17:30:00');

-- Insert sample accounts
INSERT INTO accounts (customer_id, account_type, balance, created_at, status) VALUES
(1, 'Savings', 5000.00, '2023-01-15 09:30:00', 'active'),
(1, 'Checking', 2500.00, '2023-01-15 09:30:00', 'active'),
(2, 'Savings', 12000.00, '2023-02-20 14:15:00', 'active'),
(2, 'Checking', 3500.00, '2023-02-20 14:15:00', 'active'),
(3, 'Savings', 8000.00, '2023-03-10 11:45:00', 'active'),
(4, 'Checking', 1500.00, '2023-04-05 16:20:00', 'active'),
(5, 'Savings', 25000.00, '2023-05-12 10:00:00', 'active'),
(5, 'Checking', 5000.00, '2023-05-12 10:00:00', 'active'),
(6, 'Savings', 3000.00, '2023-06-18 13:30:00', 'active'),
(7, 'Checking', 800.00, '2023-07-22 08:45:00', 'active'),
(8, 'Savings', 15000.00, '2023-08-14 15:10:00', 'active'),
(9, 'Checking', 2200.00, '2023-09-30 12:00:00', 'active'),
(10, 'Savings', 7500.00, '2023-10-25 17:30:00', 'active'),
(10, 'Checking', 1200.00, '2023-10-25 17:30:00', 'active');

-- sample transactions
INSERT INTO transactions (account_id, transaction_type, amount, transaction_date, related_account) VALUES
(1, 'Deposit', 5000.00, '2023-01-15 09:30:00', NULL),
(2, 'Deposit', 2500.00, '2023-01-15 09:30:00', NULL),
(3, 'Deposit', 12000.00, '2023-02-20 14:15:00', NULL),
(4, 'Deposit', 3500.00, '2023-02-20 14:15:00', NULL),
(5, 'Deposit', 8000.00, '2023-03-10 11:45:00', NULL),
(6, 'Deposit', 1500.00, '2023-04-05 16:20:00', NULL),
(7, 'Deposit', 25000.00, '2023-05-12 10:00:00', NULL),
(8, 'Deposit', 5000.00, '2023-05-12 10:00:00', NULL),
(9, 'Deposit', 3000.00, '2023-06-18 13:30:00', NULL),
(10, 'Deposit', 800.00, '2023-07-22 08:45:00', NULL),
(11, 'Deposit', 15000.00, '2023-08-14 15:10:00', NULL),
(12, 'Deposit', 2200.00, '2023-09-30 12:00:00', NULL),
(13, 'Deposit', 7500.00, '2023-10-25 17:30:00', NULL),
(14, 'Deposit', 1200.00, '2023-10-25 17:30:00', NULL),
(2, 'Withdrawal', 500.00, '2023-01-20 14:30:00', NULL),
(4, 'Withdrawal', 200.00, '2023-02-25 16:45:00', NULL),
(6, 'Withdrawal', 100.00, '2023-04-10 12:15:00', NULL),
(8, 'Withdrawal', 300.00, '2023-05-15 09:20:00', NULL),
(10, 'Withdrawal', 150.00, '2023-07-25 11:30:00', NULL),
(12, 'Withdrawal', 400.00, '2023-10-05 13:45:00', NULL),
(2, 'Transfer', 1000.00, '2023-01-25 10:00:00', 1),
(1, 'Transfer', 1000.00, '2023-01-25 10:00:00', 2),
(4, 'Transfer', 500.00, '2023-02-28 15:30:00', 3),
(3, 'Transfer', 500.00, '2023-02-28 15:30:00', 4),
(8, 'Transfer', 750.00, '2023-05-20 14:15:00', 7),
(7, 'Transfer', 750.00, '2023-05-20 14:15:00', 8);

-- sample data query
SELECT 'Addresses' as table_name, COUNT(*) as record_count FROM addresses
UNION ALL
SELECT 'Customers', COUNT(*) FROM customers
UNION ALL
SELECT 'Accounts', COUNT(*) FROM accounts
UNION ALL
SELECT 'Transactions', COUNT(*) FROM transactions;
