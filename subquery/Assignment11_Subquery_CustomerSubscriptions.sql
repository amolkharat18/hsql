-- Assignment11_Subquery_CustomerSubscriptions 
SELECT C.customerid, C.customername, S.startdate
FROM customer C
JOIN subscription S
  ON C.customerid = S.customerid
WHERE S.discountpercent < (
	SELECT MAX(S1.discountpercent)
	FROM subscription S1
	WHERE S1.startdate = S.startdate
)
ORDER BY C.customerid;
