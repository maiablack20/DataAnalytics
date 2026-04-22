USE northwind;

-- Question 1: Write a query to list the CategoryID, CategoryName, and Description of every category in the Northwind database. 
SELECT CategoryID, CategoryName, Description
FROM categories;

-- Question 2: Write a query to find all products where the quantity per unit contains the word 'box' (e.g., '12 boxes' or '24 - 12 oz boxes').
SELECT ProductID, ProductName, QuantityPerUnit
FROM products
WHERE QuantityPerUnit LIKE '%box%';

-- Question 3: Write a query to list all products that are currently discontinued. Display the ProductID, ProductName, and Discontinued columns. 
SELECT ProductID, ProductName, Discontinued
FROM products
WHERE Discontinued = (1);

-- Question 4: Write a query to display the full name of every employee by combining their first and last name into a single column. Label the combined column FullName.
SELECT CONCAT(FirstName, ' ', LastName) AS 'Full Name', 
		Title
FROM employees; 

-- Question 5: Write a query to list all customers located in either Germany or France. Display the CustomerID, CompanyName, and Country.
SELECT CustomerID, CompanyName, Country
FROM customers;

-- Question 6: How many total orders have been placed in the Orders table? Write a query that returns this count and labels it TotalOrders. 
SELECT COUNT(OrderID) AS TotalOrders
FROM orders;

-- Question 7: Write a query to list all suppliers whose contact title is either 'Sales Representative' or 'Sales Manager'. Show SupplierID, CompanyName, ContactName, and ContactTitle. 
SELECT SupplierID, CompanyName, ContactName, ContactTitle
FROM suppliers
WHERE ContactTitle IN ('Sales Representative', 'Sales Manager');

-- Question 8: Write a query to find all orders that were shipped to the USA. Display OrderID, CustomerID, ShipCountry, and ShippedDate. 
SELECT OrderID, CustomerID, ShipCountry, ShippedDate
FROM orders
WHERE ShipCountry = 'USA';

-- Question 9: Examine the Orders table. It records a required date and an actual shipped date. Write a query to find all orders where the product was shipped after the required date (i.e., the shipment was late). Display OrderID, CustomerID, RequiredDate, and ShippedDate. 
SELECT OrderID, CustomerID, RequiredDate, ShippedDate
FROM orders
WHERE ShippedDate > RequiredDate;

-- Question 10: Examine the Products table. It contains a column called UnitsInStock and a column called ReorderLevel. Write a query that identifies products that need to be reordered — that is, products where the current stock is at or below the reorder level and the product is NOT discontinued.
SELECT ProductID, ProductName, UnitsInStock, ReorderLevel, Discontinued
FROM products
WHERE UnitsInStock <= ReorderLevel AND NOT Discontinued;