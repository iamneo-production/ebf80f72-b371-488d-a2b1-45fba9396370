--SPRINT 5 E-COMMERCE_PERFORMANCE_SET_1

--1. Count the Customers from each country?

CREATE OR REPLACE PROCEDURE COUNT_OF_COUNTRY
AS
BEGIN
FOR i IN(SELECT COUNTRY,COUNT(*) CUSTOMERS FROM BUSINESS_SALES_TRANSACTION
GROUP BY COUNTRY) 
LOOP 
DBMS_OUTPUT.PUT_LINE(i.COUNTRY||'     '||i.CUSTOMERS);
END LOOP;
END;

BEGIN
COUNT_OF_COUNTRY();
END;

--2. Count the customers from each year?

CREATE OR REPLACE PROCEDURE COUNT_EACH_YEAR
AS
BEGIN
FOR i IN(SELECT EXTRACT(year from TRANSACTIONDATE) year,COUNT(CUSTOMERNO) CNO
FROM BUSINESS_SALES_TRANSACTION
GROUP BY EXTRACT(year from TRANSACTIONDATE)) 
LOOP
DBMS_OUTPUT.PUT_LINE(i.year||'     '||i.CNO);
END LOOP;
END;

BEGIN
COUNT_EACH_YEAR();
END;

--3. List all the unique product names sold from each year?

CREATE OR REPLACE PROCEDURE UNIQUE_PROD_OF_EACH_YEAR
AS
BEGIN
FOR i IN(select productname,extract(year from transactiondate) year from BUSINESS_SALES_TRANSACTION 
group by productname,extract(year from transactiondate)) 
LOOP 
DBMS_OUTPUT.PUT_LINE(i.productname||'     '||i.year);
END LOOP;
END;

BEGIN
UNIQUE_PROD_OF_EACH_YEAR;
END;

--4. List all unique Product names sold from 2018-12-01 to 2019-02-27?

CREATE OR REPLACE PROCEDURE UNIQUE_PROD
AS
BEGIN
FOR i IN(select distinct(productname) unique_products from BUSINESS_SALES_TRANSACTION where transactiondate 
between to_date('2018-12-01','YYYY-MM-DD') and to_date('2019-02-27','YYYY-MM-DD'))
LOOP 
DBMS_OUTPUT.PUT_LINE(i.unique_products);
END LOOP;
END;

BEGIN
UNIQUE_PROD;
END;

--5. Count the products sale in the year 2019?

CREATE OR REPLACE PROCEDURE COUNT_PROD_2019
AS
BEGIN
FOR i IN(select sum(quantity) productcount from BUSINESS_SALES_TRANSACTION where transactiondate like '%19')
LOOP 
DBMS_OUTPUT.PUT_LINE(i.productcount);
END LOOP;
END;

BEGIN
COUNT_PROD_2019;
END;

--6. Count the product sale in the year 2019 month-wise?

CREATE OR REPLACE PROCEDURE SALE_MONWISE_2019
AS
BEGIN
FOR i IN(select sum(QUANTITY) as sale_monthwise,
to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month 
from BUSINESS_SALES_TRANSACTION 
where extract (year from TRANSACTIONDATE) = '2019'
group by extract(month from TRANSACTIONDATE)) 
LOOP
DBMS_OUTPUT.PUT_LINE(i.sale_monthwise||'      '||i.Month);
END LOOP;
END; 

BEGIN
SALE_MONWISE_2019();
END;

--7. Total sale amount in each year?

CREATE OR REPLACE PROCEDURE SALE_AMOUNT_EACH_YEAR
AS
BEGIN
FOR i IN(select sum(price*quantity) as Total_Sum,extract(year from TRANSACTIONDATE) as Year 
from BUSINESS_SALES_TRANSACTION group by extract (year from TRANSACTIONDATE)) 
LOOP
DBMS_OUTPUT.PUT_LINE(i.Total_Sum||'      '||i.Year);
END LOOP;
END;

BEGIN
SALE_AMOUNT_EACH_YEAR();
END;

--8. Total sale amount of each product in the year 2019?

CREATE OR REPLACE PROCEDURE EACH_PRODUCT_2019
AS
BEGIN
FOR i IN(select sum(PRICE * QUANTITY) as totalsum,productname
from BUSINESS_SALES_TRANSACTION where extract(year from TRANSACTIONDATE)='2019'
group by productname) 
LOOP
DBMS_OUTPUT.PUT_LINE(i.totalsum||'      '||i.productname);
END LOOP;
END;

BEGIN
EACH_PRODUCT_2019();
END;

--9. Count each product sale in 2019 Feb month?

CREATE OR REPLACE PROCEDURE SALE_IN_FEB
AS
BEGIN
FOR i IN(select sum(quantity)as sale_feb  
from BUSINESS_SALES_TRANSACTION 
where extract(year from TRANSACTIONDATE) ='2019' and extract(month from TRANSACTIONDATE)='02'
group by extract(month from transactiondate)) 
LOOP
DBMS_OUTPUT.PUT_LINE(i.sale_feb);
END LOOP;
END;

BEGIN
SALE_IN_FEB();
END;

--10. Total sale amount of each product month-wise in the year 2019? 

CREATE OR REPLACE PROCEDURE SALE_IN_MON_WISE
AS
BEGIN
FOR i IN(
select sum(PRICE * QUANTITY)as Totalsale, to_char(to_date(extract(month from TRANSACTIONDATE),'MM'),'MONTH') as Month 
from BUSINESS_SALES_TRANSACTION 
where extract (year from TRANSACTIONDATE) = '2019'
group by extract(month from transactiondate)
order by extract(month from transactiondate) asc) 
LOOP
DBMS_OUTPUT.PUT_LINE(i.Totalsale||'      '||i.Month);
END LOOP;
END;

BEGIN
SALE_IN_MON_WISE();
END;