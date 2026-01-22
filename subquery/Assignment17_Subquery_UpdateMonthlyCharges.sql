-- Assignment17_Subquery_UpdateMonthlyCharges 
UPDATE journal J
SET monthlycharges = (
	SELECT ROUND(AVG(J1.monthlycharges))
	FROM journal J1
	WHERE J1.publisherid = J.publisherid
);
