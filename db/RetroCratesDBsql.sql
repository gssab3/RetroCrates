DROP DATABASE IF EXISTS retrocrates;

CREATE DATABASE retrocrates;

USE RetroCrates;

CREATE TABLE Utente(
    Username VARCHAR(20) NOT NULL,
    Email VARCHAR(50),
    Tipo ENUM('Admin','Utente') NOT NULL,
    Passwordhash VARCHAR(128) NOT null,
    Datanas DATE NOT NULL,
    Foto BLOB,
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

CREATE TABLE Console(
    IdProdotto CHAR(7) NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    Descrizione TEXT NOT NULL,
    Costo DECIMAL(10,2) NOT NULL,
    Produttore ENUM('Sony','Microsoft','Nintendo','Atari','Sega','Altri') NOT NULL,
    Qta INT NOT NULL,
    Disponibile BOOLEAN, -- al posto di cancellarlo
    /* MediaVoto questo dobbiamo farlo solo atraverso query perchè il voto non si aggiorna
        SELECT Console.Nome, AVG(recensioni.voto) as Valutazione
        FROM Console
        LEFT JOIN Recensione ON Console.IdProdotto = Recensione.IdProdotto
        GROUP BY IdProdotto;
    */
    PRIMARY KEY (IdProdotto),
    Foto Blob,
    CHECK (Qta>=0),
    CHECK (Costo>=0)
);

CREATE TABLE Videogioco(
    IdProdotto CHAR(7) NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    Descrizione TEXT NOT NULL, 
    Edizione ENUM('Standard Edition','Bronze Edition','Silver Edition','Gold Edition','Platinum Edition','Diamond Edition','Definitive Edition','G.O.T.Y Edition','Enhanced Edition','Ultimate Edition'),
    Costo DECIMAL(10,2) NOT NULL,
    Qta INT NOT NULL,
    Disponibile BOOLEAN, -- al posto di cancellarlo
    /* MediaVoto questo dobbiamo farlo solo atraverso query perchè il voto non si aggiorna
        SELECT Console.Nome, AVG(recensioni.voto) as Valutazione
        FROM Console
        LEFT JOIN Recensione ON Console.IdProdotto = Recensione.IdProdotto
        GROUP BY IdProdotto;
    */
    Genere ENUM('Action/Adventure','Picchiaduro','RPG','Sparattutto','Simulazione','Sport','Strategia') NOT NULL,
    Piattaforma ENUM('PS1','PS2','PS3','PS4','PS5','Xbox','Xbox 360','Xbox One','Xbox Series X/S','Nintendo 64','GameCube','Wii','Wii U','Switch','Game Boy','Nintendo DS','Nintendo 3DS','Sega Mega Drive','Sega Master System','DreamCast','Sega Saturn','Atari 2600','Atari 5200','Atari 7800        ','Altro') NOT NULL,
    Produttore ENUM('Ubisoft','Rockstar Games','Nintendo','Activision','Eletronic Arts','Sega','Naughty Dog','Microsoft Studios','Bethesda','Gearbox Software','Epic Games','Capcom','Bandai Namco Entertainment','Konami') NOT NULL, 
    Tipo ENUM('Digitale','Fisico') NOT NULL,
    Foto Blob,
    PRIMARY KEY (IdProdotto),
    CHECK (Qta>=0),
    CHECK (Costo>=0)
);

CREATE TABLE Collezionabile(
    IdProdotto CHAR(7) NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    Qta INT NOT NULL, 
    Disponibile BOOLEAN, -- al posto di cancellarlo
    Descrizione TEXT NOT NULL,   
    /* MediaVoto questo dobbiamo farlo solo atraverso query perchè il voto non si aggiorna
        SELECT Console.Nome, AVG(recensioni.voto) as Valutazione
        FROM Console
        LEFT JOIN Recensione ON Console.IdProdotto = Recensione.IdProdotto
        GROUP BY IdProdotto;
    */ 
    Categoria ENUM('Poster','Gadget','Figure','Plush','Audio') NOT NULL,
    Costo DECIMAL(10,2) NOT NULL, 
    Produttore ENUM('Funko','Nintendo','Pokémon','Bandai Namco','Youtooz','Sega','Hasbro','Konami'),
    Edizione ENUM('Normale','Esclusiva RetroCrates'),
    Foto Blob,
    PRIMARY KEY (IdProdotto),
    CHECK (Qta>=0),
    CHECK (Costo>=0)
);

CREATE TABLE Recensione(
    IdRecensione CHAR(10) NOT NULL,
    Utente VARCHAR(20) NOT NULL,      
    Videogioco CHAR(7),
    Console CHAR(7),
    Collezionabile CHAR(7),
    Stelle DECIMAL(2,1) NOT NULL,
    Descrizione TEXT,
    PRIMARY KEY (IdRecensione,Utente),
    FOREIGN KEY (Utente) REFERENCES Utente(Username),
    FOREIGN KEY (Videogioco) REFERENCES Videogioco(IdProdotto),
    FOREIGN KEY (Console) REFERENCES Console(IdProdotto),
    FOREIGN KEY (Collezionabile) REFERENCES Collezionabile(IdProdotto),
    CHECK (Stelle >= 1 AND Stelle <= 5),
    CHECK ((Videogioco IS NOT NULL AND Console IS NULL AND Collezionabile IS NULL) OR
            (Videogioco IS NULL AND Console IS NOT NULL AND Collezionabile IS NULL) OR
                (Videogioco IS NULL AND Console IS NULL AND Collezionabile IS NOT NULL))
);

CREATE TABLE ContieneCon(
    IdOrdine VARCHAR(10) NOT NULL,
    IdProdotto CHAR(7) NOT NULL,
    Qta INT NOT NULL,
    Costo DECIMAL(10,2) NOT NULL, 
    PRIMARY KEY (IdOrdine,IdProdotto),
    FOREIGN KEY (IdProdotto) REFERENCES Console(IdProdotto),
    FOREIGN KEY (IdOrdine) REFERENCES Ordine(IdOrdine),
    CHECK (Costo>=0)
);

CREATE TABLE ContieneVid(
    IdOrdine VARCHAR(10) NOT NULL,
    IdProdotto CHAR(7) NOT NULL,
    Qta INT NOT NULL,
    Costo DECIMAL(10,2) NOT NULL, 
    PRIMARY KEY (IdOrdine,IdProdotto),
    FOREIGN KEY (IdProdotto) REFERENCES Videogioco(IdProdotto),
    FOREIGN KEY (IdOrdine) REFERENCES Ordine(IdOrdine),
    CHECK (Costo>=0)
);

CREATE TABLE ContieneCol(
    IdOrdine VARCHAR(10) NOT NULL,
    IdProdotto CHAR(7) NOT NULL,
    Qta INT NOT NULL,
    Costo DECIMAL(10,2) NOT NULL, 
    PRIMARY KEY (IdOrdine,IdProdotto),
    FOREIGN KEY (IdProdotto) REFERENCES Collezionabile(IdProdotto),
    FOREIGN KEY (IdOrdine) REFERENCES Ordine(IdOrdine),
    CHECK (Costo>=0)
);

/* su bing ho trovato sta cosa per fare quello che ci serve ma 
biosgna analizzarla perchè non so minimamente che stracazzo sia
poi ha detto che o si fa a livello di applicazione o come procedura
qui su sql, io la lascio qua poi si vede

DELIMITER //
CREATE PROCEDURE InserisciOrdine(IN IdOrdine VARCHAR(10), IN IdProdotto CHAR(7), IN Quantita INT)
BEGIN
    DECLARE QtaInMagazzino INT;
    SELECT Qta INTO QtaInMagazzino FROM Videogioco WHERE IdProdotto = IdProdotto;
    IF Quantita <= QtaInMagazzino THEN
        INSERT INTO ContieneVid(IdOrdine, IdProdotto, Quantita) VALUES (IdOrdine, IdProdotto, Quantita);
        UPDATE Videogioco SET Qta = QtaInMagazzino - Quantita WHERE IdProdotto = IdProdotto;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quantità non valida';
    END IF;
END //
DELIMITER ;

Poi mi ha scritto anche questo 


DELIMITER //
CREATE PROCEDURE InserisciOrdine(IN IdOrdine VARCHAR(10), IN IdProdotto CHAR(7), IN TipoProdotto ENUM('Videogioco', 'Console', 'Collezionabile'))
BEGIN
    DECLARE QtaInMagazzino INT;
    DECLARE QtaOrdinata INT;
    IF TipoProdotto = 'Videogioco' THEN
        SELECT Qta INTO QtaInMagazzino FROM Videogioco WHERE IdProdotto = IdProdotto;
        SELECT COUNT(*) INTO QtaOrdinata FROM ContieneVid WHERE IdOrdine = IdOrdine AND IdProdotto = IdProdotto;
        IF QtaOrdinata < 5 AND QtaOrdinata < QtaInMagazzino THEN
            INSERT INTO ContieneVid(IdOrdine, IdProdotto) VALUES (IdOrdine, IdProdotto);
            UPDATE Videogioco SET Qta = QtaInMagazzino - 1 WHERE IdProdotto = IdProdotto;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quantità non valida';
        END IF;
    ELSEIF TipoProdotto = 'Console' THEN
        SELECT Qta INTO QtaInMagazzino FROM Console WHERE IdProdotto = IdProdotto;
        SELECT COUNT(*) INTO QtaOrdinata FROM ContieneCon WHERE IdOrdine = IdOrdine AND IdProdotto = IdProdotto;
        IF QtaOrdinata < 5 AND QtaOrdinata < QtaInMagazzino THEN
            INSERT INTO ContieneCon(IdOrdine, IdProdotto) VALUES (IdOrdine, IdProdotto);
            UPDATE Console SET Qta = QtaInMagazzino - 1 WHERE IdProdotto = IdProdotto;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quantità non valida';
        END IF;
    ELSE
        SELECT Qta INTO QtaInMagazzino FROM Collezionabile WHERE IdProdotto = IdProdotto;
        SELECT COUNT(*) INTO QtaOrdinata FROM ContieneCol WHERE IdOrdine = IdOrdine AND IdProdotto = IdProdotto;
        IF QtaOrdinata < 5 AND QtaOrdinata < QtaInMagazzino THEN
            INSERT INTO ContieneCol(IdOrdine, IdProdotto) VALUES (IdOrdine, IdProdotto);
            UPDATE Collezionabile SET Qta = QtaInMagazzino - 1 WHERE IdProdotto = IdProdotto;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quantità non valida';
        END IF;
    END IF;
END //
DELIMITER ;

*/