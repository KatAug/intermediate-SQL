-- Problem 1 & 2
-- 1. Using JOINs in a single query, combine data from all three tables (employees, products, sales) to view all sales with complete employee and product information in one table.

-- SELECT FirstName, MiddleInitial, LastName, Name, Price, Quantity 
-- FROM employees 
-- Inner Join sales  
-- ON employees.EmployeeID = sales.SalesPersonID
-- Inner Join products
-- ON sales.SalesID = products.ProductID;

-- 2a. Create a View for the query you made in Problem 1 named "all_sales"

-- CREATE VIEW All_Sales AS 
-- SELECT FirstName, MiddleInitial, LastName, Name, Price, Quantity
-- employees, products, sales
-- WHERE employees.EmployeeID = SalesPersonID AND
-- sales.SalesID = products.ProductID;

-- NOTE: You'll want to remove any duplicate columns to clean up your view!

-- 2b. Test your View by selecting all rows and columns from the View

-- SELECT * FROM All_Sales;

-- Problem 3
-- Find the average sale amount for each sales person

-- SELECT FirstName, LastName, SalesID, Quantity, Price, (Quantity * Price) AS Extended_Price
-- FROM Employees
-- Join Sales
-- ON employees.EmployeeID = sales.SalesPersonID 
-- JOIN Products 
-- ON products.ProductID = sales.ProductID
-- ORDER BY FirstName ASC

-- Problem 4
-- Find the top three sales persons by total sales


-- Problem 5
-- Find the product that has the highest price

-- SELECT Name, Price 
-- FROM products 
-- ORDER BY Price DESC

-- Problem 6
-- Find the product that was sold the most times

-- Problem 7
-- Using a subquery, find all products that have a price higher than the average price for all products

-- Problem 8
-- Find the customer who spent the most money in purchased products

-- Problem 9
-- Find the total number of sales for each sales person

-- Problem 10
-- Find the sales person who sold the most to the customer you found in Problem 8
