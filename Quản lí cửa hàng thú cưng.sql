CREATE DATABASE Quanlicuahangthucung_TranThuHien;
GO
USE Quanlicuahangthucung_TranThuHien;
GO

-- Tạo bảng Thú cưng
CREATE TABLE Pets (
    PetID INT PRIMARY KEY,
    Name VARCHAR(50),
    Species VARCHAR(50),
    Age INT,
    Price DECIMAL(10, 2)
);

-- Tạo bảng Sản phẩm
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT
);

-- Tạo bảng Đơn hàng
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Tạo bảng Chi tiết đơn hàng
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Tạo bảng Khách hàng
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

-- Thêm dữ liệu vào bảng Pets
INSERT INTO Pets (PetID, Name, Species, Age, Price)
VALUES (1, 'Max', 'Dog', 3, 100),
       (2, 'Lucy', 'Cat', 2, 80),
       (3, 'Charlie', 'Dog', 5, 120);

-- Thêm dữ liệu vào bảng Products
INSERT INTO Products (ProductID, Name, Category, Price, Stock)
VALUES (1, 'Pet Food', 'Food', 10, 100),
       (2, 'Cat Litter', 'Accessories', 5, 50),
       (3, 'Dog Leash', 'Accessories', 15, 30);

-- Thêm dữ liệu vào bảng Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', '123456789'),
       (2, 'Jane', 'Smith', 'jane.smith@example.com', '987654321');

-- Thêm dữ liệu vào bảng Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (1, 1, '2023-01-01', 150),
       (2, 2, '2023-02-01', 50);

-- Thêm dữ liệu vào bảng OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Price)
VALUES (1, 1, 1, 2, 20),
       (2, 1, 2, 1, 5),
       (3, 2, 3, 1, 15);

-- Truy vấn danh sách thú cưng
SELECT * FROM Pets;

-- Truy vấn danh sách sản phẩm
SELECT * FROM Products;

-- Truy vấn danh sách đơn hàng
SELECT * FROM Orders;

-- Truy vấn danh sách khách hàng
SELECT * FROM Customers;

-- Truy vấn chi tiết đơn hàng
SELECT * FROM OrderDetails;