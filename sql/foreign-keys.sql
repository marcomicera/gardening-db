SET NAMES latin1;
USE `impresagiardinaggio`;
SET FOREIGN_KEY_CHECKS = 1;
SET GLOBAL EVENT_SCHEDULER = ON;

ALTER TABLE `pianta`
  ADD FOREIGN KEY(`NomeSpecie`) REFERENCES `specie`(`Nome`)
    ON DELETE SET NULL ON UPDATE CASCADE,
  ADD FOREIGN KEY(`CodTerreno`) REFERENCES `terreno`(`CodTerreno`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`CodOrdine`) REFERENCES `ordine`(`CodOrdine`)
    ON DELETE SET NULL ON UPDATE CASCADE,
  ADD FOREIGN KEY(`CodContenitore`)
	REFERENCES `contenitore`(`CodContenitore`)
		ON DELETE SET NULL ON UPDATE CASCADE;
  
ALTER TABLE `scheda`
  ADD FOREIGN KEY(`CodPianta`) REFERENCES `pianta`(`CodPianta`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`CodVaso`) REFERENCES `vaso`(`CodVaso`)
    ON DELETE SET NULL ON UPDATE CASCADE,
  ADD FOREIGN KEY(`Utente`) REFERENCES `account`(`Nickname`)
    ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `ordine`
  ADD FOREIGN KEY(`Utente`) REFERENCES `account`(`Nickname`)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `post`
  ADD FOREIGN KEY(`Utente`) REFERENCES `account`(`Nickname`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`CodThread`) REFERENCES `thread`(`CodThread`)
    ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `mediapost`
  ADD FOREIGN KEY(`Timestamp`,`Utente`)
	REFERENCES `post`(`Timestamp`,`Utente`)
		ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`URL`) REFERENCES `media`(`URL`)
    ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `specieappassionatoaccount`
  ADD FOREIGN KEY(`NomeSpecie`) REFERENCES `specie`(`Nome`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`Utente`) REFERENCES `account`(`Nickname`)
    ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `reportmanutenzione`
  ADD FOREIGN KEY(`NomeSpecie`) REFERENCES `specie`(`Nome`)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `speciereportordini`
  ADD FOREIGN KEY(`CodRepOrdini`) REFERENCES `reportordini`(`CodRepOrdini`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`NomeSpecie`) REFERENCES `specie`(`Nome`)
    ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `elementinecessarispecie`
  ADD FOREIGN KEY(`NomeSpecie`) REFERENCES `specie`(`Nome`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`NomeElemento`) REFERENCES `elemento`(`Nome`)
    ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `elementiterreno`
  ADD FOREIGN KEY(`NomeElemento`) REFERENCES `elemento`(`Nome`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`CodTerreno`) REFERENCES `terreno`(`CodTerreno`)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `componentiterreno`
  ADD FOREIGN KEY(`CodTerreno`) REFERENCES `terreno`(`CodTerreno`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`NomeComponente`) REFERENCES `componente`(`Nome`)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `salute`
  ADD FOREIGN KEY(`CodContenitore`) 
	REFERENCES `contenitore`(`CodContenitore`)
		ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `elementistatosalute`
  ADD FOREIGN KEY(`CodContenitore`,`Timestamp`) 
	REFERENCES `salute`(`CodContenitore`,`Timestamp`)
		ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`NomeElemento`) REFERENCES `elemento`(`Nome`)
    ON DELETE CASCADE ON UPDATE CASCADE;

-- I ripiani e i contenitori si possono spostare (ON DELETE SET NULL)  
ALTER TABLE `contenitore`
  ADD FOREIGN KEY(`CodRipiano`) REFERENCES `ripiano`(`CodRipiano`)
    ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `ripiano`
  ADD FOREIGN KEY(`CodSezione`) REFERENCES `sezione`(`CodSezione`)
    ON DELETE SET NULL ON UPDATE CASCADE;

-- Le sezioni e le serre no (ON DELETE CASCADE)
ALTER TABLE `sezione`
  ADD FOREIGN KEY(`CodSerra`) REFERENCES `serra`(`CodSerra`)
    ON DELETE CASCADE ON UPDATE CASCADE;  
ALTER TABLE `serra`
  ADD FOREIGN KEY(`CodSede`) REFERENCES `sede`(`CodSede`)
    ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `spazio`
  ADD FOREIGN KEY(`Utente`) REFERENCES `account`(`Nickname`)
    ON DELETE SET NULL ON UPDATE CASCADE;
  
ALTER TABLE `verticisettore`
  ADD FOREIGN KEY(`CodSettore`) REFERENCES `settore`(`CodSettore`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`PosX`,`PosY`) REFERENCES `vertice`(`PosX`,`PosY`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
  
ALTER TABLE `arredamento`
  ADD FOREIGN KEY(`CodSpazio`) REFERENCES `spazio`(`CodSpazio`)
    ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `vasiarredamento`
  ADD FOREIGN KEY(`CodVaso`) REFERENCES `vaso`(`CodVaso`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`CodSpazio`,`Versione`) 
	REFERENCES `arredamento`(`CodSpazio`,`Versione`)
		ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`CodPianta`) REFERENCES `pianta`(`CodPianta`)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `piantearredamentoinpienaterra`
  ADD FOREIGN KEY(`CodSpazio`,`Versione`) 
	REFERENCES `arredamento`(`CodSpazio`,`Versione`)
		ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`CodPianta`) REFERENCES `pianta`(`CodPianta`)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `somministrazioneconcimazione`
  ADD FOREIGN KEY(`NomeElemento`) REFERENCES `elemento`(`Nome`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`CodManutenzione`) 
	REFERENCES `manutenzione`(`CodManutenzione`)
		ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `esigenzaconcimazionepianta`
  ADD FOREIGN KEY(`CodPianta`) REFERENCES `pianta`(`CodPianta`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`CodManutenzione`) 
	REFERENCES `manutenzione`(`CodManutenzione`)
		ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `periodispecie`
  ADD FOREIGN KEY(`NomeSpecie`) REFERENCES `specie`(`Nome`)
    ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `reportdiagnostica`
  ADD FOREIGN KEY(`CodPianta`) REFERENCES `pianta`(`CodPianta`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`CodTerreno`) REFERENCES `terreno`(`CodTerreno`)
    ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `sintomireport`
  ADD FOREIGN KEY(`CodPianta`,`Timestamp`) 
	REFERENCES `reportdiagnostica`(`CodPianta`,`Timestamp`)
		ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`CodSintomo`) REFERENCES `sintomo`(`CodSintomo`)
    ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `patologiereport`
  ADD FOREIGN KEY(`CodPianta`,`Timestamp`) 
	REFERENCES `reportdiagnostica`(`CodPianta`,`Timestamp`)
		ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`CodPatologia`) REFERENCES `patologia`(`CodPatologia`)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `periodiprodotti`
  ADD FOREIGN KEY(`NomeProdotto`) REFERENCES `prodotto`(`Nome`)
    ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `principiattiviprodotto`
  ADD FOREIGN KEY(`NomeProdotto`) REFERENCES `prodotto`(`Nome`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`NomePrincipioAttivo`) 
	REFERENCES `principioattivo`(`Nome`)
		ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `prodottocombatte`
  ADD FOREIGN KEY(`NomeProdotto`) REFERENCES `prodotto`(`Nome`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`NomeAgentePatogeno`) REFERENCES `agentepatogeno`(`Nome`)
    ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `agentipatogenipatologia`
  ADD FOREIGN KEY(`CodPatologia`) REFERENCES `patologia`(`CodPatologia`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`NomeAgentePatogeno`) REFERENCES `agentepatogeno`(`Nome`)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `prodottipatologia`
  ADD FOREIGN KEY(`CodPatologia`) REFERENCES `patologia`(`CodPatologia`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`NomeProdotto`) REFERENCES `prodotto`(`Nome`)
    ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `sintomipatologia`
  ADD FOREIGN KEY(`CodPatologia`) REFERENCES `patologia`(`CodPatologia`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`CodSintomo`) REFERENCES `sintomo`(`CodSintomo`)
    ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `immaginisintomi`
  ADD FOREIGN KEY(`CodSintomo`) REFERENCES `sintomo`(`CodSintomo`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`URL`) REFERENCES `immagine`(`URL`)
    ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `prodottitrattamento`
  ADD FOREIGN KEY(`NomeProdotto`) REFERENCES `prodotto`(`Nome`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  ADD FOREIGN KEY(`CodManutenzione`) 
	REFERENCES `manutenzione`(`CodManutenzione`)
		ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `manutenzione`
  ADD FOREIGN KEY(`CodPianta`) REFERENCES `pianta`(`CodPianta`)
    ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `periodimanutenzione`
  ADD FOREIGN KEY(`CodManutenzione`) 
	REFERENCES `manutenzione`(`CodManutenzione`)
		ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `reportassunzioni`
  ADD FOREIGN KEY(`CodSede`) REFERENCES `sede`(`CodSede`)
    ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `settore`
  ADD FOREIGN KEY(`CodSpazio`) REFERENCES `spazio`(`CodSpazio`)
    ON DELETE CASCADE ON UPDATE CASCADE;