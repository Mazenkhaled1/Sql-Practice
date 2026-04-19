-- STEP 1: Find the total sales per customer
WITH CTE_TotalSales AS (

SELECT 
CustomerID , 
SUM(Sales) TotalSales 
FROM Sales.Orders  
GROUP BY CustomerID
)
-- STEP 2: Find the last order date per customer 

, CTE_LastOrder AS (

SELECT 
CustomerID , 
MAX(OrderDate)  LastOrder 
FROM Sales.Orders
GROUP BY CustomerID
)
-- STEP 3: Rank customers based on total sales per customer 

, CTE_Customer_Rank AS (

SELECT 
CustomerID,
TotalSales,
RANK() OVER ( ORDER BY TotalSales DESC) AS CustomerRank
FROM CTE_TotalSales 
)
-- STEP 4: Segment customer based on their TotalSales 
, CTE_Customer_Segment AS (

SELECT 
CustomerID, 
CASE 
	WHEN TotalSales > 100 THEN 'High'
	WHEN TotalSales > 50 THEN 'Medium'
	ELSE 'Low'
END CustomerSegment
FROM CTE_TotalSales
)

SELECT 
c.CustomerID,
c.FirstName,
c.LastName,
ctt.TotalSales,
cto.LastOrder,
CustomerRank,
CustomerSegment
FROM Sales.Customers c 
LEFT JOIN CTE_TotalSales ctt
ON ctt.CustomerID = c.CustomerID
LEFT JOIN CTE_LastOrder cto
ON c.CustomerID = cto.CustomerID
LEFT JOIN CTE_Customer_Rank cr 
ON c.CustomerID = cr.CustomerID
LEFT JOIN CTE_Customer_Segment cs
ON c.CustomerID = cs.CustomerID



-- Find the running total of sales for each month 


WITH CTE_Monthly_Salary AS 
(
	SELECT 
	DATETRUNC(month,OrderDate) OrderMonth,
	SUM(Sales) TotalSales,
	COUNT(OrderID) TotalOrders, 
	SUM(Quantity) TotalQuantities
	FROM Sales.Orders
	GROUP BY DATETRUNC(month,OrderDate)

)

SELECT 
OrderMonth,
TotalSales,
SUM(TotalSales) OVER (ORDER BY OrderMonth) RunningTotal
FROM CTE_Monthly_Salary





