

SELECT * FROM customers
SELECT * FROM customers WHERE country = 'USA'
SELECT * FROM customers WHERE country != 'Germany'
SELECT * FROM customers WHERE score > 500
SELECT * FROM customers WHERE score >= 500 








SELECT * FROM customers
SELECT * FROM customers WHERE country = 'USA' AND score > 500 
SELECT * FROM  customers WHERE country = 'USA' OR score > 500  
SELECT * FROM customers WHERE NOT score <= 500 






SELECT * FROM customers
SELECT * FROM customers WHERE score BETWEEN 0 AND 600
SELECT * FROM customers WHERE  country = 'Germany' OR country = 'USA'
SELECT * FROM customers WHERE  country IN('Germany', 'USA')





-SELECT * FROM customers
-SELECT * FROM customers WHERE first_name LIKE 'M%'
-SELECT * FROM customers WHERE first_name LIKE '%N'
-SELECT * FROM customers WHERE first_name LIKE '%r%'
-SELECT * FROM customers WHERE first_name LIKE '__r%' 






SELECT 
c.id , 
c.first_name,
o.order_id,
o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id  = o.customer_id 

SELECT 
c.id , 
c.first_name,
o.order_id,
o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id  = o.customer_id 


SELECT 
c.id , 
c.first_name,
o.order_id,
o.sales
FROM customers AS c
left JOIN orders AS o
ON c.id  = o.customer_id 

SELECT 
c.id , 
c.first_name,
o.order_id,
o.sales
FROM customers AS c
right JOIN orders AS o
ON c.id  = o.customer_id 


SELECT 
*
FROM orders AS o
left JOIN customers AS c
ON o.customer_id   = c.id


SELECT 
*
FROM orders AS o
FULL JOIN customers AS c
ON o.customer_id   = c.id


SELECT * FROM customers AS c  LEFT JOIN orders AS o  ON c.id = o.customer_id WHERE o.customer_id IS NULL 
SELECT * FROM orders AS o  LEFT JOIN customers AS c  ON c.id = o.customer_id WHERE c.id IS NULL 

SELECT * FROM customers AS c FULL JOIN orders AS o ON c.id = o.customer_id WHERE c.id IS NULL OR o.customer_id IS NULL 




/* get all the customers along with their ordres 
but only for cusotmers who have placed an order without inner join
*/
SELECT * FROM
customers AS c 
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE O.customer_id IS NOT  NULL 







SELECT * FROM Sales.Orders
SELECT * FROM Sales.Customers
SELECT * FROM Sales.Products
SELECT * FROM Sales.Employees

SELECT 
so.OrderID ,
so.Sales , 
sc.FirstName ,
sc.LastName , 
sp.Product AS productName, 
sp.price ,
se.FirstName ,
se.LastName   
FROM sales.orders AS so LEFT JOIN sales.Customers AS sc ON so.CustomerID  = sc.CustomerID 
LEFT JOIN sales.Products AS sp ON so.ProductID  = sp.ProductID 
LEFT JOIN Sales.Employees AS se ON so.SalesPersonID  = se.EmployeeID 









SELECT FirstName , LastName 
FROM Sales.Customers 
UNION  
SELECT FirstName , LastName 
FROM Sales.Employees 


SELECT FirstName , LastName 
FROM Sales.Customers 
UNION  ALL  
SELECT FirstName , LastName 
FROM Sales.Employees 


SELECT FirstName , LastName 
FROM Sales.Customers 
EXCEPT 
SELECT FirstName , LastName 
FROM Sales.Employees 



SELECT FirstName AS CUST , LastName 
FROM Sales.Customers ;
 
SELECT FirstName , LastName 
FROM Sales.Employees ;


SELECT FirstName , LastName 
FROM Sales.Customers 
INTERSECT  
SELECT FirstName , LastName 
FROM Sales.Employees 



