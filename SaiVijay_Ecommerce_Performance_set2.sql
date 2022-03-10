--SPRINT 5 E-COMMERCE_PERFORMANCE_SET_2

--1. Display the Order details of who are all ordered from country Australia?

CREATE OR REPLACE PROCEDURE ORDER_DETAILS_AUS
AS
BEGIN
FOR i IN(select * from BUSINESS_SALES_TRANSACTION where country='Australia') 
LOOP
DBMS_OUTPUT.PUT_LINE(i.TRANSACTIONNO||'   '||i.TRANSACTIONDATE||'   '||i.PRODUCTNO
||'   '||i.PRICE||'   '||i.QUANTITY||'   '||i.CUSTOMERNO||'   '||i.COUNTRY);
END LOOP;
END;

BEGIN
ORDER_DETAILS_AUS;
END;

--2. Display the Country name in ascending order?

CREATE OR REPLACE PROCEDURE COUNTRY_NAME
AS
BEGIN
FOR i IN(select distinct(country) countryname from BUSINESS_SALES_TRANSACTION order by country asc) 
LOOP
DBMS_OUTPUT.PUT_LINE(i.countryname);
END LOOP;
END;

BEGIN
COUNTRY_NAME;
END;

--3. Count the Products sale in years between 2017 and 2018?

CREATE OR REPLACE PROCEDURE PRODUCT_SALE
AS
BEGIN
FOR i IN(select count(productno) sale from BUSINESS_SALES_TRANSACTION where transactiondate like '%17' or transactiondate like '%18') 
LOOP
DBMS_OUTPUT.PUT_LINE(i.sale);
END LOOP;
END;

BEGIN
PRODUCT_SALE;
END;

--4. Display the product list the price is above 2.01?

CREATE OR REPLACE PROCEDURE MORE_PRICE
AS
BEGIN
FOR i IN(select productno,productname,price from BUSINESS_SALES_TRANSACTION where price>2.01) 
LOOP
DBMS_OUTPUT.PUT_LINE(i.productno||'  '||i.productname||'  '||i.price);
END LOOP;
END;

BEGIN
MORE_PRICE();
END;

--5. Count the products of price is below 2.04?

CREATE OR REPLACE PROCEDURE LESS_PRICE
AS
BEGIN
FOR i IN(select count(distinct productno) Price from BUSINESS_SALES_TRANSACTION where price<2.04) 
LOOP
DBMS_OUTPUT.PUT_LINE(i.Price);
END LOOP;
END;

BEGIN
LESS_PRICE();
END;