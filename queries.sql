-- Queries for Banking Management System
USE my_BMS;

-- 1. View all customers with their addresses
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email_address,
    CONCAT(a.line1, ', ', a.city, ', ', a.state) as full_address
FROM customers c
JOIN addresses a ON c.address_id = a.address_id
ORDER BY c.last_name, c.first_name;

-- 2. Show all accounts with customer information
SELECT 
    a.account_id,
    CONCAT(c.first_name, ' ', c.last_name) as customer_name,
    a.account_type,
    a.balance,
    a.status,
    a.created_at
FROM accounts a
JOIN customers c ON a.customer_id = c.customer_id
ORDER BY a.balance DESC;

-- 3. Find customers with multiple accounts
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) as customer_name,
    COUNT(a.account_id) as account_count,
    SUM(a.balance) as total_balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(a.account_id) > 1
ORDER BY total_balance DESC;

-- 4. Show recent transactions with account details
SELECT 
    t.transaction_id,
    CONCAT(c.first_name, ' ', c.last_name) as customer_name,
    a.account_type,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
JOIN customers c ON a.customer_id = c.customer_id
ORDER BY t.transaction_date DESC
LIMIT 10;

-- 5. Calculate total deposits and withdrawals by account
SELECT 
    a.account_id,
    CONCAT(c.first_name, ' ', c.last_name) as customer_name,
    a.account_type,
    SUM(CASE WHEN t.transaction_type = 'Deposit' THEN t.amount ELSE 0 END) as total_deposits,
    SUM(CASE WHEN t.transaction_type = 'Withdrawal' THEN t.amount ELSE 0 END) as total_withdrawals,
    SUM(CASE WHEN t.transaction_type = 'Transfer' THEN t.amount ELSE 0 END) as total_transfers
FROM accounts a
JOIN customers c ON a.customer_id = c.customer_id
LEFT JOIN transactions t ON a.account_id = t.account_id
GROUP BY a.account_id, c.first_name, c.last_name, a.account_type
ORDER BY total_deposits DESC;

-- 6. Find accounts with highest transaction activity
SELECT 
    a.account_id,
    CONCAT(c.first_name, ' ', c.last_name) as customer_name,
    a.account_type,
    COUNT(t.transaction_id) as transaction_count,
    SUM(t.amount) as total_transaction_amount
FROM accounts a
JOIN customers c ON a.customer_id = c.customer_id
LEFT JOIN transactions t ON a.account_id = t.account_id
GROUP BY a.account_id, c.first_name, c.last_name, a.account_type
ORDER BY transaction_count DESC;

-- 7. Find customers with highest total balance
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) as customer_name,
    c.email_address,
    COUNT(a.account_id) as account_count,
    SUM(a.balance) as total_balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
WHERE a.status = 'active'
GROUP BY c.customer_id, c.first_name, c.last_name, c.email_address
ORDER BY total_balance DESC;

-- 8. Monthly transaction summary
SELECT 
    YEAR(transaction_date) as year,
    MONTH(transaction_date) as month,
    transaction_type,
    COUNT(*) as transaction_count,
    SUM(amount) as total_amount
FROM transactions
GROUP BY YEAR(transaction_date), MONTH(transaction_date), transaction_type
ORDER BY year DESC, month DESC, transaction_type;

-- 9. Show all transfers with related account details
SELECT 
    t.transaction_id,
    CONCAT(c1.first_name, ' ', c1.last_name) as from_customer,
    a1.account_type as from_account_type,
    t.amount,
    CONCAT(c2.first_name, ' ', c2.last_name) as to_customer,
    a2.account_type as to_account_type,
    t.transaction_date
FROM transactions t
JOIN accounts a1 ON t.account_id = a1.account_id
JOIN customers c1 ON a1.customer_id = c1.customer_id
JOIN accounts a2 ON t.related_account = a2.account_id
JOIN customers c2 ON a2.customer_id = c2.customer_id
WHERE t.transaction_type = 'Transfer'
ORDER BY t.transaction_date DESC;

-- 10. Show account creation timeline
SELECT 
    DATE(created_at) as creation_date,
    COUNT(*) as accounts_created,
    account_type
FROM accounts
GROUP BY DATE(created_at), account_type
ORDER BY creation_date DESC;
