--SPRINT 5 E-COMMERCE_PERFORMANCE_SET_2

select * from BUSINESS_SALES_TRANSACTION where country='Australia';

select unique(country) from BUSINESS_SALES_TRANSACTION order by country asc;

select count(productno) from BUSINESS_SALES_TRANSACTION where transactiondate like '%17' or transactiondate like '%18';

select productno,productname from BUSINESS_SALES_TRANSACTION where price>2.01;

select count(unique productno) from BUSINESS_SALES_TRANSACTION where price<2.04;