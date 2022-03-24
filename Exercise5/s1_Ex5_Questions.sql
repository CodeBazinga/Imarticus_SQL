

-- Use the following insert queries

-- INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
-- INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
-- INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
-- INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
-- INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
--  
--  INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
--  INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
--  INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
--  INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
--  INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
--  INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
--  INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
--  INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
--  INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
--  INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
--  INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);

-- Q1) Create table warehouses as per schema depicted
-- Q2) Create table boxes as per schema depicted
-- Q3) Insert records into the table warehouses
-- Q4) Insert records into the table boxes
-- Q5) Display location and capacity from warehouses
-- Q6) Select Code, location and capacity where location starts 
--     with 'C' from warehouses table
-- Q7) display distinct location from warehouses
-- Q8) display contents and value from boxes where value is 
--     between 150 and 200
-- Q9) Display sum of value based on contents
-- Q10) Display avg capacity based on location from warehouses
-- Q11) Display max value based on Warehouse code in ascending
--      order of warehouse code
-- Q12) Display min value based on contents in descending order
--      of contents from boxes table when the box code is 
--      either 'OMN7','8JN6' or '4RT3' 
-- Q13) Select the warehouse code and the average value of the boxes
--      in each warehouse.
-- Q14) Display the warehouse codes, along with the number of boxes 
--      in each warehouse from boxes table
