/*
	Write a solution to report the name and bonus amount of each employee who satisfies either of the following:
	The employee has a bonus less than 1000.
	The employee did not get any bonus.
	Return the result table in any order.
*/

SELECT e.name   , b.bonus    
FROM Employee AS e
LEFT JOIN Bonus AS b 
ON e.empId = b.empId 
WHERE b.bonus < 1000 OR b.empId IS NULL