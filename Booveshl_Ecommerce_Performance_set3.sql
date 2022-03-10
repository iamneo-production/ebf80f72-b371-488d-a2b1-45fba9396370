-->> 1. Display all unique products in ascending order?

create or replace procedure Products_inAscending
as
begin
for i in ( select distinct(PRODUCTNAME) product_name
           from business_sales_transaction 
           order by PRODUCTNAME
         ) loop
dbms_output.put_line(i.Product_name);
end loop;
end;

-->> 2. Find how many products were sold in the year 2018?

create or replace procedure Sold_Products_in(year number)
as
begin
for i in ( select sum(quantity) soldproduct
           from business_sales_transaction 
           where extract (year from TRANSACTIONDATE) = year
         ) loop
dbms_output.put_line(i.soldproduct);
end loop;
end;

-->> 3. Find the total sale amount in the year 2018?

create or replace procedure TotalSale_Amount_in(year number)
as
begin
for i in ( select sum(price * quantity) Sale_amount 
           from business_sales_transaction 
           where extract (year from TRANSACTIONDATE) = year
         ) loop
dbms_output.put_line(i.sale_amount);
end loop;
end;

-->> 4. Find the Total sale amount in each month of the year 2018?

create or replace procedure Monthly_Sale_Amount_in(year number)
as
begin
for i in( select sum(PRICE * QUANTITY)as Totalsale_Amount, to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month 
          from BUSINESS_SALES_TRANSACTION 
          where extract (year from TRANSACTIONDATE) = 2019
          group by extract(month from transactiondate)
        ) loop
dbms_output.put_line(i.totalsale_amount ||'  '||i.month);
end loop;
end;

-->> 5. Find which product is maximum purchased? 

create or replace procedure Most_Purchaced_Product
as
begin
for i in( select productname , sum(QUANTITY) Max_purchased_count
          from business_sales_transaction
          group by productname
          order by Max_purchased_count desc 
          fetch first 1 row only
        ) loop
dbms_output.put_line(i.productname ||'  '||i.Max_purchased_count);
end loop;
end;

**********************************************************************************************************************************************************************
--->> Execution of Set-3 Procedures:
--->> 1.execute the  procedure Products_inAscending();
exec Products_inAscending();
--->> 2.execute the  procedure Sold_Products_in(2018);
exec Sold_Products_in(2018);
--->> 3.execute the  procedure TotalSale_Amount_in(2018);
exec TotalSale_Amount_in(2018);
--->> 4.execute the  procedure Monthly_Sale_Amount_in(2018)
exec Monthly_Sale_Amount_in(2018);
--->> 5.execute the  procedure Most_Purchaced_Product();
exec Most_Purchaced_Product();
