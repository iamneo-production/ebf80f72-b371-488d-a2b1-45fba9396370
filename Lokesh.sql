SELECT * FROM BUSINESS_SALES_TRANSACTION
WHERE COUNTRY='Australia';

SELECT DISTINCT(COUNTRY) FROM BUSINESS_SALES_TRANSACTION
ORDER BY COUNTRY;

SELECT COUNT(PRODUCTNAME)
FROM BUSINESS_SALES_TRANSACTION
WHERE TRANSACTIONDATE LIKE '%17' OR TRANSACTIONDATE LIKE '%18';

SELECT PRODUCTNAME 
FROM BUSINESS_SALES_TRANSACTION
WHERE PRICE>2.01;

SELECT COUNT(DISTINCT PRODUCTNO)
FROM BUSINESS_SALES_TRANSACTION
WHERE PRICE<2.04;