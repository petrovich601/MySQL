/*
1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
*/

CREATE DATABASE homework_database;
use homework_database;

CREATE TABLE `homework_database`.`sales` (
    id INT NOT NULL AUTO_INCREMENT,
    order_date DATE NOT NULL,
    amount INT NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO sales (order_date, amount)
VALUES
  ("2021-10-26",285),
  ("2022-11-15",150),
  ("2023-03-19",283),
  ("2022-08-12",310),
  ("2022-06-04",154),
  ("2022-08-22",187),
  ("2023-04-17",87),
  ("2023-01-25",315),
  ("2023-07-24",156),
  ("2021-10-18",314),
  ("2022-08-03",95);

/*
2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
*/

SELECT id, order_date, amount,
CASE TRUE
    WHEN amount < 100 THEN 'меньше 100'
    WHEN amount >= 100 AND amount <= 300 THEN '100-300'
    ELSE 'больше 300'
END AS order_size
FROM sales;

/*
3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
*/

CREATE TABLE orders (
    orderid INT NOT NULL AUTO_INCREMENT,
    employeeid VARCHAR(5) NOT NULL,
    amount DECIMAL(20, 2) NOT NULL,
    orderstatus VARCHAR(45) NOT NULL,
    PRIMARY KEY (orderid)
);

INSERT INTO orders (employeeid, amount, orderstatus)
VALUES
("e03",50.65,"OPEN"),
  ("e02",33.34,"OPEN"),
  ("e03",7.90,"CLOSED"),
  ("e03",58.30,"CLOSED"),
  ("e03",15.02,"CANCELLED"),
  ("e05",28.46,"CLOSED"),
  ("e04",23.70,"OPEN"),
  ("e02",84.01,"OPEN");


SELECT orderid, orderstatus,
CASE orderstatus
    WHEN "OPEN" THEN 'Order is in open state.'
    WHEN "CLOSED" THEN 'Order is closed.'
    ELSE 'Order is cancelled.'
END AS order_summary
FROM orders;

/*
4. Чем NULL отличается от 0?
"0" — это значение. 
A "NULL" указывает на "пустое место" — объект и т.п.
*/