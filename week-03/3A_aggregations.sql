USE northwind; 

-- Question 1: Write a query to find the price of the cheapest item that Northwind sells. Then write a second query to find the name of the product that has that price.
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice = (SELECT MIN(UnitPrice) FROM Products);
-- Cheapest item that Northwind sells is Geitost for $2.50. 

-- Question 2: Write a query to find the average price of all items that Northwind sells.(Bonus: Once you have written a working query, try asking Claude or ChatGPT for help using the ROUND function to round the average price to the nearest cent.)
SELECT AVG(UnitPrice) AS 'Average Price of Items Being Sold'
FROM products;
-- Without ROUND: Average Price of Items Being Sold = 28.86636364

SELECT ROUND(AVG(UnitPrice), 2) AS 'Average Price of Items Being Sold'
FROM products;
-- With ROUND: Average Price of Items Being Sold = 28.87

-- Question 3: Write a query to find the price of the most expensive item that Northwind sells. Then write a second query to find the name of the product with that price, plus the name ofthe supplier for that product.
SELECT p.ProductName, 
       p.UnitPrice, 
       s.CompanyName AS 'Supplier'
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.UnitPrice = (SELECT MAX(UnitPrice) FROM Products);
-- Name and price of the most expensive item being sold plus their supplier: Cte de Blaye, price is 263.50, and their supplier is Aux Joyeux ecclsiastiques.

-- Question 4: Write a query to find total monthly payroll (the sum of all the employees’ monthly salaries).
SELECT SUM(Salary) AS 'Total Monthly Salaries'
FROM employees;
-- Total Monthly Salaries = 20362.93

-- Question 5: Write a query to identify the highest salary and the lowest salary amounts which any employee makes. (Just the amounts, not the specific employees!)
SELECT MIN(Salary) AS 'Minimum Employee Salary',
		MAX(Salary) AS 'Maximum Employee Salary'
FROM employees; 
-- Minimum Employee Salary = 1744.21
-- Maximum Employee Salary = 3119.15

-- Question 6: Write a query to find the name and supplier ID of each supplier and the number of items they supply. Hint: Join is your friend here.
SELECT p.ProductName, 
		s.CompanyName
FROM products p
RIGHT JOIN Suppliers s
ON p.SupplierID = s.SupplierID
ORDER BY s.CompanyName;

-- Question 7: Write a query to find the list of all category names and the average price for items in each category. 
SELECT c.CategoryName,
       ROUND(AVG(p.UnitPrice), 2) AS 'Average Price'
FROM Categories c
JOIN Products p
    ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName
ORDER BY ROUND(AVG(p.UnitPrice), 2) DESC;
-- Average Price by Category: Meat/Poultry = 54.01, Beverages = 37.98, Produce = 32.37, Dairy Products = 28.73, Confections = 25.16, Condiments = 23.06, Seafood = 20.68, and Grains/Cereals = 20.25. 

-- Question 8: Write a query to find, for all suppliers that provide at least 5 items to Northwind, what is the name of each supplier and the number of items they supply.
SELECT s.CompanyName,
       COUNT(p.ProductID) AS 'Number of Items'
FROM Suppliers s
JOIN Products p
    ON s.SupplierID = p.SupplierID
GROUP BY s.CompanyName
HAVING COUNT(p.ProductID) >= 5;
-- Suppliers that provide at least five items are Pavlova,Ltd. and Plutzer Lebensmittelgromrkte AG.

-- Question 9:  Write a query to list products currently in inventory by the product id, product name, and inventory value (calculated by multiplying unit price by the number of units on hand). Sort the results in descending order by value. If two or more have the same value, order by product name. If a product is not in stock, leave it off the list.
SELECT ProductID, ProductName, UnitPrice * UnitsInStock AS 'Inventory Value'
FROM Products
WHERE UnitPrice != 0
ORDER BY UnitPrice * UnitsInStock DESC;