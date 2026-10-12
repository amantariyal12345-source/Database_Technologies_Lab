-- Database Technologies Lab Sheet 1 | Question 38
-- Question: Add transaction_date DATETIME as the first column in financial_ledger.

ALTER TABLE financial_ledger
ADD COLUMN transaction_date DATETIME FIRST;
