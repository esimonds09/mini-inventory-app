CREATE TABLE ProductTypes (
    ProductTypeID INT IDENTITY(1,1) PRIMARY KEY,
    TypeName VARCHAR(100) NOT NULL UNIQUE
);