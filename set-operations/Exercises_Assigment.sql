-- Exercise1_Union_SelectiveInvoices

SELECT
    i.invoiceid,
    i.quantitypurchased,
    i.discount
FROM invoice i
WHERE CAST(RIGHT(i.productid, 1) AS integer) < 5

UNION ALL

SELECT
    i.invoiceid,
    i.quantitypurchased,
    i.discount
FROM invoice i
WHERE i.discount < 10

ORDER BY 1;


-- Exercise2_Union_SelectiveProducts

SELECT p.pname, p.brand
FROM product p
WHERE p.color NOT IN ('Brown', 'Yellow')

UNION

SELECT p.pname, p.brand
FROM product p
WHERE p.review <> 'Bad'

ORDER BY 1, 2;


-- Exercise3_Union_FilterVendors

SELECT
    v.vendorid,
    v.vendorname,
    v.vendorcontactno,
    v.rating
FROM vendor v
WHERE v.vendorcontactno IS NOT NULL
  AND CAST(v.vendorcontactno AS VARCHAR(10)) <> ''
  AND v.rating > 3

UNION ALL

SELECT
    v.vendorid,
    v.vendorname,
    v.vendorcontactno,
    v.rating
FROM vendor v
WHERE v.vendorcontactno IS NOT NULL
  AND CAST(v.vendorcontactno AS VARCHAR(10)) <> ''
  AND v.vendorname LIKE '%a%'
ORDER BY 1, 2;

-- Assignment1_CombiningData_E

SELECT p.PublisherId AS "PUBLISHERID"
FROM Publisher p
LEFT JOIN Journal j
  ON j.PublisherId = p.PublisherId
WHERE j.PublisherId IS NULL
ORDER BY "PUBLISHERID";
