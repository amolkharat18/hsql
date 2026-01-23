-- Assignment1_Functions_Numeric

SELECT
    j.JournalId AS "JournalId",
    FLOOR(CAST(j.MonthlyCharges AS DECIMAL(10,2)) - 70.25) AS "Rounded_Integer"
FROM Journal AS j
WHERE CHAR_LENGTH(j.Genre) > 8;


-- Assignment2_Functions_CountSelectivePublishers

SELECT COUNT(*) AS "NUMBEROFPUBLISHERS"
FROM Publisher
WHERE ContactNo IS NOT NULL
  AND CHAR_LENGTH(PublisherName) > 5;


-- Assignment3_Functions_RoundOff2DecimalDigits

SELECT 
    JournalId AS "JournalId",
    Genre AS "Genre",
    MonthlyCharges AS "Old_Price",
    ROUND(MonthlyCharges * 0.625, 2) AS "New_Price"
FROM Journal
WHERE Genre = 'Academics';

-- Assignment4_Functions_regularCustomers

SELECT 
    CustomerId AS "CUSTOMERID",
    CustomerName AS "CUSTOMERNAME"
FROM Customer
WHERE LOWER(CustomerType) = 'regular'
  AND LOWER(State) LIKE '%o%';


-- Assignment5_Functions_SelectiveJournals

SELECT 
    JournalId AS "JOURNALID",
    JournalName AS "JOURNALNAME"
FROM Journal
WHERE CAST(RIGHT(PublisherId, 1) AS INTEGER) > 2
  AND JournalName LIKE '%o%t%';

-- Assignment6_Functions_Aggregate

SELECT 
    MAX(DiscountPercent) AS "MaxDiscount",
    MIN(DiscountPercent) AS "MinDiscount",
    AVG(DiscountPercent) AS "AvgDiscount"
FROM Subscription;

-- Assignment7_Functions_CombineColumnData

SELECT 
    CustomerId || '/' || SUBSTRING(CustomerType FROM 1 FOR 4) AS "Customer-ID"
FROM Customer;


-- Assignment8_Functions_CountUniqueStartDates

SELECT 
    COUNT(DISTINCT StartDate) AS "Total_Dates"
FROM Subscription;


-- Assignment9_Functions_MinDiscountPercent

SELECT 
    MIN(DiscountPercent) AS "Min Discount Percent",
    COUNT(*) AS "No. Of Customers"
FROM Subscription
WHERE MONTH(StartDate) = 11;


-- Assignment10_Functions_NoOfUniqueCustomers

SELECT 
    COUNT(DISTINCT CustomerId) AS "NoOfUniqueCustomer"
FROM Subscription
WHERE MONTH(StartDate) <> 6;


-- Assignment11_Functions_TotalMonthlyCharges

SELECT 
    SUM(MonthlyCharges) AS "Monthly_Charges"
FROM Journal
WHERE CAST(RIGHT(PublisherId, 1) AS INTEGER) > 4;


-- Assignment12_Functions_NestedDateFunctions

SELECT 
    SubscriptionId AS "SUBSCRIPTIONID",
    CustomerId     AS "CUSTOMERID"
FROM Subscription
WHERE DATEADD('month', DurationInMonths, StartDate)
      BETWEEN DATE '2024-06-30' AND DATE '2024-07-30';


-- Assignment13_Case_JournalCategory

SELECT
    JournalName AS "JOURNALNAME",
    MonthlyCharges AS "MONTHLYCHARGES",
    CASE
        WHEN MonthlyCharges < 75 THEN 'LowCost'
        WHEN MonthlyCharges BETWEEN 75 AND 100 THEN 'AverageCost'
        ELSE 'HighCost'
    END AS "JOURNALCATEGORY"
FROM Journal;


-- Assignment14_Case_NewMonthlycharges

SELECT
    JournalName AS "JOURNALNAME",
    Genre AS "GENRE",
    MonthlyCharges AS "MONTHLYCHARGES",
    MonthlyCharges +
        CASE 
            WHEN Genre = 'Trade' THEN MonthlyCharges * 0.10
            WHEN Genre = 'Scientific' THEN MonthlyCharges * 0.15
            WHEN Genre = 'Academics' THEN MonthlyCharges * 0.05
            WHEN Genre = 'Politics' THEN MonthlyCharges * 0.25
            ELSE MonthlyCharges * 0.20
        END AS "NEWMONTHLYCHARGE"
FROM Journal
