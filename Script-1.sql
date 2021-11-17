--create table 
CREATE TABLE STUDENTS (
FirstName varchar(255),
LastName varchar(255),
class varchar(255)
);
--add data into table
insert into students values ('tariq','nawaz','five'),
('danish','ali','four'),
('Nasrullah','jokhio','five'),
('hayat','nawaz','nine')
--create table
CREATE TABLE CUSTOMER_INFO (
customer_name varchar(255),
customer_id int not null unique,
product_id int,
phone_Number int,
primary key(customer_id)
);


--add data into table
insert into customer_info values ('tariq',1,111,03172102315),
('danish',2,112,03128939387),
('Nasrullah',3,111,03198993393),
('hayat',4,113,03212605149)

--view the table
select * from customer_info

--alias 
select c.customer_name as Name , c.customer_id as identification_Number ,c.phone_Number as CELL from customer_info as c;

--So from Now we are going to start some book tasks under 'on Your Own' heading 

--Start Writing Your Query
--ON YOUR OWN:
--» Add another eld from the customers table to this query. Try
--adding the Company or Phone eld to our sTunes mailing list.

alter table customer_info 
add company varchar(255);

--update company column value of all record as RAdo
update customer_info set company = 'Rado'


--Adding an Alias to Your Columns
--ON YOUR OWN:
	--» Add another eld to this query and give it an alias.
	--» Practice changing the alias syntax and omitting the AS keyword
	--entirely. 
--	Does this have any e ect on your output?
--  Yes it will change field name in output but not in database.



select companyAdd as "Company Addrees" from customer_info;

--Using the ORDER BY Clause

--Here we will use student table

--ON YOUR OWN:
--» Rearrange the fields in the SELECT clause so that LastName is
--the first column instead of the second. Order the output by
--LastName . Does this make the list more readable? 

select s.lastname , s.firstname from students s order by s.lastname   -- by default it will set Asscending order

--CHAPTER 5 HAS STARTED FROM HERE

--Comparison, Logical, and Arithmetic Operators
--ON YOUR OWN:
--» Using the example query above, show the Total eld from
--invoices with a 15 percent tax added. 

--here in our case we don't have invoice table we create field of company price
--for that our table of customer info don't have any price or total name field so first we will add field of company price 
alter table customer_info 
add Company_price float;


--now add values
update customer_info
set company_price = 300
where product_id = 111;

update customer_info
set company_price = 400
where product_id = 112;

update customer_info
set company_price = 500
where product_id = 113;




select * from customer_info;
--Now real work start from here

select
company_price as "OriginalAmount",
company_price + (company_price /100 *15) as "TotalAmount"
from
customer_info;

--Filtering Records by Numbers with the where Clause

--ON YOUR OWN:
--Using comparison operators, try out the following queries:
--» Write a query that returns all invoices that are greater than 1.98.
--» Write a query that returns all invoices that are greater than or
--equal to 1.98.
--» Write a query that returns all invoices that are not 1.98.


--for that we should add smaller value because our company price field has no lower value so first add some small values


update customer_info
set company_price = 0.5
where product_id = 114;

update customer_info
set company_price = 1.98
where product_id = 115;


insert into customer_info values ('ahmad',5,114, 3122102315, 'Rado',0.5 ),('tanveer', 6 ,115, 3182102318,'Rado',1.98);
--1.
select *  
from customer_info
where company_price > 1.98;

--2.
select *  
from customer_info
where company_price >= 1.98;


--3.
select *  
from customer_info
where company_price <> 1.98;

--ON YOUR OWN:
--» Order the previous query by the Total field. What is the
--highest invoice amount in this dataset? 

--for that first we should keep in our mind that our table don't have table field so we will perform this task to company price field

select *   
from customer_info
order by company_price desc ;

--ON YOUR OWN:
--» How many records does the query above return?
--» Write a query that lists all invoices that are $13.86, $18.86, and
--$21.86.
--our company price don't have these value so first we will add these record 

insert into customer_info values('fahad',7,116, 3116351360, 'Rado', 13.86),('bilal',8,117, 3116351460, 'Rado', 18.86),('kashif',9,118, 3116355560, 'Rado', 21.86);  


select company_price , count(company_price)   
from customer_info
group by company_price desc ;


select * from customer_info 
where company_price in (13.86 , 18.86, 21.86);

--Filtering Records by Date

--ON YOUR OWN:
--» Get all invoices that were issued between January 1, 2009, and December 31, 2009.
--» Find the top 10 highest value invoices that occurred after July 5, 2009.

--we first add new field  invoice data
alter table customer_info 
add column invoiceDate date
;

update customer_info
set invoiceDate = '01-01-2009'
where product_id = 111;

update customer_info
set invoiceDate = '01-05-2009'
where product_id = 112;

update customer_info
set invoiceDate = '01-10-2010'
where product_id = 113;

update customer_info
set invoiceDate = '01-11-2009'
where product_id = 114;

update customer_info
set invoiceDate = '12-31-2009'
where product_id = 115;

update customer_info
set invoiceDate = '01-02-2009'
where product_id = 116;

update customer_info
set invoiceDate = '07-15-2009'
where product_id = 117;

update customer_info
set invoiceDate = '07-01-2009'
where product_id = 118;

--now the real work start 
--1.
select * from customer_info 
where invoiceDate between '01-01-2009' and '12-31-2009';
--2.
select * from customer_info 
where invoiceDate > '07-05-2009'
ORDER BY
company_price desc;

--Using the AND and OR Operators with Two Separate Fields

--ON YOUR OWN:
--» Find all invoices whose billing city starts with P and whose total is greater than $2.00.

--so again for that we should add billing city field

alter table customer_info 
add column billingCity varchar(255);

update customer_info 
set billingCity = 'karachi'
where customer_id =1;

update customer_info 
set billingCity = 'karachi'
where customer_id =2;

update customer_info 
set billingCity = 'peshawar'
where customer_id =3;

update customer_info 
set billingCity = 'lahore'
where customer_id =4;

update customer_info 
set billingCity = 'quetta'
where customer_id =5;

update customer_info 
set billingCity = 'hyderabad'
where customer_id =6;

update customer_info 
set billingCity = 'peshawar'
where customer_id =7;

update customer_info 
set billingCity = 'lahore'
where customer_id =8;

update customer_info 
set billingCity = 'peshawar'
where customer_id =9;

select * from customer_info ci ;

--so now all data has added
--again start real world

select *
from customer_info 
where billingCity like '%p%' and company_price > 2;

--Using Parentheses with AND and OR to Specify the Order of Operations

--ON YOUR OWN:
--» Run the query again and observe if there are any values in the Total column that are less than $1.98.
--» Find all invoices that have total values higher than $3.00 whose billing city starts with P or h.
--1.
select *
from customer_info 
where billingCity like 'p%' and company_price < 1.98;
--2.
select *
from customer_info 
where company_price > 3 and billingCity like 'p%' or billingCity like 'h%';

--Chapter 5 ended





