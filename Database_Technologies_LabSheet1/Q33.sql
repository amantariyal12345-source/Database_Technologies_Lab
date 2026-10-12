-- Database Technologies Lab Sheet 1 | Question 33
-- Question: Create document_store with doc_id INT primary key, doc_title VARCHAR(255), and content LONGTEXT.

CREATE TABLE document_store (
    doc_id INT PRIMARY KEY,
    doc_title VARCHAR(255),
    content LONGTEXT
);
