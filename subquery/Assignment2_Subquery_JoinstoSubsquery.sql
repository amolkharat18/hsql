-- Assignment2_Subquery_JoinstoSubsquery
SELECT DISTINCT J.journalname, J.genre
FROM journal J
WHERE J.journalid IN (
	SELECT S.journalid
	FROM subscription S
)
ORDER BY J.journalname;
