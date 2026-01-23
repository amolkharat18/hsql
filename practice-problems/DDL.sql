-- DDL

-- Create
CREATE TABLE dbo.Course (
    CourseId              CHAR(6)      NOT NULL,
    CourseName            VARCHAR(40)  NOT NULL,
    DurationHours         INT          NOT NULL,
    MaxStrength           INT          NOT NULL,
    IsCertificationOffered BIT         NOT NULL,
    CONSTRAINT PK_Course PRIMARY KEY (CourseId),

    -- Must start with C and have 5 more alphanumeric characters (total 6)
    CONSTRAINT CK_CourseId_Format CHECK (
        CourseId LIKE 'C[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]'
    ),

    -- Duration must be positive
    CONSTRAINT CK_Duration_Positive CHECK (DurationHours > 0),

    -- MaxStrength must be positive
    CONSTRAINT CK_MaxStrength_Positive CHECK (MaxStrength > 0)
);


-- Alter
CREATE TABLE Product (
    ProductId          VARCHAR(3) PRIMARY KEY,        -- unique identifier of the product
    ProductName        VARCHAR(20) NOT NULL,          -- name of the product
    Category           VARCHAR(20) NOT NULL,          -- category of the product
    "Type"             VARCHAR(20),                   -- type of the product (quoted due to reserved word)
    Color              VARCHAR(10),                   -- color of the product
    QuantityAvailable  INTEGER                        -- availability of the product
);


ALTER TABLE Product
ADD COLUMN Price NUMERIC(5);

ALTER TABLE Product
ALTER COLUMN ProductId TYPE VARCHAR(5);

ALTER TABLE Product
RENAME COLUMN "Type" TO ProductType;
