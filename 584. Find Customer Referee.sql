/*
	
	Find the names of the customer that are either:
	
	referred by any customer with id != 2.
	
	not referred by any customer.
	
	Return the result table in any order.
	
	The result format is in the following example.
*/

SELECT name 
FROM Customer 
WHERE referee_id != 2 OR referee_id IS NULL;