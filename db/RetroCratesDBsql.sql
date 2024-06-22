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
	Foto MediumBlob,
	Costo DECIMAL(10,2) NOT NULL,
	stelleTot INT NOT NULL,
	
	Produttore ENUM('Sony', 'Microsoft', 'Nintendo', 'Atari', 'Sega', 'Altri', 
	'Ubisoft', 'Rockstar_Games', 'Activision', 'Electronic_Arts', 'Naughty_Dog', 'Microsoft_Studios', 
	'Bethesda', 'Gearbox_Software', 'Epic_Games', 'Capcom', 'Bandai_Namco_Entertainment', 'Konami',
	'Funko', 'Pokèmon', 'BandaiNamco', 'YouTooz', 'Hasbro') NOT NULL,
	
	Genere ENUM('Action_Adventure', 'Picchiaduro', 'RPG', 'Sparatutto', 'Simulazione', 'Sport', 'Strategia'),
	
	Piattaforma ENUM('PS1', 'PS2', 'PS3', 'PS4', 'PS5', 'Xbox', 'Xbox_360', 'Xbox_One', 'Xbox_Series_X_S', 
	'Nintendo_64', 'GameCube', 'Wii', 'Wii_U', 'Switch', 'Game_Boy', 'Nintendo_DS', 'Nintendo_3DS',
	'Sega_Mega_Drive', 'Sega_Master_System', 'DreamCast', 'SegaSaturn', 'Atari_2600', 
	'Atari_5200', 'Atari_7800', 'Altro'),
	
	TipoGioco ENUM('Digitale', 'Fisico'),
	
	TipoProdotto ENUM('Console', 'Videogioco', 'Collezionabile') NOT NULL,
	
	Categoria ENUM('Poster', 'Gadget', 'Figure', 'Plush', 'Audio'),
	
	Edizione ENUM('Standard_Edition', 'Bronze_Edition', 'Silver_Edition', 'Gold_Edition', 
	'Platinum_Edition', 'Diamond_Edition', 'G_O_T_Y_Edition', 'Enhanced_Edition', 'Ultimate_Edition',
	'Normale', 'Esclusiva', 'RetroCrates'),
	
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
INSERT INTO Prodotto VALUES ('con0001', 'PS5', 'Sony PlayStation 5', 100, TRUE, NULL, 499.99, 0, 0, 'Sony', NULL, 'PS5', NULL, 'Console', NULL, NULL);
INSERT INTO Prodotto VALUES ('con0002', 'Xbox Series X', 'Microsoft Xbox Series X', 100, TRUE, NULL, 499.99, 0, 0, 'Microsoft', NULL, 'Xbox_Series_X_S', NULL, 'Console', NULL, NULL);
INSERT INTO Prodotto VALUES ('con0003', 'Nintendo Switch', 'Nintendo Switch', 100, TRUE, NULL, 299.99, 0, 0, 'Nintendo', NULL, 'Switch', NULL, 'Console', NULL, NULL);
INSERT INTO Prodotto VALUES ('con0004', 'Atari 2600', 'Atari 2600', 100, TRUE, NULL, 199.99, 0, 0, 'Atari', NULL, 'Atari_2600', NULL, 'Console', NULL, 'RetroCrates');
INSERT INTO Prodotto VALUES ('con0005', 'Sega Mega Drive', 'Sega Mega Drive', 100, TRUE, NULL, 149.99, 0, 0, 'Sega', NULL, 'Sega_Mega_Drive', NULL, 'Console', NULL, 'RetroCrates');

-- Videogiochi
INSERT INTO Prodotto VALUES ('game001', 'The Last of Us Part II', 'Azione Avventura', 100, TRUE, NULL, 59.99, 0, 0, 'Naughty_Dog', 'Action_Adventure', 'PS4', 'Fisico', 'Videogioco', NULL, 'Standard_Edition');
INSERT INTO Prodotto VALUES ('game002', 'Halo Infinite', 'Sparatutto', 100, TRUE, NULL, 59.99, 0, 0, 'Microsoft_Studios', 'Sparatutto', 'Xbox_Series_X_S', 'Digitale', 'Videogioco', NULL, 'Standard_Edition');
INSERT INTO Prodotto VALUES ('game003', 'The Legend of Zelda: Breath of the Wild', 'Azione Avventura', 100, TRUE, NULL, 59.99, 0, 0, 'Nintendo', 'Action_Adventure', 'Switch', 'Fisico', 'Videogioco', NULL, 'Standard_Edition');
INSERT INTO Prodotto VALUES ('game004', 'Pac-Man', 'Arcade', 100, TRUE, NULL, 19.99, 0, 0, 'Bandai_Namco_Entertainment', 'Picchiaduro', 'Atari_2600', 'Fisico', 'Videogioco', NULL, 'Standard_Edition');
INSERT INTO Prodotto VALUES ('game005', 'Sonic the Hedgehog', 'Azione Avventura', 100, TRUE, NULL, 29.99, 0, 0, 'Sega', 'Action_Adventure', 'Sega_Mega_Drive', 'Fisico', 'Videogioco', NULL, 'Standard_Edition');

-- Collezionabili
INSERT INTO Prodotto VALUES ('coll001', 'Poster di The Last of Us Part II', 'Poster di alta qualità', 100, TRUE, NULL, 14.99, 0, 0, 'Naughty_Dog', NULL, NULL, NULL, 'Collezionabile', 'Poster', 'Normale');
INSERT INTO Prodotto VALUES ('coll002', 'Tazza di Halo Infinite', 'Tazza con logo di Halo Infinite', 100, TRUE, NULL, 7.99, 0, 0, 'Microsoft_Studios', NULL, NULL, NULL, 'Collezionabile', 'Gadget', 'Normale');
INSERT INTO Prodotto VALUES ('coll003', 'Funko Pop Pac-Man', 'Funko Pop di Pac-Man', 100, TRUE, NULL, 9.99, 0, 0, 'Funko', NULL, NULL, NULL, 'Collezionabile', 'Figure', 'Normale');
INSERT INTO Prodotto VALUES ('coll004', 'Poster di Sonic the Hedgehog', 'Poster di alta qualità', 100, TRUE, NULL, 14.99, 0, 0, 'Sega', NULL, NULL, NULL, 'Collezionabile', 'Poster', 'Normale');

-- Insert a user
INSERT INTO Utente (Username, Email, Passwordhash, Datanas, Tipo)
VALUES ('user1', 'user1@example.com', 'passwordhash', '2000-01-01', 'Utente'),
		('Admin', NULL, 'Admin', '2004-01-27', 'Admin');

-- Insert an order for the user
INSERT INTO Ordine (IdOrdine, Utente, Destinazione, Email, DataOrdine, CostoTotale)
VALUES ('ord001', 'user1', '123 Main St, City, Country', 'user1@example.com', '2024-11-11', 629.96);

-- Insert 4 items into the order
INSERT INTO ContieneProd (IdOrdine, IdProdotto, Qta, Costo)
VALUES ('ord001', 'con0001', 1, 499.99),
       ('ord001', 'game001', 1, 59.99),
       ('ord001', 'game003', 1, 59.99);

