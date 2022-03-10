--> 1. Display the Order details of who are all ordered from country Australia?
create or replace procedure OrderDetails_Of(country_name varchar)
as
begin
for i in (SELECT * from BUSINESS_SALES_TRANSACTION
          where COUNTRY =country_name) loop
 dbms_output.put_line(i.TRANSACTIONNO||'  '||i.TRANSACTIONDATE||'  '||i.PRODUCTNO||'  '||i.PRODUCTNAME||'  '||i.PRICE||'  '||i.QUANTITY||'  '||i.CUSTOMERNO);
end loop;
end;

--> 2. Display the Country name in ascending order?

create or replace procedure Country_in_Ascending
as
begin
dbms_output.put_line('COUNTRY_inAscending');
for i in( SELECT distinct(country) country_name
          from BUSINESS_SALES_TRANSACTION
          order by COUNTRY
        ) loop
dbms_output.put_line(i.country_name);
end loop;
end;

--> 3. Count the Products sale in years between 2017 and 2018?

create or replace procedure ProductSales_yearsBetween(start_year number,end_year number)
as
begin
for i in( SELECT count(productname) Product_sales
          from BUSINESS_SALES_TRANSACTION
          where extract(year from TRANSACTIONDATE) 
          BETWEEN start_year and end_year
        ) loop;
dbms_output.put_line(i.Product_sales)
end loop;
end;

--> 4. Display the product list the price is above 2.01?

create or replace procedure Product_price_above(min_price number)
as
begin
for i in ( SELECT PRODUCTNAME,PRICE
           FROM BUSINESS_SALES_TRANSACTION
           WHERE price > min_price
         ) loop
dbms_output.put_line(i.Productname||'  '||i.price);
end loop;
end;

--> 5. Count the products of price is below 2.04?

create or replace procedure Product_price_below(max_price number)
as
begin
for i in ( SELECT PRODUCTNAME,PRICE
           FROM BUSINESS_SALES_TRANSACTION
           WHERE price < max_price
         ) loop
dbms_output.put_line(i.Productname||'  '||i.price);
end loop;
end;

***********************************************************************************************************************************************
--->> Execution of Set-2 Procedures:
--->> 1.execute the  procedure OrderDetails_Of('Australia');
exec OrderDetails_Of('Australia');
--->> 2.execute the  procedure Country_in_Ascending();
exec Country_in_Ascending();
--->> 3.execute the  procedure ProductSales_yearsBetween(2017,2018);
exec ProductSales_yearsBetween(2017,2018);
--->> 4.execute the  Product_price_above(2.01);
exec Product_price_above(2.01);
--->> 5.execute the  procedure Product_price_below(2.04);
exce Product_price_below(2.04);
