DROP DATABASE IF EXISTS my_BMS;
CREATE DATABASE my_BMS;
USE my_BMS;

-- addresses table
CREATE TABLE addresses (
    address_id   INT 			PRIMARY KEY 	AUTO_INCREMENT,
    line1        VARCHAR(60) 					NOT NULL,
    line2        VARCHAR(60) 					DEFAULT NULL,
    city         VARCHAR(40) 					NOT NULL,
    state        VARCHAR(2) 					NOT NULL,
    zip_code     VARCHAR(10) 					NOT NULL,
    phone        VARCHAR(20) 					NOT NULL,
    disabled     TINYINT(1) 					NOT NULL DEFAULT 0
);

-- customers table
CREATE TABLE customers (
    customer_id     INT 		PRIMARY KEY 	AUTO_INCREMENT,
    first_name      VARCHAR(50) 				NOT NULL,
    last_name       VARCHAR(50) 				NOT NULL,
    email_address   VARCHAR(255) 				NOT NULL 		UNIQUE,
    phone_number    VARCHAR(20) 				NOT NULL,
    address_id      INT 										UNIQUE,
    created_at      DATETIME 					DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT customers_fk_addresses
        FOREIGN KEY (address_id)
        REFERENCES addresses(address_id)
);

-- accounts table
CREATE TABLE accounts (
    account_id     INT 			PRIMARY KEY 	AUTO_INCREMENT NOT NULL,
    customer_id    INT 							NOT NULL,
    account_type   VARCHAR(20) 					NOT NULL,
    balance        DECIMAL(15, 2) 				NOT NULL DEFAULT 0.00,
    created_at     DATETIME 					NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status         VARCHAR(20) 					DEFAULT 'active',
    CONSTRAINT accounts_fk_customers
        FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
);

-- transactions table
CREATE TABLE transactions (
    transaction_id    INT 		PRIMARY KEY 	AUTO_INCREMENT NOT NULL,
    account_id        INT 						NOT NULL,
    transaction_type  ENUM('Deposit', 'Withdrawal', 'Transfer') NOT NULL,
    amount            DECIMAL(15,2) 			NOT NULL CHECK (amount > 0),
    transaction_date  DATETIME 					NOT NULL DEFAULT CURRENT_TIMESTAMP,
    related_account   INT 						DEFAULT NULL,
    CONSTRAINT transactions_fk_accounts
        FOREIGN KEY (account_id)
        REFERENCES accounts (account_id)
);
