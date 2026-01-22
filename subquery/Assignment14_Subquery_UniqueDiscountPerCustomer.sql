-- Assignment14_Subquery_UniqueDiscountPerCustomer 
SELECT DISTINCT C.customername, S.discountpercent
FROM customer C
JOIN subscription S
  ON C.customerid = S.customerid
WHERE S.discountpercent < (
	SELECT MAX(S1.discountpercent)
	FROM subscription S1
	WHERE S1.journalid = S.journalid
)
ORDER BY C.customername;
