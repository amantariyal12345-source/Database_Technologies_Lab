-- Q4. Create Library with unique BookID and insert 5 books.
USE SchoolConstraintsDB;
CREATE TABLE IF NOT EXISTS Library (
    BookID INT PRIMARY KEY,
    BookTitle VARCHAR(255) NOT NULL,
    Author VARCHAR(255)
);

INSERT INTO Library (BookID, BookTitle, Author) VALUES
(1, 'Database Systems', 'R. Elmasri'),
(2, 'Operating Systems', 'A. Silberschatz'),
(3, 'Computer Networks', 'A. Tanenbaum'),
(4, 'Clean Code', 'R. Martin'),
(5, 'Introduction to Algorithms', 'T. Cormen');
