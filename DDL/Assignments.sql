-- Assignment1_DDL_Create_Publisher

CREATE TABLE Publisher (
    PublisherId   VARCHAR(4) PRIMARY KEY
        CHECK (PublisherId LIKE 'P%'),

    PublisherName VARCHAR(20) NOT NULL UNIQUE,

    Rating        NUMERIC(3,1) NOT NULL
        CHECK (Rating BETWEEN 1 AND 5),

    ContactNo     NUMERIC
);


-- Assignment2_DDL_Create_Subscription

CREATE TABLE Subscription (
    SubscriptionId   VARCHAR(4) PRIMARY KEY
        CHECK (SubscriptionId LIKE 'S%'),
    JournalId        VARCHAR(4),
    CustomerId       VARCHAR(4),
    StartDate        DATE DEFAULT SYSDATE,
    DurationInMonths INTEGER DEFAULT 3 NOT NULL
        CHECK (DurationInMonths > 0),
    Discount         NUMERIC,
    FOREIGN KEY (JournalId) REFERENCES Journal(JournalId),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
);


-- Assignment3_DDL_Create_Journal

CREATE TABLE Journal (
    JournalId       VARCHAR(4) PRIMARY KEY
        CHECK (JournalId LIKE 'J%'),

    JournalName     VARCHAR(25) NOT NULL
        CHECK (JournalName <> Genre),

    Genre           VARCHAR(20) NOT NULL
        CHECK (Genre IN ('Academics', 'Scientific', 'Politics', 'Trade')),

    MonthlyCharges  INTEGER NOT NULL
        CHECK (MonthlyCharges > 0),

    PublisherId     VARCHAR(4),
    FOREIGN KEY (PublisherId) REFERENCES Publisher(PublisherId)
);


-- Assignment4_DDL_Alter_AddColumn

ALTER TABLE Customer
ADD COLUMN ContactNo NUMERIC(10);


-- Assignment5_DDL_Alter_Size

ALTER TABLE Customer
ALTER COLUMN State VARCHAR(20);


-- Assignment6_DDL_Alter_Rename

ALTER TABLE Customer
ALTER COLUMN City RENAME TO CustomerCity;


-- Assignment7_DDL_Alter_Modify_DataType

ALTER TABLE Publisher
ALTER COLUMN ContactNo NUMERIC(10);


-- Assignment8_DDL_DropColumn

ALTER TABLE Customer
DROP COLUMN City;
