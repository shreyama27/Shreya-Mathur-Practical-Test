SELECT *
FROM Genre g 


--------Query 1-----------------------------------------------------------

SELECT g.Name  AS Genre,SUM(il.UnitPrice * il.Quantity) AS Total_Sales
FROM InvoiceLine il 
JOIN Track t 
ON il.Trackid = t.TrackId
JOIN Genre g 
ON t.GenreId = g.GenreId 
GROUP BY t.GenreId, g.Name
ORDER BY Total_Sales DESC 
LIMIT 5;


-----------Query 2--------------------------------------------------

SELECT BillingCountry AS Country, (SUM(Total)/COUNT(InvoiceId)) AS Average_Invoice_Total
FROM Invoice i 
GROUP BY BillingCountry, InvoiceId 
ORDER BY Average_Invoice_Total DESC

----------Query 3-----------------------------------------------------

SELECT CONCAT(c.FirstName, " ", c.LastName) AS Customer_Name , SUM(Total)  AS Total_Sum_of_Invoices
FROM Invoice i
LEFT JOIN Customer c 
ON i.CustomerId = c.CustomerId 
GROUP BY i.CustomerId, c.FirstName, c.LastName 
ORDER BY Total_Sum_of_Invoices DESC 
LIMIT 3

--------Query 4---------------------------------------------------------

SELECT CONCAT(e.FirstName, " ", e.LastName) AS Employee_Name, SUM(i.Total) AS Amount
FROM Invoice i
LEFT JOIN Customer c 
ON i.CustomerId = c.CustomerId 
LEFT JOIN Employee e 
ON c.SupportRepId = e.EmployeeId
GROUP BY e.EmployeeId, e.FirstName, e.LastName  
