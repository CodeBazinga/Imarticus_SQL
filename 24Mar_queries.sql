

-- group by and having
-- Ex2 solutions
-- constraints
-- string functions

use practice

CREATE TABLE my_sales (
month varchar(15),
prod_name  VARCHAR(15),
sales INT );


INSERT INTO my_sales VALUES('Jan', 'Fruits', 45000),
				('Jan', 'Vegetables', 67000),
				('Jan', 'Dairy', 55000),
				('Feb', 'Fruits', 42000),
				('Feb', 'Vegetables', 32000),
				('Feb', 'Dairy', 52000),
				('March', 'Fruits', 61000),
				('March', 'Vegetables', 43000),
				('March', 'Dairy', 92000);
                
                
select count(*) from my_sales


-- group by
SELECT prod_name, SUM(sales) FROM my_sales GROUP BY prod_name;
SELECT month, SUM(sales) FROM my_sales GROUP BY month;
SELECT month, SUM(sales) FROM my_sales where month='Jan' 
GROUP BY month;
SELECT prod_name, MIN(sales) FROM my_sales GROUP BY prod_name;
SELECT month, MIN(sales) FROM my_sales GROUP BY month;
SELECT month,prod_name, MIN(sales) FROM my_sales 
GROUP BY month,prod_name;

SELECT prod_name, MAX(sales) as MaxSales 
FROM my_sales GROUP BY prod_name
order by prod_name


Select prod_name, sum(sales) From my_sales group by sum(sales);  -- Error


select * from sp

select gender, sum(math_sc) from sp group by gender

select race_eth, avg(reading_sc),max(reading_sc) 
from sp group by race_eth

select parental_edu, min(writing_sc) from sp group by parental_edu

select parental_edu, count(writing_sc) from sp 
group by parental_edu

select distinct race_eth from sp

select parental_edu, max(writing_sc) 
from sp where race_eth='group A'
group by parental_edu

select race_eth, max(math_sc) 
from sp where gender='female'
group by race_eth

select distinct parental_edu from sp

select parental_edu,gender, min(math_sc) from sp 
where gender='female'
group by parental_edu, gender
order by parental_edu

select parental_edu,gender, min(math_sc) as MinMathSc 
from sp 
where gender='male'
group by parental_edu, gender
order by MinMathSc asc



select race_eth, sum(reading_sc)
from sp
group by race_eth

select distinct lunch from sp
-- standard, free/reduced
select distinct test_course from sp
-- none,completed


-- having clause
select race_eth, avg(reading_sc) from sp group by race_eth
having avg(reading_sc)>70

select race_eth, avg(reading_sc) from sp 
where gender='female' 
group by race_eth
having avg(reading_sc)>70

select parental_edu, min(writing_sc),sum(writing_sc) 
from sp 
group by parental_edu

select parental_edu, min(writing_sc),sum(writing_sc) 
from sp 
group by parental_edu
having sum(writing_sc)>10000

select parental_edu, min(writing_sc) 
from sp 
group by parental_edu
having sum(writing_sc)>10000



-- constraints 
-- not null, primary key, foreign key, unique, default, check
drop table dummy2

create table dummy2(
ID int not null primary key auto_increment,
name varchar(20) not null,
age int,
adhar int unique,
city varchar(20) default 'Delhi',
check (age>=18)
);

insert into dummy2 (name,age,adhar) 
values 
('Amit',20,1234),
('Vikas',19,1235);

select * from dummy2
insert into dummy2 (name,age,adhar) values ('Mohit',14,2345)
insert into dummy2 (name,age,adhar,city) values ('Anuj',23,5662,'Mumbai')
insert into dummy2 (name,age,adhar) values ('Arun',25,5662)



-- string functions - LCase, UCase, Length, Mid, concat, 
select LCase('NASA');
select lower('HellO') as Lowercase;
select UCase('india') as Country;
select upper('india') as Country;

use demo2
select * from emp
select * from customers
select UCase(city) from emp;
select Length('HEllo');
select concat(FName," *** ",LName) as Full_Name from customers;
select concat("Mr.",FName," ",LName) as Full_Name from customers;
-- trim - removes leading or trailing whitespace from string
select trim(' Welcome to SQL '), length(trim(' Welcome to SQL '));
select ltrim(' Welcome to SQL '), length(ltrim(' Welcome to SQL '));
select rtrim(' Welcome to SQL '), length(rtrim(' Welcome to SQL '));
select reverse('Welcome to SQL')

select format(250500.5634, 2);
select format(250500.5634, 3);
select format(25032450056.34, 3);

-- String method with multiple arguments

-- 1) insert (str1,pos,no,str2)
-- str1 - str to be modified
-- pos - index where str2 will be insert into str1
-- no - No of chars to replace
-- str2 - str to be inserted into str1
select insert("welcome to SQL", 1, 7, "Python"); 
select insert("welcome to India", 1, 5, "Python"); 
select insert("welcome to India", 1, 3, "Python"); 

-- 2) replace(str1,str2,str3)
-- str1- string in which replacement will happen
-- str2 - a substring of str1 which will be replaced
-- str3 - The string with which str2 will be replaced with in str1
-- if str2 is not a subtring of str1, str1 is returned as the result
-- replacement happens at all occurences of the str2 in str1
select replace("Welcome to SQL", "SQL", "Python");
select replace("Covid cases are rising", "rising", "falling");
select replace("Welcome to SQL", "Java", "Python");
select replace("Welcome to the world SQL", "r", "domain");
select replace("Welcome to the world SQL", "o", "**");

-- 3) mid(str,start,len)
-- It is used to extract a substring from a string (starting at any position).
-- str - The str to extract from
-- start - Starting index, can be +ve or -ve. 
-- Index starts from 1(towards +ve) from left to right
-- Index starts from -1(towards -ve) from left to right
-- len - No of chars to extract (in left to right direction)
select mid("Startups in India",4,7);
select mid("Startups in India",1,5);
select mid("Startups in India",-5,5);
select mid("Startups in India",-2,5);
select mid('PGA01-23224',1,5) as Course, mid('PGA01-23224',7,12) as Batch;

-- 4) repeat(str,n)
-- It repeats a string n number of times 
select repeat("HEllo ",5)

-- 5) Lpad(str,len,lpad_str)
-- str - str which will be padded
-- len - len of resultant str after padding
-- lpad_str - the str to left_pad str
select lpad('5264', 7,'AI-')
select lpad('5264', 10,'AI-')
select lpad('5264', 8,'AI-')

-- 6) Rpad(str,len,rpad_str)
-- str - str which will be padded
-- len - len of resultant str agter padding
-- lpad_str - the str to right_pad str
select rpad('5264', 7,'-AI')
select rpad('5264', 10,'-AI')
select rpad('5264', 8,'-AI')

-- 7) position(substr IN str)
-- It returns the position of the first occurrence of a substring in a string
-- substr - The substr to be searched on str
-- str - The str that will be searched

select position("7" IN "Hello 2378234") AS MatchPosition; 
select position("7" IN "Hello 23782734") AS MatchPosition;
select position("llo" IN "Hello 23782734") AS MatchPosition; 

-- 8) Left(str,n)
-- Extract n chars from left of the str
select left("Welcome to SQL",5)

-- 9) Right(str,n)
-- Extract n chars from right of the str
select right("Welcome to SQL",5)


