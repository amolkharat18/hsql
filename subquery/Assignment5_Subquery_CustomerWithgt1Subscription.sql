-- Assignment5_Subquery_CustomerWithgt1Subscription
SELECT C.customerid, C.customername
FROM customer C
WHERE C.customerid IN (
	SELECT S.customerid
	FROM subscription S
	GROUP BY S.customerid
	HAVING COUNT(*) > 1
)
ORDER BY C.customerid;
