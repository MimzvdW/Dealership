---Create Supplier Table
CREATE TABLE Supplier
(
    Supplier_ID VARCHAR(5) NOT NULL PRIMARY KEY,  ---The ID contains the letter S therefor I am using VARCHAR
    Supplier_Name VARCHAR(50) NOT NULL,
    Supplier_Country VARCHAR(50) NOT NULL,
    Supplier_Contact VARCHAR(50) NOT NULL,
    Supplier_Phone_Number VARCHAR(8) NOT NULL, ---Only 8 characters as more or less means the phone number is missing a number or the - symbol
    Stock_Number VARCHAR(50) NOT NULL
);

---Create Product Table
CREATE TABLE Product
(
    Stock_Number INT NOT NULL PRIMARY KEY,
    Product_Make VARCHAR(50) NOT NULL,
    Product_Model VARCHAR(50) NOT NULL, ---Model is a keyword
    Product_Year INT NOT NULL, ---Year is a keyword
    Product_Color VARCHAR(50) NOT NULL,
    Product_Mileage INT, ---Must allow 0
    Product_Transmission VARCHAR(50) NOT NULL,
    Product_Price INT NOT NULL, ---No need for decimal
    Supplier_ID VARCHAR(5) NOT NULL, 
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);

---Insert into Supplier table
INSERT INTO Supplier (Supplier_ID, Supplier_Name, Supplier_Country, Supplier_Contact, Supplier_Phone_Number, Stock_Number) 
VALUES ('S1', 'American Autos', 'USA', 'John Smith', '555-1234', '001, 004, 010');
INSERT INTO Supplier (Supplier_ID, Supplier_Name, Supplier_Country, Supplier_Contact, Supplier_Phone_Number, Stock_Number) 
VALUES ('S2', 'Asian Car Masters', 'Japan', 'Yuki Tanaka', '555-5678', '002, 005, 008');
INSERT INTO Supplier (Supplier_ID, Supplier_Name, Supplier_Country, Supplier_Contact, Supplier_Phone_Number, Stock_Number) 
VALUES ('S3', 'Electric Innovations', 'USA', 'Emily Johnson', '555-9101', '003');
INSERT INTO Supplier (Supplier_ID, Supplier_Name, Supplier_Country, Supplier_Contact, Supplier_Phone_Number, Stock_Number) 
VALUES ('S4', 'European Luxury', 'Germany', 'Hans Müller', '555-1122', '006, 007, 009');


---Insert into Product table
INSERT INTO Product (Stock_Number, Product_Make, Product_Model, Product_Year, Product_Color, Product_Mileage, Product_Transmission, Product_Price, Supplier_ID) 
VALUES (001, 'Ford', 'F-150', 2022, 'Blue', 0, 'Automatic', 500000, 'S1');
INSERT INTO Product (Stock_Number, Product_Make, Product_Model, Product_Year, Product_Color, Product_Mileage, Product_Transmission, Product_Price, Supplier_ID) 
VALUES (002, 'Toyota', 'Camry', 2021, 'Black', 12000, 'Manual', 280000, 'S2');
INSERT INTO Product (Stock_Number, Product_Make, Product_Model, Product_Year, Product_Color, Product_Mileage, Product_Transmission, Product_Price, Supplier_ID) 
VALUES (003, 'Tesla', 'Model 3', 2023, 'White', 0, 'Automatic', 450000, 'S3');
INSERT INTO Product (Stock_Number, Product_Make, Product_Model, Product_Year, Product_Color, Product_Mileage, Product_Transmission, Product_Price, Supplier_ID) 
VALUES (004, 'Chevrolet', 'Silverado', 2020, 'Red', 30000, 'Automatic', 350000, 'S1');
INSERT INTO Product (Stock_Number, Product_Make, Product_Model, Product_Year, Product_Color, Product_Mileage, Product_Transmission, Product_Price, Supplier_ID) 
VALUES (005, 'Honda', 'Civic', 2019, 'Silver', 20000, 'Manual', 180000, 'S2');
INSERT INTO Product (Stock_Number, Product_Make, Product_Model, Product_Year, Product_Color, Product_Mileage, Product_Transmission, Product_Price, Supplier_ID) 
VALUES (006, 'BMW', '3 Series', 2022, 'Black', 0, 'Automatic', 550000, 'S4');
INSERT INTO Product (Stock_Number, Product_Make, Product_Model, Product_Year, Product_Color, Product_Mileage, Product_Transmission, Product_Price, Supplier_ID) 
VALUES (007, 'Audi', 'A4', 2021, 'White', 5000, 'Automatic', 400000, 'S4');
INSERT INTO Product (Stock_Number, Product_Make, Product_Model, Product_Year, Product_Color, Product_Mileage, Product_Transmission, Product_Price, Supplier_ID) 
VALUES (008, 'Nissan', 'Altima', 2018, 'Blue', 50000, 'Manual', 150000, 'S2');
INSERT INTO Product (Stock_Number, Product_Make, Product_Model, Product_Year, Product_Color, Product_Mileage, Product_Transmission, Product_Price, Supplier_ID) 
VALUES (009, 'Mercedes', 'C-Class', 2022, 'Grey', 0, 'Automatic', 600000, 'S4');
INSERT INTO Product (Stock_Number, Product_Make, Product_Model, Product_Year, Product_Color, Product_Mileage, Product_Transmission, Product_Price, Supplier_ID) 
VALUES (010, 'Subaru', 'Outback', 2020, 'Green', 25000, 'Manual', 270000, 'S1');

---Question 2 ***Subqueries***
---2.1
---Display Product price where country is USA
SELECT product.Product_Price AS Price
FROM Supplier supplier JOIN Product product ON product.Supplier_ID = supplier.Supplier_ID
WHERE Supplier_Country ='USA';

---Display Product price and country name where country is USA
SELECT product.Product_Price AS Price, supplier.Supplier_Country AS Country
FROM Supplier supplier JOIN Product product ON product.Supplier_ID = supplier.Supplier_ID
WHERE Supplier_Country ='USA';

---2.2
---Display Product make where supplier name is Electric Innovations 
SELECT product.Product_Make AS Make
FROM Supplier supplier JOIN Product product ON product.Supplier_ID = supplier.Supplier_ID
WHERE Supplier_Name ='Electric Innovations';

---Display Product make and supplier name where supplier name is Electric Innovations 
SELECT product.Product_Make AS Make, supplier.Supplier_Name AS Supplier_Name
FROM Supplier supplier JOIN Product product ON product.Supplier_ID = supplier.Supplier_ID
WHERE Supplier_Name ='Electric Innovations';

---2.3
---Display Supplier Contact where price is higher than 500 000
SELECT supplier.supplier_contact AS Contact
FROM Product product JOIN Supplier supplier ON supplier.Supplier_ID = product.Supplier_ID 
WHERE Product_Price > 500000;

---Display Product Make, Supplier Name, Supplier Contact, Product Price where price is higher than 500 000
SELECT product.Product_Make AS Make, supplier.supplier_Name AS Name, supplier.supplier_contact AS Contact, product.Product_Price AS Price
FROM Product product JOIN Supplier supplier ON supplier.Supplier_ID = product.Supplier_ID 
WHERE Product_Price > 500000;

---2.4
---Display Supplier Phone Number where Mileage equals zero
SELECT supplier.Supplier_Phone_Number AS Phone_Number
FROM Product product JOIN Supplier supplier ON supplier.Supplier_ID = product.Supplier_ID 
WHERE Product_Mileage = 0;

---Display Product Make, Supplier Name, Supplier Contact, Product Price, Product Mileage where Mileage equals zero
SELECT product.Product_Make AS Make, supplier.supplier_Name AS Name, supplier.supplier_contact AS Contact, product.Product_Mileage AS Mileage
FROM Product product JOIN Supplier supplier ON supplier.Supplier_ID = product.Supplier_ID 
WHERE Product_Mileage = 0;

---Question 3 ***Schema Objects Views***
---3.1
---Create a view that shows all the columns from the Product table
CREATE VIEW Product_Table_View AS
SELECT *
FROM Product;

---3.2
---Create a view that shows all the cars with automatic transmission and their details
CREATE VIEW Automatic_Cars AS
SELECT Product_Make AS Make, Product_Model As Model, Product_Year AS Year, Product_Color AS Color, Product_Mileage AS Mileage, Product_Transmission AS Transmission, Product_Price AS Price
FROM Product
WHERE Product_Transmission = 'Automatic';

---3.3
---Create a view lists all cars supplied by "American Autos" with the supplier's details
CREATE VIEW American_Autos_Cars_Details AS
SELECT Supplier_Name AS Name, Supplier_Country AS Country, Supplier_Contact AS Contact, Supplier_Phone_Number AS Phone_Number
FROM Supplier s JOIN Product p ON s.Supplier_ID = p.Supplier_ID
WHERE supplier_Name = 'American Autos';

---Create a view lists all cars supplied by "American Autos" with the car's details
CREATE VIEW American_Autos_Cars AS
SELECT s.supplier_Name, p.Product_Make AS Make, p.Product_Model AS Model, p.Product_Year AS Year, 
p.Product_Color AS Color, p.Product_Mileage AS Mileage, p.Product_Transmission AS Transmission, p.Product_Price AS Price
FROM Supplier s JOIN Product p ON s.Supplier_ID = p.Supplier_ID
WHERE supplier_Name = 'American Autos';

---3.4
---Create a view that shows the Make, Model, Year and Supplier Name
CREATE VIEW Car_Details_Supplier_Name AS
SELECT p.Product_Make AS Make, p.Product_Model AS Model, p.Product_Year AS Year, s.supplier_Name
FROM Supplier s JOIN Product p ON s.Supplier_ID = p.Supplier_ID;

---3.5
---Create a view that list all the 2022 cars and their supplier
CREATE VIEW Cars_2022 AS
SELECT p.Product_Year AS Year, s.Supplier_ID, Supplier_Name, s.Supplier_Country AS  Country, 
s.Supplier_Contact, s.Supplier_Phone_Number AS Phone_Number, s.Stock_Number
FROM Product p JOIN Supplier s ON p.Supplier_ID = s.Supplier_ID
WHERE Product_Year = 2022;

---Question 4 ***Set Operators***
---4.1 List all unique in the Products Table and Supplier countries in a single column
SELECT Product_Model FROM Product
UNION ---Return unique rows
SELECT Supplier_Country FROM Supplier;
---OR
SELECT Product_Model AS Model_and_Country FROM Product
UNION
SELECT Supplier_Country AS Model_and_Country FROM Supplier;

---4.2 List cars with Automatic transmissions and cars from the year 2022
---Remove duplicates but does not display what I want
SELECT * FROM Product
WHERE Product_Transmission = 'Automatic' 
UNION
SELECT * FROM Product
WHERE Product_Year = 2022;

---Looks for common values among the rows of the SELECT statement, display the information as I want it.
SELECT * FROM Product
WHERE Product_Transmission = 'Automatic'
INTERSECT
SELECT * FROM Product
WHERE Product_Year = 2022;

---4.3
---Find car models that are supplied by American Autos and are Automatic 
SELECT p.Product_Model AS Model FROM Product p 
JOIN Supplier s ON p.Supplier_ID = s.Supplier_ID
WHERE p.Product_Transmission = 'Automatic'
INTERSECT
SELECT p.Product_Model FROM Product p 
JOIN Supplier s ON p.Supplier_ID = s.Supplier_ID
WHERE s.Supplier_Name = 'American Autos';

---Show Transmission and Supplier columns as well
SELECT p.Product_Model AS Model, p.Product_Transmission AS Transmission, s.Supplier_Name FROM Product p 
JOIN Supplier s ON p.Supplier_ID = s.Supplier_ID
WHERE p.Product_Transmission = 'Automatic'
INTERSECT
SELECT p.Product_Model AS Model, p.Product_Transmission AS Transmission, s.Supplier_Name FROM Product p 
JOIN Supplier s ON p.Supplier_ID = s.Supplier_ID
WHERE s.Supplier_Name = 'American Autos';

---4.4
---Find car models that are supplied by American Autos and are  NOT Automatic 
SELECT p.Product_Model AS Model FROM Product p 
JOIN Supplier s ON p.Supplier_ID = s.Supplier_ID
WHERE p.Product_Transmission != 'Automatic'
INTERSECT
SELECT p.Product_Model FROM Product p 
JOIN Supplier s ON p.Supplier_ID = s.Supplier_ID
WHERE s.Supplier_Name = 'American Autos';

---Show Transmission and Supplier columns as well
SELECT p.Product_Model AS Model, p.Product_Transmission AS Transmission, s.Supplier_Name FROM Product p 
JOIN Supplier s ON p.Supplier_ID = s.Supplier_ID
WHERE p.Product_Transmission != 'Automatic'
INTERSECT
SELECT p.Product_Model AS Model, p.Product_Transmission AS Transmission, s.Supplier_Name FROM Product p 
JOIN Supplier s ON p.Supplier_ID = s.Supplier_ID
WHERE s.Supplier_Name = 'American Autos';