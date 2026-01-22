-- Assignment4_Subquery_SelectiveCustomers 
SELECT C.customerid, C.customername, C.state
FROM customer C
WHERE C.state = (
	SELECT C1.state
	FROM customer C1
	WHERE C1.customername = 'Robert'
)
AND C.customername <> 'Robert'
ORDER BY C.customerid;
