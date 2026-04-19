/* find the products that have a price higher than average
price of all products */ 


SELECT *
FROM( SELECT 
ProductID,
Price,
AVG(PRICE) OVER() AvgPrice
FROM Sales.Products) t 
WHERE Price > AvgPrice ;


-- rank customers based on their total amount of sales 
SELECT 
*,
RANK() OVER( ORDER BY TotalSales DESC) CustomerRank
FROM(SELECT 
CustomerID,
SUM(Sales) TotalSales 
FROM Sales.Orders
GROUP BY CustomerID) t ;

-- show the product ids , product names , prices , and total number of orders

SELECT 
(
SELECT 
	COUNT(*) 
	FROM Sales.Orders)   TotalOrders ,
ProductID,
Product,
Price
FROM Sales.Products




-- show all customers details and find the total orders for each customer 

SELECT 
c.*,
o.TotalOrders
FROM Sales.Customers c LEFT JOIN (SELECT 
CustomerID,
COUNT(*) TotalOrders
From Sales.Orders
GROUP BY CustomerID) o
ON c.CustomerID = o.CustomerID

-- find the products that have a price higher than the average of all products 



SELECT 
ProductID,
Price 
FROM Sales.Products
WHERE
Price > ( SELECT AVG(Price) AvgPrice FROM Sales.Products) 


-- show the details of orders made by customers in germany

SELECT * 
From Sales.Orders 
WHERE CustomerID IN
					(SELECT 
					CustomerID
					From Sales.Customers
					WHERE Country = 'Germany'); 

SELECT o.* FROM Sales.Orders o
INNER JOIN sales.Customers c 
ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany'; 


-- show the details of orders made by customers who are not in germany 


SELECT * 
From Sales.Orders 
WHERE CustomerID IN
					(SELECT 
						CustomerID
						FROM Sales.Customers
						WHERE Country != 'Germany');




/* find female employees whose salaries are greater 
than the salaries of ANY males employee */

SELECT EmployeeID , FirstName , Salary 
FROM Sales.Employees
WHERE Gender = 'F' 
AND Salary > ANY(SELECT  Salary FROM Sales.Employees WHERE Gender = 'M');

SELECT EmployeeID ,FirstName , Salary FROM Sales.Employees WHERE Gender = 'M' ;


/* find female employees whose salaries are greater 
than the salaries of ALL males employee */

SELECT EmployeeID , FirstName , Salary 
FROM Sales.Employees
WHERE Gender = 'F' 
AND Salary > ALL(SELECT  Salary FROM Sales.Employees WHERE Gender = 'M');



SELECT EmployeeID , FirstName , Salary 
FROM Sales.Employees
WHERE Gender = 'F' ;


SELECT EmployeeID , FirstName , Salary 
FROM Sales.Employees
WHERE Gender = 'M' ;

-- show all customer  details and find the total orders of each customer 

SELECT * , ( SELECT COUNT(*) FROM Sales.Orders o WHERE o.CustomerID = c.CustomerID) TotalOrders
FROM Sales.Customers c  ;