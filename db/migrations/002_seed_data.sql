-- Initial seed data for reference tables

IF NOT EXISTS (SELECT * FROM ProductTypes WHERE TypeName = 'Widget A')
    INSERT INTO ProductTypes (TypeName) VALUES ('Widget A');

IF NOT EXISTS (SELECT * FROM ProductTypes WHERE TypeName = 'Widget B')
    INSERT INTO ProductTypes (TypeName) VALUES ('Widget B');

IF NOT EXISTS (SELECT * FROM ProductTypes WHERE TypeName = 'Widget C')
    INSERT INTO ProductTypes (TypeName) VALUES ('Widget C');
