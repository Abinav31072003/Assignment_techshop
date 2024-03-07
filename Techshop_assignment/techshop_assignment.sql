create database techshop1

CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(100)
);

-- Create Products table
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100),
    Description VARCHAR(30),
    Price DECIMAL(10, 2)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON Delete Cascade
);

-- Create OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON Delete Cascade,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON Delete Cascade
);

-- Create Inventory table
CREATE TABLE Inventory (
    InventoryID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON Delete Cascade
);

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) 
VALUES 
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Elm St'),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-123-4567', '789 Oak St'),
('Bob', 'Brown', 'bob.brown@example.com', '444-555-6666', '321 Pine St'),
('Emma', 'Garcia', 'emma.garcia@example.com', '222-333-4444', '555 Maple St'),
('Michael', 'Davis', 'michael.davis@example.com', '678-901-2345', '678 Cedar St'),
('Sarah', 'Taylor', 'sarah.taylor@example.com', '901-234-5678', '901 Birch St'),
('David', 'Martinez', 'david.martinez@example.com', '234-567-8901', '234 Walnut St'),
('Jessica', 'Rodriguez', 'jessica.rodriguez@example.com', '567-890-1234', '567 Ash St'),
('Christopher', 'Lee', 'christopher.lee@example.com', '890-123-4567', '890 Sycamore St');

INSERT INTO Products (ProductName, Description, Price) 
VALUES 
('T-shirt', 'Dress', 10.99),
('Watch', 'Accessory', 20.99),
('Earphone', 'Electronics', 30.99),
('Jeans', 'Dress', 40.99),
('Coolers', 'Accessory', 50.99),
('Smart Watch', 'Electronics', 60.99),
('Hoodie', 'Dress', 70.99),
('Cap', 'Accessory', 80.99),
('Hard Disk', 'Electronics', 90.99),
('Shorts', 'Dress', 100.99);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) 
VALUES 
(1, '2024-02-28', 100.00),
(2, '2024-02-28', 150.00),
(3, '2024-02-27', 200.00),
(4, '2024-02-27', 120.00),
(5, '2024-02-26', 180.00),
(6, '2024-02-26', 90.00),
(3, '2024-02-25', 250.00),
(7, '2024-02-25', 110.00),
(8, '2024-02-24', 170.00),
(5, '2024-02-24', 140.00);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
(1, 1, 2),
(2, 2, 3),
(3, 3, 1),
(4, 4, 4),
(5, 5, 2),
(6, 6, 1),
(7, 7, 3),
(8, 8, 2),
(9, 9, 5),
(10, 10, 3);

Select * from products
Insert into Inventory(ProductID, QuantityInStock, LastStockUpdate)  
values
(1,100,'2024-01-24'),
(10,65,'2023-12-05'),
(2,87,'2023-11-28'),
(3,50,'2023-12-07'),
(4,150,'2023-12-07'),
(5,162,'2024-02-08'),
(6,75,'2023-12-24'),
(7,59,'2023-12-26'),
(8,36,'2024-01-16'),
(9,94,'2023-11-04')

--TASK 2
--1. Write an SQL query to retrieve the names and emails of all customers. 
SELECT FirstName, LastName, Email FROM Customers;

Select * from Customers;
Select * from Orders

--2. Write an SQL query to list all orders with their order dates and corresponding customer names.
Select c.FirstName,c.LastName,o.OrderDate From Customers c Join Orders o on c.CustomerID=o.CustomerID;

--3. Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address. 
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) 
VALUES ('Giri', 'Dharan', 'giridharan@example.com', '592-633-5012', '123 New St');

--4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.
UPDATE Products SET Price = Price * 1.1 WHERE Description = 'Electronics';

--5. Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter. 
DELETE FROM Orders WHERE OrderID = 5;

--6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES (9, '2024-02-28', 125.99);

--7. Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information.
UPDATE Customers SET Email = 'giri@example.com', Address = '123 Laporte St' WHERE CustomerID = 12;

--8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table. 
ALTER TABLE OrderDetails ADD Price DECIMAL(10, 2)

UPDATE OrderDetails SET Price = 10.99 WHERE OrderDetailID = 1;

UPDATE OrderDetails SET Price = 20.99 WHERE OrderDetailID = 2;

UPDATE OrderDetails SET Price = 30.99 WHERE OrderDetailID = 3;

UPDATE OrderDetails SET Price = 40.99 WHERE OrderDetailID = 4;

UPDATE OrderDetails SET Price = 50.99 WHERE OrderDetailID = 6;

UPDATE OrderDetails SET Price = 60.99 WHERE OrderDetailID = 7;

UPDATE OrderDetails SET Price = 70.99 WHERE OrderDetailID = 8;

UPDATE OrderDetails SET Price = 80.99 WHERE OrderDetailID = 9;

UPDATE OrderDetails SET Price = 90.99 WHERE OrderDetailID = 10;

UPDATE Orders SET TotalAmount = (SELECT SUM(Quantity * Price) FROM OrderDetails 
WHERE Orders.OrderID = OrderDetails.OrderID)

Select * from Orders
Select * from OrderDetails
Select * from Customers
--9. Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.
DELETE FROM Orders WHERE CustomerID = 9;

--10. Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details.
INSERT INTO Products (ProductName, Price, Description) 
VALUES ('Phone' , 99.99, 'Electronics');

--11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status.
ALTER TABLE Orders ADD Statusdetail VARCHAR(20)

UPDATE Orders SET Statusdetail = 'Shipped' WHERE OrderID = 2;

UPDATE Orders SET Statusdetail = 'Shipped' WHERE OrderID = 7;

UPDATE Orders SET Statusdetail = 'Shipped' WHERE OrderID = 4;

UPDATE Orders SET Statusdetail = 'Pending' WHERE OrderID = 1;

UPDATE Orders SET Statusdetail = 'Pending' WHERE OrderID = 3;

UPDATE Orders SET Statusdetail = 'Pending' WHERE OrderID = 8;

--12. Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table
ALTER TABLE Customers ADD NumOrders INT

UPDATE Customers SET NumOrders = (SELECT COUNT(*) FROM Orders 
WHERE Orders.CustomerID = Customers.CustomerID);

--TASK 3
--1. Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order.
SELECT * from Customers

Select c.FirstName, c.CustomerID, o.OrderID FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID

--2. Write an SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue.
SELECT Products.ProductName, SUM(Orders.TotalAmount) AS TotalRevenue FROM Products JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID JOIN Orders ON OrderDetails.OrderID = Orders.OrderID Where Products.Description='Electronics' GROUP BY Products.ProductName;

--3. Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information
SELECT c.FirstName, COUNT(o.OrderID) FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID GROUP BY c.FirstName

--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered.
SELECT TOP 1 SUM(o.Quantity) AS Total, p.ProductName FROM Products p JOIN OrderDetails o ON p.ProductID = o.ProductID GROUP BY p.ProductName ORDER BY Total DESC

--5.Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.
SELECT ProductName, Description FROM Products where Description = 'Electronics'

--6. Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value.
Select CONCAT_WS(' ', c.FirstName, c.LastName) AS Name_Cus, AVG(o.TotalAmount) AS Average From Customers c JOIN Orders o ON c.CustomerID = o.CustomerID GROUP BY c.FirstName, c.LastName

--7. Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue. 
Select TOP 1 o.orderID, o.TotalAmount, CONCAT_WS(' ', c.FirstName, c.LastName) AS Name_Cus From Orders o join Customers c on o.CustomerID=c.CustomerID Order BY o.TotalAmount DESC

--8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered.
SELECT p.ProductName, COUNT(o.OrderID) AS NumberOfOrders FROM Products p LEFT JOIN OrderDetails o ON p.ProductID = o.ProductID where p.Description = 'Electronics' GROUP BY p.ProductName;

--9. Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter.
Select CONCAT_WS(' ', c.FirstName, c.LastName) AS Name_Cus, p.ProductName FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID Join OrderDetails od ON o.OrderID = od.OrderID JOIN Products p ON od.ProductID = p.ProductID where p.Description = 'Electronics'

--10. Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters.
Select * from Orders
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders WHERE OrderDate BETWEEN '2024-02-25' AND '2024-02-28';

--TASK 4
--1.Write an SQL query to find out which customers have not placed any orders.
Select CONCAT_WS(' ', FirstName, LastName) AS Name_Cus FROM Customers Where CustomerID NOT In (Select CustomerID from Orders) 

--2.Write an SQL query to find the total number of products available for sale. 
Select * from (Select Count(ProductID)as Product_id from Inventory where QuantityInStock>0) as TotalProduct

--3. Write an SQL query to calculate the total revenue generated by TechShop.  
Select SUM(TotalAmount) AS [Total Revenue] From Orders

--4. Write an SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter.
SELECT AVG(o.Quantity) AS AverageQuantityOrdered, p.Description FROM OrderDetails o JOIN Products p ON o.ProductID = p.ProductID WHERE p.Description = 'Electronics' 
GROUP BY p.Description

--5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter.
Select SUM(TotalAmount) From Orders Where CustomerID = 3

--6. Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed.
Select FirstName, LastName, NumOrders From Customers Where Customerid = (Select Top 1 CustomerID from Orders Group By CustomerID Order By COUNT(OrderID) DESC)

--7. Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders.
Select TOP 1 p.Description, o.Quantity FROM Products p JOIN OrderDetails o ON p.ProductID = o.ProductID ORDER BY o.Quantity DESC

--8. Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending.
SELECT TOP 1 c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpending FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.Description = 'Electronics'
GROUP BY c.FirstName, c.LastName ORDER BY TotalSpending DESC

--9. Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.
SELECT AVG(total_amount) AS AverageOrderValue FROM ( SELECT SUM(TotalAmount) AS total_amount FROM Orders
GROUP BY CustomerID) AS order_total;

--10. Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count.
SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName;