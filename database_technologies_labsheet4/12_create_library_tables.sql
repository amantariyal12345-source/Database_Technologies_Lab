-- Library table task: create Books, Members, and Loans.
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

CREATE TABLE IF NOT EXISTS Books (
    book_id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    isbn VARCHAR(13) UNIQUE,
    genre VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Members (
    member_id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Loans (
    loan_id INTEGER PRIMARY KEY,
    book_id INTEGER,
    member_id INTEGER,
    loan_date DATE,
    return_date DATE NULL,
    CONSTRAINT fk_loans_book FOREIGN KEY (book_id) REFERENCES Books(book_id),
    CONSTRAINT fk_loans_member FOREIGN KEY (member_id) REFERENCES Members(member_id)
);
