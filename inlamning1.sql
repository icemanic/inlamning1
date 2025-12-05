-- Micael Engdahl YH25

CREATE DATABASE Bokhandel;				-- Skapar databasen.

USE Bokhandel;							-- Aktiverar databasen Bokhandel

-- 1. Tabell: Bok
CREATE TABLE Bok (
    ISBN VARCHAR(13) PRIMARY KEY,		--  Då ISBN är unikt för varje bok är det en perfekt Primary Key.
    Titel VARCHAR(255) NOT NULL,		--  Bokens titel Ej blankt/tomt.
    Forfattare VARCHAR(150) NOT NULL,	-- Förfaterns namn.
    Pris DECIMAL(10,2) NOT NULL,		-- Pris för bok ska kunna vara i decimalform pågrund av att vi fortfarande använder öre.
    Lagerstatus INT NOT NULL			-- Lagerstatus visar hur många böcker som finns i lagar.
);

-- 2. Tabell: Kund
CREATE TABLE Kund (							-- Kortare att skriva kund än kunder.
    KundID INT AUTO_INCREMENT PRIMARY KEY,	-- Primary Key KundID automatisk blir enklare och kortare än Epost.
    Namn VARCHAR(150) NOT NULL,				-- Kundens namn får inte vara blankt.
    Epost VARCHAR(150) UNIQUE NOT NULL,		-- Kundens Epostaddress för kund kontakt Unik får bara finnas en, Ej Blankt. Kan användas som Primary Key.
    Telefon VARCHAR(50) NOT NULL,			-- Kundens telefonnummer för kund kontakt EJ Blankt.
    Adress VARCHAR(255) NOT NULL			-- Kundens address kan bli lång då jag inte separerat postnummer osv Ej blankt.
);

-- 3. Tabell: Beställning
CREATE TABLE Bestallning (
    Ordernummer INT AUTO_INCREMENT PRIMARY KEY,		-- Beställningens Ordernummer Primary Key 
    KundID INT NOT NULL,							-- Foreign Key från Kund.
    Datum DATE NOT NULL,							-- Datumet för dagen då beställningen skapas.
    Totalbelopp DECIMAL(10,2) NOT NULL,				-- Beställningens kostnad.

	FOREIGN KEY (KundID)
	REFERENCES Kund(KundID)
);

-- 4. Tabell: Orderrad
CREATE TABLE Orderrad (
    OrderradID INT AUTO_INCREMENT PRIMARY KEY,		-- Fanns ingen PK så skapade en.
    Ordernummer INT NOT NULL,						-- FK från Bestallningar. 
    ISBN VARCHAR(13) NOT NULL,						-- FK från bok. ISBN går upp till 13 nummer sedan 2007.
    Antal INT NOT NULL,								-- Antal Böcker i ordern så man kan beställa mer än en av samma bok.
    Radpris DECIMAL(10,2) NOT NULL,					-- Tänkte att det kan vara bra om det inte är samma som pris i bok tabellen om det kan bli konflikt.

	FOREIGN KEY (Ordernummer)
	REFERENCES Bestallning(Ordernummer),

	FOREIGN KEY (ISBN)
	REFERENCES Bok(ISBN)
);

INSERT INTO Bok (ISBN, Titel, Forfattare, Pris, Lagerstatus) VALUES		-- Infogar böcker i bok.
('9113003382', 'Härskarringen', 'J R R Tolkien', 399.99, 12),
('9780345445605', 'The Hobbit', 'J R R Tolkien', 299.99, 8),
('9780008387969', 'Sagor från Midgård', 'J R R Tolkien', 299.99, 0);

INSERT INTO Kund (Namn, Epost, Telefon, Adress) VALUES					-- Infogar kunder i Kund.
('Erik Johansson', 'erik.johansson@email.com', '070-3214567', 'Södra Långgatan 12, 392 32 Kalmar'),
('Emma Karlsson', 'emma.karlsson@email.com', '073-6549871', 'Larmgatan 5, 392 32 Kalmar'),
('Johan Berglund', 'johan.berglund@email.com', '076-1122334', 'Norra Vägen 68, 392 39 Kalmar'),
('Sara Nilsson', 'sara.nilsson@email.com', '070-8877665', 'Stensbergsvägen 14, 393 52 Kalmar'),
('Marcus Andersson', 'marcus.andersson@email.com', '072-5566778', 'Öländskavägen 42, 393 50 Kalmar');

INSERT INTO bestallning (KundID, Datum, Totalbelopp) VALUES				-- Infogar en Beställning
('1', '2025-12-01', '299.99');

INSERT INTO orderrad (ordernummer, ISBN, Antal, Radpris) VALUES			-- Inforgar en Orderrad
( '1', '9780345445605', '1', '299.99');

SELECT * FROM kund;		-- Visar vilka kunder som finns i kund.

SELECT * FROM bok;		-- Visar vilka böcker som finns i bok.

SELECT Kund.namn, kund.adress, bestallning.ordernummer, bestallning.datum, bestallning.totalbelopp
FROM Kund
INNER JOIN bestallning
ON Kund.KundID = Bestallning.KundID;

SELECT orderrad.orderradID, orderrad.ordernummer, orderrad.Antal, bok.titel, bok.forfattare, bok.ISBN, orderrad.Radpris
FROM Bok
INNER JOIN Orderrad
ON Bok.ISBN = orderrad.ISBN;

DESCRIBE kund;			-- Visar en beskrivning av tabelen som Primary key, unik osv.
