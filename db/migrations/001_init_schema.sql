-- Initializes cor schema for Mini Inventory App

-- Product Types
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='ProductTypes' AND xtype='U')
BEGIN
    CREATE TABLE ProductTypes (
        ProductTypeID INT IDENTITY PRIMARY KEY
        TypeName NVARCHAR(100) NOT NULL UNIQUE
    );
END

-- Production Requests
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='ProductionRequests' AND xtype='U')
BEGIN
    CREATE TABLE ProductionRequests (
        Requestid INT IDENTITY PRIMARY KEY,
        ProductTypeID INT NOT NULL,
        RequestedAt DATETIME DEFAULT GETDATE(),
        FOREIGN KEY (ProductTypeID) REFERENCES ProductTypes(ProductTypeID)
    );
END

-- Printed Products
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='PrintedProducts' AND xtype='U')
BEGIN 
    CREATE TABLE PrintedProducts (
        ProductID INT IDENTITY PRIMARY KEY,
        RequestID INT,
        PrintedAt DATETIME DEFAULT GETDATE(),
        FOREIGN KEY (RequestID) REFERENCES ProductionRequests(RequestID)
    );
END

-- Product Status
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='ProductStatus' AND xtype='U')
BEGIN 
    CREATE TABLE ProductStatus (
        StatusID INT IDENTITY PRIMARY KEY,
        ProductID INT,
        StatusUpdate NVARCHAR(100),
        StatusAT DATETIME DEFAULT GETDATE(),
        FOREIGN KEY (ProductID) REFERENCES PrintedProducts(ProductID)
    );
END