--> 1. Count the Customers from each country?

select country,count(customerno) 
from business_sales_transaction 
group by country;

--> 2. Count the customers from each year?

select extract(year from transactiondate),count(*) 
from BUSINESS_SALES_TRANSACTION 
group by extract (year from TRANSACTIONDATE);

--> 3. List all the unique product names sold from each year?

select extract(year from transactiondate),PRODUCTNAME
from BUSINESS_SALES_TRANSACTION 
group by extract (year from TRANSACTIONDATE),productname;

--> 4. List all unique Product names sold from 2018-12-01 to 2019-02-27?

select distinct(productname) 
from BUSINESS_SALES_TRANSACTION
where transactiondate 
between to_date('2018-DEC-01','YYYY-MON-DD') and to_date('2019-FEB-27','YYYY-MON-DD');

--> 5. Count the products sale in the year 2019?

select sum(quantity) as productsale
from BUSINESS_SALES_TRANSACTION 
group by extract(year from transactiondate) 
having extract (year from TRANSACTIONDATE) = '2019';

--> 6. Count the product sale in the year 2019 month-wise?

select sum(quantity)as productsale_monthwise, to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month 
from BUSINESS_SALES_TRANSACTION 
where extract (year from TRANSACTIONDATE) = '2019'
group by extract(month from transactiondate); 

--> 7. Total sale amount in each year?

select sum ( price * quantity ) as TotalSale_Amount ,extract (year from TRANSACTIONDATE) as Year 
from BUSINESS_SALES_TRANSACTION 
group by extract (year from TRANSACTIONDATE);

--> 8. Total sale amount of each product in the year 2019?

select sum ( price * quantity ) as TotalSale_Amount ,PRODUCTNAME
from BUSINESS_SALES_TRANSACTION where extract (year from TRANSACTIONDATE) = '2019'
group by PRODUCTNAME;

--> 9. Count each product sale in 2019 Feb month?

select sum(quantity)as productsale_feb_2019  
from BUSINESS_SALES_TRANSACTION 
where extract (year from TRANSACTIONDATE) = '2019' and extract (month from TRANSACTIONDATE) = '02'
group by extract(month from transactiondate); 

--> 10. Total sale amount of each product month-wise in the year 2019? 

select sum(PRICE * QUANTITY)as Totalsale_Amount_monthwise, to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month 
from BUSINESS_SALES_TRANSACTION 
where extract (year from TRANSACTIONDATE) = '2019'
group by extract(month from transactiondate); 


-->procedure for set1

--1>

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

--2>

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

--3>

create or replace procedure Uniqueproductname_from_Eachyear
as
begin
for i in (select extract(year from transactiondate)as year,PRODUCTNAME
from BUSINESS_SALES_TRANSACTION 
group by extract (year from TRANSACTIONDATE),productname)
loop
dbms_output.put_line(i.year ||'   '||i.PRODUCTNAME);
end loop;
end;

begin
Uniqueproductname_from_Eachyear();
end;


--4>

create or replace procedure Uniqueproductname_from_year2018to2019
as
begin
for i in (select distinct(productname) as productname
from BUSINESS_SALES_TRANSACTION
where transactiondate 
between to_date('2018-DEC-01','YYYY-MON-DD') and to_date('2019-FEB-27','YYYY-MON-DD'))
loop
dbms_output.put_line(i.productname);
end loop;
end;

begin
Uniqueproductname_from_year2018to2019();
end;

--5>

create or replace procedure Product_saleyear_2019
as
begin
for i in (select sum(quantity) as productsale
from BUSINESS_SALES_TRANSACTION 
group by extract(year from transactiondate) 
having extract (year from TRANSACTIONDATE) = '2019')
loop
dbms_output.put_line(i.productsale);
end loop;
end;

begin
Product_saleyear_2019();
end;

--6>

create or replace procedure countproduct_saleyear_2019_monthwise
as
begin
for i in (select sum(quantity)as productsale_monthwise, to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month 
from BUSINESS_SALES_TRANSACTION 
where extract (year from TRANSACTIONDATE) = '2019'
group by extract(month from transactiondate))
loop
dbms_output.put_line(i. productsale_monthwise ||'   '||i.Month );
end loop;
end;

begin
countproduct_saleyear_2019_monthwise();
end;

--7>

create or replace procedure Totalsale_amount_eachyear
as
begin
for i in (select sum ( price * quantity ) as TotalSale_Amount ,extract (year from TRANSACTIONDATE) as Year 
from BUSINESS_SALES_TRANSACTION 
group by extract (year from TRANSACTIONDATE))
loop
dbms_output.put_line(i.TotalSale_Amount ||'   '||i.Year );
end loop;
end;

begin
Totalsale_amount_eachyear();
end;

--8>

create or replace procedure Totalsale_eachproduct_year2019
as
begin
for i in (select sum ( price * quantity ) as TotalSale_Amount ,PRODUCTNAME
from BUSINESS_SALES_TRANSACTION where extract (year from TRANSACTIONDATE) = '2019'
group by PRODUCTNAME)
loop
dbms_output.put_line(i.TotalSale_Amount ||'   '||i.PRODUCTNAME);
end loop;
end;

begin
Totalsale_eachproduct_year2019();
end;

--9>

create or replace procedure counteachproduct_2019feb_saleamount
as
begin
for i in (select sum(quantity)as productsale_feb_2019  
from BUSINESS_SALES_TRANSACTION 
where extract (year from TRANSACTIONDATE) = '2019' and extract (month from TRANSACTIONDATE) = '02'
group by extract(month from transactiondate))
loop
dbms_output.put_line(i.productsale_feb_2019);
end loop;
end;

begin
counteachproduct_2019feb_saleamount();
end;

--10>

create or replace procedure Totalsale_amount
as
begin
for i in (select sum(PRICE * QUANTITY)as Totalsale_Amount_monthwise, to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month 
from BUSINESS_SALES_TRANSACTION 
where extract (year from TRANSACTIONDATE) = '2019'
group by extract(month from transactiondate))
loop
dbms_output.put_line(i.Totalsale_Amount_monthwise ||'   '||i.Month );
end loop;
end;

begin
Totalsale_amount();
end;
