# Online Bookstore SQL Analysis

## Project Overview
This is my first SQL project based on an Online Bookstore dataset. The project uses three CSV files: `Books.csv`, `Customers.csv`, and `Orders.csv`. These files are connected using common columns such as `Book_ID` and `Customer_ID`.

The main goal of this project is to practice SQL concepts such as table creation, filtering, sorting, aggregation, joins, CTEs, and business analysis queries.

---

# Author

**Rahul Prakash Pagar**  
📧 Email: rahulpagar423@gmail.com  
🔗 LinkedIn: https://www.linkedin.com/in/rahul-pagar1993/  
💻 GitHub: https://github.com/RahulprakashPagar

---

## Dataset Files

- `Books.csv` – contains book details such as title, author, genre, published year, price, and stock.
- `Customers.csv` – contains customer details such as name, email, phone, city, and country.
- `Orders.csv` – contains order details such as order date, quantity, total amount, customer ID, and book ID.

---

## Database Tables

The project contains three main tables:

1. `Books`
2. `Customers`
3. `Orders`

---

## SQL Concepts Used

- CREATE TABLE
- DROP TABLE
- SELECT
- WHERE
- ORDER BY
- LIMIT
- DISTINCT
- SUM
- AVG
- MAX
- GROUP BY
- JOIN
- LEFT JOIN
- CTE
- COALESCE

---

## Key Business Questions Answered

### Basic Queries
- Retrieve all books from the Fiction genre
- Find books published after 1950
- List customers from Canada
- Show orders placed in November 2023
- Retrieve total stock available
- Find the most expensive book
- Show customers who ordered more than 1 quantity
- Retrieve orders with total amount greater than $20
- List all available genres
- Find the book with the lowest stock
- Calculate total revenue generated

### Advanced Queries
- Retrieve total books sold for each genre
- Find average price of Fantasy books
- List customers who placed at least 2 orders
- Find the most frequently ordered book
- Show top 3 most expensive Fantasy books
- Retrieve total quantity sold by each author
- List cities where customers spent more than $30
- Find the customer who spent the most
- Calculate remaining stock after fulfilling orders

---

## Project Structure

```bash
online-bookstore-sql-analysis/
│
├── Books.csv
├── Customers.csv
├── Orders.csv
├── SQL Project.sql
└── README.md
