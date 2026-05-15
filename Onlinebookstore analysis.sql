-- Database created by USING CREATE command
-- Name of the DATABASE OnlineBookStore

-- CREATE books table in onlinebookstore database
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
Book_ID serial PRIMARY KEY,
Title VARCHAR(100) NOT NULL,
Author VARCHAR(50) NOT NULL,
Genre VARCHAR(50)NOT NULL,
Published_Year int,
Price NUMERIC(10,2),
Stock int
);

-- CREATE table for customers
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
Customer_ID serial NOT NULL PRIMARY KEY,
Name varchar(100),
Email varchar(10),
Phone varchar(15),
City varchar(50),
Country varchar(100)
);

-- CREATE orders table

DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * From Customers;
SELECT * FROM Orders;

-- Q1 : Retrieve all books in the "Fiction" genre

SELECT * FROM Books
WHERE Genre = 'Fiction'
ORDER BY Genre ASC ;

-- Q2 : Find books published after the year 1950
SELECT * FROM Books
WHERE Published_year > 1950
ORDER BY Published_year ASC;

--Q3 : List all customers from the Canada
SELECT * FROM Customers
WHERE Country = 'Canada';

--Q4 : Show orders placed in November 2023
SELECT * FROM Orders;
SELECT * FROM Orders
WHERE Order_date BETWEEN '2023-11-01' AND '2023-11-30'
ORDER BY Order_date ASC ;

-- Q5 : Retrieve the total stock of books available
SELECT SUM(Stock) AS Total_stock
FROM Books;

--Q6 : Find the details of the most expensive book
SELECT Max(price) AS Most_expesnive_book
FROM Books;

--Q7 : Show all customers who ordered more than 1 quantity of a book
SELECT * FROM Orders ;

SELECT * FROM Orders
WHERE Quantity >= 1 ;

--Q8 : Retrieve all orders where the total amount exceeds $20
SELECT * FROM Orders
WHERE total_amount > 20 ;

--Q9 : List all genres available in the Books table

SELECT DISTINCT(Genre) AS all_genres_available
FROM Books;

--Q10 : Find the book with the lowest stock

SELECT * FROM Books
ORDER BY stock ASC
LIMIT 1;


-- Q11 :Calculate the total revenue generated from all orders
SELECT * FROM Orders ;

SELECT SUM (total_amount) AS total_revenue_generated
FROM ORDERS ;

--Q12 : Retrieve the total number of books sold for each genre

SELECT b.Genre, SUM(o.Quantity) AS Total_Books_sold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.Genre;

-- Q13 : Find the average price of books in the "Fantasy" genre
SELECT * FROM Books;
SELECT AVG(price) AS AVG_price
FROM Books
WHERE Genre = 'Fantasy' ;

--Q14 : List customers who have placed at least 2 orders
SELECT * FROM ORDERS ;
SELECT * FROM Orders
WHERE quantity = 2;

--Q15 : Find the most frequently ordered book
SELECT * FROM Orders;
SELECT b.title , b.author, b.genre , SUM(o.quantity) AS Total_sale
FROM Orders AS o
JOIN Books AS b
ON o.book_id = b.book_id
Group BY b.book_id 
ORDER BY total_sale DESC
LIMIT 1;

-- Q16 : Show the top 3 most expensive books of 'Fantasy' Genre

SELECT * FROM Books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3 ;


-- Q17 : Retrieve the total quantity of books sold by each author
-- Method 1 using CTE + JOIN

SELECT * FROM Orders;
WITH total_quantity AS (
					SELECT book_id, SUM(quantity) AS Total_quantity
					FROM Orders GROUP BY book_id)
SELECT b.author, b.genre, t.total_quantity
FROM Books AS b
JOIN total_quantity as t
ON b.book_id= t.book_id
ORDER BY t.total_quantity DESC;

-- Method 2 Using Simple Join

SELECT b.author, b.genre , SUM(o.quantity) AS Total_quantity
FROM Books AS b
JOIN Orders AS o
ON b.book_id = o.book_id
GROUP BY b.book_id
ORDER BY total_quantity DESC;

--Q18 : List the cities where customers who spent over $30 are located

SELECT * FROM Orders;
SELECT c.name, c.city, c.country, o.total_amount
FROM Customers AS c
JOIN Orders AS o
ON c.customer_id = o.customer_id
WHERE total_amount > 30 ;

-- Q19 : Find the customer who spent the most on orders
-- METHOD 1 : Using Simple Join
SELECT * FROM Customers;
SELECT c.name, c.city, c.country, c.email, SUM(o.total_amount) AS total_spend
FROM Customers AS c
JOIN Orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id 
ORDER BY total_spend DESC;

-- Using CTE + JOIN
WITH total_spend AS (
				SELECT customer_id, SUM(total_amount) AS total_spend
				FROM Orders
				GROUP BY Customer_id
)
SELECT c.name , c.city, c.country, t.total_spend
FROM Customers AS c
JOIN total_spend AS t
ON c.customer_id = t.customer_id
ORDER BY total_spend DESC ;

-- Q20 : Calculate the stock remaining after fulfilling all orders

SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;
