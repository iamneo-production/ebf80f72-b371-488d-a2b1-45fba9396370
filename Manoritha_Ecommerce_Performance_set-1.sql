--> 1.count the number of customers from each country
select country,count(CUSTOMERNO) from BUSINESS_SALES_TRANSACTION 
group by COUNTRY;


--> 2.count the customers from each year
select extract(year from transactiondate),count(*)
from BUSINESS_SALES_TRANSACTION
group by extract(year from TRANSACTIONDATE);


--> 3. List all the unique product names sold from each year

select extract(year from transactiondate),PRODUCTNAME
from BUSINESS_SALES_TRANSACTION 
group by extract (year from TRANSACTIONDATE),productname;

--> 4. List all unique Product names sold from 2018-12-01 to 2019-02-27

select distinct(productname) 
from BUSINESS_SALES_TRANSACTION
where transactiondate 
between to_date('2018-DEC-01','YYYY-MON-DD') and to_date('2019-FEB-27','YYYY-MON-DD');

--> 5. Count the products sale in the year 2019

select sum(quantity) as productsale
from BUSINESS_SALES_TRANSACTION 
group by extract(year from transactiondate) 
having extract (year from TRANSACTIONDATE) = '2019';


--> 6. Count the product sale in the year 2019 month-wise

select sum(quantity)as productsale_monthwise, to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month 
from BUSINESS_SALES_TRANSACTION 
where extract (year from TRANSACTIONDATE) = '2019'
group by extract(month from transactiondate); 

--> 7. Total sale amount in each year

select sum ( price * quantity ) as TotalSale_Amount ,extract (year from TRANSACTIONDATE) as Year 
from BUSINESS_SALES_TRANSACTION 
group by extract (year from TRANSACTIONDATE);


--> 8. Total sale amount of each product in the year 2019

select sum ( price * quantity ) as TotalSale_Amount ,PRODUCTNAME
from BUSINESS_SALES_TRANSACTION where extract (year from TRANSACTIONDATE) = '2019'
group by PRODUCTNAME;

--> 9. Count each product sale in 2019 Feb month

select sum(quantity)as productsale_feb_2019  
from BUSINESS_SALES_TRANSACTION 
where extract (year from TRANSACTIONDATE) = '2019' and extract (month from TRANSACTIONDATE) = '02'
group by extract(month from transactiondate); 


--> 10. Total sale amount of each product month-wise in the year 2019 

select sum(PRICE * QUANTITY)as Totalsale_Amount_monthwise, to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month 
from BUSINESS_SALES_TRANSACTION 
where extract (year from TRANSACTIONDATE) = '2019'
group by extract(month from transactiondate); 

--------------------------------------------------------------------------------------------------------------------------------------------------

-->Procedures

--> 1.
create or replace procedure EachCountry_customer_count
as
begin
for i in (select country,count(customerno) cc
from business_sales_transaction 
group by country) loop
dbms_output.put_line(i.country ||'      '||i.cc);
end loop;
end;

begin
--count_custno();
EachCountry_customer_count();
end;

-- drop procedure EachCountry_customer_count;

----------------------------------------------------------------------------------------------------------------------------------------------------------

--> 2.
create or replace procedure Eachyear_customer_count 
as
begin
for i in (select extract(year from transactiondate) aa,count(*) cc
from BUSINESS_SALES_TRANSACTION
group by extract(year from TRANSACTIONDATE))loop
dbms_output.put_line(i.aa ||'      '||i.cc);
end loop;
end;

begin
Eachyear_customer_count();
end;

-- drop procedure Eachyear_customer_count ;

-----------------------------------------------------------------------------------------------------------------------------------------------------

---> 3.
create or replace procedure Unique_products_sold_each_year
as
begin
for i in(select extract(year from transactiondate)aa,PRODUCTNAME cc
from BUSINESS_SALES_TRANSACTION 
group by extract (year from TRANSACTIONDATE),productname) loop
dbms_output.put_line(i.aa ||'      '||i.cc);
end loop;
end;

begin
Unique_products_sold_each_year();
end;

-- drop procedure Unique_products_sold_each_year;

---------------------------------------------------------------------------------------------------------------------------------------------

--> 4.
create or replace procedure Unique_products_sold
as
begin
for i in(select distinct(productname) cc
from BUSINESS_SALES_TRANSACTION
where transactiondate 
between to_date('2018-DEC-01','YYYY-MON-DD') and to_date('2019-FEB-27','YYYY-MON-DD')) loop
dbms_output.put_line(i.cc);
end loop;
end;

begin 
Unique_products_sold();
end;

-- drop procedure Unique_products_sold

---------------------------------------------------------------------------------------------------------------------------------------------

--> 5.
create or replace procedure  Product_sale_2019
as 
BEGIN
for i in (select sum(quantity) as productsale
from BUSINESS_SALES_TRANSACTION 
group by extract(year from transactiondate) 
having extract (year from TRANSACTIONDATE) = '2019')loop
dbms_output.put_line(i.productsale);
end loop;
END;

begin
Product_sale_2019();
end;

-- drop Product_sale_2019;
---------------------------------------------------------------------------------------------------------------------------------------------

--> 6.
create or replace procedure Product_sale_2019_monthwise
as 
begin
for i in (select sum(quantity)as productsale_monthwise, to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month 
from BUSINESS_SALES_TRANSACTION 
where extract (year from TRANSACTIONDATE) = '2019'
group by extract(month from transactiondate)) loop
dbms_output.put_line(i.productsale_monthwise ||'      '||i.month);
end loop;
end;

begin
Product_sale_2019_monthwise();
end;

-- drop procedure Product_sale_2019_monthwise;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--> 7.
create or replace procedure Total_sale_amount_each_year
as
BEGIN
for i in(select sum ( price * quantity ) as TotalSale_Amount ,extract (year from TRANSACTIONDATE) as Year 
from BUSINESS_SALES_TRANSACTION 
group by extract (year from TRANSACTIONDATE))loop
dbms_output.put_line(i.TotalSale_Amount ||'      '||i.Year);
end loop;
END;

begin
Total_sale_amount_each_year();
end;

-- drop procedure Total_sale_amount_each_year;

-------------------------------------------------------------------------------------------------------------------------------------------------

--> 8.
create or replace procedure Total_sale_amount_each_product_2019
as 
begin
for i in (select sum ( price * quantity ) as TotalSale_Amount ,PRODUCTNAME cc
from BUSINESS_SALES_TRANSACTION where extract (year from TRANSACTIONDATE) = '2019'
group by PRODUCTNAME)loop
dbms_output.put_line(i.TotalSale_Amount ||'      '||i.cc);
end loop;
END;

begin
Total_sale_amount_each_product_2019();
end;

-- drop procedure Total_sale_amount_each_product_2019;

--------------------------------------------------------------------------------------------------------------------------------------------

--> 9.
create or replace procedure Each_product_sale_feb_2019
as
begin
for i in (select sum(quantity)as productsale_feb_2019
from BUSINESS_SALES_TRANSACTION 
where extract (year from TRANSACTIONDATE) = '2019' and extract (month from TRANSACTIONDATE) = '02'
group by extract(month from transactiondate))loop
dbms_output.put_line(i.productsale_feb_2019);
end loop;
end;

begin
Each_product_sale_feb_2019();
end;

-- drop procedure Each_product_sale_feb_2019;

---------------------------------------------------------------------------------------------------------------------------------------------

--> 10.
create or replace procedure  Total_sale_amount_each_product_2019_month
as
begin
for i in (select sum(PRICE * QUANTITY)as Totalsale_Amount_monthwise, 
to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month 
from BUSINESS_SALES_TRANSACTION 
where extract (year from TRANSACTIONDATE) = '2019'
group by extract(month from transactiondate))loop
dbms_output.put_line(i.Totalsale_Amount_monthwise ||'      '||i.Month);
end loop;
end;

begin
Total_sale_amount_each_product_2019_month();
end;

-- drop procedure Total_sale_amount_each_product_2019_month;

-------------------------------------------------------------------------------------------------------------------------------------------------------------


