-- Exercise1_GroupBy_LocationWiseMinAge

SELECT c.CustLocation AS "LOCATION",
       MIN(c.Age)     AS "MINIMUMAGE"
FROM Customer c
GROUP BY c.CustLocation
ORDER BY "LOCATION";


-- Exercise2_GroupBy_RecentPurchaseDate

SELECT
    i.custid,
    MAX(i.purchasedate) AS recentpurchasedate
FROM invoice i
GROUP BY i.custid
ORDER BY i.custid;


-- Exercise3_GroupBy_WhiteProducts

SELECT
    p.brand,
    COUNT(*) AS noofwhiteproducts
FROM product p
WHERE p.color = 'White'
GROUP BY p.brand
ORDER BY p.brand;

-- Exercise4_GroupBy_RecentPurchaseDateProductWise

SELECT
    i.custid,
    i.productid,
    MAX(i.purchasedate) AS recentpurchasedate
FROM invoice i
GROUP BY i.custid, i.productid
ORDER BY i.custid, i.productid;


-- Exercise5_GroupBy_LocationWiseMinAgeOfEachGender

SELECT
    custlocation AS location,
    gender,
    MIN(age) AS minimumage
FROM customer
GROUP BY custlocation, gender
ORDER BY custlocation, gender;


-- Exercise6_GroupBy_MinAgeAtleast30

SELECT
    custlocation AS location,
    MIN(age) AS minimumage
FROM customer
GROUP BY custlocation
HAVING MIN(age) >= 30
ORDER BY custlocation;


-- Exercise7_GroupBy_LoyalCustomers

SELECT
    custid,
    vendorid,
    productid,
    COUNT(*) AS noofpurchases
FROM invoice
GROUP BY custid, vendorid, productid
HAVING COUNT(*) > 1
ORDER BY custid, vendorid, productid;

-- Exercise8_GroupBy_Month

SELECT 
    TO_CHAR(purchasedate, 'Mon') AS month,
    COUNT(*) AS number_of_purchases
FROM invoice
GROUP BY TO_CHAR(purchasedate, 'Mon'), EXTRACT(MONTH FROM purchasedate)
ORDER BY number_of_purchases DESC;

-- Exercise9_GroupBy_TotalQuantity

SELECT
    productid,
    SUM(quantitypurchased) AS total_quantity
FROM invoice
WHERE quantitypurchased > 1
GROUP BY productid
HAVING COUNT(*) > 1
ORDER BY productid;
