--SPRINT 5 E-COMMERCE_PERFORMANCE_SET_1

select * from BUSINESS_SALES_TRANSACTION;

--1. Count the Customers from each country?

select count(*),country from BUSINESS_SALES_TRANSACTION group by country;

--2. Count the customers from each year?

select count(*),extract(year from transactiondate) from BUSINESS_SALES_TRANSACTION group by extract(year from transactiondate);

--3. List all the unique product names sold from each year?

select productname,extract(year from transactiondate) from BUSINESS_SALES_TRANSACTION 
group by productname,extract(year from transactiondate);

--4. List all unique Product names sold from 2018-12-01 to 2019-02-27?

select distinct(productname) from BUSINESS_SALES_TRANSACTION where transactiondate 
between to_date('2018-12-01','YYYY-MM-DD') and to_date('2019-02-27','YYYY-MM-DD');

--5. Count the products sale in the year 2019?

select sum(quantity) from BUSINESS_SALES_TRANSACTION where transactiondate like '%19';

--6. Count the product sale in the year 2019 month-wise?

--select sum(quantity),extract(month from transactiondate) from BUSINESS_SALES_TRANSACTION where transactiondate like '%19'
--group by sum(quantity),extract(month from transactiondate);

--7. Total sale amount in each year?

select sum(price),extract(year from transactiondate) from BUSINESS_SALES_TRANSACTION group by extract(year from transactiondate);

--8. Total sale amount of each product in the year 2019?

select sum(price),productname from BUSINESS_SALES_TRANSACTION where transactiondate like '%19'
group by productname;

--9. Count each product sale in 2019 Feb month?

select count(*),productname from BUSINESS_SALES_TRANSACTION where transactiondate like '%FEB-19' group by productname;

--10. Total sale amount of each product month-wise in the year 2019? 



