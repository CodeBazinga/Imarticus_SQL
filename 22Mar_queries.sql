
create database demo1;

use demo1;

show databases;

CREATE TABLE information(
Cust_Id int Not Null,
Name varchar(20) Not Null,
Country varchar(20) Not Null,
City varchar(20)
);

describe information;

create table student(
RNo int not null primary key,
FName varchar(20) not null,
LName varchar(20),
email varchar(40) not null,
contact int,
city varchar(30),
age int
);


describe student;

select * from student;

insert into student values(24,'Mohit','Singh','mohit123@gmail.com',6789,'Delhi',25);
insert into student values(25,'Ankit','Pandey','ankit123@gmail.com',1234,null,21);
insert into student values(25,'Manan','Shukla','manan123@gmail.com',4353,null,22);




select * from information;

insert into information values (45,'Aman','India','Noida');



show tables;


CREATE TABLE personal_info (
Cust_id int Not Null,
Name varchar(20) Not Null,
Country varchar(20) Not Null,
City varchar(20),
PRIMARY KEY (Cust_id)); 

describe personal_info;
select * from personal_info;

ALTER TABLE personal_info CHANGE Name Full_Name varchar(50);
ALTER TABLE personal_info CHANGE Full_Name FName varchar(30) not null;

ALTER TABLE personal_info MODIFY Country varchar(35) NOT NULL;
ALTER TABLE personal_info ADD COLUMN Income int;

ALTER TABLE personal_info ADD Gender varchar(5) AFTER FName;
ALTER TABLE personal_info DROP COLUMN Income;
select * from personal_info

RENAME TABLE personal_info TO per_info;
select * from per_info;



CREATE TABLE order_info (
Order_id int NOT NULL,
Order_num int NOT NULL,
Cust_id int,
PRIMARY KEY (Order_id),
FOREIGN KEY (Cust_id) REFERENCES personal_info(Cust_id));



drop database demo1;

select * from t1

insert into t1 values (10,'India');
insert into t1 values (20,'Sri Lanka');

drop table t1;
truncate table t1;

create table t1(
c1 int not null primary key,
c2 varchar(20)
)



create table t2(
Rno int not null,
name varchar(20) not null,
age int
)

select * from t2
describe t2

ALTER TABLE t2 ADD PRIMARY KEY(Rno);
ALTER TABLE t2 DROP PRIMARY KEY;


