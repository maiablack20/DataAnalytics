-- ============================================================
--  Northwind Analytics Challenge
--  MySQL  ·  Aggregate Functions  ·  Data Storytelling
--  Date: April 24, 2026
-- ============================================================

USE northwind;

-- NOTE: The line-items table is named "order details" (with a space).
--       It must always be wrapped in backticks: `order details`

-- ============================================================
-- Query 1 — Revenue by Product Category
-- Business Question: Which product categories generate the most revenue?
-- Chart: Horizontal Bar Chart — CategoryName vs Total_Revenue
-- Export: Q1_results.csv
-- ============================================================
SELECT
    c.CategoryName,
    SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))  AS Total_Revenue,
    COUNT(DISTINCT o.OrderID)                             AS Total_Orders,
    AVG(od.Quantity * od.UnitPrice * (1 - od.Discount))  AS Avg_Order_Value,
    SUM(od.Quantity)                                      AS Total_Units_Sold
FROM categories      c
JOIN products        p  ON p.CategoryID  = c.CategoryID
JOIN `order details` od ON od.ProductID  = p.ProductID
JOIN orders          o  ON o.OrderID     = od.OrderID
GROUP BY c.CategoryName
ORDER BY Total_Revenue DESC;

-- ============================================================
-- Query 2 — Monthly Revenue Trend
-- Business Question: How does revenue fluctuate month-to-month and year-over-year?
-- Chart: Line Chart — Month vs Total_Revenue (two lines: 2023 and 2024)
-- Export: Q2_results.csv
-- ============================================================
SELECT
    YEAR(o.OrderDate)               AS Year,
    MONTH(o.OrderDate)              AS Month,
    DATE_FORMAT(o.OrderDate, '%b')  AS MonthName,
    SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Total_Revenue,
    COUNT(DISTINCT o.OrderID)       AS Num_Orders
FROM orders          o
JOIN `order details` od ON od.OrderID = o.OrderID
GROUP BY Year, Month, MonthName
ORDER BY Year, Month;

-- ============================================================
-- Query 3 — Top Sales Employees
-- Business Question: Which employees drive the most revenue?
-- Chart: Clustered Column Chart — Employee vs Total_Revenue & Orders_Handled
-- Export: Q3_results.csv
-- ============================================================
SELECT
    CONCAT(e.FirstName, ' ', e.LastName)                 AS Employee,
    SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))  AS Total_Revenue,
    COUNT(DISTINCT o.OrderID)                            AS Orders_Handled,
    AVG(od.Quantity * od.UnitPrice * (1 - od.Discount))  AS Avg_Revenue_Per_Order,
    MIN(od.Quantity * od.UnitPrice * (1 - od.Discount))  AS Min_Order_Value,
    MAX(od.Quantity * od.UnitPrice * (1 - od.Discount))  AS Max_Order_Value
FROM employees       e
JOIN orders          o  ON o.EmployeeID = e.EmployeeID
JOIN `order details` od ON od.OrderID   = o.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY Total_Revenue DESC;

-- ============================================================
-- Query 4 — Revenue by Ship Country (Top 10)
-- Business Question: Which markets contribute the most revenue?
-- Chart: Pie Chart — ShipCountry slices by Total_Revenue
-- Export: Q4_results.csv
-- ============================================================
SELECT
    o.ShipCountry,
    SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))  AS Total_Revenue,
    COUNT(DISTINCT o.OrderID)                            AS Num_Orders,
    AVG(o.Freight)                                       AS Avg_Freight,
    SUM(o.Freight)                                       AS Total_Freight_Cost
FROM orders          o
JOIN `order details` od ON od.OrderID = o.OrderID
GROUP BY o.ShipCountry
HAVING Total_Revenue > 10000
ORDER BY Total_Revenue DESC
LIMIT 10;

-- ============================================================
-- Query 5 — Category Revenue Year-over-Year Pivot
-- Business Question: How has each category's revenue changed from 2023 to 2024?
-- Chart: Pivot Chart — Clustered Column (2023 navy, 2024 teal) with data table
-- Export: Q5_results.csv
-- ============================================================
SELECT
    c.CategoryName,
    SUM(CASE WHEN YEAR(o.OrderDate) = 2023
        THEN od.Quantity * od.UnitPrice * (1 - od.Discount)
        ELSE 0 END)                                           AS Revenue_2023,
    SUM(CASE WHEN YEAR(o.OrderDate) = 2024
        THEN od.Quantity * od.UnitPrice * (1 - od.Discount)
        ELSE 0 END)                                           AS Revenue_2024,
    SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))      AS Total_Revenue,
    ROUND(
        (SUM(CASE WHEN YEAR(o.OrderDate) = 2024
             THEN od.Quantity * od.UnitPrice * (1 - od.Discount)
             ELSE 0 END) -
         SUM(CASE WHEN YEAR(o.OrderDate) = 2023
             THEN od.Quantity * od.UnitPrice * (1 - od.Discount)
             ELSE 0 END)) /
        NULLIF(SUM(CASE WHEN YEAR(o.OrderDate) = 2023
             THEN od.Quantity * od.UnitPrice * (1 - od.Discount)
             ELSE 0 END), 0) * 100,
    1)                                                        AS YoY_Growth_Pct
FROM categories      c
JOIN products        p  ON p.CategoryID  = c.CategoryID
JOIN `order details` od ON od.ProductID  = p.ProductID
JOIN orders          o  ON o.OrderID     = od.OrderID
GROUP BY c.CategoryName
ORDER BY Total_Revenue DESC;
