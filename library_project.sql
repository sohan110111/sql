-- Create Database
CREATE DATABASE LibraryDB;
GO

-- Use the database
USE LibraryDB;
GO

-- Create Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    AuthorName NVARCHAR(100) NOT NULL
);
GO

-- Create Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(200) NOT NULL,
    AuthorID INT FOREIGN KEY REFERENCES Authors(AuthorID),
    PublishedYear INT
);
GO

-- Insert sample Authors
INSERT INTO Authors (AuthorName) VALUES 
('J.K. Rowling'),
('George R.R. Martin'),
('J.R.R. Tolkien');
GO

-- Insert sample Books
INSERT INTO Books (Title, AuthorID, PublishedYear) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 1997),
('A Game of Thrones', 2, 1996),
('The Hobbit', 3, 1937);
GO

-- Select all Authors
SELECT * FROM Authors;
GO

-- Select all Books
SELECT * FROM Books;
GO

-- Select Books with Author names
SELECT 
    Books.Title, 
    Authors.AuthorName, 
    Books.PublishedYear
FROM Books
INNER JOIN Authors ON Books.AuthorID = Authors.AuthorID;
GO

-- Update a Book's Title
UPDATE Books
SET Title = 'Harry Potter and the Philosopher''s Stone'
WHERE BookID = 1;
GO

-- Delete a Book
DELETE FROM Books
WHERE BookID = 2;
GO
