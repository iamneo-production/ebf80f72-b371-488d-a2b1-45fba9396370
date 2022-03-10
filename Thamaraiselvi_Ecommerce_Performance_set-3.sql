-->> 1. Display all unique products in ascending order?

-->>Query
select distinct PRODUCTNAME from BUSINESS_SALES_TRANSACTION order by PRODUCTNAME;
-->>Procedure
create or replace procedure Uniqueproductname
as
begin
for i in (select distinct PRODUCTNAME as productname from BUSINESS_SALES_TRANSACTION order by PRODUCTNAME)
loop
dbms_output.put_line(i.productname);
end loop;
end;

begin
Uniqueproductname();
end;

-->> 2. Find how many products were sold in the year 2018?


-->>Query
select PRODUCTNAME from BUSINESS_SALES_TRANSACTION where transactiondate like '%18';
-->>Procedure
create or replace procedure productname
as
begin
for i in (select PRODUCTNAME from BUSINESS_SALES_TRANSACTION where transactiondate like '%18')
loop
dbms_output.put_line(i.productname);
end loop;
end;

begin
productname();
end;

-->> 3. Find the total sale amount in the year 2018?


-->>Query
select sum(price) from business_sales_transaction where transactiondate like '%18';
-->>Procedure
create or replace procedure Sumofprice
as
begin
for i in (select sum(price)as total from business_sales_transaction where transactiondate like '%18')
loop
dbms_output.put_line(i.total);
end loop;
end;

begin
Sumofprice();
end;


-->> 4. Find the Total sale amount in each month of the year 2018?

-->>Query
select sum(PRICE * QUANTITY)as Totalsale_Amount, to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month 
from BUSINESS_SALES_TRANSACTION 
where extract (year from TRANSACTIONDATE) = 2019
group by extract(month from transactiondate);

-->>Procedure
create or replace procedure Monthly_Sale_Amount_in(year number)
as
begin
for i in( select sum(PRICE * QUANTITY)as Totalsale_Amount, to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month 
from BUSINESS_SALES_TRANSACTION 
where extract (year from TRANSACTIONDATE) = 2019
group by extract(month from transactiondate)) loop
dbms_output.put_line(i.totalsale_amount ||'  '||i.month);
end loop;
end;

begin
Monthly_Sale_Amount_in(2018);
end;


-->> 5. Find which product is maximum purchased? 


-->>Query
select max(PRODUCTNAME) from BUSINESS_SALES_TRANSACTION;
-->>Procedure
create or replace procedure Maxsaleproduct
as
begin
for i in (select max(PRODUCTNAME)as productname from BUSINESS_SALES_TRANSACTION)
loop
dbms_output.put_line(i.productname);
end loop;
end;

begin
Maxsaleproduct();
end;
