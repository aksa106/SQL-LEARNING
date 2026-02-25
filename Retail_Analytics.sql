-- CREATE DB


USE RetailAnalytics;

-- CREATE ALL THE TABLES

------------------------------------------

-- TABLE STRUCTURE

-- CUSTOMERS TABLE


CREATE TABLE Customers(

	CustomerID  INT PRIMARY KEY IDENTITY(1,1),
	FirstName   VARCHAR(50) NOT NULL,
    LastName    VARCHAR(50) NOT NULL,
	Email       VARCHAR(255) NOT NULL UNIQUE,
	PhoneNumber VARCHAR(15) NOT NULL,
	SignUpDate  DATETIME2 NOT NULL DEFAULT GETDATE()

)

select * from Customers
---------------------------------------------------------------------------------------------------------------------

--PRODUCTS TABLE

Create table Products(

	ProductID   INT PRIMARY KEY IDENTITY(1,1),
	ProductName VARCHAR(100) NOT NULL,
	Category    VARCHAR(50) NOT NULL,
	Price       DECIMAL(10,2) NOT NULL CHECK (Price >=0),
	StockQty    INT NOT NULL CHECK(StockQty >=0),
	IsActive    BIT NOT NULL DEFAULT 1
	

)
select * from Products

-----------------------------------------------------------------------------------------

-- ORDER TABLE

Create table Orders(

	OrderID    INT PRIMARY KEY IDENTITY(1,1),
	CustomerID INT NOT NULL,
	OrderDate  DATETIME2 NOT NULL DEFAULT GETDATE(),
	TotalAmount DECIMAL(10,2) NOT NULL CHECK (TotalAmount >=0),
	OrderStatus VARCHAR(20) NOT NULL CHECK (OrderStatus IN ('Pending','Shipped','Delivered','Cancelled'))


)
select * from Orders
---------------------------------------------------------------------------------------------------

-- ORDER DETAILS

CREATE TABLE OrderDetails (
	
	OrderDetailID    INT PRIMARY KEY IDENTITY(1,1),
	OrderID          INT NOT NULL,
	ProductID        INT NOT NULL,
	Quantity         INT NOT NULL CHECK(Quantity>0),
	UnitPrice        DECIMAL(10,2) NOT NULL CHECK(UnitPrice >=0)

)
select * from OrderDetails
----------------------------------------------------


-- PAYMENTS TABLE

CREATE TABLE payments(

	PaymentID  INT PRIMARY KEY IDENTITY(1,1),
	OrderID    INT NOT NULL,
	PaymentDate DATETIME2 NOT NULL DEFAULT GETDATE(),
	AmountPaid  DECIMAL(10,2) NOT NULL CHECK(AmountPaid >=0),
	PaymentMethod VARCHAR(20) NOT NULL CHECK (PaymentMethod IN ('UPI','Card','Cash','NetBanking')),
	PaymentStatus VARCHAR(20) NOT NULL CHECK (PaymentStatus IN ('Completed','Failed','Refunded'))

)
select * from payments

-----------------------------------------------------------------------------------------------------------------------------------



-- ADDING FOREIGN KEYS

ALTER TABLE ORDERS
ADD CONSTRAINT FK_ORDERS_CUSTOMERS
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)


--ORDER DETAILS -> ORDERS

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Orders
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID)


--ORDER DETAILS -> PRODUCTS
ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Products
FOREIGN KEY (ProductID)
REFERENCES Products(ProductID)

--payments -> orders

ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_Orders
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID);



select * from Orders



------------------------------------------------------------------------------------------------------------------------




















































































