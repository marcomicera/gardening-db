SET NAMES latin1;
USE `impresagiardinaggio`;
SET FOREIGN_KEY_CHECKS = 1;
SET GLOBAL EVENT_SCHEDULER = ON;

-- Controllo password
DROP TRIGGER IF EXISTS `ControlloPassword`;
DELIMITER $$
CREATE TRIGGER `ControlloPassword` BEFORE INSERT ON `account` FOR EACH ROW
BEGIN
	IF(LENGTH(NEW.`Password`) < 8) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Password troppo corta.';
	END IF;
    
    IF(NEW.`Nickname` = NEW.`Password`) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
			'Impossibile scegliere la password uguale al nickname.';
	END IF;
END $$
DELIMITER ;

-- Controllo domanda e risposta segreta
DROP TRIGGER IF EXISTS `ControlloDomandaRispostaSegreta`;
DELIMITER $$
CREATE TRIGGER `ControlloDomandaRispostaSegreta` 
	BEFORE INSERT ON `account` FOR EACH ROW
BEGIN
	IF(NEW.`DomandaSegreta` = NEW.`RispostaSegreta`) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Impossibile scegliere la domanda segreta 
			uguale alla risposta segreta.';
	END IF;
END $$
DELIMITER ;

-- Controllo sulle percentuali degli elementi di un terreno
DROP TRIGGER IF EXISTS `ControllaPercentualiElementi`;
DELIMITER $$
CREATE TRIGGER `ControllaPercentualiElementi` 
	BEFORE INSERT ON `elementiterreno` FOR EACH ROW
BEGIN
	SET @PercentualeElementiTerreno = (	SELECT SUM(`Concentrazione`)
										FROM `elementiterreno`
										WHERE `CodTerreno` = 
											NEW.`CodTerreno`);

	IF(@PercentualeElementiTerreno + NEW.`Concentrazione` > 100) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La concentrazione di elementi in un terreno 
			non puo\' superare il 100%.';
	END IF;
END $$
DELIMITER ;

/* Aggiornamento della ridondanza `CostoTotManutenzione`
dell'entità `specie` */
DROP TRIGGER IF EXISTS `AggiornamentoCostoTotManutenzione`;
DELIMITER $$
CREATE TRIGGER `AggiornamentoCostoTotManutenzione` 
	AFTER INSERT ON `manutenzione` FOR EACH ROW
BEGIN
	/* Se si tratta di una manutenzione svolta,
	e non di una concimazione necessaria */
	IF(NEW.`CodPianta` IS NOT NULL) THEN
		UPDATE `specie`
		SET `CostoTotManutenzione` = `CostoTotManutenzione` + NEW.Costo
		WHERE `Nome` = (SELECT `NomeSpecie`
						FROM `pianta`
						WHERE `CodPianta` = NEW.`CodPianta`);
	END IF;
END $$
DELIMITER ;

-- Controllo data scadenza
DROP TRIGGER IF EXISTS `ControllaDataScadenza`;
DELIMITER $$
CREATE TRIGGER `ControllaDataScadenza`
	BEFORE INSERT ON `manutenzione` FOR EACH ROW
BEGIN
	IF(NEW.`Scadenza` < NEW.`DataInizio`) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'La scadenza non può avvenire 
				prima della data di inizio.';
        END IF;
END $$
DELIMITER ;

-- Aggiornamento della ridondanza `NumMedia` dell'entità `thread`
DROP TRIGGER IF EXISTS `AggiornamentoNumMedia`;
CREATE TRIGGER `AggiornamentoNumMedia` 
	AFTER INSERT ON `mediapost` FOR EACH ROW
	UPDATE `thread`
	SET `NumMedia` = `NumMedia` + 1
    WHERE `CodThread` = (SELECT `CodThread`
						FROM `post`
						WHERE `Timestamp` = NEW.`Timestamp`
							AND `Utente` = NEW.`Utente`);

-- Calcolo dell'indice di manutenzione
DROP TRIGGER IF EXISTS `ImpostaIndiceManutenzione`;
CREATE TRIGGER `ImpostaIndiceManutenzione` 
	BEFORE INSERT ON `pianta` FOR EACH ROW
	SET NEW.`IndiceManutenzione` = (
		SELECT `IndiceAccrescimento` * `DimMax`
		FROM `specie`
		WHERE `Nome` = NEW.`NomeSpecie`) / NEW.`DimAttuale`;

-- Trigger per l'inserimento di una nuova pianta
DROP TRIGGER IF EXISTS `InserimentoPianta`;
DELIMITER $$
CREATE TRIGGER `InserimentoPianta` AFTER INSERT ON `pianta` FOR EACH ROW
BEGIN
	-- Se la pianta e' contenuta in un contenitore
	IF(NEW.`CodContenitore` IS NOT NULL) THEN
		CALL ControlloDimensioneContenitore(NEW.`DimAttuale`, 
											NEW.`CodContenitore`);
        CALL ControlloTemperaturaSezione(NEW.`CodPianta`, 
										 NEW.`CodContenitore`);
        CALL AggiornaStatoContenitore(NEW.`CodContenitore`,
									  '1');
		CALL AggiornaPiantePresentiSezioneSerraSede(NEW.`CodContenitore`, 
													'1');
	END IF;
    CALL AggiornaNumeroPianteSpecie(NEW.`CodPianta`, '1');
END $$
DELIMITER ;

-- Trigger per la modifica di una pianta
DROP TRIGGER IF EXISTS `ModificaPianta`;
DELIMITER $$
CREATE TRIGGER `ModificaPianta` BEFORE UPDATE ON `pianta` FOR EACH ROW
BEGIN
	IF(OLD.`CodContenitore` <> NEW.`CodContenitore`) THEN
		IF(OLD.`CodContenitore` IS NOT NULL) THEN
			CALL AggiornaStatoContenitore(OLD.`CodContenitore`, 
										  '0');
			CALL AggiornaPiantePresentiSezioneSerraSede(
				OLD.`CodContenitore`, 
				'-1'
			);
		END IF;
        IF(NEW.`CodContenitore` IS NOT NULL) THEN
			CALL ControlloDimensioneContenitore(NEW.`DimAttuale`, 
												NEW.`CodContenitore`);
			CALL AggiornaStatoContenitore(NEW.`CodContenitore`, '1');
			CALL AggiornaPiantePresentiSezioneSerraSede(
				NEW.`CodContenitore`, 
				'1'
			);
		END IF;
	END IF;
END $$
DELIMITER ;

-- Trigger per la cancellazione di una pianta
DROP TRIGGER IF EXISTS `CancellazionePianta`;
DELIMITER $$
CREATE TRIGGER `CancellazionePianta` AFTER DELETE ON `pianta` FOR EACH ROW
BEGIN
	CALL AggiornaStatoContenitore(OLD.`CodContenitore`, '0');
	CALL AggiornaPiantePresentiSezioneSerraSede(OLD.`CodContenitore`, '-1');
	CALL AggiornaNumeroPianteSpecie(OLD.`CodPianta`, '-1');
END $$
DELIMITER ;

-- Aggiornamento della ridondanza `NumPostPubblicati` dell'entità `account`
DROP TRIGGER IF EXISTS `AggiornamentoNumPostPubblicati`;
CREATE TRIGGER `AggiornamentoNumPostPubblicati` 
	AFTER INSERT ON `post` FOR EACH ROW
	UPDATE `account`
	SET `NumPostPubblicati` = `NumPostPubblicati` + 1
	WHERE `Nickname` = NEW.`Utente`;

-- Impostazione dell'attributo `CodTerreno`
DROP TRIGGER IF EXISTS `ImpostaCodTerreno`;
CREATE TRIGGER `ImpostaCodTerreno` 
	BEFORE INSERT ON `reportdiagnostica` FOR EACH ROW
	SET NEW.`CodTerreno` = (SELECT `CodTerreno`
							FROM `pianta`
							WHERE `CodPianta` = NEW.`CodPianta`);

-- Aggiornamento della ridondanza `NumeroEsordi` dell'entità `specie`
DROP TRIGGER IF EXISTS `AggiornamentoNumeroEsordi`;
CREATE TRIGGER `AggiornamentoNumeroEsordi` 
	AFTER INSERT ON `reportdiagnostica` FOR EACH ROW
	UPDATE `specie`
	SET `NumeroEsordi` = `NumeroEsordi` + 1
    WHERE `Nome` = (SELECT `NomeSpecie`
					FROM `pianta`
					WHERE `CodPianta` = NEW.`CodPianta`);

-- Controllo sulla capienza di un ripiano
DROP TRIGGER IF EXISTS `ControllaCapienzaRipiano`;
DELIMITER $$
CREATE TRIGGER `ControllaCapienzaRipiano` 
	BEFORE INSERT ON `ripiano` FOR EACH ROW
BEGIN
	SET @CapienzaSezione = (SELECT `Capienza`
							FROM `sezione`
							WHERE `CodSezione` = NEW.`CodSezione`);

	SET @CapienzaRipiani = (SELECT SUM(`Capienza`)
							FROM `ripiano`
                            WHERE `CodSezione` = NEW.`CodSezione`);

	IF(@CapienzaRipiani + NEW.`Capienza` > @CapienzaSezione) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La capienza di tutti i ripiani di una 
			sezione non può superare quella di quest\'ultima.';
	END IF;
END $$
DELIMITER ;

-- Impostazione dell'attributo `DimensioneAllAcquisto`
DROP TRIGGER IF EXISTS `ImpostazioneDimensioneAllAcquisto`;
CREATE TRIGGER `ImpostazioneDimensioneAllAcquisto` 
	BEFORE INSERT ON `scheda` FOR EACH ROW
	SET NEW.`DimensioneAllAcquisto` = (	
		SELECT `DimAttuale`
		FROM `pianta`
		WHERE `CodPianta` = NEW.`CodPianta`);

/* Trigger per l'aggiornamento della ridondanza
`NumPianteVendute` di `specie` dopo la vendita di una pianta */
DROP TRIGGER IF EXISTS `AggiornaNumPianteVendute`;
DELIMITER $$
CREATE TRIGGER `AggiornaNumPianteVendute` 
	AFTER INSERT ON `scheda` FOR EACH ROW
BEGIN
	UPDATE `specie`
    SET `NumPianteVendute` = `NumPianteVendute` + 1
    WHERE `Nome` = (SELECT `NomeSpecie`
					FROM `pianta`
					WHERE `CodPianta` = NEW.`CodPianta`);
END $$
DELIMITER ;

-- Controllo sulla capienza di una serra
DROP TRIGGER IF EXISTS `ControllaCapienzaSerra`;
DELIMITER $$
CREATE TRIGGER `ControllaCapienzaSerra` 
	BEFORE INSERT ON `serra` FOR EACH ROW
BEGIN
	SET @CapienzaSede = (	SELECT `Capienza`
							FROM `sede`
							WHERE `CodSede` = NEW.`CodSede`);

	SET @CapienzaSerre = (	SELECT SUM(`Capienza`)
							FROM `serra`
							WHERE `CodSede` = NEW.`CodSede`);

	IF(@CapienzaSerre + NEW.`Capienza` > @CapienzaSede) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La capienza di tutte le serre di una 
			sede non può superare quella di quest\'ultima.';
	END IF;
END $$
DELIMITER ;

-- Controllo sulla capienza di una sezione
DROP TRIGGER IF EXISTS `ControllaCapienzaSezione`;
DELIMITER $$
CREATE TRIGGER `ControllaCapienzaSezione` 
	BEFORE INSERT ON `sezione` FOR EACH ROW
BEGIN
	SET @CapienzaSerra = (	SELECT `Capienza`
							FROM `serra`
							WHERE `CodSerra` = NEW.`CodSerra`);

	SET @CapienzaSezioni = (SELECT SUM(`Capienza`)
							FROM `sezione`
							WHERE `CodSerra` = NEW.`CodSerra`);

	IF(@CapienzaSezioni + NEW.`Capienza` > @CapienzaSerra) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La capienza di tutte le sezioni di 
			una serra non può superare quella di quest\'ultima.';
	END IF;
END $$
DELIMITER ;

-- Calcolo dell'indice di accrescimento
DROP TRIGGER IF EXISTS `ImpostaIndiceAccrescimento`;
CREATE TRIGGER `ImpostaIndiceAccrescimento` 
	BEFORE INSERT ON `specie` FOR EACH ROW
	SET NEW.`IndiceAccrescimento` = NEW.`DimMax` * 100 /
		(NEW.`NumIrrigGiornaliereVegetativo` * 
			NEW.`QuantitaIrrigVegetativo` * 
			365/NEW.`PeriodicitaIrrigVegetativo`
		+ 0.5 * (NEW.`NumIrrigGiornaliereRiposo` * 
			NEW.`QuantitaIrrigRiposo` * 
			365/NEW.`PeriodicitaIrrigRiposo`));

-- Controllo sulla distanza minima di conflitto
DROP TRIGGER IF EXISTS `ControllaDistanzaMinConflitto`;
DELIMITER $$
CREATE TRIGGER `ControllaDistanzaMinConflitto` 
	BEFORE INSERT ON `specie` FOR EACH ROW
BEGIN
	IF(NEW.`DistanzaMinConflitto` < NEW.`DimMax` / 2) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'DistanzaMinConflitto troppo piccola.';
	END IF;
END $$
DELIMITER ;

-- Controllo del range delle temperature accettabili
DROP TRIGGER IF EXISTS `ControllaTemperature`;
DELIMITER $$
CREATE TRIGGER `ControllaTemperature` 
	BEFORE INSERT ON `specie` FOR EACH ROW
BEGIN
	IF(NEW.`TempMin` > NEW.`TempMax`) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Range di temperature non valido.';
	END IF;
END $$
DELIMITER ;

-- Controllo sulle percentuali delle componenti di un terreno
DROP TRIGGER IF EXISTS `ControllaPercentualiComponenti`;
DELIMITER $$
CREATE TRIGGER `ControllaPercentualiComponenti` 
	BEFORE INSERT ON `componentiterreno` FOR EACH ROW
BEGIN
	SET @PercentualeComponentiTerreno = (	SELECT SUM(`Concentrazione`)
											FROM `componentiterreno`
											WHERE `CodTerreno` = 
												NEW.`CodTerreno`);

	IF(@PercentualeComponentiTerreno + NEW.`Concentrazione` > 100) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La concentrazione di componenti in un terreno
			non puo\' superare il 100%.';
	END IF;
END $$
DELIMITER ;