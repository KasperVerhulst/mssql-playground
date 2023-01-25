--Table Schema

CREATE TABLE dbo.Customer (
    CUSTOMER_CODE char(8) NOT NULL,
    FIRST_NAME char(50) NOT NULL,
    LAST_NAME char(50) NOT NULL,
    MUT_TS datetime2(6),

    CONSTRAINT PK_CUSTOMER PRIMARY KEY CLUSTERED (CUSTOMER_CODE)
);
GO

-- Create trigger for modifation timestamp
CREATE TRIGGER MUT_TS_TRIGGER
ON Customer
AFTER INSERT, UPDATE
AS
UPDATE Customer
SET MUT_TS = SYSDATETIME()
WHERE CUSTOMER_CODE IN (SELECT DISTINCT CUSTOMER_CODE FROM inserted);

GO

-- Insert data
INSERT INTO Customer(CUSTOMER_CODE,FIRST_NAME,LAST_NAME) VALUES
("ON01","Kasper","Verhulst"),
("ON02","Joris","Goossens"),
("ON03","Peter","Vermeer"),
("ON04","Bart","Dubois");

GO

