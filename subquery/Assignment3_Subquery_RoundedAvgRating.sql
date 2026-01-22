-- Assignment3_Subquery_RoundedAvgRating
SELECT ROUND(AVG(P.rating)) AS rating
FROM publisher P
WHERE P.publisherid IN (
	SELECT J.publisherid
	FROM journal J
);
