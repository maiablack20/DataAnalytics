USE northwind;

-- 1) Write a query to list the product id, product name, and unit price of every product. This time, display them in ascending order by price.
-- productID: 33, product name: Geitost, unit price: 2.50; productID: 24, product name: Guaran Fantstica, unit price: 4.50; productID: 13, product name Konbu, unit price: 6.00; productID: 52, product name: Filo Mix, unit price: 7.00; productID: 54, product name: Tourtire, unit price: 7.45; productID: 75, product name: Rhnbru Klosterbier, unit price: 7.75; productID: 23, product name: Tunnbrd, unit price: 9.00; productID: 19, product name: Teatime Chocolate Biscuits, unit price: 9.20; productID: 45, product name: Rogede slid, unit price: 9.50; productID: 47, product name: Zaanse koeken, unit price: 9.50; product ID: 41, product name: Jack's New England Clam Chowder, unit price: 9.65; productID: 3, product name: Aniseed Syrup, unit price: 10.00; productID: 21, product name: Sir Rodney's Scones, unit price: 10.00; productID: 74, product name: Longlife Tofu, unit price: 10.00; productID: 46, product name: spegesild, unit price: 12.00; productID: 31, product name: Gorgonzola Telino, unit price: 12.50; productID: 68, product name: Scottish Longbreads, unit price: 12.50; productID: 48, product name: Chocolade, unit price: 12.75; productID: 77, product name: Original Frankfurter grne Soe, unit price: 13.00; productID: 58, product name: Escargots de Bourgogne, unit price: 13.25; productID: 25, product name: NuNuCa Nu-Nougat-Creme, unit price: 14.00; productID: 34, product name: Sasquatch Ale, unit price: 14.00; productID: 42, product name: Singaporean Hokkien Fried Mee, unit price: 14.00; productID: 67, product name: Laughing Lumberjack Lager, unit price: 14.00; productID: 70, product name: Outback Lager, unit price: 15.00; productID: 73, product name: Rd Kaviar, unit price: 15.00; productID: 15, product name: Genen Shouyu, unit price: 15.50; productID: 50, product name: Valkoinen suklaa, unit price: 16.25; productID: 66, product name: Louisiana Hot Spiced Okra, unit price: 17.00; productID: 16, product name: Pavlova, unit price: 17.45; product ID: 1, product name: Chai, unit price: 18.00; productID: 35, product name: Steeleye Stout, unit price: 18.00; productID: 39, product name: Chartreuse verte, unit price: 18.00; productID: 76, product name: Lakkalikri, unit price: 18.00; productID: 40, product name: Boston Crab Meat, unit price: 18.40; productID: 2, product name: Chang, unit price: 19.00; productID: 36, product name: Inlagd Sill, unit price: 19.00; productID: 44, product name: Gula Malacca, unit price: 19.45; product ID: 57, product name: Ravioli Angelo, unit price: 19.50; productID: 49, product name: Maxilaku, unit price: 20.00; productID: 11, product name: Queso Cabrales, unit price: 21.00; productID: 22, product name: Gustaf's Knckebrd, unit price: 21.00; productID: 65, product name: Louisiana Fiery Hot Pepper Sauce, unit price: 21.05; productID: 5, product name: Chef Anton's Gumbo Mix, unit price: 21.35; productID: 71, product name: Flotemysost, unit price: 21.50; productID: 4, product name: Chef Anton' Cajun Seasoning, unit price: 22.00; productID: 14, product name: Tofu, unit price: 23.25; productID: 55, product name: Pt chinois, unit price: 24.00; productID: 6, product name: Grandma's Boysenberry Spread, unit price: 25.00; productID: 30, product name: Nord-Ost Matjeshering, unit price: 25.89; productID: 37, product name: Gravad lax, unit price: 26.00; productID: 61, product name: Sirop d'rable, unit price: 28.50; productID: 7, product name: Uncle Bob's Organic Dried Pears, unit price: 30.00; productID: 10, product name: Ikura, unit price: 31.00; productID: 26, product name: Gumbr Gummibrchen, unit price: 31.23; productID: 32, product name: Mascarpone Fabioli, unit price: 32.20; productID: 53, product name: Perth Pastries, unit price: 32.80; productID: 64, product name: Wimmers gute Semmelkndel, unit price: 32.25; productID: 60, product name: Camembert Pierrot, unit price: 34.00; productID: 72, product name: Mozzarella di Giovanni, unit price: 34.80; productID: 69, product name: Gudbrandsdalsost, unit price: 36.00; productID: 12, product name: Queso Manchego La Pastora, unit price: 38.00; productID: 56, product name: Gnocchi di nonna Alice, unit price: 38.00; productID: 17, product name: Alice Mutton, unit price: 39.00; productID: 8, product name: Northwoods Cranberry Sauce, unit price: 40.00; productID: 27, product name: Schoggi Schokolade, unit price: 43.90; productID: 63, product name: Vegie-spread, unit price: 43.90; productID: 28, product name: Rssle Sauerkraut, unit price: 45.60; productID: 43, product name: Ipoh Coffee, unit price: 46.00; productID: 62, product name: Tarte au sucre, unit price: 49.30; productID: 51, product name: Manjump Dried Applies, unit price: 53.00; productID: 59, product name: Raclette Courdavault, unit price: 55.00; productID: 18, product name: Carnarvon Tigers, unit price: 62.50; productID: 20, product name: Sir Rodney's Marmalade, unit price: 81.00; productID: 9, product name: Mishi Kobe Niku, unit price: 97.00; productID: 29, product name: Thringer Rostbratwurst, unit price: 123.79; productID: 38, product name: Cte de Blaye, unit price: 263.50. 
SELECT * FROM products;

-- 2) What are the products that we carry where we have at least 100 units on hand? Order them in descending order by price.
SELECT ProductName, UnitPrice, UnitsInStock 
FROM products
WHERE UnitsInStock >= 100; 
-- 28.50 for Sirop d'rable, 25.00 for Grandma's Boysenberry Spread, 24.00 for Pt chinois, 21.00 for Gustaf's Knckebrd, 19.00 for Inlagd Sill, 18.40 for Boston Crab Meat, 15.00 for Rd Kaviar, 14.00 for Sasquatch Ale, 7.75 for Rhnbru Klosterbier, and 2.50 for Geitost.  

-- 3) What are the products that we carry where we have at least 100 units on hand? Order them in descending order by price. If two or more have the same price, list those in ascending order by product name
SELECT ProductName, UnitPrice, UnitsInStock
FROM products
WHERE UnitsInStock >= 100;
-- Rd Kaviar has 101 units, Gustaf's Knckebrd has 104 units, Sasquatch Ale has 111 units, Geitost has 112 units, Inlagd Sill has 112 units, Sirop d'rable has 113 units, Pt chinois has 115 units, Grandma's Boysenberry Spread has 120 units, Boston Crab Meat has 123 units, and Rhnbru Klosterbier has 125 units. 

-- 4) Write a query against the orders table that displays the total number of distinct customers who have placed orders, based on customer ID. Use an alias to label the count calculation as CustomerCount.
SELECT COUNT(DISTINCT CustomerID) AS CustomerCount
FROM orders;
-- The answer is that are 89 distinct customers who have placed orders. 

-- 5) Write a query against the orders table that displays the total number of distinct customers who have placed orders, by customer ID, for each country where orders have been shipped. Again, use an alias to label the count as CustomerCount. Order the list by the CustomerCount, largest to smallest. 
SELECT 
    ShipCountry, 
    COUNT(DISTINCT CustomerID) AS CustomerCount
FROM 
    Orders
GROUP BY 
    ShipCountry
ORDER BY 
    CustomerCount DESC;
-- USA has 13, Germany has 11, France has 10, Brazil has 9, UK has 7, Mexico has 5, Venezuela has 4, Sprain has 4, Canada has 3, Argentina has 3, Switzerland has 2, Sweden has 2, Portugal has 2, Finland has 2, Denmark has 2, Belgium has 2, Austria has 2, Poland has 1, Norway has 1, and Ireland has 1.

-- 6) What are the products that we carry where we have less than 25 units on hand, but 1 or more units of them are on order? Write a query that orders them by quantity on order (high to low), then by product name. 
SELECT ProductName, ProductID, UnitsinStock, UnitsOnOrder
FROM products
WHERE UnitsOnOrder >= 1;
-- UnitsOnOrder by Quantity: 100 units for Louisiana Hot Spiced Okra, 80 units for Wimmers gute Semmelkndel, 70 units for Chocolade, 70 units for Rogede slid, 70 units for Gorgonzola Telino, 70 units for Aniseed Syrup, 60 units for Maxilaku, 50 units for Gravad lax, 40 units for Mascarpone Fabioli, 40 units for Sir Rodney's Scones, 40 units for Chang, 30 units for Queso Cabrales, 20 units for Longlife Tofu, 10 units for Outback Lager, 10 units for Scottish Longbreads, 10 units for Gnocchi di nonna, and 10 units Ipoh Coffee. 

-- 7) Write a query to list each of the job titles in employees, along with a count of how many employees hold each job title.
SELECT Title, COUNT(*) AS employee_count
FROM employees
GROUP BY Title;
-- 6 employees hold the title of Sales representative, 1 employee holds the title for Vice President of Sales, 1 employee holds the title for Sales Manager, and 1 employee holds the title for Inside Sales Coordinator. 

-- 8) What employees have a monthly salary that is between $2000 and $2500? Write a query that orders them by job title. 
SELECT Salary, FirstName, LastName
FROM employees
WHERE Salary BETWEEN 2000 AND 2500;
-- Employees with a salary between $2000 and $2500 are Andrew Fuller, Michael Suyama, Laura Callahan, Anne Dodsworth. 
