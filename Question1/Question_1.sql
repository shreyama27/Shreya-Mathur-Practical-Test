-------Query to create the Table-------------

CREATE TABLE Online_Retail (
    Invoice_No INT,
    Stock_code VARCHAR(255),
    Description VARCHAR(255),
    Quantity INT,
    Invoice_Date TIMESTAMP,
    Unit_Price INT,
    Customer_ID INT,
    Country VARCHAR(255)
);
----------Data was inserted using the import function in dbeaver---------
-----Query 1 -------------

SELECT Customer_ID, SUM(Quantity * Unit_Price) AS total_purchase_amount
FROM Online_Retail
WHERE 
(Customer_ID != ''
 AND 
Customer_ID IS NOT NULL)
GROUP BY Customer_ID
ORDER BY total_purchase_amount DESC
LIMIT 10;


-------Query 2------------

SELECT Description, COUNT(Invoice_No) AS order_count
FROM Online_Retail
WHERE Description != ''
GROUP BY Description 
--, Invoice_No 
ORDER BY order_count DESC;

--------Query 3--------------

SELECT 
    SUBSTRING(Invoice_Date,1,2) AS Invoice_Month, 
    SUBSTRING(Invoice_Date,7,2) AS Invoice_YEAR,
    SUM(Quantity * Unit_Price) AS Monthly_Revenue
FROM Online_Retail
GROUP BY Invoice_YEAR, Invoice_Month
ORDER BY Invoice_YEAR, Invoice_Month;



