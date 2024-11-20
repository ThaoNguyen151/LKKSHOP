CREATE DATABASE LKKShop
USE LKKShop



CREATE TABLE [dbo].[tblUsers](
	[userID] NVARCHAR(50) PRIMARY KEY,
	[fullName] NVARCHAR(50) NULL,
	[password] NVARCHAR(50) NULL,
	[roleID] NVARCHAR(50) NULL,
	[picture] VARCHAR(255) ,
	[status] BIT NULL,
)

CREATE TABLE [dbo].[tblOrders](
	orderID NVARCHAR(50) PRIMARY KEY,
	userID NVARCHAR(50) NOT NULL,
	total DECIMAL(10, 2) NULL,
	[date] DATE NULL,
	[status] BIT NULL,
	FOREIGN KEY (userID) REFERENCES tblUsers(userID)
	)

CREATE TABLE [dbo].[tblProducts](
	productID CHAR(5) PRIMARY KEY,
	name NVARCHAR(255) NOT NULL,
	price DECIMAL(10, 2) NOT NULL,
	quantity INT NOT NULL,
	[picture] VARCHAR(255) ,
	brand NVARCHAR(255),
	[status] BIT NULL,
	)

CREATE TABLE [dbo].[tblOrderDetail](
orderID NVARCHAR(50) NOT NULL,
productID CHAR(5) NOT NULL,
price DECIMAL(10, 2),
quantity INT,
[status] BIT NULL,
PRIMARY KEY(orderID,productID),
FOREIGN KEY(orderID) REFERENCES tblOrders(orderID),
FOREIGN KEY(productID) REFERENCES tblProducts(productID)
)

INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID],[picture], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD','', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID],[picture], [status]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'US','', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID],[picture], [status]) VALUES (N'SE130363', N'Ngo Ha Tri Bao', N'1', N'AD','', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID],[picture], [status]) VALUES (N'SE140103', N'Phuoc Ha', N'1', N'US','', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID],[picture], [status]) VALUES (N'SE140119', N'Trai Nguyen', N'1', N'AD','', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID],[picture], [status]) VALUES (N'SE140130', N'Tam Tran', N'1', N'AD','', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID],[picture], [status]) VALUES (N'SE140201', N'PHAM HOANG TU', N'1', N'AD','', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID],[picture], [status]) VALUES (N'SE140969', N'Nguyen Gia Tin', N'123', N'US','', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID],[picture], [status]) VALUES (N'SE150443', N'LE MINH KHOA', N'1', N'US','', 1)

INSERT [dbo].[tblOrders] ([orderID], [userID], [total], [date],[status]) VALUES (N'OP1',N'admin', 1, CAST(N'2016-01-01' AS Date), 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [total], [date],[status]) VALUES (N'OP2',N'Hoadnt', 4, CAST(N'2016-01-02' AS Date), 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [total], [date],[status]) VALUES (N'OP3',N'SE130363', 4, CAST(N'2016-01-03' AS Date),  1)


INSERT INTO [dbo].[tblProducts] (productID, name, price, quantity,[picture],brand, status) VALUES (N'PEN01',N'Pen', 1.25, 100,'img/product/pic7.jpg',N'Thien Long', 1); 
INSERT INTO [dbo].[tblProducts] (productID, name, price, quantity,[picture],brand, status) VALUES (N'NTB01',N'Notebook', 5.99, 50,'img/product/pic6.jpg',N'Thien Long', 1); 
INSERT INTO [dbo].[tblProducts] (productID, name, price, quantity,[picture],brand, status) VALUES (N'BOK01',N'Book', 2.50, 25,'img/product/pic2.jpg',N'Thien Long', 1);  
INSERT INTO [dbo].[tblProducts] (productID, name, price, quantity,[picture],brand, status) VALUES (N'RUL01',N'Ruler', 3.50, 25,'img/product/pic8.jpg',N'Thien Long', 1);  
INSERT INTO [dbo].[tblProducts] (productID, name, price, quantity,[picture],brand, status) VALUES (N'CAL01',N'Caculator', 20.50, 25,'img/product/pic3.jpg',N'Thien Long', 1);  


INSERT INTO [dbo].[tblOrderDetail] (orderID, productID, price, quantity, status) VALUES (N'OP1',N'PEN01',1.25, 2, 1); -- 2 Pens
INSERT INTO [dbo].[tblOrderDetail] (orderID, productID, price, quantity, status) VALUES (N'OP2',N'NTB01', 5.99, 1, 1); -- 1 Notebook
INSERT INTO [dbo].[tblOrderDetail] (orderID, productID, price, quantity, status) VALUES (N'OP2',N'CAL01', 2.50, 3, 0); -- 3 Cals (out of stock)
INSERT INTO [dbo].[tblOrderDetail] (orderID, productID, price, quantity, status) VALUES (N'OP3',N'PEN01', 1.25, 1, 1); -- 1 Pen
INSERT INTO [dbo].[tblOrderDetail] (orderID, productID, price, quantity, status) VALUES (N'OP3',N'NTB01', 5.99, 2, 1); -- 2 Notebooks