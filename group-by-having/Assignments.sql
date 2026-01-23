-- Assignment1_GroupBy_CountProduct

SELECT 
    review,
    COUNT(*) AS number_of_products
FROM product
GROUP BY review
ORDER BY review;


-- !Assignment2_GroupBy_MonthWiseCount

SELECT
  to_char(StartDate, 'Month') AS "MONTH",
  COUNT(DISTINCT CustomerId) AS "SUBSCRIBERCOUNT"
FROM Subscription
GROUP BY
    to_char(StartDate, 'Month');

-- Assignment3_GroupBy_TwoColumns

SELECT
  CustomerId,
  DiscountPercent,
  AVG(DurationInMonths) AS "AVG_DURATION"
FROM Subscription
WHERE DurationInMonths > 3
GROUP BY CustomerId, DiscountPercent
HAVING COUNT(*) >= 2;


-- Assignment4_GroupBy_Having

SELECT PCATEGORY
FROM Product
GROUP BY PCATEGORY
HAVING COUNT(*) > 1;


-- Assignment5_GroupBy_GenreWiseAvgMonthlyCharges

SELECT 
    Genre,
    AVG(MonthlyCharges) AS "AVG_CHARGES"
FROM Journal
GROUP BY Genre
HAVING AVG(MonthlyCharges) > 100;


-- Assignment6_GroupBy_FilterMonthWiseCount

SELECT 
    to_char(StartDate, 'Mon') AS "MONTH",
    COUNT(*) AS "TOTAL_SUBSCRIPTIONS"
FROM Subscription
WHERE DurationInMonths >= 6
GROUP BY to_char(StartDate, 'Mon')
HAVING COUNT(*) > 1;


-- Assignment7_GroupBy_FilterAvgDiscount

SELECT
  JournalId,
  AVG(DiscountPercent) AS "AVG_DIS"
FROM Subscription
WHERE StartDate < DATE '2023-11-01'
GROUP BY JournalId;


-- Assignment8_GroupBy_AvgMonthlyCharges

SELECT
    Genre,
    AVG(MonthlyCharges) AS "Average Charge"
FROM Journal
WHERE Genre <> 'Trade'
GROUP BY Genre
HAVING AVG(MonthlyCharges) < 100;


-- Assignment9_GroupBy_JournalWiseSubscription

SELECT
    JournalId,
    COUNT(*) AS "TOTALSUBSCRIPTIONS"
FROM Subscription
GROUP BY JournalId;


-- Assignment10_GroupBy_FilterAvgCharges

SELECT
    PublisherId,
    AVG(MonthlyCharges) AS "MONTHLY_CHARGES"
FROM Journal
WHERE Genre IN ('Trade', 'Politics')
GROUP BY PublisherId
HAVING AVG(MonthlyCharges) < 110;


-- Assignment11_GroupBy_StartDate

SELECT
    StartDate,
    AVG(DiscountPercent)::numeric(10,5) AS "AVG_DISCOUNT"
FROM Subscription
WHERE DurationInMonths >= 6
GROUP BY StartDate
HAVING AVG(DiscountPercent) > 10;
