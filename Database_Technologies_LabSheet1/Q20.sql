-- Database Technologies Lab Sheet 1 | Question 20
-- Question: Re-add a primary key to clients.client_id after table creation.

ALTER TABLE clients
ADD PRIMARY KEY (client_id);
