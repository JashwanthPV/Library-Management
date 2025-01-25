CREATE DATABASE library_db;
USE library_db;
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    quantity INT
);
CREATE TABLE Borrowers (
    borrower_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    borrower_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id)
);
INSERT INTO Books (title, author, genre, quantity) 
VALUES 
('Harry Potter', 'J.K. Rowling', 'Fantasy', 5),
('The Alchemist', 'Paulo Coelho', 'Fiction', 3),
('Atomic Habits', 'James Clear', 'Self-Help', 8);

INSERT INTO Borrowers (name, email, phone) 
VALUES 
('Alice Johnson', 'alice@example.com', '9876543210'),
('Bob Smith', 'bob@example.com', '1234567890');

SELECT * FROM Books;

INSERT INTO Loans (book_id, borrower_id, loan_date) 
VALUES (1, 1, CURDATE());
UPDATE Books 
SET quantity = quantity - 1 
WHERE book_id = 1;

SELECT * FROM Loans;

UPDATE Loans 
SET return_date = CURDATE() 
WHERE loan_id = 1;

UPDATE Books 
SET quantity = quantity + 1 
WHERE book_id = 1;

SELECT * FROM Books WHERE quantity < 5;
