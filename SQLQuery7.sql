-- for USA custoemrs find the total number of customers and average Score
CREATE PROCEDURE GetCustomerSummary AS 
BEGIN 
SELECT 
COUNT(*) TotalCustomers , -- total number of customers 
AVG(Score) AvgScore
FROM Sales.Customers
WHERE Country = 'USA'
END 
EXEC GetCustomerSummary




-- for Germany customers find the total number of customers and the average of score 
CREATE PROCEDURE GetCustomerSummaryGermany 
-- parameters 
AS 
BEGIN 
SELECT 
COUNT(*) TotalCustomers , -- total number of customers 
AVG(Score) AvgScore
FROM Sales.Customers
WHERE Country = 'Germany'
END 

EXEC GetCustomerSummaryGermany









CREATE PROCEDURE GetCustomerSummaryDynamic  @Country  NVARCHAR(50) = 'USA' -- default
AS 
BEGIN
	BEGIN TRY
		DECLARE @TotalCustomers INT , @AvgScore FLOAT 

	
		-- Setp 1:Preparing & Cealnup Data
		IF EXISTS(SELECT 1 FROM Sales.Customers WHERE Score  IS NULL AND Country = @Country)
		BEGIN 
			PRINT('updating null scores to 0 ') 
			UPDATE Sales.Customers
			SET Score = 0 
			WHERE Score  IS NULL AND Country = @Country;
		END 

		ELSE
		BEGIN 
			PRINT('no null scores founds')
		END;

		-- Setp 2:Generating Report 
		SELECT 
		 @TotalCustomers = COUNT(*) ,
		 @AvgScore =AVG(Score)
		FROM Sales.Customers
		WHERE Country = @Country ;

		PRINT 'Total Customers From ' +  @Country + ':' + CAST(@TotalCustomers AS NVARCHAR(50) ) ;
		PRINT 'Avegare Score ' + @Country + ':' + CAST(@AvgScore AS NVARCHAR(50))  ; 

		-- SSetp 3: Find the total NR. of orders and total sales from usa customers
		SELECT 
		COUNT(OrderID) TotalOrders ,
		SUM(Sales) TotalSales 
		FROM Sales.Orders o 
		INNER JOIN Sales.Customers c 
		ON o.CustomerID = c.CustomerID
		WHERE c.Country = @Country ;
		END TRY 
	BEGIN CATCH
			PRINT('an error occured.');
			PRINT('error message:' + ERROR_MESSAGE());
			PRINT('error number:' + CAST(ERROR_NUMBER() AS NVARCHAR));
			PRINT('error line:' + CAST(ERROR_LINE() AS NVARCHAR));
			PRINT('error procedure ' + ERROR_PROCEDURE()) 
	END CATCH 
END 


EXEC GetCustomerSummaryDynamic @Country = 'Germany'
EXEC GetCustomerSummaryDynamic @Country = 'USA'
EXEC GetCustomerSummaryDynamic 





