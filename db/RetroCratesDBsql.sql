DROP DATABASE IF EXISTS retrocrates;

CREATE DATABASE retrocrates;

USE retrocrates;

CREATE TABLE Utente(
    Username VARCHAR(20) NOT NULL,
    Email VARCHAR(50),
    Passwordhash VARCHAR(128) NOT null,
    Datanas DATE NOT NULL,
    Tipo ENUM('Admin', 'Utente') NOT NULL,
    PRIMARY KEY (Username)
);

CREATE TABLE Ordine(
    IdOrdine CHAR(10) NOT NULL,
    Utente VARCHAR(20) NOT NULL,
    Destinazione VARCHAR(255),
    Email VARCHAR(50) NOT NULL,
    CostoTotale DECIMAL(10,2) NOT NULL,
    DataOrdine DATE NOT NULL,
    PRIMARY KEY (IdOrdine,Utente),
    FOREIGN KEY (Utente) REFERENCES Utente(Username)
);


CREATE TABLE Prodotto(
	IdProdotto CHAR(7) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Descrizione TEXT NOT NULL, 
	Qta INT NOT NULL, -- >=0
	Disponibile BOOLEAN, -- al posto di cancellarlo
	Foto VARCHAR(50),
	Costo DECIMAL(10,2) NOT NULL,
	stelleTot INT NOT NULL,
	
	Produttore VARCHAR(30) NOT NULL,
	
	Genere VARCHAR(30),
	
	Piattaforma VARCHAR(30), 
	
	TipoGioco VARCHAR(15),
	
	TipoProdotto VARCHAR(15),
	
	Categoria VARCHAR(15), 
	
	Edizione VARCHAR(35),
	
	PRIMARY KEY (IdProdotto),
    CHECK (Qta>=0),
    CHECK (Costo>=0)
);

CREATE TABLE ContieneProd(
    IdOrdine CHAR(10) NOT NULL,
    IdProdotto CHAR(7) NOT NULL,
    Qta INT NOT NULL,
    Costo DECIMAL(10,2) NOT NULL, 
    PRIMARY KEY (IdOrdine,IdProdotto),
    FOREIGN KEY (IdProdotto) REFERENCES Prodotto(IdProdotto),
    FOREIGN KEY (IdOrdine) REFERENCES Ordine(IdOrdine),
    CHECK (Costo>=0)
);

-- Console
INSERT INTO Prodotto VALUES ('con0001', 'PS5', 'Sony PlayStation 5', 100, TRUE, NULL, 499.99, 4, 'Sony', NULL, NULL, NULL, 'Console', NULL, NULL);
INSERT INTO Prodotto VALUES ('con0002', 'Xbox Series X', 'Microsoft Xbox Series X', 100, TRUE, NULL, 499.99, 4, 'Microsoft', NULL, NULL, NULL, 'Console', NULL, NULL);
INSERT INTO Prodotto VALUES ('con0003', 'Nintendo Switch', 'Nintendo Switch', 100, TRUE, NULL, 299.99, 5, 'Nintendo', NULL, NULL, NULL, 'Console', NULL, NULL);
INSERT INTO Prodotto VALUES ('con0004', 'Atari 2600', 'Atari 2600', 100, TRUE, NULL, 199.99, 5, 'Atari', NULL, NULL, NULL, 'Console', NULL, 'RetroCrates');
INSERT INTO Prodotto VALUES ('con0005', 'Sega Mega Drive', 'Sega Mega Drive', 100, TRUE, NULL, 149.99, 5, 'Sega', NULL, NULL, NULL, 'Console', NULL, 'RetroCrates');

-- Videogiochi
INSERT INTO Prodotto VALUES ('game001', 'The Last of Us Part II', 'Azione Avventura', 100, TRUE, NULL, 59.99, 5, 'Naughty_Dog', 'Action_Adventure', 'PS4', 'Fisico', 'Videogioco', NULL, 'Standard_Edition');
INSERT INTO Prodotto VALUES ('game002', 'Halo Infinite', 'Sparatutto', 100, TRUE, NULL, 59.99, 4, 'Microsoft_Studios', 'Sparatutto', 'Xbox_Series_X_S', 'Digitale', 'Videogioco', NULL, 'Standard_Edition');
INSERT INTO Prodotto VALUES ('game003', 'The Legend of Zelda: Breath of the Wild', 'Azione Avventura', 100, TRUE, NULL, 59.99, 5, 'Nintendo', 'Action_Adventure', 'Switch', 'Fisico', 'Videogioco', NULL, 'Standard_Edition');
INSERT INTO Prodotto VALUES ('game004', 'Pac-Man', 'Arcade', 100, TRUE, NULL, 19.99, 4, 'Bandai_Namco_Entertainment', 'Picchiaduro', 'Atari_2600', 'Fisico', 'Videogioco', NULL, 'Standard_Edition');
INSERT INTO Prodotto VALUES ('game005', 'Sonic the Hedgehog', 'Azione Avventura', 100, TRUE, NULL, 29.99, 3, 'Sega', 'Action_Adventure', 'Sega_Mega_Drive', 'Fisico', 'Videogioco', NULL, 'Standard_Edition');

-- Collezionabili
INSERT INTO Prodotto VALUES ('coll001', 'Poster di The Last of Us Part II', 'Poster di alta qualità', 100, TRUE, NULL, 14.99, 3, 'Naughty_Dog', NULL, NULL, NULL, 'Collezionabile', 'Poster', 'Normale');
INSERT INTO Prodotto VALUES ('coll002', 'Tazza di Halo Infinite', 'Tazza con logo di Halo Infinite', 100, TRUE, NULL, 7.99, 5, 'Microsoft_Studios', NULL, NULL, NULL, 'Collezionabile', 'Gadget', 'Normale');
INSERT INTO Prodotto VALUES ('coll003', 'Funko Pop Pac-Man', 'Funko Pop di Pac-Man', 100, FALSE, NULL, 9.99, 1, 'Funko', NULL, NULL, NULL, 'Collezionabile', 'Figure', 'Normale');
INSERT INTO Prodotto VALUES ('coll004', 'Poster di Sonic the Hedgehog', 'Poster di alta qualità', 100, TRUE, NULL, 14.99, 4, 'Sega', NULL, NULL, NULL, 'Collezionabile', 'Poster', 'Normale');

-- Insert a user
INSERT INTO Utente (Username, Email, Passwordhash, Datanas, Tipo)
VALUES ('user1', 'user1@example.com', 'bb0576674f2587b945c53ce914f52fcf96d924f1f2a194650f52b9a9a35a1270', '2000-01-01', 'Utente'),
		('Admin', NULL, 'c1c224b03cd9bc7b6a86d77f5dace40191766c485cd55dc48caf9ac873335d6f', '2004-01-27', 'Admin');

-- Insert an order for the user
INSERT INTO Ordine (IdOrdine, Utente, Destinazione, Email, DataOrdine, CostoTotale)
VALUES ('ord001', 'user1', '123 Main St, City, Country', 'user1@example.com', '2024-11-11', 619.97);

-- Insert 4 items into the order
INSERT INTO ContieneProd (IdOrdine, IdProdotto, Qta, Costo)
VALUES ('ord001', 'con0001', 1, 499.99),
       ('ord001', 'game001', 1, 59.99),
       ('ord001', 'game003', 1, 59.99);

