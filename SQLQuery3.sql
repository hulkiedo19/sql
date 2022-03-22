CREATE DATABASE [OLIMP_XXXXXX]
GO

USE [OLIMP_XXXXXX];
GO

CREATE TABLE Categories (
	CategoryId INT PRIMARY KEY IDENTITY,
	Designation NVARCHAR(MAX) NOT NULL,
	CategoryDescription NVARCHAR(MAX) NOT NULL
);

CREATE TABLE HotelRooms (
	HotelRoomId INT PRIMARY KEY IDENTITY,
	CategoryId INT FOREIGN KEY REFERENCES Categories(CategoryId) NOT NULL,
	[Description] NVARCHAR(MAX) NOT NULL,
	[Floor] INT NOT NULL,
	CostPerDay INT NOT NULL,
	SeatsNumber INT NOT NULL,
	[Status] NVARCHAR(20)
);

CREATE TABLE Clients (
	ClientId INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	MiddleName NVARCHAR(50) NULL,
	Gender NVARCHAR(10) NOT NULL,
	DateOfBirth DATE NOT NULL,
	BonusCard NVARCHAR(20) NOT NULL
);

CREATE TABLE MigrationCards (
	ClientId INT PRIMARY KEY NOT NULL,
	CardNumber NVARCHAR(10) NOT NULL,
	WhereCountry NVARCHAR(MAX) NOT NULL,
	StayWith DATE NOT NULL,
	StayBy DATE NOT NULL,
	TripPurpose NVARCHAR(MAX) NOT NULL,

	CONSTRAINT FK_MigrationCard_Clients_ClientId FOREIGN KEY (ClientId) REFERENCES Clients(ClientId)
);

CREATE TABLE Passports (
	ClientId INT PRIMARY KEY NOT NULL,
	Series NVARCHAR(5) NOT NULL,
	Number NVARCHAR(6) NOT NULL,
	DocumentType NVARCHAR(20) NOT NULL,
	Issued NVARCHAR(40) NOT NULL,
	IssuedAddress NVARCHAR(MAX) NOT NULL,
	CountryIssued NVARCHAR(MAX),

	CONSTRAINT FK_Passport_Clients_ClientId FOREIGN KEY (ClientId) REFERENCES Clients(ClientId)
);

CREATE TABLE Treaties (
	TreatyNumber INT PRIMARY KEY IDENTITY,
	TreatyDate DATE NOT NULL,
	ClientId INT FOREIGN KEY REFERENCES Clients(ClientId) NOT NULL,
	HotelRoomId INT FOREIGN KEY REFERENCES HotelRooms(HotelRoomId) NOT NULL,
	DateEntrance DATE NOT NULL,
	DateEscape DATE NOT NULL,
	SumOfPay INT NOT NULL,
	PaymentMethod NVARCHAR(10) NOT NULL,
);
