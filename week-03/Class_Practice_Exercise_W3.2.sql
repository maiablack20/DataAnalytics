USE northwind; 

-- Question 1: Write a query to list ProductID, ProductName, UnitPrice, and UnitsInStock from the Products table. Order the results by UnitPrice from highest to lowest. 
-- Hint: Use the ORDER BY clause with DESC to sort in descending order. 
SELECT ProductID, ProductName, UnitPrice, UnitsInStock
FROM products
ORDER BY UnitPrice DESC; 
-- Returns 77 records. 

-- Question 2: Task: Write a query to list all customers. Order them first by Country (A–Z), then by CompanyName (A–Z) within each country. 
-- Hint: You can list multiple columns in the ORDER BY clause separated by commas. 
SELECT CustomerID, CompanyName, ContactName, Country
FROM customers
ORDER BY Country, CompanyName ASC;
-- Returns 93 records, 

-- Question 3: Task: Write a query that counts the total number of products in each category. Display the CategoryID and the count, labeling the count ProductCount. Order the results so the category with the most products appears first. 
-- Hint: Use COUNT() with GROUP BY on CategoryID, then ORDER BY the count descending. 
SELECT CategoryID, COUNT(ProductID) AS ProductCount
FROM products
GROUP BY CategoryID;
-- Returns 8 records.

-- Question 4: Task: Write a query against the Order Details table that calculates the total revenue per order. Total revenue for a line is UnitPrice × Quantity × (1 − Discount). Label the total Revenue and display it alongside OrderID. Order the results by Revenue from largest to smallest. 
-- Hint: Use SUM() on the calculated expression and GROUP BY OrderID. 
SELECT 
    OrderID,
    ROUND(SUM(UnitPrice * Quantity * (1 - Discount)), 2) AS 'Total Revenue'
FROM `Order Details`
GROUP BY OrderID
ORDER BY `Total Revenue` DESC;
-- Returns 830 records. 
SHOW TABLES;

-- Question 5: Write a query to list the number of orders placed by each employee. Show EmployeeID and label the count OrderCount. Only include employees who have handled more than 50 orders. Order by OrderCount, largest first. 
-- Hint: Use GROUP BY EmployeeID, then filter groups with HAVING instead of WHERE. 
SELECT EmployeeID, COUNT(OrderID) AS OrderCount
FROM orders
GROUP BY EmployeeID
HAVING OrderCount > 50
ORDER BY OrderCount DESC;
-- Returns 7 records.

-- Question 6: Write a query that lists each shipper (ShipVia) and counts the number of orders assigned to them. Label the count OrderCount. Order results by ShipperID ascending. 
-- Hint: Use GROUP BY on the ShipVia column in the Orders table.
SELECT ShipVia, COUNT(OrderID) AS OrderCount
FROM orders
GROUP BY ShipVia
ORDER BY ShipVia ASC;
-- Returns 3 records

-- Question 7: List every product together with the name of its category. Display ProductID, ProductName, and CategoryName. Order alphabetically by CategoryName, then by ProductName within each category. 
-- Hint: Join the Products table to the Categories table on the CategoryID column. 
SELECT p.ProductID, 
       c.CategoryName,
       p.ProductName
FROM products p
JOIN Categories c ON c.CategoryID = p.CategoryID
ORDER BY c.CategoryName ASC, p.ProductName ASC;
-- 77 records returned.

-- Question 8: Write a query that shows each order and the company name of the customer who placed it. Display OrderID, OrderDate, and CompanyName. Order by OrderDate from most recent to oldest. 
-- Hint: Join the Orders table to the Customers table on CustomerID. 
SELECT o.OrderID,
		c.CompanyName,
        o.OrderDate
FROM customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY OrderDate ASC;

-- Question 9: Write a query that calculates the average unit price of products in each category. Display CategoryName and the average price labeled AvgPrice, rounded to 2 decimal places. Only show categories where the average price is greater than $20. Order by AvgPrice descending. 
-- Hint: Join Products and Categories, use AVG() with GROUP BY CategoryID, filter with HAVING, and use ROUND(). 
SELECT ROUND(AVG(p.UnitPrice), 2) AS AVGPrice,
		c.CategoryName,
        p.CategoryID
FROM products p
JOIN Categories c ON c.CategoryID = p.CategoryID
GROUP BY p.CategoryID
HAVING ROUND(AVG(p.UnitPrice), 2);
-- 8 records returned. 

-- Question 10: Write a query that lists each employee's full name along with the total number of orders they have processed. Show FullName (combined FirstName + LastName) and OrderCount. Only include employees who have processed at least 70 orders. Order by OrderCount descending, then by FullName ascending. 
-- Hint: Join Employees and Orders on EmployeeID, aggregate with COUNT and GROUP BY, then filter with HAVING. 
SELECT COUNT(o.OrderID) AS OrderCount,
       CONCAT(e.FirstName, ' ', e.LastName) AS FullName
FROM employees e
JOIN orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING COUNT(o.OrderID) >= 70
ORDER BY OrderCount DESC, FullName ASC;
-- 6 records returned. 