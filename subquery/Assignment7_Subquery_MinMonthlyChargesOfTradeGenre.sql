-- Assignment7_Subquery_MinMonthlyChargesOfTradeGenre 
SELECT P.publisherid, P.publishername
FROM publisher P
WHERE P.publisherid IN (
	SELECT J.publisherid
	FROM journal J
	WHERE J.genre = 'Trade'
  	AND J.monthlycharges = (
      	SELECT MIN(J1.monthlycharges)
      	FROM journal J1
      	WHERE J1.genre = 'Trade'
  	)
);
