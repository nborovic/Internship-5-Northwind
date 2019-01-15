/* 
	BANKA
*/



/* Creating tables */

USE Banka

CREATE TABLE Titles (
	ID INT IDENTITY(1, 1),
	Title NVARCHAR(30) UNIQUE NOT NULL
)

CREATE TABLE Users (
	ID INT IDENTITY(1, 1),
	FirstName NVARCHAR(20) NOT NULL,
	LastName NVARCHAR(20) NOT NULL,
	Oib NVARCHAR(11) NOT NULL,
	PhoneNumber NVARCHAR(20),
	HomeAddress NVARCHAR(20),
	City NVARCHAR(20) NOT NULL,
	Country NVARCHAR(20) NOT NULL,
	PostalCode NVARCHAR(15) NOT NULL
)

CREATE TABLE Transactions (
	ID INT IDENTITY(1, 1),
	ProcessingDate DATETIME NOT NULL,
	ProcessingStatus BIT NOT NULL
)

CREATE TABLE Employees (
	ID INT IDENTITY(1, 1),
	FirstName NVARCHAR(20) NOT NULL,
	LastName NVARCHAR(20) NOT NULL,
	Title NVARCHAR(30) NOT NULL,
	Email NVARCHAR(254)
)

/* Altering tables */

ALTER TABLE Transactions
	ADD ProcessingDescription NVARCHAR(255)

ALTER TABLE Employees
	ADD Notes NVARCHAR(255)

ALTER TABLE Users 
	ADD UNIQUE (Oib)

/* Titles */

INSERT INTO Titles (Title) 
	VALUES ('Direktor'), ('Potpredsjednik'), ('Investicijski suradnik'), (N'Investicijski analitičar')

/* Users */

INSERT INTO Users (FirstName, LastName, Oib, PhoneNumber, HomeAddress, City, Country, PostalCode) 
	VALUES('Nino', N'Borović', '45829174851', '+3850923451899', N'Krležina 22', 'Split', 'Hrvatska', '21000'),
		  ('Ivo', N'Ivić', '53161461451', '+3850915439918', N'Ivićeva 1', 'Zagreb', 'Hrvatska', '10010'),
		  ('Ante', N'Antić', '64329144851', null, null, 'Split', 'Hrvatska', '21000'),
		  ('Luka', N'Lukić', '11829174851', null, N'Lukićeva 3', 'Zagreb', 'Hrvatska', '10010')

UPDATE Users
SET PhoneNumber = '+3850923561899'
WHERE Oib = '64329144851'

UPDATE Users
SET City = 'Pula'
WHERE City = 'Zagreb'

DELETE FROM Users WHERE ID = 3

/* Transactions */

INSERT INTO Transactions (ProcessingDate, ProcessingStatus, ProcessingDescription) 
	VALUES (convert(datetime,'18-06-17 10:34:09 PM', 4), 1, 'Neka transakcija'),
		   ('20180315 05:32:12 AM', 0, 'Jos jedna transakcija'),
		   ('20150315 09:12:42 PM', 1, 'Opet transakcija'),
		   ('20151211 12:12:22 PM', 1, 'Transakcija')

UPDATE Transactions
SET ProcessingStatus = 0
WHERE ID = 1

DELETE FROM Transactions WHERE ID = 4

/* Employees */

INSERT INTO Employees (FirstName, LastName, Title, Email, Notes)
	VALUES ('Nino', N'Borović', 'Direktor','v-nino.borovic@dump.hr', 'Odličan radnik :)'),
		   ('Ivo', N'Ivić', 'Potpredsjednik', 'ivo.ivic@gmail.com', 'Kasni na posa'),
		   ('Ante', N'Antić', N'Investicijski analitičar', 'ante.antic@gmail.com', 'Nema task'),
		   ('Luka', N'Lukić', N'Investicijski suradnik', 'ante.antic@gmail.com', null)

UPDATE Employees
SET Email = 'ante.antic@outlook.com', Notes = 'Ima task'
WHERE ID = 3

DELETE FROM Employees 
	WHERE ID = 4

SELECT * FROM Employees
	WHERE FirstName LIKE '[a-g]%'
	


/* 
	NORTHWIND
*/



USE NORTHWND

/* 1 */

SELECT TOP 50 CompanyName, ContactName, ContactTitle, [Address], City, Phone
	FROM Customers

/* 2 */

SELECT COUNT(CustomerID) as [Count]
	FROM Customers
		WHERE Fax IS NOT NULL AND Region IS NOT NULL

/* 3 */

SELECT TOP 2 FirstName, LastName, Title
	FROM Employees
		ORDER BY BirthDate

/* 4 */

SELECT * FROM Customers
	WHERE [Address] LIKE '[0-9]%' AND CompanyName LIKE '__a%'
		ORDER BY Country

/* 5 */
	
SELECT TOP 1 OrderID	
	FROM [Order Details]
		ORDER BY Quantity DESC

/* 6 */

SELECT * FROM Customers
	WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders)