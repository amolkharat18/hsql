-- Exercise_Subquery_Having 
SELECT ProductId
FROM Invoice
GROUP BY ProductId
HAVING AVG(Discount) >
(
	SELECT AVG(Discount) AS Discount
	FROM Invoice
	WHERE ProductId = 'P101'
);
