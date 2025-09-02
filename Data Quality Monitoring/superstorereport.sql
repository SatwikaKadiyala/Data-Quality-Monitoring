CREATE TABLE IF NOT EXISTS Orders (
    CustomerID INTEGER,
    OrderID INTEGER PRIMARY KEY,
    Product TEXT,
    UnitsSold INTEGER,
    OrderDate DATE,
    Revenue REAL,
    Cost REAL
);

SELECT 
    Product, 
    SUM(Revenue) AS TotalRevenue, 
    SUM(Cost) AS TotalCost,
    (SUM(Revenue) - SUM(Cost)) AS TotalProfit
FROM Orders
GROUP BY Product
ORDER BY TotalRevenue DESC;

SELECT 
    Product, 
    COUNT(*) AS TotalOrders, 
    SUM(UnitsSold) AS TotalUnitsSold
FROM Orders
GROUP BY Product
ORDER BY TotalUnitsSold DESC
LIMIT 10;

SELECT 
    strftime('%m', OrderDate) AS Month, 
    SUM(Revenue) AS MonthlyRevenue
FROM Orders
WHERE strftime('%Y', OrderDate) = '2020'
GROUP BY Month
ORDER BY Month;

SELECT 
    OrderID, 
    COUNT(*) AS DuplicateCount
FROM Orders
GROUP BY OrderID
HAVING COUNT(*) > 1;

SELECT * 
FROM Orders
WHERE CustomerID IS NULL 
   OR OrderID IS NULL 
   OR Product IS NULL 
   OR UnitsSold IS NULL 
   OR OrderDate IS NULL 
   OR Revenue IS NULL 
   OR Cost IS NULL;
