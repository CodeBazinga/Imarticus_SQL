
create database practice;
use practice;

-- Comments
-- Students (SID, Name, Age)
-- Course (C_ID, CName,S_ID,Duration)
# welcome to sql


drop table Students

create table Students(
SID int not null primary key,
Name varchar(30) not null,
Age int
);

insert into Students values (10,'Harsh',23);
insert into Students (Name, Age, SID) values ('Amit',25,11);

insert into Students (Name, Age, SID)
values 
('Mohit',26,12),
('Shreya',21,13),
('Vidushi',27,14)


select * from Students;

create table Course(
C_ID int not null primary key,
CName varchar(50) not null,
S_ID int not null,
Duration date,
foreign key (S_ID) references Students(SID)
);

alter table Course change Duration Start_date date

describe Course
-- YYYY-MM-DD

insert into Course (C_ID,CName,S_ID,Start_date)
values 
(345,'SQL',10,'2022-03-22'),
(346,'Python', 11,'2022-03-28'),
(347,'Data Science',12,'2022-04-07'),
(348,'ML',13,'2022-04-20'),
(349,'Tableau',14,'2022-05-17')

-- update query
select * from students

update students set Age=22 where SID=12
update students set Age=25,Name='Kartik' where SID=14
update students set Age=30 where SID>11

-- delete query
delete from students where SID=11
delete from students where Name='Kartik' 

drop table t2

create table t1(
id int not null primary key,
name varchar(30),
city varchar(20)
);

insert into t1 (id,name,city) 
values
(12,'Ankit','Noida'),
(13,'Suresh','Delhi'),
(14,'Rohit','Mumbai')

select * from t1

delete from t1 where name='Rohit'

RENAME TABLE personal_info TO per_info;


select * from emp
-- E_ID,EName,city,D_ID,Join_date,Email,Salary,Exp
select E_ID,EName,Email,Salary from emp


-- Filter the records
-- where ccluse is used

-- Filter Name, City, Salary of all emp whose Salary>35000

-- Filtering operations1:  >, >=, <, <=, <>,=
select EName,city,Salary from emp where Salary>35000;
select EName,city,Salary from emp where Salary>=35000;
select EName,city,Salary, Exp, Email from emp where Exp<3;
select EName,city,Salary, Exp, Email from emp where Exp<=3;
select E_ID,EName,city,Salary, Join_Date from emp where Join_Date>'2019-01-01';
select EName,city,Salary, Email from emp where City='Delhi';
select EName,city,Salary, Email from emp where City<>'Delhi';

-- Filtering operations2: and, or, in,not in, between
-- E_ID,EName,city,D_ID,Join_date,Email,Salary,Exp
select E_ID, EName, city,Salary from emp where city='Mumbai' and Salary>30000;
select E_ID, EName, city,Salary from emp where city='Mumbai' or Salary>30000;
select E_ID, EName, city,Salary from emp where salary between 31000 and 35000;
select E_ID, EName, city,Exp from emp where Exp between 3 and 6;
select E_ID, EName, city,Exp from emp where Exp>=3 and Exp<=6;
select E_ID, EName, Join_Date,Exp from emp where Join_date between '2019-01-01' and '2021-12-31';
select Ename, Salary, Email, city from emp where city in ('Delhi','Mumbai','Noida');
select Ename, Salary, Email, city from emp where city not in ('Delhi','Mumbai','Noida');
select Ename, Salary, Email, city from emp where city in ('Delhi','Mumbai','Noida') and Salary>35000; 

-- Filtering operations3 - using wild cards - % , _
select * from emp
-- E_ID,EName,city,D_ID,Join_date,Email,Salary,Exp
select Ename, city, D_ID, email from emp where Ename like 'A%'
select Ename, city, D_ID, email from emp where Ename like 'a%'
select Ename, city, D_ID, email from emp where Ename like '%a'
select Ename, city, D_ID, email from emp where city like '____i'
select Ename, city, D_ID, email from emp where city like '%i'
select Ename, city, D_ID, email from emp where city like '%n%'
select Ename, city, D_ID, email from emp where Ename like '%sh%'


-- distinct - removes duplicacy, returns unique values
select * from emp
select distinct city from emp
select distinct(city) from emp
select distinct(city) from emp where salary>35000
select distinct(city),Ename from emp


-- Aggregate Functions - min(), max(), count(), avg()

-- count() - count number of records
select count(*) from emp
select count(*) from emp where Salary>35000
select count(D_ID) from emp where Join_Date>'2020-01-01'
select * from emp where Join_Date>'2020-01-01'
select city, count(*) from emp

-- min(), max(), avg(), sum()
select min(Salary), max(Salary), avg(Salary) from emp
select min(Exp), max(Exp), avg(Exp) from emp
select * from emp
select sum(salary) from emp
select sum(salary), max(salary) from emp


-- Alias - Renaming a column
select max(Salary) as MaxSal from emp
select max(Salary) as MaxSal, min(Salary) as MinSal from emp
select sum(Salary) as SumSal, avg(Salary) as AvgSal from emp


-- Sorting records
select EName, city, D_ID, email, salary from emp order by salary
select EName, city, D_ID, email, salary from emp order by salary asc
select EName, city, D_ID, email, salary from emp order by salary desc
select EName, city, D_ID, email, salary from emp order by city
select EName, city, D_ID, email, salary from emp order by city desc
select EName, city, salary from emp order by city asc, salary desc 
select EName, salary,city from emp order by salary desc, city asc 