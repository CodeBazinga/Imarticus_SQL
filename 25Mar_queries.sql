

-- date and time functions
-- mathematical functions
-- Joins
-- Union, Union All

-- Date functions
select now();  -- returns current date and time
-- YYYY-MM-DD HH:MM:SS
select date(now()) as TodaysDate;
select year(now()), month(now()), day(now()), quarter(now());
select monthname(now())
select curdate(); -- returns current date
select year(curdate()), month(curdate()), day(curdate()), quarter(curdate());
select day('1999/10/23'), month('2019-12-31');
select month('25-03-2019') -- DD-MM-YYYY
select year('9999-12-31')


select year('2022/10/23 14:23:56') as date, month('2019-12-31');
select year('2019-10-08'), year('10-13-2010');
select dayname(now())
select dayname('2018-09-24')
select left(dayname('2022-03-25'),3)
select mid(dayname('2022-03-30'),1,3) -- mid('Monday',1,3)
select substr(dayname('2022-03-29'),1,3) -- substr('Tuesday',1,3)

select dayofweek('2022-03-20') -- Sun-1
select dayofweek('2022-03-21') -- Mon-2
select dayofweek('2022-03-22') -- Tue-3 
select dayofweek('2022-03-23') -- Wed-4
select dayofweek('2022-03-24') -- Thu-5
select dayofweek('2022-03-25') -- Fri-6
select dayofweek('2022-03-26') -- Sat-7

select weekday('2022-03-28')+1 as Wday; 
-- Mon-0,Tue 1, Wed-2, Thu-3,Fri-4,Sat-5,Sun-6


select dayofyear('2019-07-13')

-- Time Functions
-- Time format - HH:MM:SS
-- HH follows 24 hr clock (0-23)
-- MM(0-59), -- SS(0-59)
select hour('9:34:56')
select hour(now()), minute(now()) as Min, second(now())
select hour('16:45:22')
select minute('1999/10/23 14:23:56') as Min
select hour('1999-10-23 14:23:56') as Hr;
select second('1999/10/23 14:23:56') as Sec;

-- week - returns week number(0-52)

select week('2022-07-25 14:23:56') as Week; -- returns week number
select week('2022-01-01') as Week; -- returns week number
select week('2022-01-02') as Week; -- returns week number
select week('2022-12-31') as Week; -- returns week number

-- weekofyear - Returns week number of the year (1-52)
 
select weekofyear('2022-03-23') as Week_of_Year;
select weekofyear('2022-02-15');
select weekofyear('2022-01-01') as Week; -- returns week number
select weekofyear('2022-01-02') as Week; -- returns week number
select weekofyear('2022-01-03') as Week; -- returns week number
select weekofyear('2022-12-31') as Week; -- returns week number

select weekofyear('2022-12-25'), week('2022-12-25') 

-- Date Time Addition and Subtraction
-- select adddate(date,days_to_be_added)
select adddate('2012-10-05',12) -- addition of day
select adddate('2012-10-05',-15) -- subtraction of day
select adddate('2012-10-05',366) -- addition of day

select adddate('2012-10-05',interval 1 year) -- addition of year
select adddate('2012-10-05',interval -3 year) -- subtraction of year

select adddate('2012-10-05',interval 2 month) -- addition of month
select adddate('2012-10-05',interval -2 month) -- subtraction of month

select adddate('2012-10-05',interval -2 week) -- subtraction of week
select adddate('2012-10-05',interval 2 week) -- addition of week

select adddate('2012-10-05',interval 5 hour) -- addition of hr
select adddate('2012-10-05',interval -3 hour) -- subtraction of hr

select adddate('2012-10-05',interval 23 minute) -- addition of min
select adddate('2012-10-05',interval -45 minute) -- subtraction of min
select adddate('2012-10-05 01:23:45',interval -45 minute) -- subtraction of min

select adddate('2012-10-05',interval 34 second) -- addition of sec
select adddate('2012-10-05',interval -17 second) -- subtraction of sec

select adddate('2012-10-05','03-12-14') -- addition of day

-- error
select adddate('2012-10-05',interval 2 year,interval 2 month) 

-- timediff - Returns the time difference in HH:MM:SS format
-- It subtracts 2nd time value from the 1st time value

select timediff('08:25:23','6:56:12')
select timediff('14:25:23','18:56:12') 
select timediff('2022-03-12 08:25:23','2022-03-11 6:56:12') -- difference is returned in time
select timediff('2022-03-18 08:25:23','2022-03-05 6:56:12') -- difference is returned in time

-- datediff - Returns the date difference in days
-- It subtracts 2nd date value from the 1st date value
select datediff('2022-09-15','2022-09-12') -- difference in days
select datediff('2022-09-04','2022-09-12') -- difference in days


-- Date Format
-- Default format YYYY-MM-DD or YYYY/MM/DD
select date_format('2018-04-22','%m/%Y/%d')
select date_format('2018-04-22','%m-%y-%d')
select date_format('2018-04-22','%m-%y-%d - %M') -- %M - Full Month Name
select date_format('2018-04-22','Month: %M, Day: %d, Year: %Y') -- %M - Full Month Name
select date_format('2018-04-22','%m-%y-%d - %b') -- %b - Month Name in short
select date_format('2018-04-22','%m-%y-%d - %a') -- Weekday name in short
select date_format('2018-04-22','%m-%y-%d - %W') -- Weekday full name
select date_format('2018-04-23','%m-%y-%d - %w') -- Weekday number
select date_format('2018-04-23 16:45:34','%m-%y-%d - %p') -- %p -  AM/PM
select date_format('2018-04-23 6:45:34','%m-%y-%d %p') -- 
select date_format('2018-04-22 14:23:45','%m-%y-%d %H:%i:%s')
select date_format('2018-04-22','%M %Y %W %d')
select date_format('2018-04-22','%a %b %d-%Y')
select date_format('2018-04-22','%H:%i:%s')
select date_format('2018-04-22 17:43:19','%m/%Y/%d %H:%i:%s %p %b %a %w %W %M') as DTime

select date_format('2022-03-25','%m-%y-%Y-%d %p ')


-- What are different ways to merge two or more tables?
-- 1) Joins
-- 2) Union/ Union All 
-- 3) Using where clause
-- 4) Sub Query


-- where, group by, having, order by


-- Joins
-- stu1 (SID,Name,Email, age,score,C_ID)
-- course(CID,CName,start_date) 
use demo2

select * from stu1
select * from course

-- Types of Joins
-- 1) Inner Join
-- 2) Left Join
-- 3) Right Join
-- 4) Full Join or Full Outer Join
-- 5) Self Join


-- Inner join

-- No student has been enrolled for CID=224
-- No course has been alloted for SID=230 
-- Ex1
select s.sid,s.Name, s.email, s.score, c.cname,c.cid
from stu1 as s
inner join course as c
on s.C_ID = c.CID
-- 13,16,21,24,15,22,17,23,11,19,27,29,12,14,20,25,18,26,28

-- Ex2
select s.sid,s.Name, s.email, s.score, c.cname,c.CID
from stu1 s
inner join course c
on s.C_ID = c.CID

-- Ex3 - Inner Join without inner join keyword 
select s.sid,s.Name, s.email, s.score, c.cname,c.CID
from stu1 s, course c
where s.C_ID = c.CID

-- Ex4
select s.sid,s.Name, s.email, s.score, c.cname,c.CID
from stu1 s
join course c
on s.C_ID = c.CID


-- Ex4 - Inner join with where clause on c.cname
select s.sid,s.Name, s.age, s.score, c.cname
from stu1 s
inner join course c
on s.C_ID = c.CID
where c.cname in ('Data Science','ML','SQL')

select s.sid,s.Name, s.age, s.score, c.cname
from stu1 s
inner join course c
on s.C_ID = c.CID
where c.cname in ('Excel')


-- Ex5 - Inner join with where clause on age and score
select s.sid,s.Name, s.age, s.score, c.cname
from stu1 s
inner join course c
on s.C_ID = c.CID
where s.age >=24 or s.score>60


-- Ex 6 - Inner join with where clause on start date
-- select start_date from course
select s.sid,s.Name, s.score, c.cid, c.cname, c.start_date
from stu1 s
inner join course c
on s.C_ID = c.CID
where c.start_date between '2019-05-01' and '2019-10-30'


-- Ex7 - Inner join on start_date with where clause on start date
-- select start_date from course
select s.sid,s.Name, s.score, c.cid, c.cname, monthname(c.start_date) as StartMonth
from stu1 s
inner join course c
on s.C_ID = c.CID
where monthname(c.start_date) not in ('March','April','July','December') 

-- Ex 8 - Inner Join with group by 
select avg(s.score),min(s.score), c.cname
from stu1 s
inner join course c
on s.C_ID = c.CID
group by c.cname

-- Ex 8 - Inner Join with group by and having
select avg(s.score), c.cname
from stu1 s
inner join course c
on s.C_ID = c.CID
group by c.cname
having avg(s.score)>70

-- Ex9 - Inner Join with where clause, group by and having
select avg(s.score), c.cname
from stu1 s
inner join course c
on s.C_ID = c.CID
where quarter(c.start_date) in (2,4) 
group by c.cname
having avg(s.score)<80

-- Ex10 - Inner Join with where clause, group by, having and order by
select avg(s.score), c.cname
from stu1 s
inner join course c
on s.C_ID = c.CID
where quarter(c.start_date) in (2,4) 
group by c.cname
having avg(s.score)<81
order by c.cname desc


-- Left Join
select * from stu1 -- SID,Name,email,age,score,C_iD
select * from course -- CID,CNAme,Start_date

select s.Name,s.age,s.email,c.CID,c.cname
from stu1 s
left join course c
on s.C_ID = c.CID


-- Right Join
select * from stu1 -- SID,Name,email,age,score,C_iD
select * from course -- CID,CNAme,Start_date

select s.Name,s.age,s.email,c.CID,c.cname
from stu1 s
right join course c
on s.C_ID = c.CID

-- Full Outer Join

select s.Name,s.age,s.email,c.CID,c.cname
from stu1 s
left join course c
on s.C_ID = c.CID
union
select s.Name,s.age,s.email,c.CID,c.cname
from stu1 s
right join course c
on s.C_ID = c.CID
