--->> set 1 <---

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