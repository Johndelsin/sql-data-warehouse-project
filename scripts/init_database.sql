/*
================================================================================
Create Database and Schemas
================================================================================
Description:
   Initializes the DataWarehouse environment. 
   If an existing DataWarehouse database is found, it will be removed and 
   recreated. The script also creates the bronze, silver, and gold schemas 
   used for layered data processing.

   Note:
   This operation is destructive and will permanently remove the existing 
   DataWarehouse database along with all contained objects and data.
   Ensure execution is limited to development or controlled environments.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
