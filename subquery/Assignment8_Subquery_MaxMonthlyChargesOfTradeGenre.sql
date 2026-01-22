-- Assignment8_Subquery_MaxMonthlyChargesOfTradeGenre
SELECT J.journalname, J.monthlycharges
FROM journal J
WHERE J.genre = 'Trade'
  AND J.monthlycharges = (
  	SELECT MAX(J1.monthlycharges)
  	FROM journal J1
  	WHERE J1.genre = 'Trade'
  );
