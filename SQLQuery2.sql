USE OLYMP_00;
GO

CREATE TABLE Categories (
	CategoryId INT PRIMARY KEY IDENTITY,
	Designation NVARCHAR(50) NOT NULL,
	CategoryDescription NVARCHAR(50) NOT NULL
);

CREATE TABLE HotelRooms (
	RoomNumber INT PRIMARY KEY IDENTITY,
	CategoryId INT FOREIGN KEY REFERENCES Categories(CategoryId) NOT NULL,
	[Description] NVARCHAR(20) NOT NULL,
	[Floor] INT NOT NULL,
	CostPerDay INT NOT NULL,
	SeatsNumber INT NOT NULL,
	[Status] NVARCHAR(20)
);

CREATE TABLE Clients (
	ClientId INT PRIMARY KEY IDENTITY,
	FirstAndLastName NVARCHAR(50) NOT NULL,
	Gender NVARCHAR(10) NOT NULL,
	DateOfBirth DATE NOT NULL,
	BonusCard NVARCHAR(10) NOT NULL
);

CREATE TABLE MigrationCards (
	ClientId INT PRIMARY KEY NOT NULL,
	CardNumber INT NOT NULL,
	WhereCountry NVARCHAR(20) NOT NULL,
	StayWith DATE NOT NULL,
	StayBy DATE NOT NULL,
	TripPurpose NVARCHAR(50) NOT NULL,

	CONSTRAINT FK_MigrationCard_Clients_ClientId FOREIGN KEY (ClientId) REFERENCES Clients(ClientId)
);

CREATE TABLE Passports (
	ClientId INT PRIMARY KEY NOT NULL,
	Series NVARCHAR(4) NOT NULL,
	Number NVARCHAR(6) NOT NULL,
	DocumentType NVARCHAR(20) NOT NULL,
	Issued DATE NOT NULL,
	IssuedAddress NVARCHAR(20) NOT NULL,
	CountryIssued NVARCHAR(15) NOT NULL,

	CONSTRAINT FK_Passport_Clients_ClientId FOREIGN KEY (ClientId) REFERENCES Clients(ClientId)
);

CREATE TABLE Treaties (
	TreatyNumber INT PRIMARY KEY IDENTITY,
	TreatyDate DATE NOT NULL,
	ClientId INT FOREIGN KEY REFERENCES Clients(ClientId) NOT NULL,
	RoomNumber INT FOREIGN KEY REFERENCES HotelRooms(RoomNumber) NOT NULL,
	DateEntrance DATE NOT NULL,
	DateEscape DATE NOT NULL,
	SumOfPay INT NOT NULL,
	PaymentMethod NVARCHAR(10) NOT NULL,
);