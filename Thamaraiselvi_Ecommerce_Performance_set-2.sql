--> 1. Display the Order details of who are all ordered from country Australia


create or replace procedure OrderDetails(country_name varchar)
as
begin
for i in (SELECT * from BUSINESS_SALES_TRANSACTION
where COUNTRY =country_name) loop
dbms_output.put_line(i.TRANSACTIONNO||'  '||i.TRANSACTIONDATE||'  '||i.PRODUCTNO||'  '||i.PRODUCTNAME||'  '||i.PRICE||'  '||i.QUANTITY||'  '||i.CUSTOMERNO);
end loop;
end;

begin
OrderDetails('Australia');
end;



--> 2.Display the Country name in ascending order


create or replace procedure Countryname
as
begin
for i in (select distinct(COUNTRY) as country from BUSINESS_SALES_TRANSACTION order by COUNTRY)
loop
dbms_output.put_line(i.country );
end loop;
end;

begin
Countryname();
end;


--> 3.Count the Products sale in years between 2017 and 2018

create or replace procedure Productsale
as
begin
for i in (SELECT count(productname) as productname 
from BUSINESS_SALES_TRANSACTION
where extract(year from TRANSACTIONDATE) 
BETWEEN '2017' and '2018')
loop
dbms_output.put_line(i.productname );
end loop;
end;

begin
Productsale();
end;


--> 4.Display the product list the price is above 2.01


create or replace procedure Product_price_above(min_price number)
as
begin
for i in ( SELECT PRODUCTNAME,PRICE FROM BUSINESS_SALES_TRANSACTION WHERE price > min_price) loop
dbms_output.put_line(i.Productname||'  '||i.price);
end loop;
end;

begin
Product_price_above(2.01);
end;



--> 5.Count the products of price is below 2.04


create or replace procedure Productprice(max_price number)
as
begin
for i in (select COUNT(DISTINCT PRODUCTNO) as productno from BUSINESS_SALES_TRANSACTION
where PRICE<max_price)
loop
dbms_output.put_line(i.productno );
end loop;
end;

begin
Productprice(2.04);
end;

----------------------------------------------------------------------------------------------------

-->>Query

SELECT * from BUSINESS_SALES_TRANSACTION
where COUNTRY =country_name;

select distinct(COUNTRY) as country from BUSINESS_SALES_TRANSACTION order by COUNTRY;

SELECT count(productname) as productname 
from BUSINESS_SALES_TRANSACTION
where extract(year from TRANSACTIONDATE) 
BETWEEN '2017' and '2018';

SELECT PRODUCTNAME,PRICE FROM BUSINESS_SALES_TRANSACTION WHERE price >2.01;

select COUNT(DISTINCT PRODUCTNO) as productno from BUSINESS_SALES_TRANSACTION
where PRICE<2.04;