-- Assignment10_Subquery_SelectiveSubscriptions 
SELECT S.subscriptionid, S.journalid
FROM subscription S
WHERE S.discountpercent <= (
	SELECT AVG(S1.discountpercent)
	FROM subscription S1
	WHERE S1.journalid = S.journalid
)
ORDER BY S.subscriptionid;
