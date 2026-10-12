-- Database Technologies Lab Sheet 1 | Question 34
-- Question: Rename document_store.content to doc_body while keeping LONGTEXT.

ALTER TABLE document_store
CHANGE COLUMN content doc_body LONGTEXT;
