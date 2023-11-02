REM   Script: Great Clips Customer Appointment Database Edited with Features and 2522
REM   2522

CREATE TABLE Customer (     
  Customer_Phone NUMBER(15) NOT NULL,     
  First_Name VARCHAR2(50) NOT NULL,     
  Last_Name VARCHAR2(50) NOT NULL,     
  Email_Address VARCHAR2(50),     
  Street_1 VARCHAR2(50),     
  Street_2 VARCHAR2(50),     
  City VARCHAR2(50),     
  State CHAR(10),     
  ZIP VARCHAR2(10) NOT NULL,   
  Appointment DATE,   
  CONSTRAINT customer_pk PRIMARY KEY (Customer_Phone)     
);

CREATE TABLE Salon (     
  Salon_Phone Number(15, 0) NOT NULL,     
  Customer_Phone NUMBER(15) NOT NULL,     
  Street_Address VARCHAR2(50),     
  City VARCHAR2(50),     
  Salon_State CHAR(10),     
  Zip_Code VARCHAR2(10) NOT NULL,     
  TIME_OPEN_AM NUMBER (24, 0),     
  TIME_CLOSED_PM NUMBER (24,0),     
  CONSTRAINT salon_pk PRIMARY KEY (Salon_Phone),     
  CONSTRAINT salon_fk FOREIGN KEY (Customer_Phone) REFERENCES Customer(Customer_Phone)     
);

CREATE TABLE Services (     
  Customer_Phone NUMBER(15) NOT NULL,     
  Hair_Type VARCHAR2(50) NOT NULL,     
  Cut_Type VARCHAR2(50) NOT NULL,     
  Add_Services VARCHAR2(100),     
  CONSTRAINT services_pk PRIMARY KEY (Hair_Type, Cut_Type),     
  CONSTRAINT services_fk FOREIGN KEY (Customer_Phone) REFERENCES Customer(Customer_Phone)     
);

INSERT INTO Customer Values (4352335444, 'Justin', 'Hamilton', 'justin@utah.edu' , '123 Utah Drive' , '144 Go Utah Way', 'SLC', 'UT', 84112, TO_DATE('2022/05/03', 'yyyy/mm/dd'));

INSERT INTO Customer Values (4358185000, 'James', 'Thomson', 'james@utah.edu' , '132 Utah Drive' , '141 Go Utah Way', 'SLC', 'UT', 84112, TO_DATE('2022/01/13', 'yyyy/mm/dd'));

INSERT INTO Customer Values (4358852522, 'Sarah', 'Smith', 'sarah@gmail.edu' , '181 Swoop Drive' , '144 Football Avenue', 'SLC', 'UT', 84112, TO_DATE('2022/04/18', 'yyyy/mm/dd'));

INSERT INTO Customer Values (8015974678, 'Jim', 'Jones', 'jim@yahoo.com' , '148 Swoop Drive' , '193 Football Avenue', 'SLC', 'UT', 84112, TO_DATE('2022/02/10', 'yyyy/mm/dd'));

INSERT INTO Customer Values (8017281111, 'Jeff', 'Jefferson', 'jeff@yahoo.com' , '192 Temple Avenue' , '764 Main Street', 'SLC', 'UT', 84112, TO_DATE('2022/03/29', 'yyyy/mm/dd'));

INSERT INTO Salon Values (8013594013, 4352335444, '532 E 400 S', 'SLC', 'UT', 84102, 9, 8);

INSERT INTO Salon Values (8015758580, 4358185000, '906 E 900 S', 'SLC', 'UT', 84105, 9, 8);

INSERT INTO Salon Values (8014867311, 4358852522, '2065 S 2300 E', 'SLC', 'UT', 84108, 8, 8);

INSERT INTO Salon Values (8014842208, 8015974678, '2120 S 700 E', 'SLC', 'UT', 84106, 11, 7);

INSERT INTO Salon Values (8014850903, 8017281111, '3292 S 1300 E Ste D', 'SLC', 'UT', 84106, 8, 8);

INSERT INTO Services Values (4352335444, 'Short', 'Cut', 'Beard Trim, Neck Trim');

INSERT INTO Services Values (4358185000, 'Long', 'Style', 'Beard Trim, Hair Shampooing');

INSERT INTO Services Values (4358852522, 'Long', 'Cut', 'Bang Trim, Hair Shampooing');

INSERT INTO Services Values (8015974678, 'Short', 'Style', 'Neck Trim, Hair Shampooing');

INSERT INTO Services Values (8017281111, 'Formal', 'Cut', 'Neck Trim, Bang Trim');

SELECT * FROM CUSTOMER;

SELECT * FROM SALON;

SELECT * FROM SERVICES;

-- Feature 1
SELECT DISTINCT Customer.Customer_Phone, First_Name, Last_Name, Salon_Phone, Street_Address, TIME_OPEN_AM, TIME_CLOSED_pM, Hair_Type, Cut_Type, Add_Services, Appointment     
From Customer     
Inner Join Salon ON Customer.Customer_Phone = Salon.Customer_Phone     
Inner Join Services ON Salon.Customer_Phone = Services.Customer_Phone;

-- Feature 2
UPDATE Salon SET TIME_CLOSED_PM = TIME_CLOSED_PM +1      
WHERE Street_Address = '2120 S 700 E';

-- Feature 2
Select * From Salon;

-- Feature 2
SELECT DISTINCT Customer.Customer_Phone, First_Name, Last_Name, Salon_Phone,      
Street_Address, TIME_OPEN_AM, TIME_CLOSED_pM, Hair_Type, Cut_Type, Add_Services, Appointment     
From Customer     
Inner Join Salon ON Customer.Customer_Phone = Salon.Customer_Phone     
Inner Join Services ON Salon.Customer_Phone = Services.Customer_Phone;

-- Feature 3
SELECT Salon_Phone, Street_Address, Add_Services     
From Salon     
NATURAL JOIN Services     
WHERE Add_Services Like '%Beard%';

