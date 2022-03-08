--> 1. Display the Order details of who are all ordered from country Australia?

SELECT * from BUSINESS_SALES_TRANSACTION
where COUNTRY ='Australia';

--> 2. Display the Country name in ascending order?

SELECT distinct(country) 
from BUSINESS_SALES_TRANSACTION
order by COUNTRY ;

--> 3. Count the Products sale in years between 2017 and 2018?

SELECT count(productname) 
from BUSINESS_SALES_TRANSACTION
where extract(year from TRANSACTIONDATE) 
BETWEEN '2017' and '2018';

--> 4. Display the product list the price is above 2.01?

SELECT PRODUCTNAME,PRICE
FROM BUSINESS_SALES_TRANSACTION
WHERE price > 2.01;

--> 5. Count the products of price is below 2.04?

SELECT PRODUCTNAME,PRICE
FROM BUSINESS_SALES_TRANSACTION
WHERE price < 2.04;
