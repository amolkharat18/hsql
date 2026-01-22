-- Assignment16_Subquery_NestedQuery 
SELECT S.subscriptionid,
   	(SELECT J.journalname
    	FROM journal J
    	WHERE J.journalid = S.journalid
      	AND J.genre = 'Trade'
      	AND EXISTS (
          	SELECT 1
          	FROM publisher P
          	WHERE P.publisherid = J.publisherid
            	AND P.rating > 3
      	)
   	) AS journalname
FROM subscription S
WHERE EXISTS (
	SELECT 1
	FROM journal J
	WHERE J.journalid = S.journalid
  	AND J.genre = 'Trade'
  	AND EXISTS (
      	SELECT 1
      	FROM publisher P
      	WHERE P.publisherid = J.publisherid
        	AND P.rating > 3
  	)
);
