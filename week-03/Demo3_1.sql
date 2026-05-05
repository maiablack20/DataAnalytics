-- Maia Black 
-- April 20, 2026 
-- SHOW DATABASES; 

USE northwind; 
SHOW TABLES; 
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'northwind'
	AND table_type = 'BASE TABLE'; 

-- Example 3: 
SELECT ProductName, UnitPrice
FROM products; 
SELECT * FROM products;

-- Example 4: Using WHERE clause 
-- WHERE sets a condition to filter results 
-- Retrieve all company names, cities, and country from Germany
SELECT ProductName AS 'Product', 
UnitPrice AS 'Price(USD)', 
UnitsInStock AS 'Stock'
FROM products;

SELECT * FROM customers;
SELECT CompanyName, City, Country
FROM customers 
WHERE Country = 'Germany'; 

-- Example 5: 
SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice > 50; 

-- Example 6: 
-- Retrieve all the OrderID, CustomerID, ShipCountry, and Freight from the orders table for all orders shipped to France. 
SELECT OrderID, CustomerID, ShipCountry, Freight
FROM orders
WHERE ShipCountry = 'France'; 

-- Example 7: 
-- Retrieve all producrs whose current stock is below the reorder threshold. 
SELECT ProductName, UnitsInStock, ReorderLevel
FROM products
WHERE UnitsInStock < ReorderLevel; 

-- Example 8: 
-- Retrieve all OrderID and Freight orders greater than or equal to 100. 
SELECT OrderID, Freight
FROM orders
WHERE Freight >= 100; 

-- Example 10: Retrieve all products, unit price, and units in stock for products with unit price greater than 20 and units in stock greater than 50. 
SELECT ProductName, UnitPrice, UnitsinStock
FROM products
WHERE UnitPrice > 20 AND UnitsInStock > 50;

-- Example 11: Retrieve all company and country names from either UK or Ireland
SELECT CompanyName, Country
FROM customers
WHERE Country = 'Ireland' OR Country = 'UK'; 

-- Example 12: Retrieve all products, CategoryID and Unit price for products with a Category ID of 1 or 2 and a unit price less than 20. 
SELECT ProductName, CategoryID, UnitPrice
FROM products
WHERE CategoryID = 1 OR CategoryID = 2 
AND 'UnitPrice < 20'; 

-- Example 13: Retieve all company names and country names other than the USA
SELECT CompanyName, Country
FROM customers
WHERE Country != 'USA'; 

-- Example 14: Retrieve all products that are currently active. Not discontinued
SELECT ProductName
FROM products
WHERE NOT Discontinued = 1;

-- Example 15: Retrieve company names from the following countries, France, Germany, and Spain
SELECT CompanyName, Country
FROM customers
WHERE Country IN ('France', 'Germany', 'Spain')

-- Example 16: Retrieve product names and supplierID from suppliers other than those with supplierID 1, 2, or 3. 
SELECT ProductName, SupplierID
FROM products
WHERE SupplierID NOT IN (1, 2, 3);

-- Example 17: Retrieves the ProductName and UnitPrice for all products with a unit price between 10 and 20
SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice BETWEEN 10 AND 20;

-- Example 19: Retrieve the OrderID, CustomerId, and Ship region for orders where the ShipRegion field has not been filled in
SELECT OrderID, CustomerID, ShipRegion
FROM orders
WHERE ShipRegion IS NULL;

-- Example 20: Retrieves employees first name, last name, region from region fields filled in.
SELECT FirstName, LastName, Region
FROM employees
WHERE Region IS NOT NULL; 

-- Example 21: Retrieve all compamy names that start with A. 
SELECT CompanyName
FROM customers 
WHERE CompanyName LIKE 'A%'; 

USE northwind;

-- Example 24: Retrieves OrderID, CustomerID, OrderDate for all orders with a shipped date of '1997-01-01'
SELECT OrderID, CustomerID, OrderDate
FROM orders
WHERE OrderDate = '1997-01-01';

-- Example 26: Retrieves all orders placed in June 1997 using YEAR() and MONTH() Functions
SELECT OrderDate, OrderID
FROM orders
WHERE YEAR(OrderDate) = 1997 AND MONTH (OrderDate) = 6;

-- Example 27: Retrieve all product names and price in descneding order. 
SELECT ProductName, UnitPrice
FROM products
ORDER BY UnitPrice DESC;

-- Example 28: Retrieves company names alphabetically by Country then Name 
-- Customers are first group by Country alphabetically. Within each country, they are further sorted by CompanyName. 
SELECT CompanyName, Country
FROM customers
ORDER BY Country ASC, CompanyName ASC;

-- Example 29: Retrieve the top 5 most expensive products
SELECT ProductName, UnitPrice
FROM products
-- With an offset (skip first N rows):
ORDER BY UnitPrice DESC
LIMIT 5;

-- Example 30: Retrieves products and prices for rows 6 through 10 and skips the first 5 rows
SELECT ProductName, UnitPrice
FROM products
ORDER BY UnitPrice
LIMIT 5, 5;

-- Example 33 Returns First Name and Last Name as Full Name
SELECT CONCAT(FirstName, ' ', LastName) AS 'Full Name', 
		Title
FROM employees; 

-- Example 36: Return products, with original price and a 100% discount
SELECT ProductName, UnitPrice AS 'Original Price', UnitPrice *0.90 AS '10% Discount Price'
FROM products
ORDER BY ProductName ASC; 

-- JOINS Practice 

-- Example 1: Return OrderId, Customer, and OrderDate. Limit 5 records. 
USE northwind;
SELECT o.OrderID, 
		c.CompanyName AS 'Customer', 
        o.OrderDate
FROM orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.OrderDate DESC
LIMIT 5;

-- Example 2: Return OrderID, Company Name, and OrderDate with a limit of 5. Orders joined to Customers 
SELECT OrderID, CompanyName, OrderDate
FROM orders
JOIN Customers USING (CustomerID)
ORDER BY OrderDate
Limit 5; 

-- Example 3: Return productName, CategoryName, and UnitPrice with LIMIT of 6 Products with Their Category Names. 
SELECT p. ProductName, 
		c.CategoryName, 
		p.UnitPrice
FROM products p 
JOIN categories c USING (CategoryID)
ORDER BY c.CategoryName, 
		p.ProductName
LIMIT 6; 

-- Example 5: Return all Customers including those with No Orders. 
-- Customers with zero orders will show 0 in Order Count. 
SELECT c.CompanyName, 
		COUNT(o.OrderID) AS 'Order Count'
FROM customers c 
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName
ORDER BY 'Order Count' ASC
LIMIT 5;

USE northwind;
-- Using Aggregate Functions

-- Example 1: Find out how many orders are recorded in the Orders table in total. 
SELECT COUNT(*) as 'Total Orders'
FROM orders;

-- Example 2: Calculate the total freight charges collected across all orders. 
SELECT SUM(Freight) AS 'Total Freight Charges',
		MIN(Freight) AS 'Minimum Freight',
        MAX(Freight) AS 'Maximum Freight',
        AVG(Freight) AS 'Average Freight'
FROM orders;