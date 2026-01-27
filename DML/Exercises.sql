-- Exercise1_DML_InsertCustomer

INSERT INTO Customer (CustId, CustName, Gender)
VALUES ('C110', 'Denver', NULL);


-- Exercise2_DML_InsertVendor

INSERT INTO Vendor (VendorId, VendorName, VendorContactNo, Rating) VALUES
('V113', 'Alpha Traders', 7766671890, 4),
('V114', 'Max Retailers', NULL, 2),
('V115', 'Turning Tech', 6578567890, 3),
('V116', 'Dexter and Co', NULL, 4);


-- Exercise3_DML_InsertProduct

INSERT INTO Product (ProductId, PName, Brand, Review)
VALUES ('P111', 'Jacket', 'Woodland', NULL);


-- Exercise4_DML_Update2Columns

UPDATE Customer
SET CustName = 'James',
    CustLocation = 'Berlin'
WHERE CustId = 'C103';


-- Exercise5_DML_UpdateBrand

UPDATE Product
SET Brand = 'Adidas'
WHERE Color = 'White'
  AND Review = 'Good';


-- Exercise6_DML_UpdateReview

UPDATE Product
SET Review = 'Excellent'
WHERE Color = 'White';


-- Exercise7_DML_DeleteWhere

DELETE FROM Customer
WHERE CustLocation IN ('Ithaca', 'Auburn')
  AND Age < 35;


-- Exercise8_DML_DeleteBadProducts

DELETE FROM Product
WHERE Review = 'Bad';


-- Exercise9_DML_Delete_2Filters

DELETE FROM Vendor
WHERE VendorContactNo IS NOT NULL
  AND Rating IS NULL;


-- Exercise10_DML_SelectAll

SELECT PRODUCTID, PNAME, BRAND, PCATEGORY, COLOR, REVIEW
FROM PRODUCT;


-- Exercise11_DML_Select_Columns

SELECT VendorId, VendorName, Rating
FROM Vendor;


-- Exercise12_DML_SelectWhere

SELECT ProductId, Brand, PCategory, Color
FROM Product
WHERE PCategory = 'Clothing';


-- Exercise13_DML_SelectRating

SELECT Rating
FROM Vendor;


-- Exercise14_DML_RatingNotAvailable

SELECT VendorId, VendorName, Rating
FROM Vendor
WHERE Rating IS NULL;


-- Exercise15_DML_UniqueCategory

SELECT DISTINCT PCategory
FROM Product;


-- Exercise16_DML_LIKE

SELECT CustId, CustName, Age, Email
FROM Customer
WHERE CustName LIKE '%a%'
  AND CustLocation LIKE '%u%';
