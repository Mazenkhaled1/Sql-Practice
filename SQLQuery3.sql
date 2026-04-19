/*
generate a report showing the total sales for each category 
- high: if the sales higher than 50 
- medium: if sales between 20 and 50 
- low: if sales equals 20 or less than 
sort the resul from lowest to highst 
*/

SELECT 
Category,
SUM(Sales) AS TotalSales
FROM(
	SELECT 
	OrderID,
	Sales ,
	CASE 
		WHEN Sales > 50 THEN 'high'
		WHEN Sales > 20 THEN 'medium'
		ELSE 'low'
	END  Category
	FROM Sales.Orders
)t 
GROUP BY Category 
ORDER BY TotalSales DESC ;

SELECT 
OrderID,
Sales ,
CASE 
	WHEN Sales > 50 THEN 'high'
	WHEN Sales > 20 THEN 'medium'
	ELSE 'low'
END  Category
FROM Sales.Orders; 


/* retrieve employee details with gender displayed as full text */

SELECT 
EmployeeID,
FirstName,
LastName,
Gender,
CASE
	WHEN Gender = 'M' THEN 'Male'
	WHEN Gender = 'F' THEN 'Female'
	ELse 'Not Found'
End Full_TExt
FROM Sales.Employees;



/* retreive customer details with abbreviated country code */

SELECT 
CustomerID,
FirstName,
LastName,
Country,
CASE Country
	WHEN 'Germany' THEN 'DE'
	WHEN 'USA' THEN 'US'
	ELSE 'n/a'
END Abbreviated_Country
FROM Sales.Customers;



/* find the average scores of customers and treats nulls AS 0 
and additional provide details such customerID and LastName */

SELECT 
CustomerID,
LastName,
Score,
AVG(Score) OVER() AS AVG_Score,
AVG(CASE 
	WHEN Score IS NULL THEN 0 
	ELSE Score
END ) OVER() AVG_AFTER_REMOVING_NULL
FROM Sales.Customers;




/* count how many times each customer has made an order 
with sales greate than 30 */

SELECT 
CustomerID,
SUM(CASE 
	WHEN Sales > 30 THEN 1 
	ELSE 0 
END) AS TotalOrdersHighSales,
COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY CustomerID







