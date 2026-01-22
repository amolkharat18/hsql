-- Exercise_Subquery_CustomerCount 
SELECT CustName
FROM Customer
WHERE CustId IN (
	SELECT CustId
	FROM Invoice
	GROUP BY CustId
	HAVING COUNT(*) >= 2
);
