
create table Customers(
ID int not null primary key,
FName varchar(30) not null,
LName varchar(30),
Age int,
City varchar(30),
Salary double
)

create table Orders(
Order_ID int not null primary key,
C_ID int not null,
Order_date text,
Transaction_Amount int
)

insert into Customers values(1,'Mohit','Shukla',23,'Mathura',35000.00);
insert into Customers values(2,'Ujjwal','Singh',22,'Noida',33000.00);
insert into Customers values(3,'Karthik','Dogra',28,'Gurgugram',46000.00);
insert into Customers values(4,'Ashish','Shukla',23,'Mumbai',35000.00);
insert into Customers values(5,'Jiten','Pandey',26,'Noida',37000.00);
insert into Customers values(6,'Vrinda','Kohli',31,'Delhi',44000.00);
insert into Customers values(7,'Ritu','Gupta',21,'Mumbai',28000.00);
insert into Customers values(8,'Manan','Dueby',Null,'Mumbai',Null);
insert into Customers values(9,'Aakriti','Gaur',26,null,37000.00);

insert into Orders values(132,1,'2018-03-14',3540)
insert into Orders values(134,2,'2019-05-29',4032)
insert into Orders values(145,3,'2020-07-23',2133)
insert into Orders values(133,4,'2017-02-11',1232)
insert into Orders values(137,5,'2019-04-08',4210)
insert into Orders values(144,6,'2019-06-05',5240)
insert into Orders values(140,7,'2020-12-18',6123)
insert into Orders values(141,8,'2022-10-27',1431)
insert into Orders values(143,9,'2021-11-20',2500)




create table w1(
PID int not null primary key,
PName varchar(20),
Sales int
)

insert into w1 values
(12,'Cap',800),
(13,'Bottle',700),
(14,'Notebook',650),
(15,'Pen',250)

create table w2(
PID int not null primary key,
PName varchar(20),
Sales int,
Qty int
)

insert into w2 values
(11,'Soap',1100,30),
(13,'Bottle',700,10),
(16,'Mobile Charger',1500,12),
(18,'Bag',1350,4),
(15,'Pen',250,15)




CREATE TABLE my_sales (
S_ID int not null primary key,
month varchar(15), 
prod_name  VARCHAR(15),
sales INT)




INSERT INTO my_sales 
VALUES
(1,'Jan', 'Fruits', 45000),
(2,'Jan', 'Vegetables', 67000),
(3,'Jan', 'Dairy', 55000),
(4,'Feb', 'Fruits', 42000),
(5,'Feb', 'Vegetables', 32000),
(6,'Feb', 'Dairy', 52000),
(7,'March', 'Fruits', 61000),
(8,'March', 'Vegetables', 43000),
(9,'March', 'Dairy', 92000)
