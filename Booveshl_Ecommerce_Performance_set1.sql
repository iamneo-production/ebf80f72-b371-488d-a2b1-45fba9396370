--> Sprint 5 --> Performance tuning Queries set-1 <--

--> 1. Count the Customers from each country?
CREATE or REPLACE procedure EachCountry_customer_count
as
begin
for i in( select country,count(customerno) customer_count
          from business_sales_transaction 
          group by country
        ) loop
dbms_output.put_line(i.country ||'      '||i.customer_count);
end loop;
end;

--> 2. Count the customers from each year?
CREATE or REPLACE procedure Each_year_customer_count
as
begin
dbms_output.put_line('Year'||'      '||'customer_count');
for i in( select extract(year from transactiondate) year,count(*)customer_count
          from BUSINESS_SALES_TRANSACTION 
          group by extract (year from TRANSACTIONDATE)
        ) loop
dbms_output.put_line(i.year||'      '||i.customer_count);
end loop;
end;

--> 3. List all the unique product names sold from each year?
CREATE or REPLACE procedure sold_products_Each_year
as
cursor sold_products is select extract(year from transactiondate) yearr,PRODUCTNAME pname 
                        from BUSINESS_SALES_TRANSACTION 
                        group by extract (year from TRANSACTIONDATE),productname;
begin
dbms_output.put_line('Year'||'      '||'PRODUCTNAME');
for i in sold_products loop
dbms_output.put_line(i.yearr||'      '||i.PNAME);
end loop;
end;

--> 4. List all unique Product names sold from 2018-12-01 to 2019-02-27?
CREATE or REPLACE procedure sold_products_between_twoDates(start_date varchar,end_date varchar)
as
cursor soldproducts is select distinct(productname) sold_products
                       from BUSINESS_SALES_TRANSACTION
                       where transactiondate 
                       between to_date(start_date,'YYYY-MON-DD') and to_date(end_date,'YYYY-MON-DD');
begin
dbms_output.put_line('PRODUCTNAMES');
for i in soldproducts loop
dbms_output.put_line(i.sold_products);
end loop;
end;

--> 5. Count the products sale in the year 2019?
CREATE or REPLACE procedure product_count_inthe_yearOf(year number)
as
begin
for i in( select sum(quantity) as productsale
          from BUSINESS_SALES_TRANSACTION 
          group by extract(year from transactiondate) 
          having extract (year from TRANSACTIONDATE) = year
        ) loop
dbms_output.put_line('In '||year||', '||i.productsale||' products are sold ');
end loop;
end;

--> 6. Count the product sale in the year 2019 month-wise?
CREATE or REPLACE procedure monthwise_product_count_inthe_yearOf(year number)
as
begin
for i in( select sum(quantity)as productsale_monthwise, to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month 
          from BUSINESS_SALES_TRANSACTION 
          where extract (year from TRANSACTIONDATE) = year
          group by extract(month from transactiondate)
        ) loop
dbms_output.put_line(i.month||' '||i.productsale_monthwise);
end loop;
end;

--> 7. Total sale amount in each year?
CREATE or REPLACE procedure EachYear_TotalSale_Amount
as
begin
dbms_output.put_line('Year'||'   '||'TotalSale_Amount');
for i in( select sum ( price * quantity ) as TotalSale_Amount ,extract (year from TRANSACTIONDATE) as Year 
          from BUSINESS_SALES_TRANSACTION 
          group by extract (year from TRANSACTIONDATE)
        ) loop
dbms_output.put_line(i.year||'  '||i.TotalSale_Amount);
end loop;
end;

--> 8. Total sale amount of each product in the year 2019?
CREATE or REPLACE procedure SaleAmountOf_Eachproduct_inthe_yearOf(year number)
as
begin
for i in( select sum ( price * quantity ) as TotalSale_Amount ,PRODUCTNAME
          from BUSINESS_SALES_TRANSACTION where extract (year from TRANSACTIONDATE) = year
          group by PRODUCTNAME
        ) loop
dbms_output.put_line(i.PRODUCTNAME||' -- '||i.TotalSale_Amount);
end loop;
end;

--> 9. Count each product sale in 2019 Feb month?
CREATE or REPLACE procedure Monthly_ProductSale(Month varchar,year number)
as
begin
for i in( select sum(quantity)as productsale  
          from BUSINESS_SALES_TRANSACTION 
          where extract (year from TRANSACTIONDATE) = year and extract (month from TRANSACTIONDATE) = to_char(to_date(month,'Mon'),'mm')
          group by extract(month from transactiondate)
        ) loop
dbms_output.put_line('In '||month||', '||year||'  ' ||i.productsale||' products were sold');
end loop;
end;

--> 10. Total sale amount of each product month-wise in the year 2019? 
CREATE or REPLACE procedure Monthly_SaleAmountOf_Eachproduct_inthe_yearOf(year number)
as
begin
for i in (select sum(PRICE * QUANTITY)as Totalsale_Amount, to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month 
          from BUSINESS_SALES_TRANSACTION 
          where extract (year from TRANSACTIONDATE) = '2019'
          group by extract(month from transactiondate)
         ) loop
dbms_output.put_line(i.TotalSale_Amount||' -- ' ||i.Month);
end loop;
end;

******************************************************************************************************************************
--->> Execution of Set-1 Procedures:
--->> 1.execute the  procedure EachCountry_customer_count();
exec EachCountry_customer_count();
--->> 2.execute the  procedure Each_year_customer_count();
exec Each_year_customer_count();
--->> 3.execute the  procedure sold_products_Each_year();
exec sold_products_Each_year();
--->> 4.execute the  procedure sold_products_between_twoDates('2018-dec-01','2019-feb-27');
exec sold_products_between_twoDates('2018-dec-01','2019-feb-27');
--->> 5.execute the  procedure product_count_inthe_yearOf(2019);
exec product_count_inthe_yearOf(2019);
--->> 6.execute the procedure monthwise_product_count_inthe_yearOf(2019);
exec monthwise_product_count_inthe_yearOf(2019);
--->> 7.execute the procedure EachYear_TotalSale_Amount();
exec EachYear_TotalSale_Amount();
--->> 8.execute the  procedure SaleAmountOf_Eachproduct_inthe_yearOf(2019);
exec SaleAmountOf_Eachproduct_inthe_yearOf(2019);
--->> 9.execute the  procedure Monthly_ProductSale('FEB',2019);
exec Monthly_ProductSale('FEB',2019);
--->> 10.execute the  procedure Monthly_SaleAmountOf_Eachproduct_inthe_yearOf(2019);
exec Monthly_SaleAmountOf_Eachproduct_inthe_yearOf(2019);
