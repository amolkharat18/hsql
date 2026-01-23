-- Assignment1_Join_AndOr

SELECT DISTINCT c.CustomerId, c.CustomerName
FROM Customer AS c
JOIN Subscription AS s
  ON s.CustomerId = c.CustomerId
WHERE c.CustomerType IN ('Regular', 'Prime')
ORDER BY c.CustomerId;


-- Assignment2_Join_Where

SELECT j.JournalId,
       p.PublisherName
FROM Journal AS j
JOIN Publisher AS p
  ON j.PublisherId = p.PublisherId
WHERE p.ContactNo IS NOT NULL
ORDER BY j.JournalId;


-- Assignment3_Join_CustomerWiseSubscriptionCount

SELECT s.CustomerId,
       c.CustomerName,
       COUNT(s.SubscriptionId) AS SubscriptionCount
FROM Subscription AS s
JOIN Customer AS c
  ON s.CustomerId = c.CustomerId
GROUP BY s.CustomerId, c.CustomerName
HAVING COUNT(s.SubscriptionId) > 1
ORDER BY s.CustomerId;


-- Assignment4_Join_FilterStartdate

SELECT c.CustomerName,
       j.JournalName,
       s.StartDate,
       s.DurationInMonths
FROM Subscription AS s
JOIN Customer AS c
  ON s.CustomerId = c.CustomerId
JOIN Journal AS j
  ON s.JournalId = j.JournalId
WHERE s.StartDate <= DATE '2023-11-01'
ORDER BY c.CustomerName, s.StartDate;


-- Assignment5_Join_SelectiveJournals

SELECT DISTINCT j.JournalName,
       j.Genre
FROM Subscription AS s
JOIN Journal AS j
  ON s.JournalId = j.JournalId
WHERE s.DiscountPercent > 10
ORDER BY j.JournalName;


-- Assignment6_Join_SameGenre_DifferentPublisher

SELECT DISTINCT p.PublisherName,
       j.Genre,
       p.Rating
FROM Publisher AS p
JOIN Journal AS j
  ON p.PublisherId = j.PublisherId
WHERE j.Genre IN (
        SELECT Genre
        FROM Journal
        GROUP BY Genre
        HAVING COUNT(*) > 1
      )
ORDER BY p.PublisherName;


-- Assignment6_Join_CountPublisherWiseUniqueSubscriptions

SELECT p.PublisherName AS "PublisherName",
       COUNT(DISTINCT s.CustomerId) AS "NoOfUniqueSubscribers"
FROM Publisher p
JOIN Journal j
  ON j.PublisherId = p.PublisherId
JOIN Subscription s
  ON s.JournalId = j.JournalId
GROUP BY p.PublisherName
HAVING COUNT(DISTINCT s.CustomerId) >= 3
ORDER BY p.PublisherName;


-- Assignment7_Join_PublisherWiseMonthlyCharges

SELECT p.PublisherName AS "PUBLISHERNAME",
       SUM(j.MonthlyCharge * s.DurationInMonths * (1 - NVL(s.DiscountPercent, 0) / 100.0)) AS "TOTALREVENUE"
FROM Publisher p
JOIN Journal j
  ON j.PublisherId = p.PublisherId
JOIN Subscription s
  ON s.JournalId = j.JournalId
GROUP BY p.PublisherName
ORDER BY "TOTALREVENUE" DESC, "PUBLISHERNAME";


-- Assignment8_Join_CountPublisherWiseSubscriptions

SELECT p.PublisherName AS "PUBLISHERNAME",
       COUNT(s.SubscriptionId) AS "NO_SUBSCRIPTION"
FROM Publisher p
JOIN Journal j
  ON j.PublisherId = p.PublisherId
JOIN Subscription s
  ON s.JournalId = j.JournalId
GROUP BY p.PublisherName
HAVING COUNT(s.SubscriptionId) >= 3
ORDER BY "NO_SUBSCRIPTION" DESC, "PUBLISHERNAME";


-- Assignment9_Join_CountPublisherWiseSubscriptions

SELECT DISTINCT c.CustomerName AS "CUSTOMERNAME",
       j.JournalName  AS "JOURNALNAME"
FROM Customer c
JOIN Subscription s
  ON s.CustomerId = c.CustomerId
JOIN Journal j
  ON j.JournalId = s.JournalId
WHERE c.State = 'Illinois'
  AND j.Genre = 'Trade'
ORDER BY "CUSTOMERNAME", "JOURNALNAME";

-- Assignment10_Join_SamePublisher_SameGenre

SELECT j1.JournalId   AS "JOURNALID",
       j1.JournalName AS "JOURNALNAME",
       j1.Genre       AS "GENRE",
       j1.PublisherId AS "PUBLISHERID"
FROM Journal j1
WHERE EXISTS (
    SELECT 1
    FROM Journal j2
    WHERE j2.PublisherId = j1.PublisherId
      AND j2.Genre = j1.Genre
      AND j2.JournalId <> j1.JournalId
)
ORDER BY "PUBLISHERID", "GENRE", "JOURNALID";


-- Assignment11_Join_CountSubscriptions

SELECT p.PublisherName AS "PUBLISHERNAME",
       j.Genre         AS "GENRE",
       COUNT(s.SubscriptionId) AS "SUBSCRIBERCOUNT"
FROM Publisher p
LEFT JOIN Journal j
  ON j.PublisherId = p.PublisherId
LEFT JOIN Subscription s
  ON s.JournalId = j.JournalId
WHERE j.JournalId IS NOT NULL
GROUP BY p.PublisherName, j.Genre

UNION ALL

SELECT p.PublisherName AS "PUBLISHERNAME",
       'NOT PUBLISHED' AS "GENRE",
       0               AS "SUBSCRIBERCOUNT"
FROM Publisher p
LEFT JOIN Journal j
  ON j.PublisherId = p.PublisherId
WHERE j.JournalId IS NULL

ORDER BY "PUBLISHERNAME", "GENRE";


-- Assignment12_Join_AllPublishers

SELECT p.PublisherName AS "PUBLISHERNAME",
       p.ContactNo     AS "CONTACTNO",
       COALESCE(j.JournalName, 'NO JOURNAL') AS "JOURNALNAME"
FROM Publisher p
LEFT JOIN Journal j
  ON j.PublisherId = p.PublisherId
ORDER BY "PUBLISHERNAME", "JOURNALNAME";


-- Assignment13_Join_Publisher'sJournals

SELECT p.PublisherId AS "PUBLISHERID",
       COALESCE(j.JournalName, 'Yet To Publish') AS "JOURNALPUBLISHED"
FROM Publisher p
LEFT JOIN Journal j
  ON j.PublisherId = p.PublisherId
ORDER BY "PUBLISHERID", "JOURNALPUBLISHED";


-- Assignment14_Join_FilterAcademicJournals

SELECT p.PublisherName AS "PUBLISHERNAME",
       COALESCE(j.JournalName, 'NA') AS "JOURNALNAME"
FROM Publisher p
LEFT JOIN Journal j
  ON j.PublisherId = p.PublisherId
 AND j.Genre = 'Academics'
WHERE p.Rating >= 4
ORDER BY "PUBLISHERNAME", "JOURNALNAME";
