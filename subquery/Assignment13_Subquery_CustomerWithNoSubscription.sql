-- Assignment13_Subquery_CustomerWithNoSubscription 
SELECT C.customerid, C.customername
FROM customer C
WHERE NOT EXISTS (
	SELECT 1
	FROM subscription S
	WHERE S.customerid = C.customerid
)
ORDER BY C.customerid;
