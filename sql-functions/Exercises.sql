-- Exercise1_Functions_CeilingFloor

SELECT
    vendorid AS "VendorId",
    CEIL(price) AS "Higher_Round",
    FLOOR(price) AS "Lower_Round"
FROM vendoroffering;


-- Exercise2_Functions_Absolute

SELECT 
    ABS(price - 500) AS "After Discount"
FROM vendoroffering;


-- Exercise3_Functions_FilterProducts

SELECT 
    SUBSTRING(productid, 2) || '-' || pname AS "Product"
FROM product
WHERE LOWER(color) = 'white'
  AND LENGTH(pname) > 9;

-- Exercise4_Functions_Character

SELECT 
    pname || '-' || SUBSTRING(review, 1, 1) AS "Product_Review"
FROM product
WHERE pcategory LIKE '%i%';


-- Exercise5_Functions_Aggregate

SELECT
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating,
    AVG(rating) AS avg_rating,
    COUNT(*)    AS numberofvendors
FROM vendor
WHERE rating IS NOT NULL;


-- Exercise6_Functions_AggregateFilteredRows

SELECT
    MAX(age) AS "MaxAge",
    MIN(age) AS "MinAge",
    AVG(age) AS "AvgAge",
    COUNT(*) AS "NumberOfCustomers"
FROM customer
WHERE LENGTH(custname) > 3;


-- Exercise7_Functions_TotalPrice

SELECT 
    SUM(CEIL(price)) AS "Total_Price"
FROM vendoroffering;


-- !Exercise8_Functions_MonthsLapsed

SELECT
    invoiceid,
    productid,
    FLOOR(MONTHS_BETWEEN(CURRENT_DATE, purchasedate)) AS noofmonths
FROM invoice
WHERE productid = 'P105';


-- Exercise9_Functions_Date

SELECT
    invoiceid AS "InvoiceId",
    purchasedate AS "PurchaseDate",
    ADD_MONTHS(purchasedate, 2) AS "ExchangeValidityDate"
FROM invoice;


-- Exercise10_Function_NVL

SELECT
    custid AS "CustomerId",
    custname AS "CustomerName",
    NVL(email, 'Not Provided') AS "CustEmail",
    NVL(age, 0) AS "CustAge"
FROM customer;


-- Exercise11_Functions_StringInCharacterColumn

SELECT
    VendorID,
    NVL(TO_CHAR(Rating), 'Not Provided') AS "RATING"
FROM Vendor;
