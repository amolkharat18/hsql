-- Assignment12_Subquery_Subscriptions 
SELECT C.customername, C.state, S.durationinmonths
FROM customer C
JOIN subscription S
  ON C.customerid = S.customerid
WHERE S.discountpercent > (
	SELECT MIN(S1.discountpercent)
	FROM subscription S1
	WHERE S1.customerid = S.customerid
)
ORDER BY C.customername;
