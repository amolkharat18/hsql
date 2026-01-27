-- Assignment1_DML_InsertJournalColumns

INSERT INTO Journal (JournalId, JournalName, Genre, MonthlyCharges, PublisherId)
VALUES ('J209', 'Omnitrix', 'Scientific', 120, 'P105');


-- Assignment2_DML_InsertJournal

INSERT INTO Journal (JournalId, JournalName, Genre, MonthlyCharges, PublisherId)
VALUES ('J210', 'Tech-Era', 'Scientific', 10, NULL);


-- Assignment3_DML_InsertPublisher

INSERT INTO Publisher (PublisherId, PublisherName, Rating, ContactNo)
VALUES ('P108', 'Oxford Press', 4.6, NULL);


-- Assignment4_DML_InsertCustomer

INSERT INTO Customer (CustomerId, CustomerName, CustomerType, State, City)
VALUES ('C110', 'Joseph', NULL, 'Florida', 'Miami');


-- Assignment5_DML_InsertSubscriptions

INSERT INTO Subscription (SubscriptionId, JournalId, CustomerId, StartDate, DurationInMonths, DiscountPercent)
VALUES ('S315', 'J206', 'C103', '2023-08-17', 6, NULL);
INSERT INTO Subscription (SubscriptionId, JournalId, CustomerId, StartDate, DurationInMonths, DiscountPercent)
VALUES ('S316', NULL, NULL, '2023-02-15', 5, 10);


-- Assignment6_DML_InsertSubscription

INSERT INTO Subscription (SubscriptionId, JournalId, CustomerId, StartDate, DurationInMonths, DiscountPercent)
VALUES ('S317', 'J201', 'C105', DEFAULT, 6, 15);


-- Assignment7_DML_DisplayJournals

SELECT JournalId, JournalName
FROM Journal
WHERE Genre IN ('Scientific', 'Politics');


-- Assignment8_DML_DisplayDiscountedAmount

SELECT
    JournalName AS "JOURNALNAME",
    MonthlyCharges AS "CURRENT CHARGES",
    MonthlyCharges * (1 - 5/100.0) AS "OFFER PRICE",
    MonthlyCharges * (5/100.0) AS "DISCOUNTED AMOUNT"
FROM Journal;

-- Assignment9_DML_DatesRange

SELECT SubscriptionId, CustomerId
FROM Subscription
WHERE StartDate BETWEEN '2023-01-01' AND '2023-06-30';


-- Assignment10_DML_DisplayNonRegularCustomers

SELECT CustomerId, CustomerName, State, City
FROM Customer
WHERE CustomerType <> 'Regular';


-- Assignment11_DML_SQLOperators

SELECT JournalName, Genre
FROM Journal
WHERE Genre IN ('Trade', 'Politics')
  AND MonthlyCharges BETWEEN 90 AND 125;


-- Assignment12_DML_Operators

SELECT CustomerId, CustomerName, CustomerType, State
FROM Customer
WHERE State = 'Illinois'
  AND (CustomerType LIKE '%rime%' OR CustomerType LIKE '%gul%');


-- Assignment13_DML_MissingContactNos

SELECT PublisherName
FROM Publisher
WHERE ContactNo IS NULL;


-- Assignment14_DML_MonthlyChargesRange

SELECT JournalId, JournalName, MonthlyCharges
FROM Journal
WHERE MonthlyCharges > 85
  AND MonthlyCharges < 130;


-- Assignment15_DML_SelectiveGenre

SELECT JournalId, MonthlyCharges
FROM Journal
WHERE Genre IN ('Trade', 'Politics');


-- Assignment16_DML_UniqueStates

SELECT DISTINCT State
FROM Customer;


-- Assignment17_DML_UniqueStartDates

SELECT DISTINCT StartDate
FROM Subscription;


-- Assignment18_DML_UniqueStatePerCustomerType

SELECT DISTINCT CustomerType, State
FROM Customer;


-- Assignment19_DML_Like_ti

SELECT JournalName, Genre
FROM Journal
WHERE Genre LIKE '%ti%';


-- Assignment20_DML_LIKE

SELECT PublisherId, PublisherName, Rating, ContactNo
FROM Publisher
WHERE PublisherName LIKE '%i_';
