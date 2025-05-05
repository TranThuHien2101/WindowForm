CREATE DATABASE Quanlicuahangthucung_TranThuHien;
GO
USE Quanlicuahangthucung_TranThuHien;
GO

-- Tạo bảng Thú cưng
CREATE TABLE Pets (
    PetID char(30) PRIMARY KEY,
    Name VARCHAR(50),
    Species VARCHAR(50), --giống loài
    Age INT,
	SoLuong int,
    Price DECIMAL(10, 2) --giá
);
go
-- Tạo bảng Sản phẩm
CREATE TABLE Products (
    ProductID char(30) PRIMARY KEY,
	TenSanPham nvarchar(50) not null,
	XuatXu nvarchar(50) not null,
	LoaiSanPham nvarchar(50) not null,
	SoLuong nchar(10) not null,
	GiaTien nchar(10) not null
);
go
-- Tạo bảng Khách hàng
CREATE TABLE Customers (
    CustomerID char(30) PRIMARY KEY,
	Name nvarchar(50),
	NgaySinh date,   
    Phone VARCHAR(20),
	Email VARCHAR(100),
	GioiTinh nvarchar(3),
	Anh nvarchar(100)
);
go
--Tạo bảng Đăng Nhập
create table DangNhap(
	CustomerID char(30) FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	Password nvarchar(50),
	Status bit
)
go
--Tạo bảng Nhân Viên
create table NhanVien(
	NhanVienID char(30) primary key,
	TenNhanVien nvarchar(50),
	QueQuan nvarchar(50),
	SoDienThoai char(15)
)
go
-- Tạo bảng Đơn hàng
CREATE TABLE DonHang (
    DonHangID char(30) PRIMARY KEY,
    CustomerID char(30),
	NhanVienID char(30),
	ProductID char(30),
	PetID char(30),
    TenSanPham nvarchar(50),
	XuatXu nvarchar(50),
	LoaiSanPham nvarchar(50),
	SoLuong nchar(10),
	GiaTien nchar(10),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
	FOREIGN KEY (PetID) REFERENCES Pets(PetID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (NhanVienID) REFERENCES NhanVien(NhanVienID),	
);
go
--Tạo bảng ThongKe
create table ThongKe(
	MaSanPham nvarchar(10) primary key,
	TenSanPham nvarchar(50) not null,
	XuatXu nvarchar(50) not null,
	LoaiSanPham nvarchar(50) not null,
	SoLuong nchar(10) not null,
	GiaTien nchar(10) not null,
	NgayBan date not null
)
go
create table HoaDon(
	MaSanPham nvarchar(10) primary key,
	TenSanPham nvarchar(50) not null,
	XuatXu nvarchar(50) not null,
	LoaiSanPham nvarchar(50) not null,
	SoLuong nchar(10) not null,
	GiaTien nchar(10) not null,
	NgayBan date not null,
	DiaChi nvarchar(50) not null,
	MaKhachHang nvarchar(50),
	NhanVienID nvarchar(50)
);
go
--Truy vấn dữ liệu trong C#
--Form Đăng Nhập
select CustomerID, Password from DangNhap where CustomerID = 1 and Password =1
go
--Form Nhân Viên
select * from NhanVien
go
insert into NhanVien
values('NV01', N'Trần Thu Hiền', N'Kim Động', '123456789')
go
--Form 
