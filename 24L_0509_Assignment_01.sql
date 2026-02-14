-- 24L-0509 

CREATE database NHRI_MANAGEMENT 

use  NHRI_MANAGEMENT 

CREATE TABLE PATIENTS( 
PatientID varchar(6) PRIMARY KEY NOT NULL, -- Patient ID 
-- First Name and Last Name 
FirstName varchar(30), 
LastName varchar(30), 
--Full residential address 
Address nvarchar(200), 
-- Mandatory Date of Birth 
DateofBirth date NOT NULL, 
-- Single character restriced to M or F 
Gender char(1) CHECK (Gender IN ('M','F')), 
--Unique phone number up to 15 characters 
PhoneNo nvarchar(15) UNIQUE,
--Optional blood type restricted to valid groups 
BloodType varchar(3) CHECK (BloodType IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'))
)


CREATE TABLE DOCTORS( 
DoctorID int primary key, -- Primary Key implies unique and not null 
FirstName varchar(25) NOT NULL, 
LastName varchar(25) NOT NULL, 
Specialization Varchar(50) NOT NULL, 
HireDate date NOT NULL, 
DateofBirth DATE NOT NULL, 
CONSTRAINT chk_Age CHECK (DateofBirth < HireDate) 
) 


CREATE TABLE DEPARTMENTS( 
DepartmentID int PRIMARY KEY, 
DepartmentName varchar(50), 
PhoneNumber nvarchar(15) UNIQUE, 
HeadofDepartment varchar(50) 
) 

CREATE TABLE PROCEDURES(
	ProcedureID varchar(6) PRIMARY KEY, 
	ProcedureType varchar(20) NOT NULL  CHECK (ProcedureType IN ('Surgery', 'Consultation', 'Therapy', 'Diagnostic')),
	ProcedureName varchar(100) NOT NULL , 
	Cost DECIMAL(10,2) NOT NULL,
	DepartmentID INT, 

	--Adding the Foreign Key Constraint Here 
	CONSTRAINT fk_department 
		FOREIGN KEY(DepartmentID)
		REFERENCES DEPARTMENTS(DepartmentID) 

	) 

	CREATE TABLE APPOINTMENTS( 
		AppointmentID INT PRIMARY KEY, 
		PatientID varchar(6) NOT NULL, 
		DoctorID INT NOT NULL, 
		ProcedureID VARCHAR(6) NOT NULL, 
		AppointmentDate DATE NOT NULL, 
		Status VARCHAR(15) DEFAULT 'Scheduled', 

		-- Constraint for checking the Status 
		CONSTRAINT chk_status 
			CHECK (Status IN ('Scheduled', 'Completed', 'Cancelled')),

		-- Adding the Foreign Keys with reference to all the other tables outside 
		CONSTRAINT fk_patient FOREIGN KEY (PatientID)   -- Foreign Key for the for the patient 
			REFERENCES PATIENTS(PatientID), 

		CONSTRAINT fk_doctor FOREIGN KEY (DoctorID)     -- Foreign Key for the doctor 
			REFERENCES DOCTORS(DoctorID),
		
		CONSTRAINT fk_procedures FOREIGN KEY (ProcedureID) -- Foreign key for the procedures 
			REFERENCES PROCEDURES(ProcedureID)
		) 

-- Inserting 5 sample records into each table. 
INSERT INTO PATIENTS (PatientID, FirstName, LastName, Address, DateofBirth, Gender, PhoneNo, BloodType) VALUES
('P001', 'Ahmad', 'Khan', '123 Street, Lahore', '1990-05-15', 'M', '03001234567', 'O+'),
('P002', 'Sara', 'Ahmed', '45-B Model Town, Karachi', '1985-11-20', 'F', '03219876543', 'A-'),
('P003', 'Zain', 'Malik', 'Sector F-7, Islamabad', '2000-01-10', 'M', '03335554443', 'B+'),
('P004', 'Maria', 'Bibie', 'G-Block, Faisalabad', '1995-07-25', 'F', '03124445556', 'AB+'),
('P005', 'Omar', 'Farooq', 'Saddar, Rawalpindi', '1982-03-30', 'M', '03451112223', 'O-')

INSERT INTO DEPARTMENTS (DepartmentID, DepartmentName, PhoneNumber, HeadofDepartment) VALUES
(10, 'Cardiology', '042-3555001', 'Dr. Saleem'),
(20, 'Orthopedics', '042-3555002', 'Dr. Fatima'),
(30, 'General Medicine', '042-3555003', 'Dr. Hassan'),
(40, 'Radiology', '042-3555004', 'Dr. Amna'),
(50, 'Pediatrics', '042-3555005', 'Dr. Usman');

INSERT INTO DOCTORS (DoctorID, FirstName, LastName, Specialization, HireDate, DateofBirth) VALUES
(101, 'Haris', 'Rauf', 'Cardiologist', '2020-01-01', '1985-06-12'),
(102, 'Sana', 'Javed', 'Surgeon', '2018-05-20', '1980-02-14'),
(103, 'Bilal', 'Aslam', 'General Physician', '2021-09-15', '1992-12-01'),
(104, 'Iqra', 'Aziz', 'Radiologist', '2019-11-10', '1988-08-08'),
(105, 'Hamza', 'Ali', 'Therapist', '2022-03-01', '1994-04-25');

INSERT INTO PROCEDURES (ProcedureID, ProcedureType, ProcedureName, Cost, DepartmentID) VALUES
('PRC001', 'Surgery', 'Heart Bypass', 500000.00, 10),
('PRC002', 'Diagnostic', 'MRI Scan', 15000.00, 40),
('PRC003', 'Consultation', 'Routine Checkup', 2000.00, 30),
('PRC004', 'Therapy', 'Physical Rehab', 5000.00, 20),
('PRC005', 'Surgery', 'Knee Replacement', 350000.00, 20);

INSERT INTO APPOINTMENTS (AppointmentID, PatientID, DoctorID, ProcedureID, AppointmentDate, Status) VALUES
(1001, 'P001', 101, 'PRC001', '2026-02-10', 'Scheduled'),
(1002, 'P002', 102, 'PRC005', '2026-02-12', 'Completed'),
(1003, 'P003', 103, 'PRC003', '2026-02-15', 'Cancelled'),
(1004, 'P004', 104, 'PRC002', '2026-02-18', 'Scheduled'),
(1005, 'P005', 105, 'PRC004', '2026-02-20', 'Scheduled');


-- Adding a new column of Email 
ALTER TABLE PATIENTS add Email varchar(50) 

-- Changing the Lenght of FirstName in the Doctors table to 15 characters 
ALTER TABLE DOCTORS 
ALTER COLUMN FirstName varchar(15) 

-- Drop the Head of Department Column 
ALTER TABLE DEPARTMENTS 
DROP COLUMN HeadofDepartment 

DROP TABLE APPOINTMENTS

----- IMPLEMENTATION OF QUESTION 2 FROM HERE OWNWARDS 

create database library 

use library 

CREATE TABLE Book( 
bookId int primary key, 
title varchar(15) not null, 
authorId int not null 
) 

CREATE TABLE Author(
	authorId int primary key, 
	name varchar(20) not null, 
	countryId int
	) 


CREATE TABLE Country(
	countryId int primary key, 
	countryName varchar(20) 
	) 

CREATE TABLE Borrowing(
	borrowingId int primary key, 
	bookId int not null
	) 

-- Based on this we are now applying the referential integrity Rules Here 
-- Rule 01 - If a book is borrowed then it cannot be deleted 
ALTER TABLE Borrowing 
ADD CONSTRAINT fk_borrowing_key 
FOREIGN KEY (bookId) REFERENCES Book(bookID) 
ON DELETE NO ACTION 

-- RULE 02 - IF AN AUTHOR IS UPDATED THE CHANGE IS REFLECTED IN ALL ASSOCIATED BOOKS
ALTER TABLE Book 
ADD CONSTRAINT fk_book_author 
FOREIGN KEY (authorId) REFERENCES Author(authorId) 
ON UPDATE CASCADE 

-- Rule 03 - If a Country is deleted, set author countryId to NULL 
ALTER TABLE Author 
ADD CONSTRAINT fk_author_country 
FOREIGN KEY (countryId) REFERENCES Country(countryId) 
ON DELETE SET NULL 



-- Question 3 -- Implementation from HERE Ownwards 
create database Order_Management 

use Order_Management

CREATE TABLE Customers( 
	CustomerNo INT PRIMARY KEY, 
	Name varchar(50) NOT NULL, 
	City varchar(50) NOT NULL, 
	Phone nvarchar(20) NOT NULL
	) 

CREATE TABLE Order_( 
	OrderNo int PRIMARY KEY, 
	CustomerNo int NOT NULL, 
	Date  date NOT NULL, 
	Total_Items_Ordered int NOT NULL 

	CONSTRAINT fk_key FOREIGN KEY (CustomerNo) REFERENCES Customers(CustomerNo) 
	) 

CREATE TABLE Items( 
	ItemNo int PRIMARY KEY, 
	Name varchar(50) not null, 
	Price decimal (10,2) NOT Null, 
	Quantity_in_Store int DEFAULT 0 
	) 

CREATE TABLE OrderDetails( 
	OrderNo INT NOT NULL, 
	ItemNo INT NOT NULL, 
	Quantity INT NOT NULL, 

	-- Composite Primary key 
	PRIMARY KEY (OrderNo, ItemNo), 

	-- Foreign Key Relations 
	CONSTRAINT fk_order 
	FOREIGN KEY (orderNo) REFERENCES Order_(orderno), 

	CONSTRAINT fk_itemno 
	FOREIGN KEY (ItemNo) REFERENCES Items(ItemNo) 
	) 


-- Question 3 part b Implementation
-- Since there is no datatoInsertsql file, I am inserting in my own values and then running the quries accordingly. 
-- Populate Customers
INSERT INTO Customers (CustomerNo, Name, City, Phone) VALUES
(1, 'Ali Khan', 'Islamabad', '0300-1112223'),
(2, 'Sara Ahmed', 'Lahore', '0321-4445556'),
(3, 'Osman Peerzada', 'Islamabad', '0333-7778889'),
(4, 'Zainab Abbas', 'Karachi', '0345-9990001'),
(5, 'Bilal Saeed', 'Lahore', '0300-2223334'),
(6, 'Hamza Ali', 'Karachi', '0312-5556667');

-- Populate Items
INSERT INTO Items (ItemNo, Name, Price, Quantity_In_Store) VALUES
(101, 'Laptop Pro', 120000.00, 10),
(102, 'Gaming Mouse', 4500.00, 50),
(103, 'Office Chair', 25000.00, 15),
(104, 'Monitor 4K', 45000.00, 8),
(105, 'Keyboard', 3500.00, 30),
(106, 'USB Drive', 1500.00, 100);

-- Populate Orders (Note: current year is 2026)
INSERT INTO Order_ (OrderNo, CustomerNo, Date, Total_Items_Ordered) VALUES
(501, 1, '2026-01-15', 2),
(502, 2, '2026-01-20', 1),
(503, 3, '2025-12-05', 3), -- Last year
(504, 5, '2026-01-25', 1)

-- Populate OrderDetails
INSERT INTO OrderDetails (OrderNo, ItemNo, Quantity) VALUES
(501, 101, 1),
(501, 102, 1),
(502, 103, 1),
(504, 101, 1)

-- From this part ownwards we are going to be wrting down the customer based queries

--a. 
SELECT 
	Name AS Customer_Name, 
	City AS City_Name
FROM Customers 
WHERE City = 'Islamabad' 
ORDER BY NAME ASC; 

-- b. 
SELECT
	Name as Item_Name, 
	Price as Item_Price 
FROM Items 
WHERE name like '%o%'
ORDER BY Price Desc 

-- c. 
SELECT 
	Name as Item_Name, 
	Price as Original_Price, 
	(Price*0.85) AS Discounted_Price 
FROM Items 
ORDER BY Discounted_Price Desc;



-- d . Top 5 customers, showing the 
SELECT TOP 5 
	CustomerNo, 
	Name 
FROM Customers 
ORDER BY CustomerNo DESC 

-- e. Display order number and order date for orders placed in current year, ordered by order year from latest to oldest 
SELECT 
	OrderNo, 
	Date 
FROM Order_ 
WHERE YEAR(Date) = YEAR(GETDATE()) -- Dynamically gets the current year 2026 
ORDER BY DATE DESC

-- f. Dispalying a combined list of names, renamed as Entity_Name where customers belong to Lahore and items have a greater price than 20,000 
SELECT Name AS Entity_Name 
FROM Customers
WHERE City = 'Lahore'

UNION

SELECT Name 
FROM Items 
WHERE Price > 20000

ORDER BY Entity_Name ASC;

-- g. Displaying the customer no of the customers 
SELECT DISTINCT C.CustomerNo
FROM Customers C
JOIN Order_ O ON C.CustomerNo = O.CustomerNo
WHERE C.City = 'Lahore'

-- h. Displaying a combined list of names where customers belong to Karachi and items have a prices less than 5000 
SELECT Name AS Entity_Name
FROM Customers
WHERE City = 'Karachi'
UNION
SELECT Name
FROM Items
WHERE Price < 5000;

--i. Displaying the item number and item name for items that exists in the item table but never been ordered, ordered by item Name 
SELECT ItemNo, Name FROM Items
EXCEPT
SELECT I.ItemNo, I.Name 
FROM Items I
JOIN OrderDetails OD ON I.ItemNo = OD.ItemNo;




