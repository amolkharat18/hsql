-- Assignment15_Subquery_MaxMonthlyChargesPerGenre 
SELECT J.journalid, J.journalname, J.genre, J.monthlycharges
FROM journal J
WHERE J.monthlycharges = (
	SELECT MAX(J1.monthlycharges)
	FROM journal J1
	WHERE J1.genre = J.genre
)
ORDER BY J.journalid;
