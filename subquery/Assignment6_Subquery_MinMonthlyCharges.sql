-- Assignment6_Subquery_MinMonthlyCharges 
SELECT P.publisherid, P.publishername
FROM publisher P
WHERE P.publisherid IN (
	SELECT J.publisherid
	FROM journal J
	WHERE J.monthlycharges = (
    	SELECT MIN(J1.monthlycharges)
    	FROM journal J1
	)
);
