USE master;
GO
--If the database already exist drop it--
IF  DB_ID('TripPlanner') IS NOT NULL
    DROP DATABASE TripPlanner;
GO
--After dropping create it--
CREATE DATABASE TripPlanner;
GO


USE TripPlanner;

--create the Newsletter Table for the database--
CREATE TABLE NewsLetter (
  ContactID         INT            PRIMARY KEY   IDENTITY,
  FirstName         VARCHAR(50)    NOT NULL,
  LastName          VARCHAR(50)    NOT NULL,
  EmailAddress      VARCHAR(50)    NOT NULL
);
--create the Contact Table for the database--
CREATE TABLE Contact (
  ContactID         INT            PRIMARY KEY   IDENTITY,
  FirstName         VARCHAR(50)    NOT NULL,
  LastName          VARCHAR(50)    NOT NULL,
  EmailAddress      VARCHAR(50)    NOT NULL,
  PhoneNumber          VARCHAR(13)    NOT NULL
);


--If the stored procedure already exist drop it--
 IF OBJECT_ID('sp_StoreNewsletter') IS NOT NULL
   DROP PROC sp_StoreNewsletter
 GO
--Creates a Stored procedure that allows us to insert into the NewLetter table--
CREATE PROC sp_StoreNewsletter
       @FirstName VARCHAR(50),
       @LastName VARCHAR(50),
       @EmailAddress VARCHAR(50)
AS
    INSERT NewsLetter
    VALUES (
			@FirstName
			,@LastName
			,@EmailAddress
			);
GO
--Runs the stored procedure one time to confirm it is working--
USE TripPlanner
GO
BEGIN TRY
    EXEC sp_StoreNewsletter 
		 'Testing'
		 ,'ContactAdd'
		 ,'Test@gmail.com';
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
    IF ERROR_NUMBER() >= 50000
        PRINT 'This is a custom error message.';
END CATCH;
GO


--If the stored procedure already exist drop it--

 IF OBJECT_ID('sp_StoreContact') IS NOT NULL
   DROP PROC sp_StoreContact
 GO
--Creates a Stored procedure that allows us to insert into the Contact table--
CREATE PROC sp_StoreContact
       @FirstName VARCHAR(50),
       @LastName VARCHAR(50),
       @EmailAddress VARCHAR(50),
	   @PhoneNumber VARCHAR(13)
AS
    INSERT Contact
    VALUES (
			@FirstName
			,@LastName
			,@EmailAddress
			,@PhoneNumber
			);
GO
--Runs the stored procedure one time to confirm it is working--
USE TripPlanner
GO
BEGIN TRY
    EXEC sp_StoreContact 
		 'Testing'
		 ,'ContactAdd'
		 ,'Test@gmail.com'
		 ,'1234567891';
END TRY
BEGIN CATCH
    PRINT 'An error occurred.';
    PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
    IF ERROR_NUMBER() >= 50000
        PRINT 'This is a custom error message.';
END CATCH;
GO

--If you are running multiple times be sure to either drop the login or comment out the below code before running again--
--DROP Login Tester;
CREATE LOGIN Tester WITH PASSWORD = 'SuperSecretPa$$w0rd',
    DEFAULT_DATABASE = TripPlanner;

IF  USER_ID('Tester') IS NOT NULL
    DROP USER Tester;
CREATE USER Tester FOR LOGIN [Tester];
--This grants the ability to use the stored procedures created above--
GRANT EXECUTE ON OBJECT::sp_StoreContact  
    TO Tester;  
GO
GRANT EXECUTE ON OBJECT::sp_StoreNewsLetter  
    TO Tester;  
GO