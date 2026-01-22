-- Assignment1_Subquery_SubscribedJournals 
SELECT DISTINCT j.journalid, j.journalname, j.genre
FROM journal AS j
JOIN subscription AS s
  ON s.journalid = j.journalid
ORDER BY j.journalid;
