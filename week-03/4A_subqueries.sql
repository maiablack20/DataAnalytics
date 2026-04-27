USE northwind; 

-- 1.) What is the product name(s) of the most expensive products? 
-- ∗ HINT: Find the max price in a subquery and then use that value to find products whose price equals that value. (Some of your answers from Exercise 3.A may offer a useful starting point.)
SELECT p.ProductName, 
       p.UnitPrice, 
       s.CompanyName AS 'Supplier'
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.UnitPrice = (SELECT MAX(UnitPrice) FROM Products);
-- The most expensive product would be Cte de Blaye and the price for it $263.50. 

-- 2.) What is the product name(s) and categories of the least expensive products?
-- ∗ HINT: Find the min price in a subquery and then use that in your more complex query that joins products with categories.
SELECT p.ProductName, 
       p.UnitPrice, 
       s.CompanyName AS 'Supplier'
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.UnitPrice = (SELECT MIN(UnitPrice) FROM Products);
-- The mininmum price for an item is $2.50 and the name of product with that price is Geitost. 

-- 3.) What is the order id, shipping name and shipping address of all orders shipped via "Federal Shipping"?
-- ∗ HINT: Find the shipper id of "Federal Shipping" in a subquery and then use that value to find the orders that used that shipper.
-- ∗ You do not need "Federal Shipping" to display in the results.
SELECT  OrderID, 
		ShipName, 
        ShipAddress
FROM orders
WHERE ShipVia =(SELECT ShipperID FROM shippers WHERE CompanyName = 'Federal Shipping');

-- 4.) What are the order ids of the orders that included "Sasquatch Ale"?
-- ∗ HINT: Find the product id of "Sasquatch Ale" in a subquery and then use that value to find the matching orders from the `order details` table.
-- ∗ Your final results only need to display OrderID, but you may find it helpful to include additional columns as you work on creating the query to better understand how the query is working.
SELECT OrderID, ProductID
FROM `order details`
WHERE ProductID = (SELECT ProductID FROM Products WHERE ProductName = 'Sasquatch Ale');
-- -- '10287', '10315', '10358', '10367', '10386', '10438', '10483', '10548', '10573', '10688', '10700', '10757', '10805', '10890', '10937', '10990', '11008', '11063', '11066'

-- 5.) What is the name of the employee that sold order 10266?
SELECT EmployeeID,
		CONCAT(FirstName, ' ', LastName) as 'FullName'
FROM employees
WHERE EmployeeID = (SELECT EmployeeID FROM orders WHERE OrderID = 10266);
-- The name of the employee is Janet Leverling and her employeeID is 3. 

-- 6.) What is the name of the customer that bought order 10266?
SELECT ContactName
FROM customers
WHERE CustomerID = (SELECT CustomerID FROM orders WHERE OrderID = 10266);
-- The name of the customer is Pirkko Koskitalo. 