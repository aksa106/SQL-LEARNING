
-- 🔥 PRACTICE ROUND 1 (Warm-up – Single Table)
-- Q1

-- Show all customers.

select * from customers

-- Q2

-- Show only customers who signed up today.

-- (Hint: compare SignUpDate with today’s date.)

select * from Customers
where SignUpDate = "24-02-2026"


-- Q3

-- Show products that are active and cost more than 2000.

Select * from Products
where IsActive=1 and Price > 2000


-- Q4

-- Show orders that are not delivered.

select * from Orders
where OrderStatus <> 'Delievered'

-- Q5

-- Show total number of products in inventory (sum of StockQuantity).


select sum(StockQty) [Total_no_products]
from products



------------------------------------------------------------------------------------------------------------------------


-- 🔥 ROUND 2 — Filtering Mastery
-- Q1

-- Show customers whose FirstName starts with 'A'.

select * from Customers
where FirstName like 'A%'

-- Q2

-- Show products where price is between 1000 and 2600.
select * from Products
where price between 1000 and 2600

-- Q3

-- Show orders where status is NOT 'Delivered'.
select * from Orders
where OrderStatus <> 'Delivered'
-- Q4

-- Show products where Category is either 'Corset' or 'Accessory'.

-- Use IN.
select * from Products
where Category in('Corset','Accessory')

-- Q5

-- Show customers whose email does NOT end with 'gmail.com'.

-- Use NOT LIKE.

select * from Customers
where email not like '%gmail.com'

-------------------------------------------------------------------------------------------------------------------------------------
-- HOUR 1 - SINGLE TABLE MASTERY 

-- Q1

-- Show top 3 most expensive products.

select top 3   max(price) [most expensive products]
from Products 
group by ProductID

-- i needed to select top 3 most expensive products
-- grouping , aggregate , and max(price) is meaningless
-- i just needed top + order by


select  * from Products
order by price  -- price will get ordered by asc order

--now correct code
select top 3 * from products
order by price desc

-- Q2

-- Show customers whose first name has exactly 5 letters.

-- (Hint: use _ underscore)

select * from Customers
where FirstName like '%_____%'
-- wrong pattern
-- %_____% means any name containing 5 charachters anywhere not exactly 5 chars
-- correct code 
select * from Customers
where Firstname like '_____'



-- Q3

-- Show total revenue (sum of TotalAmount) from delivered orders only.

select * from Orders 
where OrderStatus in ('Delivered')

-- correct version
select SUM(totalamount) AS TotalRevenue
From Orders
where OrderStatus = 'Delivered'


-- Q4

-- Show number of orders per status.

select  OrderStatus, count(OrderStatus)[Category]

from Orders
group by OrderStatus


-- Q5

-- Show categories where average product price is greater than 2000.

select category, avg(price) as avgPrice
from Products
group by Category
having avg(Price) > 2000

------------------------------------------------------------------------------------------------------------------------




































