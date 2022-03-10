--> 1. Display the Order details of who are all ordered from country Australia

select * from BUSINESS_SALES_TRANSACTION where COUNTRY='Australia';

--> 2.Display the Country name in ascending order

select distinct(COUNTRY)  from BUSINESS_SALES_TRANSACTION order by COUNTRY;

--> 3.Count the Products sale in years between 2017 and 2018

SELECT count(productname) 
from BUSINESS_SALES_TRANSACTION
where extract(year from TRANSACTIONDATE) 
BETWEEN '2017' and '2018';

--> 4.Display the product list the price is above 2.01

select PRODUCTNAME,PRICE from BUSINESS_SALES_TRANSACTION where PRICE>2.01;

--> 5.Count the products of price is below 2.04

select COUNT(DISTINCT PRODUCTNO) from BUSINESS_SALES_TRANSACTION
where PRICE<2.04;

--------------------------------------------------------------------------------------------------------------------------------------------

--> Procedures

--> 1.

create or replace procedure OrderDetails_Of(country_name varchar)
as
begin
for i in (SELECT * from BUSINESS_SALES_TRANSACTION
where COUNTRY =country_name) loop
dbms_output.put_line(i.TRANSACTIONNO||'  '||i.TRANSACTIONDATE||'  '||i.PRODUCTNO||'  '||i.PRODUCTNAME||'  '||i.PRICE||'  '||i.QUANTITY||'  '||i.CUSTOMERNO);
end loop;
end;

begin
OrderDetails_Of('Australia');
end;

-- drop OrderDetails_Of();

----------------------------------------------------------------------------------------------------------------------------------------

--> 2.

create or replace procedure Country_ascending_order
as
begin
for i in (select distinct(COUNTRY) cc from BUSINESS_SALES_TRANSACTION order by COUNTRY) loop
dbms_output.put_line(i.cc);
end loop;
end;

begin 
Country_ascending_order();
end;



---------------------------------------------------------------------------------------------------------------------------------------------

--> 3.

create or replace procedure Product_sale_between_years(start_year number,end_year number)
as
begin
for i in(SELECT count(productname) cc
from BUSINESS_SALES_TRANSACTION
where extract(year from TRANSACTIONDATE) 
BETWEEN '2017' and '2018')loop
dbms_output.put_line(i.cc);
end loop;
end;

begin
Product_sale_between_years(2017,2018);
end;



---------------------------------------------------------------------------------------------------------------------------------------------

--> 4.

create or replace procedure Product_list_above(min_price number)
as
begin
for i in (select PRODUCTNAME aa,PRICE bb from BUSINESS_SALES_TRANSACTION where PRICE>min_price)loop
dbms_output.put_line(i.aa ||'      '||i.bb);
end loop;
end;

begin
Product_list_above(2.01);
end;



--------------------------------------------------------------------------------------------------------------------------------------------

--> 5. 
create or replace procedure Count_of_products_below(max_price number)
as
begin
for i in (select COUNT(DISTINCT PRODUCTNO) cc from BUSINESS_SALES_TRANSACTION where PRICE<max_price)loop
dbms_output.put_line(i.cc);
end loop;
end;

begin
Count_of_products_below(2.01);
end;


-------------------------------------------------------------------------------------------------------------------------------------------