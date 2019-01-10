create database bamazon;
use bamazon;

create table products(
	id int auto_increment not null,
    product_name varchar(100) not null,
    department_name varchar(100) not null,
    price int not null,
    stock_quantity int not null,
    primary key(id)
    );
    
insert into products(product_name, department_name, price, stock_quantity)
values("apple", "food", 2, 10);
insert into products(product_name, department_name, price, stock_quantity)
values("shirt", "clothing", 50, 3);
insert into products(product_name, department_name, price, stock_quantity)
values("tv", "electronic", 1000, 1);
insert into products(product_name, department_name, price, stock_quantity)
values("ice cream", "food", 10, 5);
insert into products(product_name, department_name, price, stock_quantity)
values("pants", "clothing", 100, 2);
insert into products(product_name, department_name, price, stock_quantity)
values("switch", "electronic", 300, 5);
insert into products(product_name, department_name, price, stock_quantity)
values("steak", "food", 20, 4);
insert into products(product_name, department_name, price, stock_quantity)
values("hat", "clothing", 30, 8);
insert into products(product_name, department_name, price, stock_quantity)
values("laptop", "electronic", 500, 5);
insert into products(product_name, department_name, price, stock_quantity)
values("grape", "food", 5 , 20);

select * from products;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'lol'