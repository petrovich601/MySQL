CREATE DATABASE PhonesDB;
show databases;
use phonesDB;
create table phones
(
	id int primary key auto_increment,
    ProductName varchar(20) not null,
    Manufacturer varchar(20) not null,
    ProductCount int default 0,
    Price decimal
);
insert into phones (ProductName, Manufacturer, ProductCount,
 Price)
values
('iPhon X', 'Apple', 3, 76000),
('iPhon 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawey', 5, 36000);
select * from phones;
select * from phones
where ProductCount > 2;
select * from phones
where Manufacturer = 'Samsung';

 

