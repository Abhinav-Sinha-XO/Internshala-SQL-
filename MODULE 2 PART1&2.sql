-- MODULE 2 PART A 

CREATE TABLE Books (
ISBN INT auto_increment primary key,
title varchar(50) NOT NULL,
author varchar(50) NOT NULL,
genre varchar(50) Default 'Unknown Genre',
price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Authors (
ID INT auto_increment primary key,
name varchar(100) NOT NULL Unique,
nationality varchar(50) NOT NULL
);

CREATE TABLE Customers (
Customer_ID INT auto_increment primary key,
name varchar(100) NOT NULL ,
email varchar(255) NOT NULL UNIQUE,
address varchar(255) NOT NULL);

CREATE TABLE Orders (
order_ID INT auto_increment primary key,
Customer_ID INT NOT NULL unique,
order_date DATE NOT NULL,
total_amount DECIMAL(10,2) NOT NULL,
Foreign Key(Customer_ID) references Customers(Customer_ID)
);

INSERT INTO Authors (name, nationality) VALUES 
('J.K. Rowling', 'British'),
('George Orwell', 'British'),
('J.R.R. Tolkien', 'British');

INSERT INTO Books (title, author, genre, price) VALUES
('Harry Potter and the Philosopher\'s Stone', '1', 'Fantasy', 19.99),
('1984', '2', 'Dystopian', 15.99),
( 'The Hobbit', '3', 'Fantasy', 14.99);

INSERT INTO Customers (name, email, address) VALUES
('Alice Johnson', 'alice@email.com', '123 Main St, Springfield'),
('Bob Smith', 'bob@email.com', '456 Oak Rd, Rivertown'),
('Charlie Brown', 'charlie@email.com', '789 Pine Ave, Lakeside');

INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2025-01-01', 35.98),
(2, '2025-01-02', 31.98),
(3, '2025-01-03', 29.98);

select * from Authors;
select * from Books;
select * from Customers;
select * from orders;




-- *********************** PART 2 ***********************

Create Database Titanic;
use Titanic;

 



show tables;

select * from hello;

Select Distinct embarked
from hello;

select first_name,last_name,age 
from hello
where survived = 1;

select first_name,last_name,fare
from hello
where fare>60000;

select first_name,last_name,age 
from hello
where first_name like'J%';

select first_name,last_name,age 
from hello
where deck_number IN(90,70);

select first_name,last_name,age 
from hello
where age between 20 AND 30 ;

select first_name,last_name,age 
from hello
where age IN(20,25, 30);




















