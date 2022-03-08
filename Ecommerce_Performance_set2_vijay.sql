--SPRINT 5 E-COMMERCE_PERFORMANCE_SET_2

--1. Display the Order details of who are all ordered from country Australia?

select * from BUSINESS_SALES_TRANSACTION where country='Australia';

--2. Display the Country name in ascending order?

select distinct(country) from BUSINESS_SALES_TRANSACTION order by country asc;

--3. Count the Products sale in years between 2017 and 2018?

select count(productno) from BUSINESS_SALES_TRANSACTION where transactiondate like '%17' or transactiondate like '%18';

--4. Display the product list the price is above 2.01?

select productno,productname from BUSINESS_SALES_TRANSACTION where price>2.01;

--5. Count the products of price is below 2.04?

select count(distinct productno) from BUSINESS_SALES_TRANSACTION where price<2.04;