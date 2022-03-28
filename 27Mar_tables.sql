
create table course(
CID int not null primary key,
CName varchar(20) not null,
start_date date not null
)

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
(224,'Excel','2019-12-01'),
(223,'Linux','2019-05-01'),
(225,'Statistics','2019-10-15'),
(227,'NLP','2019-08-15')


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
(20,'Shrishti','a10@gmail.com',21,64,220),
(21,'Smriti','a11@gmail.com',24,77,215),
(22,'Garima','a12@gmail.com',25,82,216),
(23,'Akshay','a13@gmail.com',21,62,218),
(24,'Ayush','a14@gmail.com',24,77,215),
(25,'Krishna','a15@gmail.com',25,82,220),
(26,'Udit','a16@gmail.com',21,62,221),
(27,'Tanmay','a17@gmail.com',24,78,219),
(28,'Tarun','a18@gmail.com',25,82,222),
(29,'Divya','a19@gmail.com',24,77,219),
(30,'Rohit','a20@gmail.com',22,90,null),
(31,'Jatin','a21@gmail.com',21,89,null),
(32,'Siddharth','a22@gmail.com',25,73,null)

create table stu1_bio(
 Stu_ID int not null primary key,
 city varchar(30),
 degree varchar(15),
 grad_year varchar(4),
 cgpa float,
 foreign key (stu_id) references stu1(SID)
 )
 
insert into stu1_bio
values
(11,'Delhi','BCOM','2018',7.5),
(12,'Noida','BA','2019',7.6),
(13,'Mumbai','BTECH','2017',8.0),
(14,'Delhi','MA','2018',8.1),
(15,'Pune','BTECH','2020',7.7),
(16,'Mumbai','BTECH','2021',7.3),
(17,'Mumbai','BCA','2021',7.2),
(18,'Bangalore','BCOM','2018',6.3),
(19,'Chennai','BA','2019',6.7),
(20,'Bangalore','MCA','2020',8.4),
(21,'Pune','BCOM','2019',8.3),
(22,'Bangalore','BA','2020',6.5),
(23,'Bangalore','MCA','2019',6.4),
(24,'Noida','BTECH','2020',6.7),
(25,'Delhi','BA','2021',6.8),
(26,'Noida','MA','2019',7.0)



-- stu1 (SID,Name,Email, age,score,C_ID)
-- course(CID,CName,start_date) 
-- stu1_bio(Stu_ID,city,degree,grad_year,cgpa)



create table employee(
emp_id varchar(5) not null,
emp_name varchar(20),
dt_of_join date,
emp_supv varchar(5),
primary key(emp_id) ,
foreign key(emp_supv) references employee(emp_id));


insert into employee values
(27863,'Ankit Sinha', '2018-06-13',null),
(27865,'Mridul Paliwal', '2019-08-14',27863),
(27867,'shweta Sharma', '2020-12-25',27865),
(27869,'Vinay Verma', '2019-03-20',27867),
(27871,'Pratyush Singh', '2019-05-20',27865),
(27873,'Ranveer Pratap', '2020-01-22',27863);




