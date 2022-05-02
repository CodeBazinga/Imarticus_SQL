
create database pro2

use pro2
select * from customer 
-- C_ID,M_ID,C_Name,C_Email_Id, C_Type, C_Addr, C_Cont_No

select * from employee_details
-- E_ID,E_name,E_Designation,E_addr, E_branch,E_Cont_No

select * from employee_manages_shipment
-- Employee_E_Id, Shipment_Sh_Id, Status_Id

select * from membership
-- M_Id,Start_date,End_date

select * from payment_details
-- Payment_id, C_Id,Sh_ID, Amount, Payment_Status, payment_mode,payment_date

select * from shipment_details
-- sh_id, c_id, sh_content, ser_type,sh_weight, sh_charges, sr_addr, ds_addr

select * from status
-- sh_id,current_status,sent_date,delivery_date


-- Q1) Select count of customers based on customer type
select  C_type,count(C_Id) from customer
group by C_type 
order by count(C_Id)

-- Q2) Select branch wise count of emp in descending order of count
select e_branch,count(E_id) from employee_details
group by e_branch
order by count(E_id) desc

-- Q3) Select designation wise count of emp ID in descending order of count
select e_designation,count(E_id) from employee_details
group by e_designation
order by count(E_id) desc

-- Q4) Select Count of customer based on payment status in descending order of count
select payment_status,count(C_id) from payment_details
group by payment_status
order by count(C_id) desc

-- Q5) Select Count of customer based on payment mode in descending order of count
select payment_mode,count(C_id) from payment_details
group by payment_mode
order by count(C_id) desc

-- Q6) Select Count of customer based on shipment_domain in descending order of count
select sh_domain,count(C_id) from shipment_details
group by sh_domain
order by count(C_id) desc

-- Q7) Select Count of customer based on ser_type in descending order of count
select ser_type,count(C_id) from shipment_details
group by ser_type
order by count(C_id) desc

-- Q8) Select Count of customer based on ser_type in descending order of count
select current_status,count(sh_id) from status
group by current_status
order by count(sh_id) desc

-- Q9) Find C_ID,M_ID and tenure for those customers whose membership tenure is over 10 years.
-- Sort them in decreasing order of Tenure
select c.C_ID,c.M_ID,m.start_date,m.end_date,
floor(datediff(m.end_date,m.start_date)/365) as Tenure
from customer c 
join membership m on c.M_ID = m.M_ID
where floor(datediff(m.end_date,m.start_date)/365) > 10
order by Tenure desc

-- Q10) Find average payment amount based on Customer Type where payment mode as COD
select c.C_type,avg(pd.amount)
from customer c 
join payment_details pd on c.C_ID = pd.C_ID
where pd.payment_mode = 'COD'
group by c.C_Type


-- Q11) Find avg payment amount based on payment mode where payment date is not null
select payment_mode, avg(amount) 
from payment_details
where payment_date is not null
group by payment_mode

describe payment_details


-- Q12) Find sum of shipment charges based on payment_mode where service type is 
-- not regular
select pd.payment_mode,sum(sd.sh_charges)
from payment_details pd
join shipment_details sd on pd.Sh_id = sd.sh_id
where  sd.ser_type<>'Regular'
group by pd.payment_mode

-- Q13) Find avg shipment weight based on payment_status where shipment domain 
-- does not start with H
select pd.payment_status,avg(sd.sh_weight) as AvgShipmentWt
from payment_details pd
join shipment_details sd on pd.Sh_id = sd.sh_id
where  sd.sh_content not like 'H%'
group by pd.payment_status

-- Q14) Find mean of payment amount based on shipping domain where service type 
-- is Express and payment status is paid

select sd.sh_domain,avg(pd.amount) as AvgPaymentAmt
from payment_details pd
join shipment_details sd on pd.Sh_id = sd.sh_id
where  sd.ser_type='Express' and pd.payment_status='PAID'
group by sd.sh_domain

-- Q15) Find avg of shipment weight and shipment charges based on shipment status
select s.current_status, avg(sd.sh_weight) as ShipWeight,
avg(sd.sh_charges) as ShipCharges
from shipment_details sd
join status s on sd.Sh_id = s.sh_id
group by s.current_status

-- Q16) Display Sh_ID, shipment status,shipment_weight and delivery date where 
-- shipment weight is over 500 and payment is done is Quarter 3

select s.sh_id,s.current_status, s.delivery_date,sd.sh_Weight,quarter(pd.payment_date)
from status s
join shipment_details sd
on s.Sh_id = sd.sh_id
join payment_details pd
on pd.Sh_id = s.sh_id
where quarter(pd.payment_date)=3 and sd.sh_weight>500


-- Q17) Display Sh_ID, shipment charges and shipment_weight and sent date where 
-- current_status is Not delivered and payment mode is Card_Payment
select sd.sh_id,sd.sh_charges, sd.sh_Weight, s.sent_date
from shipment_details sd 
join status s
on sd.sh_id = s.SH_id
join payment_details pd
on pd.Sh_id = s.sh_id
where pd.payment_mode='Card Payment' and s.current_status='Not delivered'

-- Q18) Select all records from shipment_details where shipping charges is greater than 
-- avg shipping charges for all the customers.
select * from shipment_details
where sh_charges > (select avg(sh_charges) from shipment_details)

-- Q19) Select average shipping weight and sum of shipping charges based on
-- shipping domain 

select sh_domain, avg(sh_weight) as AvgWeight, sum(sh_charges) as SumSh_Charges
from shipment_details
group by sh_domain

-- Q20) Find customer names, their email, contact,c_type and payment amount where C_type 
-- is either Wholesale or Retail
select c.C_Name, c.C_email_id, c.C_cont_no,c.c_type, pd.amount
from customer c
join payment_details pd
on c.c_id = pd.c_id
where c.c_type in ('Wholesale','Retail')


-- Q21) Find Emp_Id,Emp_Name, C_Id, shipping charges  the employees are managing customers 
-- whose shipping charges are over 1000

select ed.E_ID, ed.E_Name,sd.C_ID, sd.sh_charges
from employee_details ed
join employee_manages_shipment ems
on ed.E_id = ems.Employee_E_Id
join shipment_details sd
on sd.sh_id = ems.Shipment_Sh_Id
where sd.sh_charges>1000

-- Q22) Find Emp_deisgnation wise the count of Customers that the employees of different
-- designation are handling in decreasing order of customer count

select ed.e_designation, count(sd.C_ID) as Count
from employee_details ed
join employee_manages_shipment ems
on ed.E_id = ems.Employee_E_Id
join shipment_details sd
on sd.sh_id = ems.Shipment_Sh_Id
group by ed.e_designation
order by Count desc

-- Q23) Find Emp_deisgnation wise the count of Customers that the employees of different
-- designation are handling in decreasing order of customer count where the employess are
-- handling customers whose payment amount is greater than 
-- avg payment amount by all other coustomers
 
select ed.e_designation, count(sd.C_ID) as Count
from employee_details ed
join employee_manages_shipment ems
on ed.E_id = ems.Employee_E_Id
join shipment_details sd
on sd.sh_id = ems.Shipment_Sh_Id
join payment_details pd
on pd.c_id = sd.c_id
where pd.amount > (select avg(amount) from payment_details)
group by ed.e_designation
order by Count desc

-- select * from customer
-- select * from employee_details
select distinct E_branch from employee_details
-- select * from payment_details
-- select * from shipment_details
select distinct(sh_content) from shipment_details
-- select * from employee_manages_shipment
-- select * from status

-- Q24) Find Employee branch and employee designation wise count of employee designation
-- who have managed customers whose shipping weight < 500. 
-- Display result in descending order of count

select ed.e_branch, ed.e_designation, count(ed.e_designation) as Count
from employee_details ed
join employee_manages_shipment ems
on ed.E_id = ems.Employee_E_Id
join shipment_details sd
on sd.sh_id = ems.Shipment_Sh_Id
where sd.sh_weight <500 
group by ed.e_branch,e_designation
order by Count desc

-- Q25) Find shipping content wise count of Employees for the employees who have managed
-- customers where shipping domain is International and shipping charges are greater 
-- than average shiiping charges for all the cutomers.
-- Display result in descending order of count

select sd.sh_content,count(ed.e_id) as Count
from shipment_details sd
join employee_manages_shipment ems
on sd.sh_id = ems.shipment_sh_Id
join employee_details ed
on ems.employee_e_id = ed.E_id
where sd.sh_charges > (select avg(sh_charges) from shipment_details)
and sh_domain = 'International'
group by sd.sh_content
order by Count desc

