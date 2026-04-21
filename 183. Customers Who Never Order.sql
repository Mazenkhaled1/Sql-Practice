/*
Write a solution to find all customers who never order anything.
Return the result table in any order.
*/

SELECT name As Customers 
FROM Customers c LEFT JOIN Orders o
ON c.id = o.customerId 
WHERE o.customerId IS NULL 