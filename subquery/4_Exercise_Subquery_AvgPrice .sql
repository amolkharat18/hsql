-- Exercise_Subquery_AvgPrice 
SELECT ProductId, AVG(Price) AS AVERAGEPRICE
FROM VendorOffering
GROUP BY ProductId
HAVING AVG(Price) >
(
	SELECT AVG(Price) AS AVERAGEPRICE
	FROM VendorOffering
);
