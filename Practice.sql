

create database [SQL Basics Questions]

use [SQL Basics Questions]

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(1, 'John', 'Doe', 'HR', 55000.00),
(2, 'Jane', 'Smith', 'IT', 75000.00),
(3, 'Emily', 'Jones', 'Finance', 65000.00),
(4, 'Michael', 'Brown', 'IT', 80000.00),
(5, 'Sarah', 'Davis', 'HR', 60000.00),
(6, 'David', 'Wilson', 'Finance', 70000.00),
(7, 'Laura', 'Garcia', 'IT', 72000.00),
(8, 'Robert', 'Miller', 'HR', 58000.00),
(9, 'Sophia', 'Martinez', 'Finance', 67000.00),
(10, 'James', 'Anderson', 'IT', 81000.00);
------------------------------------------------------------------------------------------------------------------------------------


select * from employees


-- --1) How do you select all columns from the Employees table?

select * from Employees

-- --2) How do you select only the FirstName and Last Name columns from the Employees table?

select 
    Firstname,
    LastName
from Employees

select concat(firstname,lastname) [FullName] from Employees

-- --3) How do you find all employees who work in the 'IT' department?

select * from Employees
where Department = 'IT'
-- --or



-- --4) How do you select employees with a salary greater than 70,000?

select * from Employees
where salary > 70000

-- --5) How do you sort the results by Last Name in ascending order?

select * from Employees
order by lastname 


-- --6) How do you select distinct departments from the Employees table?

select distinct Department 
from employees 

-- --7) How do you count the number of employees in each department?


select 
    Department,
    count(*) [Total No. of Employees]
from Employees

GROUP BY Department



-- --8) How do you find the maximum salary in the Employees table?

select 
    max(salary) [Maximum_Salary]
from Employees

-- --9) How do you find the average salary of employees in the 'Finance' department?

select 
    avg(salary) [Finance Average]

from Employees

where Department = 'Finance'





-- --10) How do you select employees whose last name starts with 'M'?

select * from Employees
where lastname like 'M%'

------------------------------------------------------------------------------------------------------------------------------------------



select * from Employees

--1. How do you select employees who work in the 'IT' department and have a salary greater than 75,000?

select 
    * 
from 
    Employees
Where 
    (Department in ('IT') and Salary >= 75000)




--2. How do you find employees who work in the 'HR' department or have a salary less than 60,000?

select * 
from Employees
where (Department in ('HR') OR Salary < 60000)





--3. How do you select employees who do not work in the 'Finance' department?

select * 
from Employees
Where  Department not in ('Finance')

--or


select * 
from Employees
Where  Department IN ('HR','IT')


--4. How do you find employees whose salary is between 60,000 and 70,000 and who work in the 'Finance' department?

select * 
from Employees
where ( Department in('Finance')  and Salary between 60000 and 70000)

--5. How do you find employees who work in the 'IT' department and do not have a salary greater than 80,000?

select * 
from Employees
where  (Department in ('IT') and salary<=80000 )

--or


select * 
from Employees
where  (Department in ('IT') and not salary > 80000 )


--6. How do you find employees who work in the 'HR' or 'Finance' departments and have a salary greater than 65,000?


select * from Employees
where (Department in ('HR') OR Department in ('Finance')) and salary > 65000

--7. How do you select employees whose last name starts with 'D' and do not work in the 'HR' department?

select * from Employees
where lastname like 'D%' and  Department not in ('HR')

--8. How do you find employees who do not work in the 'IT' department and have a salary greater than 70,000?

select * 
from Employees
where not Department = 'IT' and Salary > 70000


--9. How do you select employees who work in the 'IT' department and either have a salary greater 
--than 75,000 or have the first name 'Laura'?

select *
from Employees
where Department = 'IT' and (salary > 75000 OR FirstName = 'Laura')


--10. How do you find employees who do not work in the 'HR' or 'IT' departments?

select * 
from Employees 
where Department NOT IN ('HR','IT')


























































