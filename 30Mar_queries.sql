# create database
create database Mar30

drop database Mar30
use Mar30
-- query to create table
create table stu(
SID int primary key,
FName varchar(20) not null,
LName varchar(15),
age int,
city varchar(20),
course varchar(15) not null,
join_date date not null
)

drop table stu
describe stu
select * from stu


-- insert data into stu table
-- Date format - YYYY-MM-DD, YYYY/MM/DD
insert into stu values
(12,'Ankit','Sharma',22,'Delhi','Data Science','2022-03-30'),
(13,'Shreya','Verma',21,'Noida','SQL','2022-03-29'),
(14,'Mahesh',null,24,'Gurugram','ML','2022-03-28'),
(15,'Ujjwal','Singh',null,'Noida','DL','2022-03-27'),
(16,'Pankaj','Pandey',22,null,'SQL','2022-03-30'),
(17,'Manisha','Dubey',25,'Mumbai','DL','2022-03-29'),
(18,'Vipin','Sinha',24,'Delhi','SQL','2022-03-28'),
(19,'Fatima',null,23,'Noida','Data Science','2022-03-30')

select * from stu
-- SID,FName, LName, Age, city, Course, Join_date


select SID,FName, Age, Join_Date, Course from stu
select Age, Join_Date, SID,FName, LName,Age, Join_Date, Course from stu

-- Filtering Operations
select SID, FName, Age, Course from stu where age>22
select SID, FName, Age, Course from stu where age<=22
select SID, FName, Age, Course from stu where age<>22
select SID, FName, Age, Course from stu where Course in ('SQL','ML')
select SID, FirstName, Age, Course from stu where Course not in ('SQL','ML')
select SID, FName, Age, Course from stu where age>=22 or Course='DL'
select SID, FName, Age, Course from stu where age>=22 and Course='DL'
select SID, FName, Age, Course from stu where age between 22 and 24
select SID, FName, Join_date, Course from stu where join_date<='2022-03-29'

-- wildcards : %, _
select * from stu 
select SID, FName, Join_date, Course from stu where FName like 'M%'
select SID, FName, Join_date, Course from stu where FName like '%a'
select SID, FName, Join_date, Course,city from stu where city like '____i'
select SID, FName, Join_date, Course,city from stu where city like 'N%a'

describe stu
-- alter queries - change table structure
alter table stu modify FName varchar(30)
alter table stu change FName FirstName varchar(25)
alter table stu drop city
alter table stu add city varchar(20) default 'Delhi'
alter table stu add pin int 

select * from stu

-- sorting
select SID, FirstName, Age, Course from stu order by age  -- ascending order
select SID, FirstName, Age, Course,Join_date from stu order by join_date asc -- ascending order
select SID, FirstName, Age, Course from stu order by FirstName desc

-- update
select * from stu
update stu set course='SQL' where SID=15
update stu set join_date='2022-03-25',LName='Singh' where SID=19
update stu set city='Mumbai' where course='SQL'

-- delete
select * from stu
delete from stu where SID=19



-- aggregate functions - avg(),sum(),min(),max(),count()
select avg(age), sum(age),min(age), max(age),count(age) from stu

-- Find total records(rows) in the table
select count(*) from stu
select count(SID) from stu where course='SQL'
select sum(*) from stu

-- distinct
select * from stu
select distinct course from stu
select count(distinct course) from stu 

-- alias - renaming a column, table
select avg(age) as AvgAge, sum(age) as SumAge,min(age) as MinAge,
max(age) as MaxAge,count(age) as Count_Rows from stu

select * from stu


 


