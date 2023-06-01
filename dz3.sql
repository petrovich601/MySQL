-- Часть 1
CREATE DATABASE HW3_1;
USE HW3_1;

CREATE TABLE salespeople
(
snum INT PRIMARY KEY UNIQUE,
sname CHAR(10) NOT NULL,
city CHAR(10) NOT NULL,
comm DECIMAL(5,2) NOT NULL
);

INSERT INTO salespeople(snum, sname, city, comm)
VALUES
(1001, "Peel", "London", 0.12),
(1002, "Serres", "San Jose", 0.13),
(1004, "Motika", "London", 0.11),
(1007, "Rifkin", "Barcelona", 0.15),
(1003, "Axelrod", "New York", 0.10);

CREATE TABLE customers
(
cnum INT PRIMARY KEY UNIQUE,
cname CHAR(10) NOT NULL,
city CHAR(10) NOT NULL,
rating INT NOT NULL,
snum INT,
FOREIGN KEY (snum)  REFERENCES salespeople (snum)
);

INSERT INTO customers(cnum, cname, city, rating, snum)
VALUES
(2001, "Hoffman", "London", 100, 1001),
(2002, "Giovanni", "Rome", 200, 1003),
(2003, "Liu", "SanJose", 200, 1002),
(2004, "Grass", "Berlin", 300, 1002),
(2006, "Clemens", "London", 100, 1001),
(2008, "Cisneros", "SanJose", 300, 1007),
(2007, "Pereira", "Rome", 100, 1004);

CREATE TABLE orders
(
onum INT PRIMARY KEY UNIQUE,
amt DECIMAL(7,2) NOT NULL,
odate DATE NOT NULL,
cnum INT,
snum INT,
FOREIGN KEY (cnum)  REFERENCES customers (cnum),
FOREIGN KEY (snum)  REFERENCES salespeople (snum)
);

INSERT INTO orders(onum, amt, odate, cnum, snum)
VALUES
(3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001, 1001),
(3002, 1900.10, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '1990-04-10', 2004, 1002),
(3008, 4723.00, '1990-05-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002),
(3011, 9891.88, '1990-06-10', 2006, 1001);

-- Задание №1
SELECT city, sname, sname, comm
FROM salespeople;

-- Задание №2
SELECT DISTINCT(cname) AS name, rating 
FROM customers; 

-- Задание №3
SELECT DISTINCT(cname) AS name 
FROM customers;

-- Задание №4
SELECT cname
FROM customers
WHERE cname LIKE 'G%';

-- Задание №5
SELECT *
FROM orders
WHERE amt > 1000;

-- Задание №6
SELECT MIN(amt)
FROM orders;

-- Задание №7
SELECT *
FROM customers
WHERE (rating > 100) AND (city != "Rome");

-- Часть 2

CREATE DATABASE hw3_2;
use hw3_2;

create table workers (
	id int primary key auto_increment,
    name varchar (20) not null,
    surname varchar (20) not null,
    speciality varchar (20) not null,
    seniority int not null,
    salary int not null,
    age int not null
);

insert workers( name, surname, speciality, seniority, salary, age)
values
	('Вася', 'Васькин', 'начальник', 40, 100000, 60),
    ('Петя', 'Петькин', 'начальник', 8, 70000, 30),
    ('Катя', 'Катькина', 'инженер', 2, 70000, 25),
    ('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'рабочий', 20, 25000, 40),
    ('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
    ('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
    ('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
    ('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
    ('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
	('Люся', 'Люськина', 'уборщик', 10, 10000, 49);
    
   
   
SELECT * FROM workers
ORDER BY salary;

-- Задание №1
SELECT * FROM workers
ORDER BY salary DESC;

-- Задание №2
SELECT * FROM workers
ORDER BY salary
LIMIT 5;

-- Задание №3
SELECT * FROM workers
WHERE salary > 100000
ORDER BY speciality;
    