                                -- SQL TASKS
                                
                                
-- QUERY 1:- Top 5 product lines by shipped sales
SELECT PRODUCT_LINE, SUM(SALES) AS total_sale
FROM sales_data
WHERE STATUS = 'Shipped'
GROUP BY PRODUCT_LINE
ORDER BY total_sale DESC
LIMIT 5;

-- QUERY 2:- Sales by year
SELECT YEAR(ORDER_DATE) AS yr, ROUND(SUM(SALES),2) AS total_sale
FROM sales_data
GROUP BY YEAR(ORDER_DATE)
ORDER BY yr;

-- QUERY 3:- Customer for Classic SHipped cars
SELECT DISTINCT a.CUSTOMER_NAME
FROM sales_data as a
INNER JOIN sales_data as b
ON a.CUSTOMER_NAME = b.CUSTOMER_NAME
WHERE a.PRODUCT_LINE = 'Classic Cars'
  AND b.PRODUCT_LINE = 'Ships'
  LIMIT 20;
  
-- QUERY 4:- Customer for 2018 but not 2019
SELECT DISTINCT a.CUSTOMER_NAME
FROM sales_data a
LEFT JOIN sales_data as b
ON a.CUSTOMER_NAME = b.CUSTOMER_NAME
AND YEAR(b.ORDER_DATE) = 2019
WHERE YEAR(a.ORDER_DATE) = 2018 AND b.ORDER_NUMBER IS NULL; 


-- SUBQUERIES AND AGGREGATE FUNCTIONS

-- QUERY 5:- Customers who spent more than the average customer
SELECT CUSTOMER_NAME, SUM(SALES) AS total_spent
FROM sales_data
GROUP BY CUSTOMER_NAME
HAVING SUM(SALES) > ( SELECT AVG(cust_total)
    FROM (SELECT SUM(SALES) AS cust_total FROM sales_data GROUP BY CUSTOMER_NAME)AS  t)
ORDER BY total_spent DESC
LIMIT 10;


--  QUERY 6:-Orders larger than the average order line
SELECT ORDER_NUMBER, SALES
FROM sales_data
WHERE SALES > (SELECT AVG(SALES) FROM sales_data)
ORDER BY SALES DESC
LIMIT 20
; 


-- QUERY 7:- VIEWS
CREATE VIEW vw_top_customers AS
SELECT CUSTOMER_NAME, COUNTRY, SUM(SALES) AS total_spent
FROM sales_data
GROUP BY CUSTOMER_NAME, COUNTRY;

SELECT * FROM vw_top_customers ORDER BY total_spent DESC LIMIT 10;
  
