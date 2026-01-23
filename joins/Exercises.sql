-- Exercise1_Join_Condition

SELECT
    c.custname,
    LOWER(c.email) AS email,
    i.invoiceid
FROM invoice AS i
JOIN customer AS c
  ON c.custid = i.custid
WHERE i.discount > 12
ORDER BY c.custname, i.invoiceid;


-- Exercise2_Join_SelectiveCustomers

SELECT
    p.productid AS "Product Id",
    p.pname AS "Product Name",
    p.pcategory AS "Category"
FROM invoice i
JOIN product p
  ON p.productid = i.productid
WHERE i.custid IN ('C101', 'C108')
ORDER BY p.productid;


-- Exercise3_InnerJoin_SelectiveAgeGroup

SELECT
    c.custid AS "Customer ID",
    c.custname AS "Customer Name",
    i.productid AS "Product ID"
FROM customer c
JOIN invoice i
  ON c.custid = i.custid
WHERE c.age > 35
ORDER BY c.custid;

-- Exercise4_Join_ConditionOnMonth

SELECT DISTINCT
    c.custid,
    c.custname
FROM invoice i
JOIN customer c
  ON c.custid = i.custid
WHERE EXTRACT(MONTH FROM i.purchasedate) = 8
ORDER BY c.custid;


-- Exercise5_Join_CategoryWiseCount

SELECT
    p.pcategory,
    COUNT(*) AS NUMBER_OF_PRODUCTS
FROM invoice i
JOIN product p
  ON p.productid = i.productid
GROUP BY p.pcategory
ORDER BY p.pcategory;


-- Exercise6_Join_SelectiveColorProducts

SELECT
    v.vendorid,
    p.pname,
    p.color,
    FLOOR(vo.price) AS baseprice
FROM vendoroffering vo
JOIN product p
  ON p.productid = vo.productid
JOIN vendor v
  ON v.vendorid = vo.vendorid
WHERE p.color IN ('White', 'Blue')
ORDER BY v.vendorid, p.pname;

-- Exercise7_Join_CategoryWiseSelectiveCount

SELECT
    p.pcategory AS "Category",
    COUNT(*) AS "Total Products"
FROM invoice i
JOIN product p
  ON p.productid = i.productid
WHERE p.review = 'Good'
  AND i.quantitypurchased > 8
GROUP BY p.pcategory
ORDER BY p.pcategory;


-- Exercise8_Join_SelectiveVendors

SELECT
    v.vendorname,
    vo.productid,
    vo.price
FROM vendor v
JOIN vendoroffering vo
  ON v.vendorid = vo.vendorid
WHERE LENGTH(v.vendorname) > 15
  AND vo.price > 1000
ORDER BY v.vendorname, vo.productid;


-- Exercise9_Join_DiscountCalculation

SELECT
    i.custid,
    i.invoiceid,
    ROUND(vo.price * i.quantitypurchased, 0) AS mrp,
    ROUND((vo.price * i.quantitypurchased) - 
          ((vo.price * i.quantitypurchased) * (i.discount / 100.0)), 0) AS final_price
FROM invoice i
JOIN vendoroffering vo
  ON vo.vendorid = i.vendorid
 AND vo.productid = i.productid
WHERE i.quantitypurchased > 2
ORDER BY i.custid, i.invoiceid;


-- Exercise10_Join_GB_OB

SELECT
    c.custlocation AS location,
    p.brand,
    SUM(i.quantitypurchased) AS productssold
FROM invoice i
JOIN customer c
  ON c.custid = i.custid
JOIN product p
  ON p.productid = i.productid
GROUP BY c.custlocation, p.brand
ORDER BY c.custlocation, p.brand;


-- Exercise11_Join_CoLocatedCustomers

SELECT
    c1.custid,
    c1.custname,
    c1.custlocation
FROM customer c1
WHERE c1.custlocation IN (
    SELECT custlocation
    FROM customer
    GROUP BY custlocation
    HAVING COUNT(*) > 1
)
ORDER BY c1.custlocation, c1.custid;

-- Exercise12_Join_FilterProducts

SELECT
    p.pname,
    p.pcategory,
    p.review
FROM product p
WHERE p.review <> 'Bad'
  AND (p.pcategory, p.review) IN (
        SELECT pcategory, review
        FROM product
        WHERE review <> 'Bad'
        GROUP BY pcategory, review
        HAVING COUNT(*) > 1
      )
ORDER BY p.pcategory, p.pname;


-- Exercise13_Join_LoyalCustomers

SELECT
    i1.custid,
    i1.vendorid,
    i1.productid
FROM invoice i1
JOIN invoice i2
  ON i1.custid = i2.custid
 AND i1.vendorid = i2.vendorid
 AND i1.productid = i2.productid
 AND i1.invoiceid <> i2.invoiceid
GROUP BY i1.custid, i1.vendorid, i1.productid
ORDER BY i1.custid, i1.vendorid, i1.productid;

-- Exercise14_Join_UniqueCustomerProducts

SELECT DISTINCT
    c.custname,
    i.productid
FROM customer c
LEFT JOIN invoice i
  ON i.custid = c.custid
ORDER BY c.custname, i.productid;


-- Exercise15_Join_AllVendors

SELECT
    v.vendorname,
    COALESCE(p.pname, 'NA') AS pname
FROM vendor v
LEFT JOIN vendoroffering vo
  ON vo.vendorid = v.vendorid
LEFT JOIN product p
  ON p.productid = vo.productid
ORDER BY v.vendorname, p.pname;


-- Exercise16_OuterJoin_FilterMain_W

SELECT
    p.productid,
    COALESCE(i.invoiceid, 'NOT YET SOLD') AS invoiceid
FROM product p
LEFT JOIN invoice i
  ON i.productid = p.productid
WHERE p.pcategory = 'Clothing'
ORDER BY p.productid;


-- Exercise17_OuterJoin_FilterMain_O

SELECT
    p.productid,
    COALESCE(i.invoiceid, 'NOT YET SOLD') AS invoiceid
FROM product p
LEFT JOIN invoice i
  ON i.productid = p.productid
WHERE p.pcategory = 'Clothing'
ORDER BY p.productid;


-- Exercise18_OuterJoin_FilterLookup

SELECT
    p.productid,
    COALESCE(i.invoiceid, 'Not sold since Sept,23') AS invoiceid
FROM product p
LEFT JOIN invoice i
  ON i.productid = p.productid
 AND i.purchasedate > DATE '2023-08-31'
ORDER BY p.productid;
