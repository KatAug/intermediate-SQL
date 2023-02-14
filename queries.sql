-- Problem 1 & 2
-- 1. Using JOINs in a single query, combine data from all three tables (employees, products, sales) to view all sales with complete employee and product information in one table.

-- SELECT FirstName, MiddleInitial, LastName, Name, Price, Quantity 
-- FROM employees 
-- Inner Join sales  
-- ON employees.EmployeeID = sales.SalesPersonID
-- Inner Join products
-- ON sales.SalesID = products.ProductID;

-- 2a. Create a View for the query you made in Problem 1 named "all_sales"
-- CREATE VIEW all_sales 
-- AS 
-- SELECT SalesID, SalesPersonID, FirstName, LastName, CustomerID, products.ProductID, Quantity, Name, Price
-- FROM sales
-- INNER JOIN  employees
-- ON employees.EmployeeID = sales.SalesPersonID
-- JOIN products
-- ON products.ProductID = sales.ProductID
-- ORDER BY SalesIDall_sales;

-- NOTE: You'll want to remove any duplicate columns to clean up your view!

-- 2b. Test your View by selecting all rows and columns from the View

-- SELECT * FROM all_sales;

-- Problem 3
-- Find the average sale amount for each sales person

-- SELECT FirstName, LastName, ROUND(AVG(Price), 2) 
-- AS average_sale 
-- FROM all_sales 
-- GROUP BY FirstName, LastName
-- ORDER BY average_sale DESC;

-- Problem 4
-- Find the top three sales persons by total sales

-- CREATE VIEW extended_Price
-- AS 
-- SELECT FirstName, LastName, SalesID, Quantity, Price, (Quantity * Price) AS extended_price
-- FROM all_sales
-- ORDER BY FirstName, LastName;

-- Select * FROM extended_Price; 

-- SELECT FirstName, LastName, ROUND(SUM(DISTINCT extended_price))
-- AS total_sales 
-- FROM extended_price
-- GROUP BY FirstName, LastName 
-- ORDER BY total_sales DESC;

-- Problem 5
-- Find the product that has the highest price

-- SELECT productID, Name, MAX(Price) AS HighestPrice
-- FROM products
-- GROUP BY productID, Name
-- ORDER BY HighestPrice DESC;

-- Problem 6
-- Find the product that was sold the most times

-- SELECT ProductID, COUNT(Quantity) 
-- FROM Sales
-- GROUP BY ProductID
-- ORDER BY COUNT(Quantity) DESC;

-- Problem 7
-- Using a subquery, find all products that have a price higher than the average price for all products

-- SELECT ROUND(AVG(price))
-- FROM all_sales;

-- SELECT * 
-- FROM all_sales
-- WHERE price >
-- 	(SELECT ROUND(AVG(price))
-- 	FROM all_sales)
-- ORDER BY Price DESC;


-- Problem 8
-- Find the customer who spent the most money in purchased products

-- SELECT CustomerID, ROUND(SUM(Price), 2) 
-- AS most_money_spent
-- FROM all_sales 
-- GROUP BY CustomerID
-- ORDER BY most_money_spent DESC;


-- Problem 9
-- Find the total number of sales for each sales person

-- SELECT FirstName, LastName, SalesPersonID, COUNT(Quantity) 
-- FROM Sales
-- JOIN Employees
-- ON sales.SalesPersonID = employees.EmployeeID
-- GROUP BY SalesPersonID, FirstName, LastName
-- ORDER BY COUNT(Quantity) DESC;

-- Problem 10
-- Find the sales person who sold the most to the customer you found in Problem 8

-- SELECT DISTINCT(FirstName), LastName
-- FROM all_sales
-- Where CustomerID = 8241;
