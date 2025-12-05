# inlamning1
Micael Engdahl YH25

Inlämning1 Databas i mySQL för en liten bokhandel görs i lärande syfte, skriven i MySQL Workbench 8.0

Databasen ska automatisera och förenkla data hållningen för en liten bokhandeln.
Personal ska kunna hämta information om kunder, lagerstatus och göra beställningar.

Databasen innehåller Böcker, Kunder, Beställningar och Order rader i tabeller

Eftersom vi säljer böcker som produkt så måste böcker vara en egen entitet som består av sina attribut som Titel, författare, ISBN, pris, lagerstatus.

Kunder måste kopplas till en unik person för att kunna göra en beställning. Kunden har attribut som namn, adress, epost, telefon. Man måste kunna spåra en kund till en beställning annars vet man inte vem som ska ha boken.

En Beställning representerar en order som en kund gör och behöver ha information som datum, totalbelopp och Ordernummer för att hålla koll på varje beställning en kund gör.

Orderrader kopplar ihop beställning och bok med hjälp av FOREIGN KEYS som Ordernummer från beställningar och ISBN från böcker. Det ger möjligheten att en beställning kan innehålla flera böcker eller samma bok upprepade gånger med hjälp från attributen Antal och Radpris. 

Databasen tabeller har följande Entiteter. Bok, Orderrad, Bestallning, Kund.

Databasens Bok Tabell innehåller följande rader: ISBN (PK), Titel (Attribut), Forfattare (Attribut), Pris(Attribut), Lagerstatus(Attribut).

Databasens Orderrad Tabell innehåller följande rader: OrderradID (PK), Ordernummer (FK), ISBN (FK), Antal (Attribut, Radpris (Attribut).

Databasens Bestallning Tabell innehåller följande rader: Ordernummer (PK), KundID (FK), Datum (Attribut), Totalbelopp (Attribut).

Databasens Kund Tabell innehåller följande rader: KundID (PK), Namn (Attribut), Epost (unik Attribut), Telefon (Attribut), Adress (Attribut).

Varje bok har en unikt ISBN nummer vilket gör den lämplig som PRIMARY KEY detta är en så kallad naturlig nyckel då den inte behöver skapas artificiellt. Resterande PRIMARY KEYS OrderradID, Ordernummer, KundID är artificiella och har skapats av mig för att kunna skapa en referens mellan entiteterna Bok, Orderrad, Bestallning och Kund. Även värt att notera att Epost är en Naturlig PRIMARY KEY men jag ansåg att det blir för lång och jobbig att arbeta med.

ER Diagram i text form av databasen.

En Kund kan göra flera beställningar, En Beställning består av en eller flera orderrader, En Bok kan ha en eller Flera orderrader.

Kund (1) -----> (N) Bestallningar (1) -----> (N) Orderrad (N) <----- (1) Bok

För att infoga ny bok skriv följande.
INSERT INTO Bok (ISBN, Titel, Forfattare, Pris, Lagerstatus) VALUES
('ISBN numret', 'Bokens titel', 'Författarens namn', 'Bokens pris', 'Lagerantalet');

För att infoga ny kund skriv följande.
INSERT INTO Kund (Namn, Epost, Telefon, Adress) VALUES
('Förnamn Efternamn', 'email adress', 'telefonnummer', 'Adress, postnummer stad'),

Är min första uppladdning till Github räkna inte med någon support.

<(-.-<)(>-.-)>
