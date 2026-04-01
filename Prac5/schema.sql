CREATE DATABASE IF NOT EXISTS ebookshop;
USE ebookshop;

CREATE TABLE IF NOT EXISTS ebookshop (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(100),
    book_author VARCHAR(100),
    book_price DECIMAL(10, 2),
    quantity INT
);

INSERT INTO ebookshop (book_id, book_title, book_author, book_price, quantity) VALUES
(1, 'Java Programming', 'John Doe', 450.00, 10),
(2, 'Web Technologies', 'Jane Smith', 300.50, 20),
(3, 'Data Structures', 'Alice Johnson', 500.00, 15),
(4, 'Operating Systems', 'Bob Williams', 400.00, 5);
