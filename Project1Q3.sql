
-- Q3.1 and Q3.2
-- Create Employee table
CREATE TABLE Employee (
    EmployeeNumber INT PRIMARY KEY,
    LastName VARCHAR(255),
    FirstName VARCHAR(255),
    Extension VARCHAR(10),
    EmailAddress VARCHAR(255),
    OfficeCode INT,  -- Foreign key referencin 
    JobTitle VARCHAR(255),
    ReportsTo INT,  -- Foreign key referencing EmployeeNumber
    FOREIGN KEY (ReportsTo) REFERENCES Employee(EmployeeNumber)
);

-- Create Office table
CREATE TABLE Office (
    OfficeCode INT PRIMARY KEY,
    City VARCHAR(255),
    PhoneNumber VARCHAR(15),
    AddressLine1 VARCHAR(255),
    AddressLine2 VARCHAR(255),
    County VARCHAR(255),
    Country VARCHAR(255),
    PostalCode VARCHAR(10),
    Territory VARCHAR(255)
);

-- Create Customer table
CREATE TABLE Customer (
    CustomerNumber INT PRIMARY KEY,
    FullName VARCHAR(255),
    PhoneNumber VARCHAR(15),
    AddressLine1 VARCHAR(255),
    AddressLine2 VARCHAR(255),
    City VARCHAR(255),
    County VARCHAR(255),
    PostalCode VARCHAR(10),
    Country VARCHAR(255),
    SalesAmount DECIMAL(10, 2),
    RepresentativeEmployeeNumber INT,  -- Foreign key referencing EmployeeNumber
    CreditLimitNumber INT
);

-- Create Payment table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    CustomerNumber INT,  -- Foreign key referencing CustomerNumber
    ChequeNumber VARCHAR(20),
    PaymentDate DATE,
    AmountPaid DECIMAL(10, 2)
);

-- Create Product table
CREATE TABLE Product (
    ProductCode INT PRIMARY KEY,
    ProductName VARCHAR(255),
    ProductLine VARCHAR(255),  -- Foreign key referencing ProductLineText
    ScaleWeight DECIMAL(10, 2),
    Vendor VARCHAR(255),
    ProductDescription TEXT,
    QuantityInStock INT,
    BuyingPrice DECIMAL(10, 2),
    MSRP DECIMAL(10, 2)
);

-- Create Order table
CREATE TABLE CustomerOrder (
    CustomerOrderNumber INT PRIMARY KEY,
    CustomerOrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    CustomerOrderStatus VARCHAR(50),
    Comments TEXT,
    CustomerNumber INT,  -- Foreign key referencing CustomerNumber
    FOREIGN KEY (CustomerNumber) REFERENCES Customer(CustomerNumber)
);

-- Create OrderLine table
CREATE TABLE OrderLine (
    OrderLineNumber INT PRIMARY KEY,
    OrderNumber INT,  -- Foreign key referencing OrderNumber
    ProductCode INT,  -- Foreign key referencing ProductCode
    QuantityOrdered INT,
    Price DECIMAL(10, 2)
);

-- Create ProductLine table
CREATE TABLE ProductLine (
    ProductLineText VARCHAR(50) PRIMARY KEY,
    ProductDescription TEXT,
    Website VARCHAR(255),
    ProductImage VARCHAR(255)
);

-- Add foreign key constraint for Product-ProductLine relationship
ALTER TABLE Product
ADD FOREIGN KEY (ProductLine) REFERENCES ProductLine(ProductLineText);


-- Q3.3
-- Insert data into Employee table
INSERT INTO Employee (EmployeeNumber, LastName, FirstName, Extension, EmailAddress, JobTitle, ReportsTo)
VALUES
    (1, 'Yusuf', 'Emmanuel', '2', 'eyusuf@gmail.com', 'Manager', NULL),
    (2, 'Taiwo', 'Moyo', '1', 'moyotaiwo03@icloud.com', 'Drug Supplier', 1),
    (3, 'Odelusi', 'Olu', '112', 'oluodelusi@.com', 'Customer Service Representative', 2),
    (4, 'Christie', 'Reona', '223', 'Rchristie@yahoo.com', 'Customer Service Representative', 2);

-- Insert data into Office table
INSERT INTO Office (OfficeCode, City, PhoneNumber, AddressLine1, AddressLine2, County, Country, PostalCode, Territory)
VALUES
    (01, 'New York', '123-456-7890', '123 Main St', 'Suite 101', 'New York County', 'USA', '10001', 'East'),
    (02, 'Los Angeles', '987-654-3210', '456 Elm St', 'Suite 202', 'Los Angeles County', 'USA', '90001', 'West'),
    (03, 'Chicago', '111-222-3333', '789 Oak St', 'Suite 303', 'Cook County', 'USA', '60601', 'Central'),
    (04, 'Houston', '444-555-6666', '101 Pine St', 'Suite 404', 'Harris County', 'USA', '77001', 'South');

-- Insert data into Customer table
INSERT INTO Customer (CustomerNumber, FullName, PhoneNumber, AddressLine1, AddressLine2, City, County, PostalCode, Country, SalesAmount, RepresentativeEmployeeNumber, CreditLimitNumber)
VALUES
    (1, 'Hannah Yusuf', '07897364228', '22 Raymere Street', 'Plumstead', 'London', 'Greater London', 'SE186BP', 'England', 50.00, 2, 10000),
    (2, 'Michael Paul', '07625928135', '92 Rankin Drive', 'Blackford', 'Edinburgh', 'Midlothian', 'EH96NP', 'Scotland', 200.00, 1, 1000),
    (3, 'Angela Chu', '23745902', '65 Baltic Avenue', 'Atlanta City', 'Atlanta', 'Georgia', 'NJ08401', 'USA', 500.00, 4, 10000),
    (4, 'Eren Jeagar', '2357', '26 Old Ealling Road', 'Leckham', 'Majura', 'Canberra', 'CA95629', 'Australia', 75.00, 3, 5000);

-- Insert data into Payment table
INSERT INTO Payment (PaymentID, CustomerNumber, ChequeNumber, PaymentDate, AmountPaid)
VALUES
    (1, 1, 'CHQ8262', '2023-10-28', 50.00),
    (2, 2, 'CHQ0192', '2023-11-01', 200.00),
    (3, 3, 'CHQ3243', '2023-11-05', 500.00),
    (4, 4, 'CHQ6483', '2023-11-07', 75.00);

-- Insert data into Product table
INSERT INTO Product (ProductCode, ProductName, ProductLine, ScaleWeight, Vendor, ProductDescription, QuantityInStock, BuyingPrice, MSRP)
VALUES
    (101, 'Codeine', 'Medicine', 0.5, 'EmmansPharmacy', 'Used to for short term pain relief', 300, 3.00, 8.99),
    (102, 'Painkillers', 'Medicine', 0.4, 'EmmansPharmacy', 'Used to relieve pain and aches', 300, 4.00, 7.99),
    (103, 'Ibuprofen', 'Medicine', 0.6, 'EmmansPharmacy', 'Used to manage and treat pain and fever', 300, 6.00, 14.99),
    (104, 'Vitamin D3 Pills', 'Supplements', 0.8, 'VitaBiotics', 'Used to increase the amount of Vitamin D in the body', 300, 8.00, 11.99);

-- Insert data into Order table
INSERT INTO CustomerOrder (CustomerOrderNumber, CustomerOrderDate, RequiredDate, ShippedDate, CustomerOrderStatus, Comments, CustomerNumber)
VALUES
    (1111, '2023-10-28', '2023-10-28', '2023-11-06', 'Delivered', 'Please enjoy your order', 1),
    (1112, '2023-11-01', '2023-11-11', '2023-11-09', 'Shipped', 'Congrats your order is on the way!', 2),
    (1113, '2023-11-05', '2023-11-15', '2023-11-12', 'Shipped', 'Your order is on transit', 4),
    (1114, '2023-11-07', '2023-11-17', NULL, 'Pending', 'Order processing', 3);
    

-- Insert data into OrderLine table
INSERT INTO OrderLine (OrderLineNumber, OrderNumber, ProductCode, QuantityOrdered, Price)
VALUES
    (1, 1111, 101, 20, 8.99),
    (2, 1112, 102, 10, 7.99),
    (3, 1113, 103, 10, 14.99),
    (4, 1114, 104, 5, 11.99);

-- Insert data into ProductLine table
INSERT INTO ProductLine (ProductLineText, ProductDescription, Website, ProductImage)
VALUES
    ('Medicine', 'Used to for short term pain relief', 'EmmanPharmacy.com/medicine/Codeniene', 'Codeniene.jpg'),
    ('Medicine2', 'Used to relieve pain and aches', 'EmmanPharmacy.com/medicine/Painkillers', 'Painkillers.jpg'),
    ('Medicine3', 'Used to manage and treat pain and fever', 'EmmanPharmacy.com/medicine/Ibuprofen', 'Ibuprofen.jpg'),
    ('Supplemenets', 'Used to increase the amount of Vitamin D in the body', 'Vitabiotitics.com/Supplements/VitaminD3', 'VitaminD3.jpg');

-- Q3.4
-- Create the Customer_Order_Restricted_Info view
CREATE VIEW Customer_Order_Restricted_Info AS
SELECT
    c.CustomerNumber AS Customer_ID,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer_Full_Name,
    CONCAT(c.AddressLine1, ' ', c.AddressLine2, ' ', c.PostalCode, ' ', c.Country) AS Customer_Full_Address,
    o.CustomerOrderStatus AS OrderStatus,
    ol.QuantityOrdered
FROM
    Customer c
JOIN
    CustomerOrder o ON c.CustomerNumber = o.CustomerNumber
JOIN
    OrderLine ol ON o.CustomerOrderNumber = ol.OrderNumber
WHERE
    c.CreditLimitNumber > 1000
    AND YEAR(o.ShippedDate) < 2010;

