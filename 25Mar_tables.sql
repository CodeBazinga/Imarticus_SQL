

-- Tables for Join
create table course(
CID int not null primary key,
CName varchar(20) not null,
start_date date not null
);

insert into course (CID,CName,start_date)
values
(215,'Data Science','2019-04-15'),
(216,'ML','2019-06-20'),
(217,'SQL','2019-08-05'),
(218,'R Programming','2019-07-10'),
(219,'Deep Learning','2019-05-25'),
(220,'Apache Spark','2019-03-01'),
(221,'Tableau','2019-10-01'),
(222,'Power BI','2019-11-01'),
(224,'Excel','2019-12-01')

create table stu1(
SID int not null primary key,
Name varchar(30) not null,
email varchar(50),
age int,
score int,
C_ID int,
foreign key (C_ID) references course(CID) 
)


insert into stu1 (SID,Name,email,age,score,C_ID)
values 
(11,'Ankit','a1@gmail.com',23,87,219),
(12,'Peeyush','a2@gmail.com',24,75,220),
(13,'Gaurav','a3@gmail.com',22,93,215),
(14,'Lakshya','a4@gmail.com',25,65,220),
(15,'Paritosh','a5@gmail.com',22,70,216),
(16,'Ujjwal','a6@gmail.com',24,89,215),
(17,'Neha','a7@gmail.com',24,91,217),
(18,'Shreya','a8@gmail.com',25,58,221),
(19,'Mudit','a9@gmail.com',22,64,219),
(20,'Shrishti','a10@gmail.com',21,62,220),
(21,'Smriti','a11@gmail.com',24,77,215),
(22,'Garima','a12@gmail.com',25,82,216),
(23,'Akshay','a13@gmail.com',21,62,218),
(24,'Ayush','a14@gmail.com',24,77,215),
(25,'Krishna','a15@gmail.com',25,82,220),
(26,'Udit','a16@gmail.com',21,62,221),
(27,'Tanmay','a17@gmail.com',24,77,219),
(28,'Tarun','a18@gmail.com',25,82,222),
(29,'Divya','a19@gmail.com',24,77,219)

insert into stu1 values (30,'Rohit','a20@gmail.com',25,93,null)