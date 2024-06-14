DROP DATABASE IF EXISTS retrocrates;

CREATE DATABASE retrocrates;

USE retrocrates;

CREATE TABLE Utente(
    Username VARCHAR(20) NOT NULL,
    Email VARCHAR(50),
    Passwordhash VARCHAR(128) NOT null,
    Datanas DATE NOT NULL,
    Foto BLOB,
    Tipo ENUM('Admin', 'Utente') NOT NULL,
    PRIMARY KEY (Username)
);

CREATE TABLE Ordine(
    IdOrdine CHAR(10) NOT NULL,
    Utente VARCHAR(20) NOT NULL,
    Destinazione VARCHAR(255),
    Email VARCHAR(50) NOT NULL,
    PRIMARY KEY (IdOrdine,Utente),
    FOREIGN KEY (Utente) REFERENCES Utente(Username)
);


CREATE TABLE Prodotto{
	IdProdotto CHAR(7) NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	Descrizione TEXT NOT NULL, 
	Qta INT NOT NULL, -- >=0
	Disponibile BOOLEAN, -- al posto di cancellarlo
	Foto Blob,
	Costo DECIMAL(10,2) NOT NULL,
	stelleTot INT NOT NULL,
	recTot INT NOT NULL,
	
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
    CHECK (Costo>=0),
    CHECK (Stelle >= 1 AND Stelle <= 5)
}


CREATE TABLE Recensione(
    IdRecensione CHAR(10) NOT NULL,
    Utente VARCHAR(20) NOT NULL,      
    Prodotto CHAR(7),
    Stelle DECIMAL(2,1) NOT NULL,
    Descrizione TEXT,
    PRIMARY KEY (IdRecensione,Utente),
    FOREIGN KEY (Utente) REFERENCES Utente(Username),
    FOREIGN KEY (Prodotto) REFERENCES Prodotto(IdProdotto),
    CHECK (Stelle >= 1 AND Stelle <= 5)
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
