SET NAMES latin1;
USE `impresagiardinaggio`;
SET FOREIGN_KEY_CHECKS = 1;
SET GLOBAL EVENT_SCHEDULER = ON;

--
-- Operazione 1: Ottenere il numero di posts pubblicati da un account
-- 
DROP PROCEDURE IF EXISTS OttieniNumPostPubblicati;
DELIMITER $$
CREATE PROCEDURE OttieniNumPostPubblicati(	IN nick char(50), 
											OUT numeropost int(11))
BEGIN
	SELECT `NumPostPubblicati` INTO numeropost
    FROM `account`
    WHERE `Nickname` = nick;
END $$
DELIMITER ;

--
-- Operazione 2: Ottenere il costo complessivo di
-- 			     manutenzione di una specie di pianta
-- 
DROP PROCEDURE IF EXISTS OttieniCostoTotManutenzione;
DELIMITER $$
CREATE PROCEDURE OttieniCostoTotManutenzione(IN nomespecie char(50), 
											 OUT costo int(11))
BEGIN
	SELECT `CostoTotManutenzione` INTO costo
    FROM `specie`
    WHERE `Nome` = nomespecie;
END $$
DELIMITER ;

--
-- Operazione 3: Ottenere il numero di piante appartenenti ad una sezione
-- 
DROP PROCEDURE IF EXISTS OttieniNumeroPianteSezione;
DELIMITER $$
CREATE PROCEDURE OttieniNumeroPianteSezione(IN sezione int(11), 
											OUT numeropiante int(11))
BEGIN
	SELECT `PiantePresenti` INTO numeropiante
    FROM `sezione`
    WHERE `CodSezione` = sezione;
END $$
DELIMITER ;

--
-- Operazione 4: Ottenere la specie di pianta più venduta
-- 
DROP PROCEDURE IF EXISTS OttieniSpeciePiuVenduta;
DELIMITER $$
CREATE PROCEDURE OttieniSpeciePiuVenduta()
BEGIN
	CREATE OR REPLACE VIEW `PiantePiuVendute` AS
		SELECT `Nome` AS `SpeciePiuVendute`
		FROM `specie`
		WHERE `NumPianteVendute` = (SELECT MAX(`NumPianteVendute`)
									FROM `specie`);
	
    SELECT *
    FROM `PiantePiuVendute`;
END $$
DELIMITER ;

--
-- Operazione 5: Inserire di una nuova pianta nel magazzino
-- 
/*	Consiste nell'inserimento di una tupla nella tabella
	`pianta` ed eventuali altre tuple relative nelle 
	tabelle `periodipianta`, `esigenzaconcimazionepianta`
	e `elementinecessaripianta`. */

--
-- Operazione 6: Creare un nuovo arredamento
-- 
/*	Consiste nell'inserimento di una tupla nella tabella
	`arredamento` ed eventuali altre tuple relative nelle 
	tabelle `piantearredamentoinpienaterra` e
    `vasiarredamento`. */

--
-- Operazione 7: Trovare il thread con più contenuti multimediali
-- 
DROP PROCEDURE IF EXISTS OttieniThreadsConPiuMedia;
DELIMITER $$
CREATE PROCEDURE OttieniThreadsConPiuMedia()
BEGIN
	CREATE OR REPLACE VIEW `ThreadsConPiuMedia` AS
		SELECT `CodThread` AS `ThreadConPiuContenutiMultimediali`
		FROM `thread`
		WHERE `NumMedia` = (SELECT MAX(`NumMedia`)
							FROM `thread`);
	
    SELECT *
    FROM `ThreadsConPiuMedia`;
END $$
DELIMITER ;

--
-- Operazione 8: Ottenere la specie pianta che si ammala più spesso
--
DROP PROCEDURE IF EXISTS OttieniSpecieChePiuSiAmmala;
DELIMITER $$
CREATE PROCEDURE OttieniSpecieChePiuSiAmmala()
BEGIN
	CREATE OR REPLACE VIEW `SpecieChePiuSiAmmalano` AS
		SELECT `Nome` AS `SpecieCheSiAmmalanoDiPiu`
		FROM `specie`
		WHERE `NumeroEsordi` = (SELECT MAX(`NumeroEsordi`)
								FROM `specie`);
	
    SELECT *
    FROM `SpecieChePiuSiAmmalano`;
END $$
DELIMITER ;