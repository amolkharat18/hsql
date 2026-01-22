-- Assignment9_Subquery_CustomerFromSameStateDiffCity 
SELECT C.customerid, C.state, C.city
FROM customer C
WHERE EXISTS (
	SELECT 1
	FROM customer C1
	WHERE C1.state = C.state
  	AND C1.city <> C.city
)
ORDER BY C.customerid;
