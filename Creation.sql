SET NAMES latin1;
DROP DATABASE IF EXISTS `impresagiardinaggio`;
CREATE DATABASE  IF NOT EXISTS `impresagiardinaggio`;
USE `impresagiardinaggio`;
SET FOREIGN_KEY_CHECKS = 1;
SET GLOBAL EVENT_SCHEDULER = ON;

--
-- Creazione tabella `account`
--
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `Nickname` char(50) NOT NULL,
  `CittaResidenza` char(50) DEFAULT NULL,
  `Password` char(50) NOT NULL,
  `Email` char(50) NOT NULL,
  `Nome` char(50) NOT NULL,
  `Cognome` char(50) NOT NULL,
  `DomandaSegreta` char(50) NOT NULL,
  `RispostaSegreta` char(50) NOT NULL,
  `NumPostPubblicati` int(11) unsigned NOT NULL DEFAULT '0',
  UNIQUE (`Email`),
  PRIMARY KEY (`Nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- Creazione tabella `agentepatogeno`
--
DROP TABLE IF EXISTS `agentepatogeno`;
CREATE TABLE `agentepatogeno` (
  `Nome` char(50) NOT NULL,
  `Tipo` char(50) NOT NULL,
  PRIMARY KEY (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `agentipatogenipatologia`
--
DROP TABLE IF EXISTS `agentipatogenipatologia`;
CREATE TABLE `agentipatogenipatologia` (
  `CodPatologia` int(11) unsigned NOT NULL,
  `NomeAgentePatogeno` char(50) NOT NULL,
  PRIMARY KEY (`CodPatologia`,`NomeAgentePatogeno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `arredamento`
--
DROP TABLE IF EXISTS `arredamento`;
CREATE TABLE `arredamento` (
  `Versione` int(11) unsigned NOT NULL,
  `CodSpazio` int(11) unsigned NOT NULL,
  PRIMARY KEY (`Versione`,`CodSpazio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `componente`
--
DROP TABLE IF EXISTS `componente`;
CREATE TABLE `componente` (
  `Nome` char(50) NOT NULL,
  PRIMARY KEY (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `componentiterreno`
--
DROP TABLE IF EXISTS `componentiterreno`;
CREATE TABLE `componentiterreno` (
  `CodTerreno` int(11) unsigned NOT NULL,
  `NomeComponente` char(50) NOT NULL,
  `Concentrazione` float(13, 2) unsigned NOT NULL, -- mg/m^3
  PRIMARY KEY (`CodTerreno`,`NomeComponente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `contenitore`
--
DROP TABLE IF EXISTS `contenitore`;
CREATE TABLE `contenitore` (
  `CodContenitore` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Dimensione` int(11) unsigned NOT NULL, -- centimetri (diametro)
  `Idratazione` float (13, 2) NOT NULL, -- percentuale
  `Irrigazione` float (13, 2) NOT NULL, -- percentuale
  `CodRipiano` int(11) unsigned DEFAULT NULL,
  `Pieno` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CodContenitore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `elementinecessarispecie`
--
DROP TABLE IF EXISTS `elementinecessarispecie`;
CREATE TABLE `elementinecessarispecie` (
  `NomeSpecie` char(50) NOT NULL,
  `NomeElemento` char(50) NOT NULL,
  `Concentrazione` float(13, 2) unsigned NOT NULL, -- mg/m^3
  PRIMARY KEY (`NomeSpecie`,`NomeElemento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `elementistatosalute`
--
DROP TABLE IF EXISTS `elementistatosalute`;
CREATE TABLE `elementistatosalute` (
  `CodContenitore` int(11) unsigned NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,
  `NomeElemento` char(50) NOT NULL,
  `Concentrazione` float(13, 2) unsigned NOT NULL, -- mg/m^3
  PRIMARY KEY (`CodContenitore`,`Timestamp`,`NomeElemento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `elementiterreno`
--
DROP TABLE IF EXISTS `elementiterreno`;
CREATE TABLE `elementiterreno` (
  `NomeElemento` char(50) NOT NULL,
  `CodTerreno` int(11) unsigned NOT NULL,
  `Concentrazione` float(13, 2) unsigned NOT NULL, -- mg/m^3
  PRIMARY KEY (`NomeElemento`,`CodTerreno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- Creazione tabella `elemento`
--
DROP TABLE IF EXISTS `elemento`;
CREATE TABLE `elemento` (
  `Nome` char(50) NOT NULL,
  `PerMinConflitto` float(13, 2) unsigned NOT NULL,
  PRIMARY KEY (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `esigenzaconcimazionepianta`
--
DROP TABLE IF EXISTS `esigenzaconcimazionepianta`;
CREATE TABLE `esigenzaconcimazionepianta` (
  `CodPianta` int(11) unsigned NOT NULL,
  `CodManutenzione` int(11) unsigned NOT NULL,
  PRIMARY KEY (`CodPianta`,`CodManutenzione`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `immagine`
--
DROP TABLE IF EXISTS `immagine`;
CREATE TABLE `immagine` (
  `URL` char(50) NOT NULL,
  PRIMARY KEY (`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `immaginisintomi`
--
DROP TABLE IF EXISTS `immaginisintomi`;
CREATE TABLE `immaginisintomi` (
  `CodSintomo` int(11) unsigned NOT NULL,
  `URL` char(50) NOT NULL,
  PRIMARY KEY (`CodSintomo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `manutenzione`
--
DROP TABLE IF EXISTS `manutenzione`;
CREATE TABLE `manutenzione` (
  `CodManutenzione` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `DataInizio` date NOT NULL,
  `Costo` int(11) NOT NULL, -- euro
  `TipoSomm` char(50) DEFAULT NULL, -- disciolto, nebulizzato
  `TipoManutenzione` char(50) NOT NULL, /* potatura, rinvaso, 
										   concimazione, trattamento */
  `TipoCreazione` char(50) NOT NULL, /* su richiesta, programmata, 
									    automatica */
  `Scadenza` date DEFAULT NULL,
  -- it.wikipedia.org/wiki/Potatura#Metodi_di_potatura
  `TipoPotatura` char(50) DEFAULT NULL,
  `NumIntervAnnuali` int(11) unsigned NOT NULL,
  `CodPianta` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`CodManutenzione`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- Creazione tabella `media`
--
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `URL` char(50) NOT NULL,
  PRIMARY KEY (`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `mediapost`
--
DROP TABLE IF EXISTS `mediapost`;
CREATE TABLE `mediapost` (
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
    ON UPDATE CURRENT_TIMESTAMP,
  `Utente` char(50) NOT NULL,
  `URL` char(50) NOT NULL,
  PRIMARY KEY (`Timestamp`,`Utente`,`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `ordine`
--
DROP TABLE IF EXISTS `ordine`;
CREATE TABLE `ordine` (
  `CodOrdine` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
    ON UPDATE CURRENT_TIMESTAMP,
  `Stato` char(50) NOT NULL, /* pendente, in processazione, 
								in preparazione, spedito, evaso */
  `Utente` char(50) DEFAULT NULL,
  PRIMARY KEY (`CodOrdine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `patologia`
--
DROP TABLE IF EXISTS `patologia`;
CREATE TABLE `patologia` (
  `CodPatologia` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `DataInizio` date NOT NULL,
  `DataFine` date NOT NULL,
  `Probabilita` float(13, 2) unsigned NOT NULL, -- percentuale
  `Entita` float(13, 2) NOT NULL, -- da 0 a 10
  PRIMARY KEY (`CodPatologia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `patologiereport`
--
DROP TABLE IF EXISTS `patologiereport`;
CREATE TABLE `patologiereport` (
  `CodPianta` int(11) unsigned NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
    ON UPDATE CURRENT_TIMESTAMP,
  `CodPatologia` int(11) unsigned NOT NULL,
  PRIMARY KEY (`CodPianta`,`Timestamp`,`CodPatologia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `periodimanutenzione`
--
DROP TABLE IF EXISTS `periodimanutenzione`;
CREATE TABLE `periodimanutenzione` (
  `CodManutenzione` int(11) unsigned NOT NULL,
  `DataInizio` date NOT NULL,
  `DataFine` date NOT NULL,
  PRIMARY KEY (`CodManutenzione`,`DataInizio`,`DataFine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `periodiprodotti`
--
DROP TABLE IF EXISTS `periodiprodotti`;
CREATE TABLE `periodiprodotti` (
  `NomeProdotto` char(50) NOT NULL,
  `DataInizio` date NOT NULL,
  `DataFine` date NOT NULL,
  PRIMARY KEY (`NomeProdotto`,`DataInizio`,`DataFine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `periodispecie`
--
DROP TABLE IF EXISTS `periodispecie`;
CREATE TABLE `periodispecie` (
  `NomeSpecie` char(50) NOT NULL,
  `DataInizio` date NOT NULL,
  `DataFine` date NOT NULL,
  `Tipo` char(50) NOT NULL, -- fioritura, fruttificazione, riposo
  PRIMARY KEY (`NomeSpecie`,`DataInizio`,`DataFine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `pianta`
--
DROP TABLE IF EXISTS `pianta`;
CREATE TABLE `pianta` (
  `CodPianta` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `DimAttuale` int(11) unsigned NOT NULL, -- cm
  `Prezzo` int(11) unsigned DEFAULT NULL, -- euro
  `IndiceManutenzione` float(13, 2) unsigned DEFAULT NULL,
  `NomeSpecie` char(50) DEFAULT NULL,
  `CodTerreno` int(11) unsigned NOT NULL,
  `CodContenitore` int(11) unsigned DEFAULT NULL,
  `CodOrdine` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`CodPianta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* Stored procedure per le operazioni di aggiornamento delle ridondanze 
e di controllo della capienza delle entità `Sezione`, `Serra` e `Sede` */
DROP PROCEDURE IF EXISTS AggiornaPiantePresentiSezioneSerraSede;
DELIMITER $$
CREATE PROCEDURE AggiornaPiantePresentiSezioneSerraSede(
	IN contenitore int(11),
	IN quantita int(1))
BEGIN
	-- Entità coinvolte
	SET @Sezione = (SELECT `CodSezione`
					FROM `ripiano`
					WHERE `CodRipiano` = (	
						SELECT `CodRipiano`
						FROM `Contenitore`
						WHERE `CodContenitore` = `contenitore`));
	SET @Serra = (	SELECT `CodSerra`
					FROM `sezione`
					WHERE `CodSezione` = @Sezione);

	SET @Sede = (	SELECT `CodSede`
					FROM `serra`
					WHERE `CodSerra` = @Serra);
	
    -- Controllo capienze
	IF(`quantita` > 0) THEN
		SET @PiantePresentiSezione = (	SELECT `PiantePresenti`
										FROM `sezione`
										WHERE `CodSezione` = @Sezione);
		SET @CapienzaSezione = (SELECT `Capienza`
								FROM `sezione`
								WHERE `CodSezione` = @Sezione);
		IF(@PiantePresentiSezione + `quantita` > @CapienzaSezione) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Superata capienza della sezione.';
        END IF;
        
        SET @PiantePresentiSerra = (SELECT `PiantePresenti`
									FROM `serra`
									WHERE `CodSerra` = @Serra);
		SET @CapienzaSerra = (	SELECT `Capienza`
								FROM `serra`
								WHERE `CodSerra` = @Serra);
		IF(@PiantePresentiSerra + `quantita` > @CapienzaSerra) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Superata capienza della serra.';
        END IF;
        
        SET @PiantePresentiSede = (	SELECT `PiantePresenti`
									FROM `sede`
									WHERE `CodSede` = @Sede);
		SET @CapienzaSede = (	SELECT `Capienza`
								FROM `sede`
								WHERE `CodSede` = @Sede);
		IF(@PiantePresentiSede + `quantita` > @CapienzaSede) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Superata capienza della sede.';
        END IF;
    END IF;
    
    -- Aggiornamento ridondanze
    UPDATE `sezione`
	SET `PiantePresenti` = `PiantePresenti` + `quantita`
	WHERE `CodSezione` = @Sezione;
	
	UPDATE `serra`
	SET `PiantePresenti` = `PiantePresenti` + `quantita`
	WHERE `CodSerra` = @Serra;

	UPDATE `sede`
	SET `PiantePresenti` = `PiantePresenti` + `quantita`
	WHERE `CodSede` = @Sede;
END $$
DELIMITER ;

/* Stored procedure per l'aggiornamento della 
ridondanza `NumeroPiante` dell'entità `specie` */
DROP PROCEDURE IF EXISTS AggiornaNumeroPianteSpecie;
CREATE PROCEDURE AggiornaNumeroPianteSpecie(	IN pianta int(11), 
												IN quantita int(1))
	UPDATE `specie`
	SET `NumeroPiante` = `NumeroPiante` + `quantita`
    WHERE `Nome` = (SELECT `NomeSpecie`
					FROM `pianta`
					WHERE `CodPianta` = `pianta`);

-- Stored procedure per l'aggiornamento dello stato di un contenitore
DROP PROCEDURE IF EXISTS AggiornaStatoContenitore;
DELIMITER $$
CREATE PROCEDURE AggiornaStatoContenitore(	IN contenitore int(11), 
											IN nuovoStato tinyint(1))
BEGIN
	-- Controllo dello stato del nuovo contenitore
	IF((SELECT `Pieno`
		FROM `contenitore`
		WHERE `CodContenitore` = `contenitore`) = `nuovoStato`) THEN
        IF(`nuovoStato` = '0') THEN
			SET @messageText = 'Codice del vecchio contenitore errato.';
		ELSEIF(`nuovoStato` = '1') THEN
			SET @messageText = 'Impossibile inserire una nuova pianta 
				in un contenitore già pieno.';
		END IF;

		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = @messageText;
	END IF;
	
    -- Aggiornamento stato
	UPDATE `contenitore`
    SET `Pieno` = `nuovoStato`
    WHERE `CodContenitore` = `contenitore`;
END $$
DELIMITER ;

-- Stored procedure per il controllo della dimensione di un contenitore
DROP PROCEDURE IF EXISTS ControlloDimensioneContenitore;
DELIMITER $$
CREATE PROCEDURE ControlloDimensioneContenitore(IN dimAttuale int(11), 
												IN contenitore int(11))
BEGIN
	SET @DimensioneContenitore = (	SELECT `Dimensione`
									FROM `contenitore`
                                    WHERE `CodContenitore` = contenitore);
	
    IF(`dimAttuale` > @DimensioneContenitore) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'La pianta è attualmente troppo grande per 
			essere inserita nel contenitore';
	END IF;
END $$
DELIMITER ;

-- Stored procedure per il controllo della temperatura di una sezione
DROP PROCEDURE IF EXISTS ControlloTemperaturaSezione;
DELIMITER $$
CREATE PROCEDURE ControlloTemperaturaSezione(	IN pianta int(11), 
                                                IN contenitore int(11))
BEGIN
	SET @tempSezione = (
		SELECT `Temperatura`
		FROM `sezione`
		WHERE `CodSezione` = (
			SELECT `CodSezione`
			FROM `ripiano`
			WHERE `CodRipiano` = (
				SELECT `CodRipiano`
				FROM `contenitore`
				WHERE `CodContenitore` = contenitore
			)
		)
	);
    
    SET @tempMin = (SELECT `TempMin`
					FROM `specie`
					WHERE `Nome` = (SELECT `NomeSpecie`
									FROM `pianta`
									WHERE `CodPianta` = pianta));
                    
	SET @tempMax = (SELECT `TempMax`
					FROM `specie`
					WHERE `Nome` = (SELECT `NomeSpecie`
									FROM `pianta`
									WHERE `CodPianta` = pianta));
	
    IF(@tempSezione > @tempMax OR @tempSezione < @tempMin) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'La temperatura della sezione non e\' 
			compatibile con questa pianta.';
	END IF;
END $$
DELIMITER ;

--
-- Creazione tabella `piantearredamentoinpienaterra`
--
DROP TABLE IF EXISTS `piantearredamentoinpienaterra`;
CREATE TABLE `piantearredamentoinpienaterra` (
  `CodPianta` int(11) unsigned NOT NULL,
  `CodSpazio` int(11) unsigned NOT NULL,
  `Versione` int(11) unsigned NOT NULL,
  `PosX` int(11) NOT NULL,
  `PosY` int(11) NOT NULL,
  PRIMARY KEY (`CodPianta`,`CodSpazio`,`Versione`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `post`
--
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,
  `Utente` char(50) DEFAULT 'Utente eliminato',
  `Giudizio` float(2, 1) DEFAULT NULL, -- da 0 a 5
  `Testo` char(50) NOT NULL,
  `CodThread` int(11) unsigned NOT NULL,
  PRIMARY KEY (`Timestamp`,`Utente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- Creazione tabella `principiattiviprodotto`
--
DROP TABLE IF EXISTS `principiattiviprodotto`;
CREATE TABLE `principiattiviprodotto` (
  `NomeProdotto` char(50) NOT NULL,
  `NomePrincipioAttivo` char(50) NOT NULL,
  `Concentrazione` float(13, 2) unsigned NOT NULL, -- mg/m^3
  PRIMARY KEY (`NomeProdotto`,`NomePrincipioAttivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `principioattivo`
--
DROP TABLE IF EXISTS `principioattivo`;
CREATE TABLE `principioattivo` (
  `Nome` char(50) NOT NULL,
  PRIMARY KEY (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `prodottipatologia`
--
DROP TABLE IF EXISTS `prodottipatologia`;
CREATE TABLE `prodottipatologia` (
  `CodPatologia` int(11) unsigned NOT NULL,
  `NomeProdotto` char(50) NOT NULL,
  PRIMARY KEY (`CodPatologia`,`NomeProdotto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `prodottitrattamento`
--
DROP TABLE IF EXISTS `prodottitrattamento`;
CREATE TABLE `prodottitrattamento` (
  `NomeProdotto` char(50) NOT NULL,
  `CodManutenzione` int(11) unsigned NOT NULL,
  `Dose` float(13, 2) NOT NULL, -- mg/m^3
  PRIMARY KEY (`NomeProdotto`,`CodManutenzione`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `prodotto`
--
DROP TABLE IF EXISTS `prodotto`;
CREATE TABLE `prodotto` (
  `Nome` char(50) NOT NULL,
  `Marca` char(50) NOT NULL,
  `TempoMinConsumazFrutti` int(11) DEFAULT '0', -- giorni
  `ModalitaSomm` char(50) DEFAULT NULL, -- disciolto, nebulizzato
  PRIMARY KEY (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `prodottocombatte`
--
DROP TABLE IF EXISTS `prodottocombatte`;
CREATE TABLE `prodottocombatte` (
  `NomeProdotto` char(50) NOT NULL,
  `NomeAgentePatogeno` char(50) NOT NULL,
  `Dosaggio` float(13, 2) unsigned NOT NULL, -- mL
  PRIMARY KEY (`NomeProdotto`,`NomeAgentePatogeno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `reportassunzioni`
--
DROP TABLE IF EXISTS `reportassunzioni`;
CREATE TABLE `reportassunzioni` (
  `CodReportAss` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CodSede` int(11) unsigned NOT NULL,
  `NumDipendenti` int(11) unsigned NOT NULL,
  `Indeterminato` tinyint(1) DEFAULT '0',
  `DataInizio` date DEFAULT NULL,
  `DataFine` date DEFAULT NULL,
  PRIMARY KEY (`CodReportAss`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Creazione dei reports delle assunzioni
DROP EVENT IF EXISTS `CreaReportAssunzioni`;
DELIMITER $$
CREATE EVENT `CreaReportAssunzioni` ON SCHEDULE EVERY 1 MONTH
STARTS '2014-01-01 23:55:00' DO
BEGIN
	SET @massimoNumeroOrdiniGestibiliDaUnDipendente = '20';
    
    /* Determina per quante volte una sede puo' assumere dipendenti 
    part-time prima di iniziare ad assumere a tempo indeterminato */
    SET @numeroDiAssunzioniPrimaDiIndeterminato = '5';

	CREATE OR REPLACE VIEW `NuoviOrdiniPerSede` AS
		SELECT `CodSede`, COUNT(*) AS `OrdiniUltimoMeseDaGestire`
		FROM `serra`
		WHERE `CodSerra` IN (		
			SELECT DISTINCT(`CodSerra`)
			FROM `sezione`
			WHERE `CodSezione` IN (
				SELECT DISTINCT(`CodSezione`)
				FROM `ripiano`
				WHERE `CodRipiano` IN (
					SELECT DISTINCT(`CodRipiano`)
					FROM `contenitore`
					WHERE `CodContenitore` IN (	
						SELECT DISTINCT(`CodContenitore`)
						FROM `pianta`
						WHERE `CodOrdine` IS NOT NULL
							AND `CodContenitore` IS NOT NULL
							AND `CodOrdine` IN (
								SELECT `CodOrdine`
								FROM `ordine`
								WHERE `Timestamp` BETWEEN 
									CURRENT_TIMESTAMP - INTERVAL 1 MONTH 
										AND 
									CURRENT_TIMESTAMP
									AND (`Stato` = 'pendente' OR
										 `Stato` = 'in processazione')
							)
					 )
				)
			)
		)
		GROUP BY `CodSede`;
        
	CREATE OR REPLACE VIEW `RapportoNuoviOrdiniSuDipendentiPerSede` AS
		SELECT 	NOPS.`CodSede`, 
				`NumDipendenti`/`OrdiniUltimoMeseDaGestire` 
					AS `RapportoOrdiniDipendenti`,
                (	SELECT COUNT(*)
					FROM `reportassunzioni` RA
					WHERE RA.`CodSede` = NOPS.`CodSede`)
					AS `NumeroReportPrecedenti`
        FROM `NuoviOrdiniPerSede` NOPS NATURAL JOIN `Sede` S;

	INSERT INTO `reportassunzioni` (`NumDipendenti`, 
									`CodSede`, 
									`Indeterminato`, 
									`DataInizio`, 
									`DataFine`)
		SELECT	RNO.`CodSede`,
			FLOOR(RNO.`RapportoOrdiniDipendenti`/20) 
				AS `DipendentiDaAssumere`,
            IF((SELECT RA1.`Indeterminato` AS `IndeterminatoUltimoReport`
				FROM `reportassunzioni` RA1
				WHERE RA1.`CodSede` = RNO.`CodSede`
					AND RA1.`CodReportAss` = (	
						SELECT MAX(`CodReportAss`)
						FROM `reportassunzioni` RA2
						WHERE RA2.`CodSede` = RA1.`CodSede`)) = '1',
				'0', 
                IF(RNO.`NumeroReportPrecedenti` <
					@numeroDiAssunzioniPrimaDiIndeterminato, '0', '1')
                ) AS `Indeterminato`,
			CURRENT_DATE AS `DataInizio`,
            CURRENT_DATE + INTERVAL 1 MONTH AS `DataFine`
		FROM `RapportoNuoviOrdiniSuDipendentiPerSede` RNO
		WHERE RNO.`RapportoOrdiniDipendenti` > 
			@massimoNumeroOrdiniGestibiliDaUnDipendente;
END $$
DELIMITER ;

--
-- Creazione tabella `reportdiagnostica`
--
DROP TABLE IF EXISTS `reportdiagnostica`;
CREATE TABLE `reportdiagnostica` (
  `CodPianta` int(11) unsigned NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
    ON UPDATE CURRENT_TIMESTAMP,
  `CodTerreno` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`Timestamp`,`CodPianta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `reportmanutenzione`
--
DROP TABLE IF EXISTS `reportmanutenzione`;
CREATE TABLE `reportmanutenzione` (
  `Tipo` char(50) NOT NULL,
  `NumSnapshot` int(11) unsigned NOT NULL DEFAULT '1',
  `NomeSpecie` char(50) NOT NULL,
  `CostoTot` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Tipo`,`NumSnapshot`,`NomeSpecie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
	
-- Creazione dei reports di manutenzione
DROP EVENT IF EXISTS `CreaReportManutenzione`;
DELIMITER $$
CREATE EVENT `CreaReportManutenzione` ON SCHEDULE EVERY 3 MONTH
STARTS '2014-01-01 23:55:00' DO
BEGIN
	INSERT INTO `reportmanutenzione`
		SELECT	M.`TipoManutenzione` AS `Tipo`,
				(SELECT COUNT(*)
				 FROM `reportmanutenzione` RM
				 WHERE RM.`NomeSpecie` = P.`NomeSpecie`
					AND RM.`Tipo` = M.`TipoManutenzione`) + 1
					AS `NumSnapshot`,
				P.`NomeSpecie`,
				SUM(M.`Costo`) AS `CostoTot`
		FROM `manutenzione` M INNER JOIN 
			(SELECT `CodPianta`, `NomeSpecie` FROM `pianta`) P
				ON M.`CodPianta` = P.`CodPianta`
		-- manutenzioni svolte, non solo esatte
		WHERE M.`CodPianta` IS NOT NULL 
			AND M.`DataInizio` BETWEEN -- degli ultimi 3 mesi
				CURRENT_DATE - INTERVAL 3 MONTH
					AND 
				CURRENT_DATE
		GROUP BY P.`NomeSpecie`, M.`TipoManutenzione`;
END $$
DELIMITER ;

--
-- Creazione tabella `reportordini`
--
DROP TABLE IF EXISTS `reportordini`;
CREATE TABLE `reportordini` (
  `CodRepOrdini` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `DaOrdinare` tinyint(1) NOT NULL,
  `Clima` char(50) DEFAULT NULL,
  PRIMARY KEY (`CodRepOrdini`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Creazione dei reports degli ordini da effettuare
DROP EVENT IF EXISTS `CreaReportOrdiniDaEffettuare`;
DELIMITER $$
CREATE EVENT `CreaReportOrdiniDaEffettuare` ON SCHEDULE EVERY 1 WEEK
STARTS '2014-01-01 23:55:00' DO
BEGIN
	CREATE OR REPLACE VIEW `LucePerSpecie` AS
		SELECT	S.`Nome` AS `NomeSpecie`,
                IF(	PS.`Tipo` = 'riposo',
					S.`OreLuceRiposo`,
					S.`OreLuceVegetativo`) AS `OreLuce`,
				IF(	PS.`Tipo` = 'riposo',
					'riposo', 
					'vegetativo') AS `TipoPeriodo`,
				DATEDIFF(PS.`DataFine`, PS.`DataInizio`) AS `NumeroGiorni`
		FROM `specie` S INNER JOIN `periodispecie` PS
			ON S.`Nome` = PS.`NomeSpecie`;

	CREATE OR REPLACE VIEW `OreLuceMediePerSpecie` AS
		SELECT	`NomeSpecie`,
				(SUM(`OreLuce` * `NumeroGiorni`))/365 AS `OreLuceMedie`
		FROM (	SELECT	`NomeSpecie`,
						`TipoPeriodo`,
						`OreLuce`,
						SUM(`NumeroGiorni`) AS `NumeroGiorni`
				FROM `LucePerSpecie`
				GROUP BY `NomeSpecie`, `TipoPeriodo`) AS D
		GROUP BY `NomeSpecie`;
        
	CREATE OR REPLACE VIEW `PianteDaOrdinare` AS
		SELECT	P.`NomeSpecie`,
                COUNT(*) AS `PianteDaOrdinare`
		FROM	`ordine` O 
				INNER JOIN 
				`pianta` P ON O.`CodOrdine` = P.`CodOrdine`
				INNER JOIN 
				`specie` S ON P.`NomeSpecie` = S.`Nome`
		WHERE P.`CodOrdine` IS NOT NULL
			AND O.`Stato` = 'pendente'
		GROUP BY P.`NomeSpecie`;

    CREATE OR REPLACE VIEW `PianteEstiveDaOrdinare` AS
		SELECT `NomeSpecie`, `PianteDaOrdinare`
		FROM `PianteDaOrdinare` NATURAL JOIN `OreLuceMediePerSpecie`
        WHERE `OreLuceMedie` > '7.5';

    CREATE OR REPLACE VIEW `PianteInvernaliDaOrdinare` AS
		SELECT `NomeSpecie`, `PianteDaOrdinare`
		FROM `PianteDaOrdinare` NATURAL JOIN `OreLuceMediePerSpecie`
        WHERE `OreLuceMedie` <= '7.5';

	INSERT INTO `reportordini` (`DaOrdinare`, `Clima`)
		SELECT '1', 'estivo'
		FROM `PianteEstiveDaOrdinare`;
   
	INSERT INTO `speciereportordini` (	`CodRepOrdini`,
										`NomeSpecie`, 
										`Quantita`)
		SELECT	(	SELECT MAX(`CodRepOrdini`)
					FROM `reportordini`) AS `CodRepOrdini`,
				`NomeSpecie`,
                `PianteDaOrdinare`
        FROM `PianteEstiveDaOrdinare`;

	INSERT INTO `reportordini` (`DaOrdinare`, `Clima`)
		SELECT '1', 'invernale'
		FROM `PianteInvernaliDaOrdinare`;
	
    INSERT INTO `speciereportordini` (	`CodRepOrdini`, 
										`NomeSpecie`, 
										`Quantita`)
		SELECT	(	SELECT MAX(`CodRepOrdini`) 
					FROM `reportordini`) AS `CodRepOrdini`,
				`NomeSpecie`,
                `PianteDaOrdinare`
        FROM `PianteInvernaliDaOrdinare`;
END $$
DELIMITER ;

-- Creazione dei reports degli ordini da non effettuare
DROP EVENT IF EXISTS `CreaReportOrdiniDaNonEffettuare`;
DELIMITER $$
CREATE EVENT `CreaReportOrdiniDaNonEffettuare` ON SCHEDULE EVERY 1 YEAR
STARTS '2014-01-01 23:55:00' DO
BEGIN

END $$
DELIMITER ;

--
-- Creazione tabella `ripiano`
--
DROP TABLE IF EXISTS `ripiano`;
CREATE TABLE `ripiano` (
  `CodRipiano` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Irrigazione` float (13, 2) NOT NULL, -- percentuale
  `CodSezione` int(11) unsigned DEFAULT NULL,
  `Capienza` int(11) unsigned NOT NULL,
  PRIMARY KEY (`CodRipiano`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `salute`
--
DROP TABLE IF EXISTS `salute`;
CREATE TABLE `salute` (
  `CodContenitore` int(11) unsigned NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
    ON UPDATE CURRENT_TIMESTAMP,
  `Umidita` float(13, 2) NOT NULL, -- percentuale
  `TassoAmmoniaca` float(13, 2) NOT NULL, -- percentuale
  `LivelloGas` float(13, 2) NOT NULL, -- percentuale
  PRIMARY KEY (`Timestamp`,`CodContenitore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `scheda`
--
DROP TABLE IF EXISTS `scheda`;
CREATE TABLE `scheda` (
  `CodScheda` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `DataAcquisto` date DEFAULT NULL,
  `Settore` int(11) unsigned DEFAULT NULL,
  `Collocazione` char(50) NOT NULL DEFAULT 'piena terra', /* piena terra, 
															 vaso */
  `DimensioneAllAcquisto` int(11) unsigned DEFAULT NULL,
  `PosX` int(11) NOT NULL,
  `PosY` int(11) NOT NULL,
  `CodPianta` int(11) unsigned NOT NULL,
  `CodVaso` int(11) unsigned DEFAULT NULL,
  `Utente` char(50) NOT NULL,
  PRIMARY KEY (`CodScheda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `sede`
--
DROP TABLE IF EXISTS `sede`;
CREATE TABLE `sede` (
  `CodSede` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NumDipendenti` int(11) unsigned NOT NULL,
  `Indirizzo` char(50) NOT NULL,
  `PiantePresenti` int(11) NOT NULL DEFAULT '0',
  `Nome` char(50) NOT NULL,
  `Capienza` int(11) unsigned NOT NULL,
  PRIMARY KEY (`CodSede`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `serra`
--
DROP TABLE IF EXISTS `serra`;
CREATE TABLE `serra` (
  `CodSerra` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` char(50) NOT NULL,
  `Indirizzo` char(50) NOT NULL,
  `Larghezza` int(11) unsigned NOT NULL, -- metri
  `Altezza` int(11) unsigned NOT NULL, -- metri
  `Capienza` int(11) unsigned NOT NULL,
  `PiantePresenti` int(11) unsigned NOT NULL DEFAULT '0',
  `CodSede` int(11) unsigned NOT NULL,
  PRIMARY KEY (`CodSerra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `settore`
--
DROP TABLE IF EXISTS `settore`;
CREATE TABLE `settore` (
  `CodSettore` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Tipo` char(50) NOT NULL, -- piena terra o pavimentato
  `Esposizione` char(50) NOT NULL, -- punti cardinali
  `NumOreLuce` int(11) unsigned NOT NULL,
  `CodSpazio` int(11) unsigned NOT NULL,
  PRIMARY KEY (`CodSettore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `sezione`
--
DROP TABLE IF EXISTS `sezione`;
CREATE TABLE `sezione` (
  `CodSezione` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Capienza` int(11) unsigned NOT NULL,
  `Irrigazione` float (13, 2) NOT NULL, -- percentuale
  `Illuminazione` float (13, 2) NOT NULL, -- percentuale
  `Umidita` float (13, 2) NOT NULL, -- percentuale
  `Temperatura` float (13, 2) NOT NULL, -- gradi centigradi
  `Quarantena` tinyint(1) NOT NULL,
  `PiantePresenti` int(11) unsigned NOT NULL DEFAULT '0',
  `Nome` char(50) NOT NULL,
  `CodSerra` int(11) unsigned NOT NULL,
  PRIMARY KEY (`CodSezione`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `sintomipatologia`
--
DROP TABLE IF EXISTS `sintomipatologia`;
CREATE TABLE `sintomipatologia` (
  `CodPatologia` int(11) unsigned NOT NULL,
  `CodSintomo` int(11) unsigned NOT NULL,
  PRIMARY KEY (`CodPatologia`,`CodSintomo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `sintomireport`
--
DROP TABLE IF EXISTS `sintomireport`;
CREATE TABLE `sintomireport` (
  `CodPianta` int(11) unsigned NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
    ON UPDATE CURRENT_TIMESTAMP,
  `CodSintomo` int(11) unsigned NOT NULL,
  PRIMARY KEY (`CodPianta`,`Timestamp`,`CodSintomo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `sintomo`
--
DROP TABLE IF EXISTS `sintomo`;
CREATE TABLE `sintomo` (
  `CodSintomo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Descrizione` char(200) DEFAULT NULL,
  PRIMARY KEY (`CodSintomo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `somministrazioneconcimazione`
--
DROP TABLE IF EXISTS `somministrazioneconcimazione`;
CREATE TABLE `somministrazioneconcimazione` (
  `NomeElemento` char(50) NOT NULL,
  `CodManutenzione` int(11) unsigned NOT NULL,
  `Iterazione` int(11) unsigned NOT NULL,
  `Quantita` float(13, 2) unsigned NOT NULL, -- mg/m^3
  PRIMARY KEY (`NomeElemento`,`CodManutenzione`, `Iterazione`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `spazio`
--
DROP TABLE IF EXISTS `spazio`;
CREATE TABLE `spazio` (
  `CodSpazio` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Tipo` char(50) NOT NULL,
  `Utente` char(50) DEFAULT NULL,
  PRIMARY KEY (`CodSpazio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `specie`
--
DROP TABLE IF EXISTS `specie`;
CREATE TABLE `specie` (
  `Nome` char(50) NOT NULL,
  `Genere` char(50) NOT NULL,
  `Cultivar` char(50) NOT NULL,
  `Infestante` tinyint(1) NOT NULL DEFAULT '0',
  `DimMax` int(11) unsigned NOT NULL, -- centimetri (diametro)
  `IndiceAccrescimento` float(13, 2) NOT NULL, -- di solito da 0 a 20
  `PosLuce` char(50) NOT NULL, -- pieno sole, ombra o mezz'ombra
  `TipoLuce` char(50) NOT NULL, -- in/diretta
  `OreLuceVegetativo` int(11) NOT NULL, -- giornaliere
  `TempMax` int(11) NOT NULL, -- gradi centigradi
  `ConsistenzaTerreno` char(50) DEFAULT NULL,
  `DistanzaMinConflitto` int(11) unsigned DEFAULT NULL, -- centimetri
  `NumeroEsordi` int(11) unsigned DEFAULT '0',
  `NumeroPiante` int(11) unsigned DEFAULT '0',
  `CostoTotManutenzione` int(11) unsigned DEFAULT '0', -- euro
  `Dioica` tinyint(1) NOT NULL DEFAULT '0',
  `TempMin` int(11) NOT NULL, -- gradi centigradi
  `OreLuceRiposo` int(11) NOT NULL, -- giornaliere
  `Fogliame` char(50) NOT NULL,
  `NumIrrigGiornaliereVegetativo` int(11) NOT NULL,
  `NumIrrigGiornaliereRiposo` int(11) NOT NULL,
  `QuantitaIrrigVegetativo` int(11) NOT NULL, -- mL
  `QuantitaIrrigRiposo` int(11) NOT NULL, -- mL
  `PeriodicitaIrrigVegetativo` int(11) NOT NULL, -- ogni quanti giorni
  `PeriodicitaIrrigRiposo` int(11) NOT NULL, -- ogni quanti giorni
  `NumPianteVendute` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `specieappassionatoaccount`
--
DROP TABLE IF EXISTS `specieappassionatoaccount`;
CREATE TABLE `specieappassionatoaccount` (
  `NomeSpecie` char(50) NOT NULL,
  `Utente` char(50) NOT NULL,
  PRIMARY KEY (`NomeSpecie`,`Utente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `speciereportordini`
--
DROP TABLE IF EXISTS `speciereportordini`;
CREATE TABLE `speciereportordini` (
  `CodRepOrdini` int(11) unsigned NOT NULL,
  `NomeSpecie` char(50) NOT NULL,
  `Quantita` int(11) unsigned NOT NULL,
  PRIMARY KEY (`CodRepOrdini`,`NomeSpecie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `terreno`
--
DROP TABLE IF EXISTS `terreno`;
CREATE TABLE `terreno` (
  `CodTerreno` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PH` int(11) unsigned NOT NULL, -- da 3.5 a 9.0
  `Consistenza` char(50) NOT NULL,
  -- millidarcy (en.wikipedia.org/wiki/Permeability_(earth_sciences)#Units)
  `Permeabilita` float(20, 10) NOT NULL, 
  PRIMARY KEY (`CodTerreno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `thread`
--
DROP TABLE IF EXISTS `thread`;
CREATE TABLE `thread` (
  `CodThread` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` char(50) NOT NULL,
  `NumMedia` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CodThread`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `vasiarredamento`
--
DROP TABLE IF EXISTS `vasiarredamento`;
CREATE TABLE `vasiarredamento` (
  `CodVaso` int(11) unsigned NOT NULL,
  `CodSpazio` int(11) unsigned NOT NULL,
  `Versione` int(11) unsigned NOT NULL,
  `CodPianta` int(11) unsigned NOT NULL,
  `PosX` int(11) NOT NULL,
  `PosY` int(11) NOT NULL,
  PRIMARY KEY (`CodVaso`,`CodSpazio`,`Versione`,`CodPianta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `vaso`
--
DROP TABLE IF EXISTS `vaso`;
CREATE TABLE `vaso` (
  `CodVaso` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Materiale` char(50) NOT NULL,
  `DimensioneX` int(11) unsigned NOT NULL,
  `DimensioneY` int(11) unsigned NOT NULL,
  PRIMARY KEY (`CodVaso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `vertice`
--
DROP TABLE IF EXISTS `vertice`;
CREATE TABLE `vertice` (
  `PosX` int(11) NOT NULL,
  `PosY` int(11) NOT NULL,
  PRIMARY KEY (`PosX`,`PosY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Creazione tabella `verticisettore`
--
DROP TABLE IF EXISTS `verticisettore`;
CREATE TABLE `verticisettore` (
  `CodSettore` int(11) unsigned NOT NULL,
  `PosX` int(11) NOT NULL,
  `PosY` int(11) NOT NULL,
  PRIMARY KEY (`CodSettore`,`PosX`,`PosY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;