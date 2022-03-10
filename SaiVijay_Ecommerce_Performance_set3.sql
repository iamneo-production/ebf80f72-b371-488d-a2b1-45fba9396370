--SPRINT 5 E-COMMERCE_PERFORMANCE_SET_3

--1. Display all unique products in ascending order?

CREATE OR REPLACE PROCEDURE DISTINTCT_PRODUCTS
AS
BEGIN
FOR i IN(select distinct(productname) as uni from BUSINESS_SALES_TRANSACTION order by uni asc) 
LOOP
DBMS_OUTPUT.PUT_LINE(i.uni);
END LOOP;
END;

BEGIN
DISTINTCT_PRODUCTS();
END;

--2. Find how many products were sold in the year 2018?

CREATE OR REPLACE PROCEDURE SOLD_IN_2018
AS
BEGIN
FOR i IN(select sum(quantity) Total from BUSINESS_SALES_TRANSACTION where transactiondate like '%18') 
LOOP
DBMS_OUTPUT.PUT_LINE(i.Total);
END LOOP;
END;

BEGIN
SOLD_IN_2018();
END;

--3. Find the total sale amount in the year 2018?

CREATE OR REPLACE PROCEDURE SALE_AMOUNT_2018
AS
BEGIN
FOR i IN(select sum(quantity*price) Total from BUSINESS_SALES_TRANSACTION where transactiondate like '%18') 
LOOP
DBMS_OUTPUT.PUT_LINE(i.Total);
END LOOP;
END;

BEGIN
SALE_AMOUNT_2018();
END;

--4. Find the Total sale amount in each month of the year 2018?

CREATE OR REPLACE PROCEDURE MONTH_WISE_SALE_2018
AS
BEGIN
FOR i IN(select sum(price*quantity)as Totalsale,to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month 
from BUSINESS_SALES_TRANSACTION 
where extract (year from TRANSACTIONDATE) = '2018'
group by extract(month from transactiondate)
order by extract(month from transactiondate) asc) 
LOOP
DBMS_OUTPUT.PUT_LINE(i.Totalsale||'    '||i.Month);
END LOOP;
END;

BEGIN
MONTH_WISE_SALE_2018();
END;

--5. Find which product is maximum purchased? 

CREATE OR REPLACE PROCEDURE MAXIMUM_PURCHASED
AS
BEGIN
FOR i IN(select productname from BUSINESS_SALES_TRANSACTION where quantity=(select max(quantity) from BUSINESS_SALES_TRANSACTION)) 
LOOP
DBMS_OUTPUT.PUT_LINE(i.productname);
END LOOP;
END;

BEGIN
MAXIMUM_PURCHASED();
END;
