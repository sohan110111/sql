# 📚 Simple Library Management System - SQL Practice Project

This project is a simple database system for managing books and authors.  
It helps you practice **DDL** (CREATE, ALTER) and **DML** (INSERT, UPDATE, DELETE, SELECT) in **Microsoft SQL Server**.

---

## 🛠️ Project Structure

- **Database**: `LibraryDB`
- **Tables**:
  - `Authors`
  - `Books`
- **Operations**:
  - Create database and tables
  - Insert sample data
  - Query records
  - Update and delete records

---

## 📜 Full SQL Code

```sql
-- Create Database
CREATE DATABASE LibraryDB;
GO

USE LibraryDB;
GO

-- Create Authors Table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    AuthorName NVARCHAR(100) NOT NULL
);
GO

-- Create Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(200) NOT NULL,
    AuthorID INT FOREIGN KEY REFERENCES Authors(AuthorID),
    PublishedYear INT
);
GO

-- Insert Data
INSERT INTO Authors (AuthorName) VALUES 
('J.K. Rowling'),
('George R.R. Martin'),
('J.R.R. Tolkien');
GO

INSERT INTO Books (Title, AuthorID, PublishedYear) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 1997),
('A Game of Thrones', 2, 1996),
('The Hobbit', 3, 1937);
GO

-- Select Data
SELECT * FROM Authors;
GO

SELECT * FROM Books;
GO

SELECT 
    Books.Title, 
    Authors.AuthorName, 
    Books.PublishedYear
FROM Books
INNER JOIN Authors ON Books.AuthorID = Authors.AuthorID;
GO

-- Update a Book Title
UPDATE Books
SET Title = 'Harry Potter and the Philosopher''s Stone'
WHERE BookID = 1;
GO

-- Delete a Book
DELETE FROM Books
WHERE BookID = 2;
GO
