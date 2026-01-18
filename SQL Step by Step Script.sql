/*
AUTHOR : EPHANTUS WANDUA
This is a step  by step SQL SCRIPT

*/

CREATE DATABASE CA_data_science;

select * from dimproduct
limit 5;

-- Single line comment
-- DDL - Data Definition Language 

-- Multi-line comment
/* 
CREATE
ALTER
DROP
TRUNCATE
RENAME
*/ 

SELECT 
    *
FROM
    entity;
-- CREATE STATEMENT
-- Create a database
CREATE DATABASE test_db;

-- Create a table
CREATE TABLE test_tbl(
	id integer,
    first_name varchar(20),
    last_name varchar(20),
    city varchar(20),
    country varchar(20),
    phone integer );

-- Check the schema of the table created
DESC test_tbl;

-- ALTER STATEMENT
-- Add a Column
ALTER TABLE test_tbl
ADD email varchar(25);

-- Check the schema of the table
DESC test_tbl;

-- Modify Column
ALTER TABLE test_tbl
MODIFY city varchar(10) NOT NULL,
MODIFY phone BIGINT UNSIGNED;

DESC test_tbl;

-- Drop a Column
ALTER TABLE test_tbl
DROP COLUMN phone;

-- Check the schema
DESC test_tbl;

-- TRUNCATE STATEMENT - drops contents but keeps structure
TRUNCATE test_tbl;

DESC test_tbl;

-- DROP STATEMENT -- 
-- Drop table
DROP TABLE test_tbl;

-- Drop database
DROP DATABASE test_db;

SHOW DATABASES;

-- Class activity
/* Create a table called `cohort_15` with the following columns
in the ca_data_science database-
- id
- first_name
- last_name
- city
- state
- country
- sex
- occupation
- is_tutor
*/

USE ca_data_science;

CREATE TABLE cohort_15 (
	id integer,
    first_name varchar(15),
    last_name varchar(20),
    city varchar(10),
    state varchar(20),
    country varchar(20),
    sex varchar(10),
    occupation varchar(20),
    is_tutor BOOLEAN
);
desc cohort_15;

-- I want to change column sex to gender 
-- Rename 
ALTER TABLE cohort_15
CHANGE COLUMN sex gender VARCHAR(20);

DESC cohort_15;

-- RENAME table
RENAME TABLE cohort_15 TO cohort;

-- Another way is to use ALTER
ALTER TABLE cohort
RENAME TO cohort_15;

-- Some more DDL statements
ALTER TABLE cohort_15
ADD COLUMN phone int;

-- Rearrange the order of the column
ALTER TABLE cohort_15
MODIFY COLUMN phone int AFTER country;

-- Data Manipulation Language - INSERT, UPDATE, DELETE
-- INSERT STATEMENT
INSERT INTO cohort_15(id, first_name, last_name, city, state,
				country, gender, occupation, is_tutor)
VALUES(1, 'Soyinka' ,'Sowoolu', 'London', 'England', 'United Kingdom', 
		'Male', 'Data Scientist', 1
		);

SELECT * FROM cohort_15;

-- Home work - Insert your details into the cohort_15 table. 

/*  We can insert without stating columns names if all
	details are provided in same order of the columns
    */
    
INSERT INTO cohort_15
VALUES(2, 'Williams', 'Clinton', 'Houston', 'Texas', 'United States', 222222222,
		'Male', 'Politician', 0);
	
INSERT INTO cohort_15
VALUES(3, 'Someone', 'Surname', NULL, NULL, 'United States', 333333333, 'Female',
	'Unemployed', 0);
    
-- Insert multiple values
INSERT INTO cohort_15
VALUES(4, 'Anyone', 'Surname', NULL, NULL, 'United State', 444444444, 'Male',
	'Unemployed', 0),
    (5, 'Another', 'Person', 'Some City', 'A State', 'A Country',555555555,
    'Male', 'programmer', 0);

INSERT INTO cohort_15(id, first_name, city, country, gender, occupation, is_tutor)
VALUES(6, 'Nolastname', 'London', 'England', 'Female', 'Data Scientist', 0);

-- UPDATE STATEMENT
UPDATE cohort_15
SET country = 'England'
WHERE first_name = 'Soyinka';

-- DELETE STATEMENT
DELETE FROM cohort_15
WHERE first_name = 'someone';

DELETE FROM cohort_15
WHERE last_name = 'Person';

-- Data Query Language - DQL- SELECT
-- Select all columns in a table
SHOW TABLES IN classic;
use classic;
SELECT 
	*
FROM classic_customers;
-- Select specific columns in a table
SELECT
	customerName,
    phone,
    country
FROM classic_customers;

SELECT
	*
FROM classic_employees;

-- Select the employee number, lastname and jobtitle from classoc_employee table. 
-- Select specific columns and limit output
SELECT
	employeeNumber,
    lastName,
    jobTitle
FROM classic_employees
LIMIT 15;  # this give us the top 15 employees

SELECT
	employeeNumber,
    lastName,
    jobTitle
FROM classic_employees
LIMIT 2 OFFSET 1;     # this gives us the 2 and 3rd employes, by offesting the first one

-- Select distinct values from a column
SELECT DISTINCT 
	firstName
FROM classic_employees;     # This gives the employees with disctint firstname

-- WHERE clause to filter - 
-- filtered on text column
SELECT *
FROM classic_employees
WHERE firstName = 'leslie';

-- filter on numeric column
SELECT
	Firstname,
    Lastname,
    Jobtitle
FROM classic_employees
WHERE reportsTo = 1143;

-- Filter using  comparison operators
SELECT 
	customerNumber,
    paymentdate,
    amount
FROM classic_payments
WHERE amount >= 1000;

-- Class activity - Show all column in classic_orders table and filter for orders on hold
SELECT *
FROM classic_orders
WHERE status = 'on hold';

-- Filter between a range - BETWEEN - AND
SELECT *
FROM classic_payments
WHERE amount BETWEEN 1500 AND 2500;

-- Filter for multiple posible values - IN
SELECT *
FROM classic_employees
WHERE firstname IN ('Diana', 'mary', 'Patrick', 'George', 'Gerard', 'Grace');

-- Filter with a pattern - LIKE
SELECT *
FROM classic_customers
WHERE customerName LIKE 'a%';   #This loks for all customer names that start with 'a'

SELECT *
FROM classic_customers
WHERE customerName LIKE 'a__o %';#This gives names that start with a and ends with o

-- Filter with logical operators - AND, OR, NOT
SELECT *
FROM classic_employees
WHERE firstname LIKE 'L%' AND lastname LIKE 't%';

SELECT *
FROM classic_employees
WHERE firstName LIKE 'L%' OR lastname LIKE 'T%';

-- Experiment NOT by yourselves
SELECT *
FROM classic_employees
WHERE firstname NOT LIKE 'les%'; # This gives list with names not with lesley

-- Filter by NULL values - IS NULL
SELECT *
FROM ca_data_science.cohort_15
WHERE state IS NULL;

-- ORDER BY - to sort ascending or descending
use classic;
SELECT * FROM classic_products;

SELECT 
	productname, 
    productline
FROM classic_products
ORDER BY productName; -- default is ascending

SELECT 
	productname, 
    productline
FROM classic_products
ORDER BY productname DESC;

SELECT 
	productname, 
	productline
FROM classic_products
ORDER BY productLine DESC;

-- GROUP BY clause
-- Count the number of products per productline
SELECT productline, COUNT(productname)
FROM classic_products
GROUP BY productline;

-- Use WHERE clause with GROUP BY
SELECT
	productline, COUNT(productname)
FROM classic_products
WHERE productline NOT IN ('planes', 'trains', 'ships')
GROUP BY productline;

-- Filter GROUP BY with HAVING 
SELECT
	productline, COUNT(productname)
FROM classic_products
WHERE productline NOT IN ('planes', 'trains', 'ships')
GROUP BY productline
HAVING COUNT(productname) > 15;

-- Formatting with an Alias
SELECT
	productline, 
    COUNT(productname) AS number_of_products
FROM classic_products
WHERE productline NOT IN ('planes', 'trains', 'ships')
GROUP BY productline
HAVING number_of_products > 15;

-- other aggregation function -- without group by 
SELECT MAX(amount)
FROM classic_payments;

-- How many orders - to get the total numbers of orders , we can count the number of rows
SELECT COUNT(*)
FROM classic_orders;

-- Numbers of transaction per customer
SELECT
	customernumber, 
    COUNT(amount) AS number_of_transactions
FROM classic_payments
GROUP BY customerNumber;

-- Average amount per customer
SELECT
	customernumber, 
    COUNT(amount) AS number_of_transactions,
    round(AVG(amount), 2) as avg_per_transaction 
FROM classic_payments
GROUP BY customerNumber;

-- alias applied
SELECT
	customernumber, 
    COUNT(amount) AS number_of_transactions,
    ROUND(AVG(amount), 2) AS average_amount
FROM classic_payments
GROUP BY customerNumber
ORDER BY 3 DESC;  -- this orders column 3 in descending order

/* Class activity - 
1. What is total amount for all customer
2. What is the total amount per customer
*/

-- 1
SELECT
	format(round(SUM(amount), 2), 2) AS total_amount
FROM classic_payments;

-- 2
SELECT
	customernumber,
    count(*) as number_of_transactions,
    format(round(sum(amount), 2), 2) as total_amount,
    format(round(avg(amount), 2), 2) as average_amount
FROM classic_payments
GROUP BY customerNumber
ORDER BY total_amount DESC, average_amount DESC;

 --  Data Control Language - GRANT, REVOKE
 
 -- GRANT
 SELECT User FROM mysql.user;
-- Grant select priviledge
GRANT SELECT ON classic.* TO 'user_read'@'localhost';

-- Check priviledge for user
SHOW GRANTS FOR 'user_read'@'localhost';

-- Grant delete priviledge
GRANT DELETE ON classic.classic_customers TO 'user_write_read'@'localhost';

-- SHOW GRANTS FOR 'root'@'localhost';
-- Grant select and delete priviledges to user at same time
GRANT SELECT ON classic.classic_customers TO 'user_write_read'@'localhost';

-- REVOKE
REVOKE DELETE On classic.classic_customers FROM 'user_write_read'@'localhost';	

/*  Class activity - 
- Grant user - user_write_read a `INSERT` priviledge into classic_customers TABLE.

- 	customerNumber : 249
	customername : Amica Models & Co
    contactLastname: Accorti
    contactfirstName: Paolo
    phone: 001-4988555
    addressLine1: Via Monte Bianco
    addressLine2: NULL
    city: Torino
    state: NULL
    postalcode: 10 100
    country: Italy
    salesRepemployeeNumber: 1401
    creditT Limit: 113000
*/

GRANT INSERT ON classic.classic_customers TO 'user_write_read'@'localhost';

-- COMMIT

USE contoso;

SELECT * FROM factsales;

START TRANSACTION;

-- update unit cost
UPDATE factsales
SET unitcost = '£13.99'
WHERE ProductKey = 1;

-- check update
SELECT * 
FROM factsales 
WHERE productkey = 1;

ROLLBACK;
COMMIT;

START TRANSACTION;

UPDATE factsales
SET unitcost = '$12.99'
WHERE Productkey = 1;

UPDATE factsales
SET MSRP = 13.99
WHERE ProductKey =1;

ROLLBACK;


-- check update
SELECT * FROM factsales 
WHERE Productkey = 1;

-- SAVEPOINT
ALTER TABLE factsales
ADD COLUMN total_sales DECIMAL(10, 2);

-- Start a transaction for DML operation
START TRANSACTION;

-- savepoint 1 : before any updates
SAVEPOINT before_updates;

-- update total_sales with a temporary value 
UPDATE factsales
SET total_sales = 100.00;

-- savepoint 2: After first update
SAVEPOINT after_first_update;

-- Update total_sales with calculated values
UPDATE factsales
SET total_sales = CAST(REPLACE(unitcost, '£', '') AS DECIMAL(10, 2)) * salesQuantity;

-- savepoint 3 : After calculated Values
SAVEPOINT after_calculated_update;

-- Verify current state
SELECT
	saleskey,
    unitcost,
    salesquantity,
    total_sales
FROM factsales;

-- Rollback to after_first_update (undo the calculated update, keep the temporary value)
ROLLBACK TO SAVEPOINT after_first_update;

-- Verify current state
SELECT
	saleskey,
    unitcost,
    salesquantity,
    total_sales
FROM factsales;

-- Roll back to before_update (undo all updates, total_sales becomes NULL)
ROLLBACK TO SAVEPOINT before_updates;

-- Verify final state
SELECT
	saleskey,
    unitcost,
    salesquantity,
    total_sales
FROM factsales;

COMMIT;
SELECT * FROM factsales;

-- Class activity - drop the total_sales column

-- SQL Constraints - NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK, DEFAULT , INDEX

-- NOT NULL Constraint - Enforce a coloumn not to accept NULL VALUES - by default NULL values is accepted

USE Ca_Data_science;

CREATE TABLE student (
id INT NOT NULL,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
age INT);

-- check table
DESC student;

-- Attempt to add NULL values
INSERT INTO student
VALUES(NULL, 'Ephantus', 'Wandua', NULL);

-- Insert value again
INSERT INTO student
VALUES(1, 'Ephantus', 'Wandua', NULL);

-- attempt again
INSERT INTO student
VALUES(1, NULL, 'Wandua', 23);

-- insert
INSERT INTO student
VALUES(1, 'Ephantus', 'Wandua', 23);

SELECT * FROM student;

-- We can modify existing table(s) to add a constraint
DESCRIBE student;

-- Add NOT NULL constraint to age column
ALTER TABLE student
MODIFY COLUMN age int NOT NULL;

-- Attempt to add null values
INSERT INTO student
VALUES(2, 'Ephantus', 'Wandua', NULL);
DESCRIBE student;


-- UNIQUE constraint - ensures that all values in a column are distinct.

CREATE TABLE person (
id INT NULL,
first_name VARCHAR(20),
last_name VARCHAR(20),
age INT,
UNIQUE(id)
);

-- check table
DESC person;

ALTER TABLE person
ADD UNIQUE(first_name);

-- check table
DESC person;

-- SQL automatically names any unnamed constraints as an index
SHOW INDEX FROM person;

-- Drop contraints 
ALTER TABLE person
DROP INDEX first_name;

DESC person;

-- Create name and multiple UNIQUE constraints
ALTER TABLE person
ADD CONSTRAINT uc_person UNIQUE(age, last_name);

SHOW INDEX FROM person;

-- PRIMARY KEY constraint-- Primary key can only be one for each record and cannot contain null value

CREATE TABLE developers (
id int NOT NULL,
first_name VARCHAR(25),
last_name VARCHAR(25),
age int,
tech_stack VARCHAR(50),
years_of_experience int,
PRIMARY KEY(id)
);

-- check table
DESCRIBE developers;

-- define PK on multiple columns and named
CREATE TABLE counsellors (
id int NOT NULL,
first_name VARCHAR(20),
last_name VARCHAR(20) NOT NULL,
CONSTRAINT PK_counsellor PRIMARY KEY(id, last_name)
);

-- check table
DESC counsellors;

SHOW INDEX FROM counsellors;

-- Update a column to a PK
ALTER TABLE student
ADD PRIMARY KEY(id);

DESC student;

-- Drop a PK
ALTER TABLE person
DROP PRIMARY KEY;

SHOW INDEX FROM  person;

-- FOREIGN KEY constraint

CREATE TABLE sales_representatives (
id int NOT NULL,
first_name VARCHAR(20),
last_name VARCHAR(20),
age INT,
location VARCHAR(30),
salary DECIMAL(18, 2),
PRIMARY KEY(id)
);

CREATE TABLE course_sales (
id int NOT NULL,
course_title VARCHAR(50),
course_description VARCHAR(100),
sales_rep_id INT NOT NULL,
course_price DECIMAL(18, 2),
student_id INT NOT NULL,
CONSTRAINT fk_sales_rep FOREIGN KEY(sales_rep_id) REFERENCES sales_representatives(id)
);

-- Alter the course_sales table to add FK to student table
ALTER TABLE course_sales
ADD FOREIGN KEY(student_id) REFERENCES student(id);

DESC course_sales;

SHOW INDEX FROM course_sales;

DROP TABLE student; -- This will create an error to prevent orphan table
-- Home work -- Drop he Foreign Key on student_id (course_sales table) and then drop the student table.ALTER

-- CHECK constraint

-- Class activity - drop the person table

DROP TABLE person;

CREATE TABLE person (
id int NOT NULL,
last_name VARCHAR(20) NOT NULL,
first_name VARCHAR(20),
age INT,
PRIMARY KEY(id),
CHECK(age >= 18)
);
-- check table
DESC person;

-- insert values 
INSERT INTO person
VALUES(1, 'Mike', 'Peller', 16);  -- we have violated the age check and therefore this wont work.
desc person;
-- check on multiple columns

DROP TABLE person;

CREATE TABLE person (
id int NOT NULL,
last_name VARCHAR(20) NOT NULL,
first_name VARCHAR(20),
age INT,
city VARCHAR(50),
CONSTRAINT chk_person CHECK(age >= 18 AND city = 'Austin')
);

INSERT into person
VALUES(1, 'Mike', 'Peller', 20, 'London'); -- since we have violated the check city, this will return error


INSERT into person
VALUES(1, 'Mike', 'Peller', 20, 'Austin');

-- ad check with alter
ALTER TABLE developers
ADD CHECK(years_of_experience >= 2);

-- test this
INSERT INTO developers
VALUES(1, 'Andrew', 'Ng', 40, 'Python', 1);

INSERT INTO developers
VALUES(1, 'Andrew', 'Ng', 40, 'Python', 4);

-- class activity -- Add constraint to the student to accept only students between 18 and 60.

-- Drop check from table
ALTER TABLE developers
DROP CHECK years_of_experience;

-- look for the auto-generated names
SELECT CONSTRAINT_NAME
FROM information_schema.CHECK_CONSTRAINTS;

ALTER TABLE developers
DROP CHECK developers_chk_1;

INSERT INTO developers
VALUES(2, 'patrick', 'henry', 23, 'SQL', 1);

-- DEFAULT constraint
CREATE TABLE students (
ID INT NOT NULL,
last_name VARCHAR(20) NOT NULL,
first_name VARCHAR(20),
location VARCHAR(30) DEFAULT 'United States',
PRIMARY KEY(ID)
);

INSERT INTO students
VALUES (1, 'Patrick', 'Daniel');
-- if you want to use default values you need to list out the columns you have values to insert

INSERT INTO students (ID, last_name, first_name)
VALUES(1, 'Patrick', 'Daniel');

SELECT * FROM students;

-- alter the default values
ALTER TABLE students
ALTER location SET DEFAULT 'USA';

INSERT INTO students(ID, last_name, first_name)
VALUES(2, 'Grace', 'Michael');
insert into students(id, last_name, first_name)
values(3, 'Ephantus', 'Wandua');

insert into students(id, last_name, first_name)
values(4, 'James', 'Maina'), (5, 'Patrick', 'Mwangi'), (6, 'terry', 'Maina');
SELECT * FROM students;

-- OTHER IMPORTANT FUNCTIONS & STATEMENTS
-- STRING FUNCTIONS

USE contoso;

-- LENGTH()
SELECT ProductName, LENGTH(ProductName) AS product_name_length
FROM product
WHERE BrandName LIKE '____%'
ORDER BY product_name_length desc;

-- UPPER()
SELECT entityName, UPPER(EntityName) as entity_name_in_caps
FROM entity;

-- UPPER ()
Select Manufacturer, upper(Manufacturer) as Manufacturer_in_caps
from product;

-- LOWER()
SELECT channelName, LOWER(channelName) as lower_channel_name
FROm channel;

-- TRIM()
SELECT '     Whitespace  ', TRIM('     Whitespace  ') AS trimmed;

-- LTRIM()
SELECT '     LWhitespace' , LTRIM('     LWhitespace') AS Ltrimmed;

-- RTRIM()
SELECT 'RWhitespace       ', RTRIM('RWhitespace       ') AS Rtrimmed;

-- LEFT()
SELECT saleskey, productkey, LEFT(DateKey, 2) AS day_sold
FROM factsales;

-- RIGHT()
SELECT saleskey, productKey, left(DateKey, 2) AS day_sold, right(DateKey, 2) as year_sold
FROM factsales
ORDER BY year_sold DESC;

-- SUBSTRING()
SELECT saleskey, 
	productkey, 
    LEFT(Datekey, 2) AS day_sold, 
    SUBSTRING(Datekey, 4, 3) as month_sold,
    RIGHT(DateKey, 2) AS year_sold
FROM factsales
ORDER BY year_sold;


-- REPLACE
SELECT entityname, REPLACE(entityName, 'Contoso ', '') AS entity_location
FROM entity;

-- LOCATE()
SELECT LOCATE(' ', ProductName) as space_location
FROM product;

-- How this can be used
SELECT productName,
		SUBSTRING(productName, (LOCATE(' ', ProductName))+ 1 ) AS Product
FROM product;

-- CONCAT
SELECT CONCAT(first_name, ' ', last_name) AS full_name,
	location
FROM ca_data_science.students;

-- DATE and TIME FUNCTIONS
-- STR_TO_DATE()

DESC factsales; -- dateKey is a text data type

SELECT DateKey, str_to_date(DateKey, '%d-%b-%y') AS sale_date
FROM factsales
WHERE Datekey IS NOT NULL;

SELECT CURTIME();---- this sql funtion gives the current time

-- TIMESTAMP
SELECT DateKey, TIMESTAMP(str_to_date(DateKey, '%d-%b-%y')) AS sale_date_time
FROM factsales
WHERE datekey IS NOT NULL;

-- DATE()
SELECT DATE('2003-12-31 01:02:03') as date;

-- TIME()
SELECT TIME('2003-12-31 01:02:03') as time;

-- DATEDIFF()
SELECT productKey, 
	DATEDIFF(str_to_date(Datekey, '%d-%b-%y'), '2014-01-01') AS days_in_stock
FROM factsales
ORDER BY days_in_stock DESC;

-- DATE_ADD()
SELECT DATE_ADD('2018-05-01', INTERVAL 1 DAY);

SELECT DATE_ADD('1900-01-01 00:00:00', INTERVAL '-1 10' DAY_HOUR);


-- DATE_SUB()
SELECT DATE_SUB('2018-05-01', INTERVAL 1 YEAR);

SELECT DATE_SUB('2025-01-01 00:00:00', INTERVAL '1 1:1;1' DAY_SECOND);

-- CURRENT_DATE(), CURRENT_TIME(), CURDATE(), CURTIME() ---all this can be used to represent current date
SELECT ProductKey, 
	DATEDIFF(CURRENT_DATE(), STR_TO_DATE(Datekey, '%d-%b-%y')) AS days_since_sale
FROM factsales
ORDER BY days_since_sale DESC;

-- USING CURRENT TIME
SELECT ProductKey, 
	DATEDIFF(CURRENT_TIME(), STR_TO_DATE(Datekey, '%d-%b-%y')) AS days_since_sale
FROM factsales
ORDER BY days_since_sale DESC;

-- USING CURTIME
SELECT ProductKey, 
	DATEDIFF(CURTIME(), STR_TO_DATE(Datekey, '%d-%b-%y')) AS days_since_sale
FROM factsales
ORDER BY days_since_sale DESC;

-- USING CURDATE
SELECT ProductKey, 
	DATEDIFF(CURDATE(), STR_TO_DATE(Datekey, '%d-%b-%y')) AS days_since_sale
FROM factsales
ORDER BY days_since_sale DESC;


-- NUMERIC FUNCTIONS - ROUND, CEILING, FLOOR, MOD
-- ROUND()
SELECT
	ProductKey,
    SalesQuantity,
    UnitCost,
    ROUND(SalesQuantity * CAST(REPLACE(UnitCost, '£', '') AS FLOAT),2) AS SaleAmount
FROM factsales
ORDER BY SaleAmount DESC;

-- correcting dataset
UPDATE factsales
SET Unitcost = REPLACE(unitcost, '$', '£');

-- Ceiling is truncating towards the highest value
-- CEILING -Returns the smallest integer greater than , or equal to the number 
SELECT ProductKey,
	SalesQuantity,
    UnitCost,
    CEILING(ROUND(SalesQuantity * CAST(REPLACE(UnitCost, '£', '') AS FLOAT),2)) as SaleAmount
FROM factsales
ORDER BY SaleAmount DESC;

-- Floor is truncating towards the lowest value
-- FLOOR - Returns the largets integer less than or equal to the number
SELECT ProductKey,
	SalesQuantity,
    UnitCost,
    FLOOR(ROUND(SalesQuantity * CAST(REPLACE(UnitCost, '£', '') AS FLOAT),2)) as SaleAmount
FROM factsales
ORDER BY SaleAmount DESC;

-- MOD - Returns the remainder after a division
SELECT Productkey, 
	SalesQuantity,
    UnitCost,
    CEILING(ROUND(SalesQuantity * CAST(REPLACE(UnitCost, '£', '') AS FLOAT),2)) as SaleAmount,
    MOD(CEILING(ROUND(SalesQuantity * CAST(REPLACE(UnitCost, '£', '') AS FLOAT), 2)),2) AS Ceiling_Modulo
FROM factsales
ORDER BY SaleAmount;

-- WINDOW FUNCTIONS
USE Classic;
-- See group by in action
SELECT productcode, avg(quantityordered * priceEach) as Average
FROM classic_orderdetails
GROUP BY productcode
ORDER BY 1;

SELECT productcode,
	avg(quantityOrdered * priceEach) OVER(PARTITION BY productcode) as Average,
    rank() OVER(PARTITION BY productcode) as ranking
FROM classic_orderdetails;

USE Contoso;

SELECT productkey
	entitykey,
    substring(entityname, 8) as Region,
    SUM(REPLACE(unitcost, '£','') * salesQuantity) OVER(PARTITION BY EntityKey) as totalSales
FROM factsales fs
INNER JOIN entity e
ON fs.storekey = e.entitykey;

-- Activity roundup to 2 decimal places the totalsales column
SELECT productkey
	entitykey,
    substring(entityname, 8) as Region,
    Round(SUM(REPLACE(unitcost, '£','') * salesQuantity) OVER(PARTITION BY EntityKey),2) as totalSales
FROM factsales fs
INNER JOIN entity e
ON fs.storekey = e.entitykey;

--- JOIN
SELECT *
FROM factsales fs
JOIN entity e
ON fs.storekey = e.entitykey;


--- Left join
SELECT *
FROM factsales fs
left JOIN entity e
ON fs.storekey = e.entitykey;

--- Right join
SELECT *
FROM factsales fs
right JOIN entity e
ON fs.storekey = e.entitykey;


-- SQL JOINS - INNER, LEFT, RIGHT, FULL, UNION, UNION ALL, SELF-JOIN
-- INNER
SELECT *
FROM entity
INNER JOIN factsales
	ON entity.entityKey = factsales.storekey;



SELECT 
	productName,
    productDescription,
    factsales.Unitcost,
    SalesQuantity
FROM product 
JOIN factsales 
	ON product.ProductKey = factsales.ProductKey;


-- We can use alias for same code
SELECT 
    productName,
    productDescription,
    f.Unitcost,
    SalesQuantity
FROM
    product p
JOIN
factsales f 
	ON p.ProductKey = f.ProductKey;
    
-- LEFT join for the above query
SELECT 
	productName,
    productDescription,
    f.Unitcost,
    SalesQuantity
FROM product p
LEFT JOIN factsales f
	ON p.productKey = f.productKey;

SELECT *
FROM entity
LEFT JOIN factsales
	ON entity.entityKey = factsales.storekey
WHERE salesquantity = 4;

-- RIGHT
SELECT *
FROM entity e
RIGHT JOIN factsales f
	ON e.entityKey = f.storeKey
WHERE salesquantity = 4;

-- FULL OUTER / FULL (UNION)
-- Simulate with UNION

SELECT e.*, f.*
FROM entity e
LEFT OUTER JOIN factsales f
	ON e.entityKey = f.storeKEy
WHERE salesQuantity = 4
UNION
SELECT e.*, f.*
FROM entity e
RIGHT OUTER JOIN factsales f
	ON e.entityKey = f.storeKey
WHERE salesquantity = 4;

-- UNION ALL-- This return everything(returns all rows)
SELECT ProductKey, productName FROM product
UNION all
SELECT productkey, storeKey FROM factsales;   

-- UNION-- This returns only the distint values(returns less number of rows)
SELECT ProductKey, productName FROM product
UNION
SELECT productkey, storeKey FROM factsales;  

-- SELF JOIN
SELECT
	a.ProductcategoryName AS category_name_a,
    b.ProductCategoryName AS category_name_b,
    a.loadDate as load_date
FROM productcategory a
JOIN productcategory b
	ON STR_TO_DATE(a.loadDate, '%d-%b-%Y') = STR_TO_DATE(b.loadDate, '%d-%b-%Y')
    AND a.productCategoryKey = b.ProductCategoryKey
WHERE a.LoadDate IS NOT NULL;

-- DO some more Window Function
use contoso;
SELECT 
	fs.productkey,
    entityKey,
    substring(entityname, 8) as Region,
REPLACE(fs.unitcost, '£', '') * fs.salesquantity AS salesAmount,
ROW_NUMBER() OVER(PARTITION BY entitykey ORDER BY fs.productKey) AS rowNumber
FROM factsales fs
JOIN entity e
	ON fs.storeKey = e.entityKey;

    
SELECT 
	fs.productkey,
    entityKey,
    substring(entityname, 8) as Entity,
REPLACE(fs.unitcost, '£', '') * fs.salesquantity AS salesAmount,
RANK() OVER(PARTITION BY entitykey ORDER BY REPLACE(fs.unitcost, '£', '') 
	* fs.salesquantity DESC) as rankSale
FROM factsales fs
JOIN entity e
	ON fs.storeKey = e.entityKey;

/* Activity - (1) experiment with DENSE_RANK() 
			(2) Read about CROSS-JOINS
            */
            
-- SUBQUERIES
-- e.g Get all product that sold above the average quantity

SELECT *
FROM factsales
WHERE Salesquantity > (SELECT avg(salesQuantity) FROM factsales);

SELECT *
FROM factsales
WHERE Salesquantity <= (SELECT avg(salesQuantity) FROM factsales);

-- e.g Find all the products belonging to a subcategory having more than 20 products
SELECT productname, s.numProductSubCo
FROM product p
JOIN 
(SELECT ProductSubcategoryKey, count(productname) as numProductSubCo
	FROM product
    GROUP BY ProductSubcategoryKey
    HAVING count(productname) > 20) AS s
    ON p.ProductsubcategoryKey = s.ProductSubcategoryKey;

-- See the subquery alone
SELECT ProductSubcategoryKey, count(productname) as numProductSubCo
	FROM product
    GROUP BY ProductSubcategoryKey
    HAVING count(productname) > 20;
    
-- Temporary Tables and Common Table Expressions(CTEs)

USE classic;

CREATE TEMPORARY TABLE temp_states (
states VARCHAR(30) PRIMARY KEY);
Desc temp_states;


-- Insert into temporary table

INSERT INTO temp_states
SELECT DISTINCT state FROM classic_offices
WHERE state IS NOT NULL;
SELECT * FROM temp_states;

-- Drop the temp table
DROP TABLE temp_states;

-- Faster way to create temporary table
CREATE TEMPORARY TABLE temp_states
AS
SELECT DISTINCT state FROM classic_offices
WHERE state IS NOT NULL;

SELECT * FROM temp_states;

-- Think of the CTE as a subquery lifted out and placed at the beginning of the query
-- CTEs are useful when results will be used multiple times in the rest of the query

USE contoso;


WITH top_sub_cat as (
SELECT productSubcategoryKEy, count(productName) as numSubProducts
FROM product
GROUP BY ProductSubcategoryKey
HAVING count(productName) > 20
)
SELECT productName, numsubProducts
FROM top_sub_cat t
JOIN product p	
	ON t.ProductsubcategoryKey = p.ProductSubcategoryKey;


-- Multiple CTEs
WITH top_sub_cat as (
SELECT productsubcategoryKey, count(productName) as numProductSubCo
FROM product
GROUP BY ProductSubcategoryKey
HAVING count(productName) > 20
),
top_brand as (
SELECT BrandName, count(productName) as numProductBrand
FROM product
GROUP BY BrandName
HAVING count(productName) > 50)
SELECT productName, manufacturer, BrandName, t.numProductSubCo
FROM top_sub_cat t
JOIN product p
ON t.ProductSubcategoryKey = p.ProductSubCategoryKey
WHERE BrandName IN (SELECT Brandname FROM top_brand);

-- Views.-- This limit the interaction of the user to the whole table through giving the exact columns to be used.
USE classic;

CREATE VIEW cus_name AS
SELECT
	contactFirstName, 
    contactLastName
FROM classic_customers;

SELECT * FROM cus_name;

-- Alter views
ALTER VIEW cus_name AS
SELECT contactFirstName, 
	contactLastname, 
    city 
FROM  classic_customers;

SELECT * FROM cus_name;

-- Drop views
DROP VIEW cus_name;

-- Class assignment - Create a view of a query that uses a subquery from the classic database

-- Stored Procedures
-- You need to change the Delimiter as the first step - most common one used is $$
USE CLASSIC;
DELIMITER $$

CREATE PROCEDURE people_loc(location VARCHAR(50))
BEGIN
	SELECT country, contactFirstName, contactLastName
    FROM classic_customers
    WHERE country = location;

END $$

DELIMITER ;

CALL people_loc('france');

CALL people_loc('usa');

-- Bonus topic
-- CASE STATEMENT

SELECT 
	customername, 
    contactlastName, 
    ContactFirstName, 
    creditLimit,
    (CASE
		WHEN CreditLimit < 1000 THEN 'Standard'
        WHEN CreditLimit >= 1000 THEN 'Premium'
        ELSE 'Not Classified'
	END ) As class
    FROM classic_customers
    WHERE creditLimit IS NOT NULL
    ORDER BY creditLimit;
    
    -- END OF SQL 
    









