
--                               CHECK CONSTARINT

-- It checks for certain records of that can be applied on the columns of a table, if this condition is not fullfilled , we will not
-- be able to insert records into the table

-- CASE 1 : Table does not exist

Create table test_check(
	EID int,
	firstname varchar(256),
	age tinyint check(age >= 10)
)

select * from test_check

insert into test_check 
values (1,'mayank','20')


insert into test_check 
values (2,'raj','9')

update test_check 
set EID = 11 
where EID = 1

--------------------------------------------------------------------------------------------------------------


-- CASE 2 : Table does exists and we need to check the constraint


alter table test_check
add check(EID > 5)




insert into test_check 
values (3,'mayank','20') -- WILL THROW ERROR


insert into test_check 
values (30,'mayank','20')

------------------------------------------------------------------------------------------------------

--                            DEFAULT CONSTRAINT


-- DEFAULT CONSTRAINT

-- This constraint to provide default values to the columns 

-- CASE 1 : The table does not exist

create table test_default(
	EID int default 5, -- so if you do not supply any value for EID column a default value of 5 will be assigned
	firstname varchar(256) default 'rohit',
	lastname varchar(256),
	age tinyint 
)

select *  from test_default


insert into test_default values(1,'Nitin','Jain',23)



insert into test_default(lastname,age)
values('singh',34)

------------------------------------------------------------------------------
--CASE 2 : The Table already exists 

alter table  test_default
add default 25 for age



insert into test_default(lastname)
values('jain')

----------------------------------------------------------------------------------------------------------



--                               PRIMARY KEY 


-- CASE 1 : When new table is to be created

create table test_pk_1(
EID int primary key,
Gender char(1),
Age tinyint,
firstname varchar(256)
)

select * from test_pk_1


insert into test_pk_1 values (1,'m',23,'mayank')

insert into test_pk_1 values (1,'f',23,'may') -- it will throw an error as it violates PK constraint

insert into test_pk_1 values (2,'m',23,'mayank')


insert into test_pk_1 
values (null,'m',25,'raj') -- it will throw an error again, bcz PK constraint does not allows NULL VALUES

------------------------------------------------------------------------------------------------------

truncate table test_pk_1

--CASE 2: Table Already Exists
alter table test_pk_1 
add primary key (age)   

-- this will throw an error and why bcz we have already defined PK for column EID and 
-- PK can be defined for one column only.

create table test_pk_2 (
	SID int not null unique,
	firstname nvarchar(256),
	age tinyint not null 

)

select * from test_pk_2 

alter table test_pk_2 
add primary key(SID)



--                               PRIMARY KEY 


-- CASE 1 : When new table is to be created

create table test_pk_1(
EID int primary key,
Gender char(1),
Age tinyint,
firstname varchar(256)
)

select * from test_pk_1


insert into test_pk_1 values (1,'m',23,'mayank')

insert into test_pk_1 values (1,'f',23,'may') -- it will throw an error as it violates PK constraint

insert into test_pk_1 values (2,'m',23,'mayank')


insert into test_pk_1 
values (null,'m',25,'raj') -- it will throw an error again, bcz PK constraint does not allows NULL VALUES

------------------------------------------------------------------------------------------------------

truncate table test_pk_1

--CASE 2: Table Already Exists
alter table test_pk_1 
add primary key (age)   

-- this will throw an error and why bcz we have already defined PK for column EID and 
-- PK can be defined for one column only.

create table test_pk_2 (
	SID int not null unique,
	firstname nvarchar(256),
	age tinyint not null 

)

select * from test_pk_2 

alter table test_pk_2 
add primary key(SID)

----------------------------------------------------------------------------



-- FOREIGN KEY CONSTRAINT

-- CASE 1 : When the new table has to be created
create table test_primaryKey(
	ID int primary key,
	name varchar(256)

)

select * from test_primaryKey

insert into test_primaryKey 
values 
(1,'mayank'),
(2,'Raj'),
(3,'Jayant')


------------------------------------------

create table test_foreignKey (
	ID int foreign key references test_primaryKey(ID),
	COURSE  varchar(256)

)

select * from test_foreignKey

insert into test_foreignKey
values 
(1,'A')


insert into test_foreignKey
values 
(null,'B')

insert into test_foreignKey
values 
(5,'C') 
-- it will throw an error 
-- As we knopw these two tables are
-- related to each other through Pk and Fk constraints
-- since FK is a subset of PK

-- inserting the ID=5 will throw an error

-- so this is called REFERENTIAL INTEGRITY AND IT IS
-- MAINTAINED THROUGH THE FOREIGN KEY 


---------------------------------------------------
-- CASE 2: Table already exists

create table test_foreign_key_2 (
		ID int, 
		course varchar(256)
)

-- table already exists and we need to define 
-- foreign key constraint , this is how we will do it

alter table test_foreign_key_2
add foreign key (ID) references test_primaryKey(ID)

-------------------------------------------------------------------------
--    ORDER OF EXECUTION


select * from EmployeeSalaries

select distinct top 1 Department, 
AVG(salary) [Avg Salary] 

from EmployeeSalaries
where Salary > 50000

group by Department

having AVG(salary) > 55000

order by Department 


-- order of execution

-- 1. FROM & JOINS 
-- 2. where
-- 3. group by
-- 4. Having
-- 5. select 
-- 6. distinct
-- 7. Top 

-- so as we can see we have given alias name to the column salary as avg salary after
-- calculating the avg

-- so if we try to put that alias name into having clause it will throw an error
-- why?

-- it is not being recognised in the having clause bcz

-- HAVING IS EXECUTED FIRST
-- SELECT IS EXECUTED AFTER HAVING 


-- so the column definations and the names of the columns
-- are basically declared in the select statement


-- so select statement is executed after the having clause

-- IT MEANS ALIAS NAMES WILL BE DECLARED AFTER 
-- HAVING CLAUSE IS EXECUTED













































