-- Database Technologies Lab Sheet 1 | Question 29
-- Question: Create user_accounts with user_id BIGINT primary key, account_type ENUM('Standard','Premium','Admin'), and created_timestamp TIMESTAMP.

CREATE TABLE user_accounts (
    user_id BIGINT PRIMARY KEY,
    account_type ENUM('Standard', 'Premium', 'Admin'),
    created_timestamp TIMESTAMP
);
