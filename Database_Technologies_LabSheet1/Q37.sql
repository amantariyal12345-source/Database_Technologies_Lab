-- Database Technologies Lab Sheet 1 | Question 37
-- Question: Create financial_ledger with entry_id BIGINT primary key, debit DECIMAL(15,4), and credit DECIMAL(15,4).

CREATE TABLE financial_ledger (
    entry_id BIGINT PRIMARY KEY,
    debit DECIMAL(15,4),
    credit DECIMAL(15,4)
);
