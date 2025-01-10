Create database Customer_Data_analysis;
use Customer_Data_analysis;

-- hello is table name
select * from hello;

-- Q1.
select *  
from hello
order by age;


-- Q2

SELECT * 
FROM hello 
ORDER BY Balance DESC 
LIMIT 10;

-- Q3

SELECT Region, AVG(Balance) AS Average_Balance 
FROM hello 
GROUP BY Region 
HAVING AVG(Balance) > 60000;

-- Q4

SELECT Job, SUM(Balance) AS Total_Balance 
FROM hello
GROUP BY Job 
ORDER BY Total_Balance DESC 
LIMIT 3;

-- Q5/

SELECT Job, SUM(Balance) AS Total_Balance 
FROM hello 
GROUP BY Job 
ORDER BY Total_Balance DESC 
LIMIT 3;

-- Q6


SELECT SUM(Balance) AS Total_Balance 
FROM hello 
WHERE Age BETWEEN 25 AND 35;


-- Q7

select *
from hello
where gender = 'male' AND balance > 50000;


-- 2.
create database Techmart_data_creation;

use Techmart_data_creation




Create TABLE Customerss (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
customer_name VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
phone VARCHAR(15) NOT NULL
);


CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(100) NOT NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customerss(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


INSERT INTO Products (product_name, price, category) VALUES
('Laptop', 75000.00, 'Electronics'),
('Smartphone', 50000.00, 'Electronics'),
('Smartwatch', 15000.00, 'Accessories'),
('Headphones', 3000.00, 'Accessories'),
('Keyboard', 2000.00, 'Peripherals');

INSERT INTO Customerss (customer_name, email, phone) VALUES
('Alice Johnson', 'alice@example.com', '9876543210'),
('Bob Smith', 'bob@example.com', '8765432109'),
('Charlie Brown', 'charlie@example.com', '7654321098');

INSERT INTO Orders (customer_id, product_id, quantity, order_date) VALUES
(1, 1, 1, '2025-01-01'),
(2, 2, 2, '2025-01-01'),
(3, 3, 1, '2025-01-01'),
(1, 4, 3, '2025-01-02'),
(2, 5, 1, '2025-01-02'),
(3, 1, 2, '2025-01-03'),
(1, 3, 1, '2025-01-03'),
(2, 4, 1, '2025-01-04'),
(3, 5, 2, '2025-01-04'),
(1, 2, 1, '2025-01-05');

-- 3 ------------------

create database Data_Analysis ;

use Data_Analysis;

UPDATE table3
SET job = 'Data Scientist'
WHERE customerid = '200000008';

select * from table3;


UPDATE table3
SET balance = balance * 1.10;

set sql_safe_updates = 0;

select @sql_safe_updates;

UPDATE table3
SET balance = 0
WHERE age < 30;

UPDATE table3
SET region = 'Wales'
WHERE name = 'Thomas' AND surname = 'Lawrence';

UPDATE table3
SET job = 'Engineer'
WHERE gender = 'Male';

Rollback;

commit;

update table3
set balance =balance *2
where name like 'J%';


update table3
set job ='Manager'
where balance = (select MAX(balance) from table3);

select * from table3

DESCRIBE table3;

UPDATE table3
SET balance = 50000
WHERE region = 'England';


Create database analyzing_customer_data

use analyzing_customer_data;

select * from customers

delete from customers
where age>50;

set sql_safe_updates = 0

DELETE FROM customers
WHERE customerid = 300000812;

DELETE FROM customers
WHERE job = 'Other';

DELETE FROM customers
WHERE gender = 'Male' AND age > 40;

DELETE FROM customers
WHERE region = 'Scotland' AND balance < 50000;


-- Highest average balance by job
SELECT job, AVG(balance) AS avg_bal
FROM customers
GROUP BY job
ORDER BY avg_bal DESC
LIMIT 1;

-- Lowest average balance by job
SELECT job, AVG(balance) AS avg_bal
FROM customers
GROUP BY job
ORDER BY avg_bal ASC
LIMIT 1;

SELECT job, COUNT(*) AS job_count
FROM customers
GROUP BY job
ORDER BY job_count DESC
LIMIT 1;

select region, avg(balance) as avg_bal
from customers
group by region;

select region, sum(balance) as sum_bal
from Customers
group by region
order by sum_bal desc
LIMIT 3;






















