-- find the total number of orders 
SELECT 
COUNT(*) AS TotalNrOrders
FROM orders

-- find the totals sales of all orders
SELECT 
SUM(sales) AS TotalSales
FROM orders

-- average sales of all orders 
SELECT 
AVG(sales) AS TotalAVg
FROM orders

-- highest sales of all orders 
SELECT 
MAX(sales) AS Max
FROM orders

-- lowest sales of all orders 

SELECT * FROM orders;

SELECT 
customer_id,
sales,
MIN(sales) AS min
FROM orders
GROUP BY customer_id , sales ;

SELECT 
customer_id,
sales ,
MIN(sales)  OVER () AS minOver
FROM orders



----- aggergation + window -----
SELECT 
ProductID,
OrderId,
OrderStatus,
Sales
FROM Sales.Orders
ORDER BY ProductID 


/* find total sales across all orders and total sales for each product
find total sales  for each combination of product and order status
additionally provide details suc orderID , orederDate 
*/
SELECT 
OrderID,
OrderDate,
ProductID,
OrderStatus,
Sales,
SUM(Sales) OVER() TotalSales,
SUM(Sales) OVER(PARTITION BY  ProductID ) TotalSalesByProducts ,
SUM(Sales) OVER(PARTITION BY  ProductID, OrderStatus ) TotalSalesByProductsAndStatus
FROM Sales.Orders



/* rank each order based on their sales from highest to lowest 
additionally provide details such orderId , orderDate 
*/

SELECT 
OrderID,
OrderDate,
Sales
FROM Sales.Orders ;

SELECT 
OrderID,
OrderDate,
Sales,
RANK() OVER(ORDER BY Sales DESC ) RankSales
FROM Sales.Orders ;





/* find the total number of orders and 
find the total number of orders for each customer 
additionnally prodive details such orderId , orderDate */

SELECT 
OrderID,
OrderDate,
CustomerID,
COUNT(*) OVER() TotalOrders,
COUNT(*) OVER(PARTITION BY CustomerID) ordersBycustomer
FROM Sales.Orders

-- rank the orders based on their sales from highest to lowest 

SELECT 
OrderID,
ProductID,
Sales,
ROW_NUMBER() OVER( ORDER BY sales DESC) SalesRank_Row,
RANK() OVER (ORDER BY Sales DESC ) SalesRank_RANK,
DENSE_RANK() OVER (ORDER BY Sales DESC) SalesRank_DENSERANK
FROM Sales.Orders


-- find the top highest sales for each product

SELECT * FROM(
SELECT 
OrderID,
ProductID,
Sales,
ROW_NUMBER() OVER(PARTITION BY ProductID ORDER BY sales DESC) RankByProduct
FROM Sales.Orders
)t WHERE RankByProduct = 1 


-- find the lowest 2 customers based on their total sales 


SELECT * FROM (

SELECT 
	CustomerID,
	SUM(Sales)  TotalSales,
	ROW_NUMBER() OVER(ORDER BY SUM(Sales)) TotalSalesRanked
FROM Sales.Orders
GROUP BY CustomerID
)t WHERE TotalSalesRanked <= 2 




