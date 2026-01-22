-- Exercise_Subquery_MaxCount
SELECT MAX(purchase_count) AS MAX_PURCHASES
FROM (
	SELECT CustId, COUNT(*) AS purchase_count
	FROM Invoice
	GROUP BY CustId
) purchase_count;
