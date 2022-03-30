
create table Transact
(TID int primary key,
TMode varchar(10) not null,
Amount int not null,
TSuccess bool
-- Redeem_Rearwds bool
)

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

-- F_No( 'AI-745' - 'AI-750','IN-545','IN-549','SJ-324','SJ-330')
-- Tr_ID(78965-78981)
-- Age (18-65)
-- PName ('Ankit Srivastava')
-- 25-30 records
