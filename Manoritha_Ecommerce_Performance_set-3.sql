--> 1.Display all unique products in ascending order

select distinct PRODUCTNAME from BUSINESS_SALES_TRANSACTION order by PRODUCTNAME;

--> 2.Find how many products sold in the year 2018 

select PRODUCTNAME from BUSINESS_SALES_TRANSACTION where extract (year from TRANSACTIONDATE) = 2018;

--> 3.Find the total sale amount in the year 2018

select sum(price) from business_sales_transaction where extract (year from TRANSACTIONDATE) = 2018;

--> 4.Find the total sale amount in each month of the year 2018

SELECT SUM(QUANTITY*PRICE) SaleAmount,
to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month
FROM BUSINESS_SALES_TRANSACTION
where extract (year from TRANSACTIONDATE) = '2018'
group by extract(month from TRANSACTIONDATE);

--> 5.Find which product is maximum purchased

select max(productname) from BUSINESS_SALES_TRANSACTION;

--------------------------------------------------------------------------------------------------------------------------------------------

--> Procedures

--> 1.
create or replace procedure Unique_products_ascending_order
as
begin
for i in (select distinct PRODUCTNAME cc from BUSINESS_SALES_TRANSACTION order by PRODUCTNAME)loop
dbms_output.put_line(i.cc);
end loop;
end;

begin
Unique_products_ascending_order();
end;

-- drop procedure Unique_products_ascending_order;

---------------------------------------------------------------------------------------------------------------------------------------

--> 2.
create or replace procedure Products_sold_2018
as
begin
for i in (select PRODUCTNAME cc from BUSINESS_SALES_TRANSACTION where extract (year from TRANSACTIONDATE) = 2018)loop
dbms_output.put_line(i.cc);
end loop;
end;

begin
Products_sold_2018();
end;

-- drop procedure Products_sold_2018;

-----------------------------------------------------------------------------------------------------------------------------------------------

--> 3.
create or replace procedure Total_sale_amount_2018
as
begin
for i in (select sum(price) cc from business_sales_transaction where extract (year from TRANSACTIONDATE) = 2018)loop
dbms_output.put_line(i.cc);
end loop;
end;

begin
Total_sale_amount_2018();
end;

-- drop procedure Total_sale_amount_2018;

----------------------------------------------------------------------------------------------------------------------------------------------

--> 4.
create or replace procedure Total_sale_amount_2018_each_month
as
begin
for i in (SELECT SUM(QUANTITY*PRICE) SaleAmount,
to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month
FROM BUSINESS_SALES_TRANSACTION
where extract (year from TRANSACTIONDATE) = '2018'
group by extract(month from TRANSACTIONDATE))loop
dbms_output.put_line(i.SaleAmount||'      '||i.Month);
end loop;
end;

begin
Total_sale_amount_2018_each_month();
end;

-- drop  procedure Total_sale_amount_2018_each_month; 

---------------------------------------------------------------------------------------------------------------------------------------------

--> 5.
create or replace procedure Max_product_purchased
as
begin
for i in (select max(productname) cc from BUSINESS_SALES_TRANSACTION)loop
dbms_output.put_line(i.cc);
end loop;
end;

begin
Max_product_purchased();
end;

-- drop procedure Max_product_purchased;

---------------------------------------------------------------------------------------------------------------------------------------------