-- Exercise_Subquery_MaxAvgDiscount 
SELECT MAX(avg_discount) AS MAX_DISCOUNT
FROM (
	SELECT ProductId, AVG(Discount) AS avg_discount
	FROM Invoice
	GROUP BY ProductId
) x;
