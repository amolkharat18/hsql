-- Exercise1_DDL_Create_Product

CREATE TABLE Product (
    ProductId VARCHAR(5) PRIMARY KEY
        CHECK (ProductId LIKE 'P%'),
    PName VARCHAR(30) NOT NULL,
    Brand VARCHAR(20) NOT NULL,
    PCategory VARCHAR(20)
);


-- Exercise2_DDL_Create_Vendor

CREATE TABLE Vendor (
    VendorId VARCHAR(5) PRIMARY KEY
        CHECK (VendorId LIKE 'V%'),
    VendorName VARCHAR(30) NOT NULL,
    VendorContactNo NUMERIC(10) UNIQUE,
    Rating INTEGER
        CHECK (Rating BETWEEN 0 AND 5)
);


-- Exercise3_DDL_Create_VendorOffering

CREATE TABLE VendorOffering (
    VendorId   VARCHAR(5),
    ProductId  VARCHAR(5) NOT NULL,
    Price      NUMERIC(7,2) NOT NULL
        CHECK (Price > 0),
    
    PRIMARY KEY (VendorId, ProductId),

    FOREIGN KEY (VendorId) REFERENCES Vendor(VendorId),
    FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
);


-- Exercise4_DDL_Create_Invoice

CREATE TABLE Invoice (
    InvoiceId          VARCHAR(5) PRIMARY KEY
        CHECK (InvoiceId LIKE 'IN%'),

    CustId             VARCHAR(5),
    VendorId           VARCHAR(5),
    ProductId          VARCHAR(5),

    QuantityPurchased  NUMERIC(2) NOT NULL,
    Discount           NUMERIC(3,1) NOT NULL,
    PurchaseDate       DATE NOT NULL,

    FOREIGN KEY (CustId) REFERENCES Customer(CustId),
    FOREIGN KEY (VendorId, ProductId) REFERENCES VendorOffering(VendorId, ProductId)
);


--  Exercise5_DDL_Alter_Rename

ALTER TABLE Product
ALTER COLUMN ProductId RENAME TO PId;


-- Exercise6_DDL_Alter_Modify_DataType

ALTER TABLE Product 
ALTER COLUMN Price INTEGER;


-- Exercise7_DDL_Alter_AddColumn

ALTER TABLE Product
ADD COLUMN Color VARCHAR(10);


-- Exercise8_DDL_Alter_AddColumn_Constraint

ALTER TABLE Product
ADD COLUMN Review VARCHAR(10)
    CHECK (Review IN ('Bad', 'Good', 'Excellent'));


-- Exercise9_DDL_Alter_DropTable_VendorOffering

DROP TABLE VendorOffering;


-- Exercise10_DDL_DropTable_Product

DROP TABLE Product CASCADE;


-- Exercise11_DDL_Alter_DropColumn

ALTER TABLE Product DROP COLUMN Price;
