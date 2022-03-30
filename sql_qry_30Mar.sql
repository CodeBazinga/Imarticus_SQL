

create table Transact
(TID int primary key,
TMode varchar(10) not null,
Amount int not null,
TSuccess bool
-- Redeem_Rearwds bool
)

insert into Transact values
(78965, 'NB',5670,1),
(78966, 'UPI',8440,1),
(78967, 'CC',9730,1),
(78968, 'UPI',3460,0),
(78969, 'NB',5450,1),
(78970, 'NB',3640,1),
(78971, 'DC',5670,0),
(78972, 'DC',6344,1),
(78973, 'DC',4535,0),
(78974, 'CD',7300,1),
(78975, 'UPI',4535,1),
(78976, 'CC',12300,1),
(78977, 'UPI',7300,null),
(78978, 'UPI',4535,null),
(78979, 'NB',12300,1),
(78980, 'DC',6700,0),
(78981, 'DC',5200,1)

create table Flight_details(
FNo varchar(10) primary key,
Pil_Name varchar(30) not null,
JDate date not null,
Depart_time time not null,
Arr_Time time not null,
Source_City varchar(30) not null,
Dest_City varchar(30) not null,
Crew_members int
)

insert into Flight_Details values
('AI-745','Siddharth Wadhwa','2022-04-15','09:45:00','11:30:00','Delhi','Kolkata',5),
('AI-746','Aniruddh Sinha','2022-04-16','10:15:00','11:45:00','Delhi','Mumbai',8),
('AI-747','Siddharth Wadhwa','2022-04-17','13:30:00','15:30:00','Delhi','Bangalore',7),
('AI-748','Vishal Kambley','2022-04-16','15:45:00','17:30:00','Delhi','Hyderabad',6),
('AI-749','Anusha Raina','2022-04-19','08:30:00','10:30:00','Mumbai','Chennai',null),
('AI-750','Anusha Raina','2022-04-22','18:00:00','20:45:00','Bangalore','Delhi',7),
('IN-545','Ritesh Singhania','2022-04-10','10:45:00','12:30:00','Kolkata','Delhi',6),
('IN-547','Aditya Gaur','2022-04-17','20:15:00','22:30:00','Mumbai','Ahemdabad',null),
('IN-548','Ankush Agarwal','2022-04-11','11:30:00','14:45:00','Bangalore','Lucknow',8),
('IN-546','Aditya Gaur','2022-04-15','15:30:00','18.45:00','Bangalore','Delhi',5),
('IN-549','Pawan Gupta','2022-04-22','17:15:00','18:45:00','Chennai','Bangalore',4),
('SJ-324','Jacob Shaw','2022-04-20','10:30:00','13:45:00','Lucknow','Bangalore',null),
('SJ-325','Vincent Spencer','2022-04-21','09:45:00','11:30:00','Hyderabad','Mumbai',8),
('SJ-326','Clement Alba','2022-04-22','19:30:00','21:30:00','Kolkata','Delhi',6),
('SJ-327','Vincent Spencer','2022-04-20','09:45:00','11:30:00','Mumbai','Kolkata',7),
('SJ-328','Robert Diaz','2022-04-17','14:45:00','17:15:00','Kolkata','Bangalore',5),
('SJ-329','Harvey Becker','2022-04-16','23:15:00','03:00:00','Chennai','Kolkata',null),
('SJ-330','Vincent Spencer','2022-04-15','23:30:00','01:45:00','Bangalore','Hyderabad',6),

-- Aditya Gaur - 15(Banlor-DEl), 17(Mum-Ahem) => 16(Del->Mum)

 
create table Pass_Details(
PID int primary key,
PName varchar(30) not null,
Booking_Date date not null,
Tr_ID int not null,
Age int,
F_no varchar(10) not null,
F_Rewards int not null default 0,
foreign key (F_No) references flight_details(FNo),
foreign key (Tr_ID) references Transact(TID)
)

-- F_No( 'AI-745' - 'AI-750','IN-545','IN-549','SJ-324','SJ-320')
-- Tr_ID(78965-78981)
-- Age (18-65)

-- F_No( 'AI-745' - 'AI-750','IN-545','IN-549','SJ-324','SJ-330')
-- Tr_ID(78965-78981)
-- Age (18-65)
-- PName ('Ankit Srivastava')
-- 25-30 records
