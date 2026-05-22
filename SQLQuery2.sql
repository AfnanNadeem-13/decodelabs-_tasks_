-- Create Database---
Create Database Ecommerce_data;
Go 

Use Ecommerce_data;
Go

---
Drop Table Sales_Customer_Trends;
Go
---

---Create Table---
Create Table Sales_Customer_Trends(
OrderID varchar (50),
Date Date,
CustomerID varchar (100),
Product varchar (50),
Quantity varchar (50),
UnitPrice varchar (50),
ShippingAddress varchar (200),
PaymentMethod varchar (50),
OrderStatus varchar (50),
TranckingNumber varchar (100),
ItemsInCart varchar (50),
CouponCode varchar (100),
ReferralSource varchar (100),
TotalPrice varchar (50),
Month varchar (50),
Year varchar (Max) 
);
Go

---Import Dataset---
Bulk insert Sales_Customer_Trends
From 'D:\Downloads\Dataset for Data Analytics.csv'
With (
 Firstrow = 2,
 Fieldterminator = ',',
 Rowterminator = '0x0A',
 Tablock,
 Keepnulls
 );
 GO

 ---Using keys in Queries--
 Select AVG(Cast(TotalPrice as float))
 From Sales_Customer_Trends;

 SELECT TOP 20 TotalPrice
FROM Sales_Customer_Trends;

Select SUM(Cast (Quantity as int))
from Sales_Customer_Trends;

Select *
from Sales_Customer_Trends
Order by CAST(TotalPrice as float) desc;

Select COUNT (*) as TotalOrders
From Sales_Customer_Trends;

Select *
from Sales_Customer_Trends
Where OrderStatus = 'Delivered';

---Revenue Analysis---

Select SUM(TRy_CAST (Totalprice as Float)) as TotalRevenue
from Sales_Customer_Trends;


Select AVG(TRY_CAST(TotalPrice as float)) as AverageRevenue
from Sales_Customer_Trends;

Select top 5 *
from Sales_Customer_Trends
Order by TRY_CAST( TotalPrice as float) desc;

Select Top 5 *
from Sales_Customer_Trends
Order by TRY_CAST (TotalPrice as float ) Asc;

Select PRODUCT,
Sum(TRY_CAST(TotalPrice as Float )) as TotalSales
From Sales_Customer_Trends
Group by Product
Order by TotalSales desc;

---Payment Analysis---

Select PaymentMethod,
Count (*) as TotalOrder
From Sales_Customer_Trends
Group by PaymentMethod;


_--- Monthly Sales---
Select Month,
Sum (TRY_CAST(TotalPrice as float)) as MonthlySales
from Sales_Customer_Trends
Group by Month;


_---Yearly Sales---
Select Year,
Sum (TRY_CAST(TotalPrice as float )) as yearlySales
from Sales_Customer_Trends
Group by Year;

Select Distinct OrderStatus
from Sales_Customer_Trends;

Select 
MAX (Try_Cast (TotalPrice as float)) as HighestSales,
MIn (Try_Cast (TotalPrice as float)) as LowestSales
from Sales_Customer_Trends;

Select top 20*
from Sales_Customer_Trends;