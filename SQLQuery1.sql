~

 SELECT first_name, country FROM customers WHERE score > 500 
 SELECT * FROM customers  WHERE score != 0 
 SELECT * FROM customers  WHERE country = 'Germany'
 SELECT * FROM  customers ORDER BY id DESC 
 SELECT * FROM customers  ORDER BY country ASC , score DESC

 SELECT country , sum(score) AS total_score FROM customers GROUP BY country HAVING sum(score) > 800 

SELECT  country , AVG(score) AS avg_score
FROM customers
WHERE score != 0 
GROUP BY country 
HAVING AVG(score) > 430

SELECT DISTINCT country from customers

SELECT TOP 3 * FROM customers ORDER BY score DESC
SELECT TOP 2 * FROM customers ORDER BY score ASC




CREATE TABLE persons(
id INT NOT NULL , 
person_name VARCHAR(50) NOT NULL  ,
birth_date DATE , 
phone VARCHAR(15) NOT NULL ,
CONSTRAINT pk_persons PRIMARY KEY(id)

)
SELECT * FROM PERSONS 

ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL 

ALTER TABLE persons
DROP COLUMN phone 

ALTER TABLE persons 
ADD phone VARCHAR(15) NOT NULL 

DROP TABLE persons 





INSERT INTO customers (id,first_name,country, score) 
VALUES
(6 , 'Mazen' ,'USA' ,null),
(7 , 'Youssef' ,null ,100)

INSERT INTO persons (id,person_name , birth_date,phone)
SELECT
id,
first_name,
Null, static value 
'UNKNOWN' static value 
FROM customers
SELECT * FROM persons




SELECT * FROM customers WHERE score = 0 
UPDATE customers 
SET score = 0 
WHERE  score IS NULL  




SELECT * FROM customers
DELETE FROM customers WHERE id > 5 



SELECT * FROM persons
DELETE FROM persons 
TRUNCATE TABLE persons










