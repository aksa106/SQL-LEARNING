
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


-- ROUND 2 — Data Retrieval + Filtering + Sorting + Aggregation

-- Answer carefully.

-- Q1

-- Show top 2 cheapest products.

select top 2 * from Products
order by price 


-- Q2

-- Show customers whose email contains the letter 'a'.

select * from customers 
where email like '%a%'

-- Q3

-- Show total number of orders that are either 'Pending' or 'Shipped'.

select count(*) AS [Total ORders]
from Orders
where Orderstatus in ('Pending','Shipped')


-- (Return just one number.)

-- Q4

-- Show average order amount for each OrderStatus.
select avg(TotalAmount) [AVG]
, OrderStatus 
from Orders
Group by OrderStatus


-- Q5

-- Show categories where total stock (sum of StockQty) is greater than 30.


select sum(StockQty) [Sum of StockQty],
Category
from Products
group by Category
having sum(StockQty) > 30


-------------------------------------------------------------------------------------------------------------
-- ROUND 3 — Slightly Harder
-- Q1

-- Show the second most expensive product. (Not TOP 2.)

select * from products
order by price DESC

-- Q2

-- Show number of customers whose first name starts with a vowel.

select * from customers 
where FirstName like '[aeiou]%'

-- Q3

-- Show total revenue for each month. (Based on OrderDate.)

select * from Orders
select * from OrderDetails 

-- Q4

-- Show the highest order amount per customer.

select * from Orders


-- Q5

-- Show categories where average price is lower than overall average price of all products.




------------------------------------



-- QUESTION 1

-- From Products table:

-- Show the top 2 categories (by total stock)
-- where:

-- Category name starts with a letter between A and M

-- Only include categories where average price is greater than 1500

-- Sort by total stock descending

-- Return:

-- Category

-- TotalStock

-- AveragePrice

select * from products
select top 2
Category,
sum(StockQty) [Total stock],
avg(Price) [Average Price]
from products

where Category like '[A-M]%' 


group by Category, Price

having avg(Price) > 1500

order by [Total stock] desc






--------------------------------------------------------------------------------------------
-- QUESTION 2

-- Show number of customers
-- whose email ends with 'gmail.com'
-- and only show result if count > 1
-- sorted descending.

-- This uses:

-- LIKE

-- COUNT

-- GROUP BY

-- HAVING

-- ORDER BY

-- No new functions.
-- select * from Customers


select 
Email,
count(CustomerID) [Total No. of Customers]
from customers

where email like '%g%'

Group by email 

having count(CustomerID) > 1

order by count(CustomerID) desc








