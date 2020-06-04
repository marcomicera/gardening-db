SET NAMES latin1;
USE `impresagiardinaggio`;
SET FOREIGN_KEY_CHECKS = 1;
SET GLOBAL EVENT_SCHEDULER = ON;

INSERT INTO `media` VALUES
  ('./forum/img1.png'),
  ('./forum/img2.png'),
  ('./forum/img3.png'),
  ('./forum/img4.png'),
  ('./forum/img5.png'),
  ('./forum/img6.png'),
  ('./forum/img7.png'),
  ('./forum/img8.png'),
  ('./forum/img9.png'),
  ('./forum/img10.png');

INSERT INTO `thread`	(`CodThread`, `Nome`) VALUES
						('1', 'Bonsai Mania'),
						('2', 'Foto delle vostre piante preferite!'),
						('3', 'Dove posso trovare i migliori pini?'),
						('4', 'Piante natalizie'),
						('5', 'La vostra pianta preferita?'),
						('6', 'Viti: una passione'),
						('7', 'Garden designers'),
						('8', 'Vasi per cactus'),
						('9', 'Suggerimenti'),
						('10', 'Piante tropicali');
  
INSERT INTO `vertice` VALUES
  ('1', '1'), ('1', '2'), ('1', '3'), ('1', '4'), ('1', '5'), ('1', '6'), 
  ('1', '7'), ('1', '8'), ('1', '9'), ('1', '10'),
  ('2', '1'), ('2', '2'), ('2', '3'), ('2', '4'), ('2', '5'), ('2', '6'), 
  ('2', '7'), ('2', '8'), ('2', '9'), ('2', '10'),
  ('3', '1'), ('3', '2'), ('3', '3'), ('3', '4'), ('3', '5'), ('3', '6'), 
  ('3', '7'), ('3', '8'), ('3', '9'), ('3', '10'),
  ('4', '1'), ('4', '2'), ('4', '3'), ('4', '4'), ('4', '5'), ('4', '6'),
  ('4', '7'), ('4', '8'), ('4', '9'), ('4', '10'),
  ('5', '1'), ('5', '2'), ('5', '3'), ('5', '4'), ('5', '5'), ('5', '6'),
  ('5', '7'), ('5', '8'), ('5', '9'), ('5', '10'),
  ('6', '1'), ('6', '2'), ('6', '3'), ('6', '4'), ('6', '5'), ('6', '6'),
  ('6', '7'), ('6', '8'), ('6', '9'), ('6', '10'),
  ('7', '1'), ('7', '2'), ('7', '3'), ('7', '4'), ('7', '5'), ('7', '6'),
  ('7', '7'), ('7', '8'), ('7', '9'), ('7', '10'),
  ('8', '1'), ('8', '2'), ('8', '3'), ('8', '4'), ('8', '5'), ('8', '6'),
  ('8', '7'), ('8', '8'), ('8', '9'), ('8', '10'),
  ('9', '1'), ('9', '2'), ('9', '3'), ('9', '4'), ('9', '5'), ('9', '6'),
  ('9', '7'), ('9', '8'), ('9', '9'), ('9', '10'),
  ('10', '1'), ('10', '2'), ('10', '3'), ('10', '4'), ('10', '5'), 
  ('10', '6'), ('10', '7'), ('10', '8'), ('10', '9'), ('10', '10');

-- Da Wikipedia: Famiglia -> Genere -> Specie
-- Esempi di specie e generi: goo.gl/KSZj8F
-- Esempi di cultivars: en.wikipedia.org/wiki/Lists_of_cultivars
INSERT INTO `specie` (	`Nome`, 
						`Genere`,
						`Cultivar`, 
                        `Infestante`, 
                        `DimMax`, 
                        `PosLuce`, 
                        `TipoLuce`, 
                        `OreLuceVegetativo`, 
                        `TempMax`, 
                        `ConsistenzaTerreno`, 
                        `DistanzaMinConflitto`, 
                        `Dioica`, 
                        `TempMin`, 
                        `OreLuceRiposo`, 
                        `Fogliame`, 
                        `NumIrrigGiornaliereVegetativo`, 
                        `NumIrrigGiornaliereRiposo`, 
                        `QuantitaIrrigVegetativo`, 
                        `QuantitaIrrigRiposo`, 
                        `PeriodicitaIrrigVegetativo`, 
                        `PeriodicitaIrrigRiposo`) VALUES
  ('Mays', 'Zea', 'Mais', '0', '20', 'Pieno sole', 'diretta', 
	'9', '48', 'compatto', '15', '0', '1', '6', 'seghettato', 
	'2', '1', '20', '10', '10', '20'),
  ('Aestivum', 'Triticum', 'Grano', '0', '30', 'Pieno sole', 'diretta', 
	'11', '40', 'laterico', '15', '0', '5', '6', 'lacerato',
	'1', '1', '15', '10', '7', '15'),
  ('Minor', 'Ulmus', 'Olmo', '0', '70', 'Mezz\'ombra', 'indiretta', 
	'10', '45', 'argilloso', '35', '0', '10', '7', 'pennatosetto',
	'2', '0', '10', '7', '10', '30'),
  ('Perennis', 'Bellis', 'Pratolina', '0', '25', 'Mezz\'ombra', 'diretta',
	'8', '29', 'sabbioso', '15', '1', '15', '8', 'lacerato',
	'1', '1', '20', '15', '5', '14'),
  ('Officinalis', 'Taraxacum', 'Tarassaco', '1', '15', 'Ombra', 'indiretta',
	'12', '37', 'sciolto', '12', '0', '5', '4', 'seghettato',
	'1', '1', '25', '10', '15', '20'),
  ('Alba', 'Populus', 'Gattice', '0', '30', 'Ombra', 'indiretta',
	'7', '39', 'ibrido', '15', '1', '10', '6', 'lobato', 
	'1', '0', '18', '18', '20', '20'),
  ('Avium', 'Prunus', 'Ciliegio', '0', '90', 'Pieno sole', 'diretta',
	'11', '35', 'compatto', '60', '1', '7', '5', 'pennatifido',
	'2', '0', '13', '10', '15', '20'),
  ('Moraceae', 'Ficus', 'Trigmus', '0', '30', 'Mezz\'ombra', 'indiretta',
	'9', '46', 'argilloso', '35', '0', '10', '7', 'pennatosetto', 
	'2', '0', '10', '7', '10', '30'),
  ('Tiliaceae', 'Tilia', 'Tritcum', '0', '25', 'Pieno sole', 'diretta', 
	'8', '28', 'sabbioso', '15', '1', '15', '8', 'lacerato',
	'1', '1', '20', '15', '5', '14'),
  ('Rosaceae', 'Spiraea', 'Gattice', '1', '15', 'Mezz\'ombra', 'indiretta',
	'11', '31', 'sciolto', '12', '0', '5', '4', 'seghettato', 
	'1', '1', '25', '10', '15', '20');

INSERT INTO `account` (	`Nickname`, 
						`CittaResidenza`, 
						`Password`,
						`Email`, 
						`Nome`,
						`Cognome`,
						`DomandaSegreta`, 
						`RispostaSegreta`) VALUES
  ('jack86', 'Londra', 'om12km3lk9', 'jk86@qwemk.com',
	'Jack', 'White', 'Nome del gatto di tua suocera', 'Fuffy'),
  ('John244', 'Milano', '31oij4o1k2m3l', 'hn244@ekk.com',
	'John', 'Black', 'Dove sei nato', 'Bologna'),
  ('RobJDK', 'Roma', 'l3ep12ok3', 'robjdk@odlk.com', 
	'Rob', 'Huston', 'Cognome di tua madre', 'White'),
  ('MickeyMouse12', 'Napoli', 'jri3j412klm', 'mickeymouse12@ksmc.com',
	'Mickey', 'Mouse', 'Nome del cane', 'Bobby'),
  ('RoseLover', 'Venezia', 'kop41po2k4', 'roselover11@col.com',
	'Fred', 'Durst', 'Piatto preferito', 'Pizza'),
  ('jonny1', 'Londra', 'o1ij14ò2omkk', 'jonny1_ekd@ekdm.com',
	'Jonny', 'London', 'Film preferito', 'Pulp Fiction'),
  ('Alex_9', 'Roma', 'o3i4u1h24km', 'alex9@jdem.com',
	'Alex', 'White', 'Cantante preferito', 'Freddy Mercury'),
  ('Eric', 'Napoli', 'jbslkjrlkj413l4il', 'eric_lsk@edd.com',
	'Eric', 'Black', 'Data di laurea', '3 novembre 2015'),
  ('Paul311', 'Bologna', '5ji453j6o1', 'kelw@wol.com',
	'Paul', 'Jhonson', 'Quanto sei alto', '176'),
  ('PeterWhite', 'Roma', '12okm3n3knj2', 'sksld@amz.com', 
	'Peter', 'White', 'Film preferito', 'Titanic');

INSERT INTO `spazio` VALUES
  ('1', 'verde', 'Eric'),
  ('2', 'non verde', 'jonny1'),
  ('3', 'non verde', 'jack86'),
  ('4', 'verde', 'RoseLover'),
  ('5', 'non verde', 'Eric'),
  ('6', 'verde', 'MickeyMouse12'),
  ('7', 'non verde', 'RobJDK'),
  ('8', 'verde', 'MickeyMouse12'),
  ('9', 'non verde', 'Eric'),
  ('10', 'verde', 'RobJDK');

INSERT INTO `settore` (	`CodSettore`, 
						`Tipo`, 
						`Esposizione`, 
						`NumOreLuce`, 
						`CodSpazio`) VALUES
  ('1', 'piena terra', 'nord', '11', '9'),
  ('2', 'pavimentato', 'sud-est', '8', '6'),
  ('3', 'piena terra', 'ovest', '5', '5'),
  ('4', 'pavimentato', 'sud', '0', '10'),
  ('5', 'pavimentato', 'nord-est', '5', '9'),
  ('6', 'piena terra', 'est', '12', '4'),
  ('7', 'piena terra', 'nord', '7', '6'),
  ('8', 'pavimentato', 'sud-ovest', '0', '3'),
  ('9', 'piena terra', 'nord', '6', '2'),
  ('10', 'pavimentato', 'nord-ovest', '7', '1');

INSERT INTO `verticisettore` (`CodSettore`, `PosX`, `PosY`) VALUES
  ('1', '1', '1'), ('1', '4', '1'), ('1', '1', '5'), ('1', '4', '5'),
  ('2', '1', '2'), ('2', '4', '2'), ('2', '1', '10'), ('2', '4', '10'),
  ('3', '3', '5'), ('3', '5', '10'), ('3', '1', '10'),
  ('4', '5', '1'), ('4', '2', '2'), ('4', '8', '2'), ('4', '3', '8'), 
	('4', '5', '8'),
  ('5', '7', '4'), ('5', '10', '4'), ('5', '7', '10'),('5', '10', '10'),
  ('6', '1', '6'), ('6', '4', '6'), ('6', '1', '1'),
  ('7', '5', '1'), ('7', '5', '5'), ('7', '9', '1'),
  ('8', '2', '2'), ('8', '2', '7'), ('8', '7', '2'), ('8', '7', '7'),
  ('9', '4', '4'), ('9', '4', '8'), ('9', '8', '4'), ('9', '8', '8'),
  ('10', '3', '3'), ('10', '3', '6'), ('10', '6', '3'), ('10', '6', '6');

INSERT INTO `post` VALUES
  ('2016-12-27 11:56:08', 'jack86', '3.4', 'Secondo me...', '4'),
  ('2015-09-12 12:14:58', 'Paul311', '3.3', 'La pianta che...', '1'),
  ('2016-02-23 15:38:45', 'PeterWhite', '4.7', 'Penso che...', '10'),
  ('2016-01-10 09:12:34', 'Eric', '4.9', 'Secondo me...', '9'),
  ('2015-05-09 14:44:40', 'RoseLover', '1.4', 'A mio parere...', '5'),
  ('2014-12-07 18:21:17', 'Alex_9', '2.3', 'Secondo me...', '6'),
  ('2016-07-01 07:20:57', 'jack86', '4.1', 'Io credo che...', '3'),
  ('2015-08-29 11:16:49', 'RobJDK', '3.0', 'Secondo me...', '2'),
  ('2016-10-28 17:38:38', 'RoseLover', '2.9', 'Secondo me...', '6'),
  ('2015-09-30 08:45:18', 'jack86', '5.0', 'Forse potrebbe...', '4');

INSERT INTO `mediapost` VALUES
  ('2016-12-27 11:56:08', 'jack86', './forum/img3.png'),
  ('2016-02-23 15:38:45', 'PeterWhite', './forum/img4.png'),
  ('2016-02-23 15:38:45', 'PeterWhite', './forum/img9.png'),
  ('2016-02-23 15:38:45', 'PeterWhite', './forum/img2.png'),
  ('2016-02-23 15:38:45', 'PeterWhite', './forum/img8.png'), 
  ('2016-01-10 09:12:34', 'Eric', './forum/img4.png'),
  ('2014-12-07 18:21:17', 'Alex_9', './forum/img7.png'),
  ('2016-07-01 07:20:57', 'jack86', './forum/img1.png'),
  ('2016-07-01 07:20:57', 'jack86', './forum/img6.png'),
  ('2016-07-01 07:20:57', 'jack86', './forum/img5.png'),
  ('2015-08-29 11:16:49', 'RobJDK', './forum/img1.png'),
  ('2015-09-30 08:45:18', 'jack86', './forum/img10.png'),
  ('2015-09-30 08:45:18', 'jack86', './forum/img6.png');

INSERT INTO `specieappassionatoaccount` VALUES
  ('Avium', 'RobJDK'),
  ('Rosaceae', 'jack86'),
  ('Officinalis', 'PeterWhite'),
  ('Tiliaceae', 'Alex_9'),
  ('Alba', 'RoseLover'),
  ('Moraceae', 'MickeyMouse12'),
  ('Minor', 'John244'),
  ('Avium', 'Eric'),
  ('Minor', 'jack86'),
  ('Mays', 'Alex_9');

INSERT INTO `ordine` VALUES
  ('1', '2016-01-14 09:30:15', 'pendente', 'Paul311'),
  ('2', '2016-10-16 18:43:18', 'in processazione', 'Alex_9'),
  ('3', '2016-02-03 14:15:46', 'spedito', 'PeterWhite'),
  ('4', '2016-07-19 16:08:05', 'in preparazione', 'MickeyMouse12'),
  ('5', '2016-09-29 05:05:00', 'in processazione', 'Alex_9'),
  ('6', '2016-05-05 09:13:48', 'pendente', 'jack86'),
  ('7', '2016-11-09 13:59:56', 'in preparazione', 'Eric'),
  ('8', '2016-04-15 22:48:37', 'in processazione', 'jack86'),
  ('9', '2016-03-23 14:36:47', 'spedito', 'Eric'),
  ('10', '2016-12-27 23:14:32', 'evaso', 'jack86');

INSERT INTO `sede` (`CodSede`, 
					`NumDipendenti`, 
					`Indirizzo`, 
					`Nome`, 
					`Capienza`) VALUES
  ('1', '35', 'Via Roma 34, Pisa, Italia', 'Da Giorgi', '400'),
  ('2', '12', 'Via Venezia 19, Roma, Italia', 'PuntoPianta', '300'),
  ('3', '50', 'Via Diotisalvi 9, Napoli, Italia', 'GarDesign', '100'),
  ('4', '38', 'Via Giorgi 5, Bologna, Italia', 'Magazzino Bologna', '200'),
  ('5', '10', 'St James Street 12, Londra, UK', 'Il Pollice Verde', '300'),
  ('6', '26', 'Via G. Paolo II 34, Bari, Italia', 'SOS Piante', '250'),
  ('7', '31', 'Via Garibaldi 34, Brindisi, Italia', 'Mania Bonsai', '120'),
  ('8', '42', 'Via XIV Maggio 1, Pescara, Italia', 'Da Piero', '300'),
  ('9', '68', 'Via Togliatti 3, Brescia, Italia', 'Da zio Mario', '250'),
  ('10', '18', 'Via Veneto 2, Milano, Italia', 'Tutto in Verde', '300');

INSERT INTO `serra` (	`CodSerra`, 
						`Nome`, 
						`CodSede`, 
						`Indirizzo`, 
						`Larghezza`, 
						`Altezza`, 
						`Capienza`) VALUES
('1', 'Serra1-1', '1', 'Via Roma 18, Pisa, Italia', '50', '50', '100'),
('2', 'Serra2-1', '1', 'Via Roma 19, Pisa, Italia', '50', '50', '100'),
('3', 'Serra3-1', '1', 'Via Roma 20, Pisa, Italia', '50', '50', '100'),
('4', 'Serra4-1', '1', 'Via Roma 21, Pisa, Italia', '50', '50', '100'),
('5', 'Serra1-2', '2', 'Via Vittorio Veneto 26, Venezia, Italia', '70', 
	'60', '150'),
('6', 'Serra2-2', '2', 'Via Vittorio Veneto 27, Venezia, Italia', '70', 
	'60', '150'),
('7', 'Serra1-3', '3', 'Via Togliatti 7, Bari, Italia', '40', '40', '80'),
('8', 'Serra1-5', '5', 'Via Giovanni Paolo II 14, Milano, Italia', '80',
	'50', '90'),
('9', 'Serra2-5', '5', 'Via Giovanni Paolo II 15, Milano, Italia', '80',
	'50', '90'),
('10', 'Serra1-6', '6', 'Via Bovio 2, Ancona, Italia', '100', '50', '120'),
('11', 'Serra2-6', '6', 'Via Bovio 3, Ancona, Italia', '100', '50', '120'),
('12', 'Serra1-9', '9', 'Via Garibaldi 9, Catania, Italia', '100', '120', 
	'180'),
('13', 'Serra1-10', '10', 'Via XIV Maggio 10, Milano, Italia', '40', '50'
	'100');

INSERT INTO `sezione` (	`CodSezione`, 
						`Nome`, 
						`CodSerra`, 
						`Capienza`, 
						`Irrigazione`, 
						`Illuminazione`, 
						`Umidita`, 
						`Temperatura`, 
						`Quarantena`) VALUES
  ('1', 'Sezione1-1-1', '1', '20', '75', '50', '13', '20', '0'),
  ('2', 'Sezione2-1-1', '1', '30', '71', '67', '9', '21', '0'),
  ('3', 'Sezione1-2-1', '2', '25', '64', '55', '10', '20.5', '0'),
  ('4', 'Sezione1-3-1', '3', '35', '67', '53', '12', '21.5', '0'),
  ('5', 'Sezione1-4-1', '4', '20', '68', '51', '9.5', '19', '0'),
  ('6', 'Sezione1-1-2', '5', '40', '68', '51', '9.5', '19', '0'),
  ('7', 'Sezione1-2-2', '6', '45', '76', '64', '5', '22', '0'),
  ('8', 'Sezione1-1-3', '7', '25', '84', '71', '11', '22.5', '0'),
  ('9', 'Sezione2-1-3', '7', '10', '70', '35', '18', '18', '1'),
  ('10', 'Sezione1-1-6', '10', '55', '66', '68', '12', '20.5', '0');
                        
INSERT INTO `ripiano` (	`CodRipiano`, 
						`CodSezione`, 
						`Capienza`, 
						`Irrigazione`) VALUES
  ('1', '1', '5', '71'),
  ('2', '1', '5', '72'),
  ('3', '1', '5', '70'),
  ('4', '1', '5', '66'),
  ('5', '2', '10', '69'),
  ('6', '2', '15', '68'),
  ('7', '3', '10', '65'),
  ('8', '3', '15', '65'),
  ('9', '4', '20', '71'),
  ('10', '4', '15', '74'),
  ('11', '6', '20', '79'),
  ('12', '6', '20', '64'),
  ('13', '8', '20', '68'),
  ('14', '9', '10', '77'),
  ('15', '10', '40', '75');

INSERT INTO `contenitore` (	`CodContenitore`, 
							`Dimensione`, 
							`Idratazione`, 
							`Irrigazione`, 
							`CodRipiano`) VALUES
  ('1', '50', '72', '81.5', '1'),
  ('2', '30', '71', '78', '2'),
  ('3', '40', '59.5', '79', '4'),
  ('4', '55', '69', '82', '5'),
  ('5', '20', '74.5', '84', '7'),
  ('6', '70', '78', '87.5', '8'),
  ('7', '10', '82', '77', '9'),
  ('8', '30', '58.5', '84', '10'),
  ('9', '35', '71', '79', '11'),
  ('10', '30', '68', '85.5', '12'),
  ('11', '50', '64.5', '80', '13'),
  ('12', '45', '74', '83.5', '15');

INSERT INTO `salute` VALUES
  ('1', '2014-04-20 09:30:15', '15', '40.5', '23'),
  ('1', '2014-05-20 11:09:47', '16', '37', '27.5'),
  ('1', '2014-08-20 13:41:17', '15.5', '38', '24'),
  ('3', '2015-10-14 17:13:02', '14.7', '45.1', '29'),
  ('3', '2015-11-14 14:16:57', '17.8', '40', '28.5'),
  ('5', '2015-05-08 05:06:12', '15', '38', '26'),
  ('5', '2015-06-08 06:11:35', '15.6', '38', '26.2'),
  ('5', '2015-07-08 05:07:43', '17', '37', '26.9'),
  ('5', '2015-08-08 07:01:55', '16.1', '38', '27.4'),
  ('6', '2016-08-19 04:01:14', '19', '42.3', '25'),
  ('6', '2015-10-19 03:02:12', '18.6', '9', '26');

INSERT INTO `elemento` VALUES
  ('calcio', '16'),
  ('magnesio', '20.8'),
  ('ferro', '25'),
  ('potassio', '11'),
  ('azoto', '12'),
  ('fosforo', '13.7'),
  ('zolfo', '9'),
  ('boro', '19'),
  ('manganese', '7'),
  ('rame', '23'),
  ('zinco', '8'),
  ('molibdeno', '10.5'),
  ('cloro', '15'),
  ('nichel', '11.3');

INSERT INTO `elementistatosalute` VALUES
  ('1', '2014-04-20 09:30:15', 'calcio', '16.2'),
  ('1', '2014-05-20 11:09:47', 'azoto', '13.6'),
  ('1', '2014-05-20 11:09:47', 'boro', '41.0'),
  ('3', '2015-10-14 17:13:02', 'zinco', '21.5'),
  ('3', '2015-10-14 17:13:02', 'ferro', '9.3'),
  ('5', '2015-05-08 05:06:12', 'potassio', '11.5'),
  ('5', '2015-05-08 05:06:12', 'manganese', '4.6'),
  ('5', '2015-06-08 06:11:35', 'nichel', '24.9'),
  ('5', '2015-07-08 05:07:43', 'azoto', '15.4'),
  ('6', '2016-08-19 04:01:14', 'zolfo', '7.5'),
  ('6', '2016-08-19 04:01:14', 'molibdeno', '5.1'),
  ('6', '2015-10-19 03:02:12', 'cloro', '15.2');

-- it.wikipedia.org/wiki/Reazione_del_terreno#Classificazione_dei_terreni
-- PH: acido [3.5, 6.9] | alcalino [7.0, 9.0]
-- Permeabilita: [0.0001, 10^8]
INSERT INTO `terreno` VALUES
  ('1', '6.2', 'sciolto', '204.482'),
  ('2', '3.9', 'argilloso', '204.482'),
  ('3', '4.2', 'sabbioso', '204.482'),
  ('4', '6.0', 'laterico', '204.482'),
  ('5', '6.8', 'compatto', '204.482'),
  ('6', '3.7', 'argilloso', '204.482'),
  ('7', '4.2', 'compatto', '204.482'),
  ('8', '5.3', 'sciolto', '204.482'),
  ('9', '4.7', 'ibrido', '204.482'),
  ('10', '5.9', 'laterico', '204.482');

INSERT INTO `componente` VALUES 
  ('sabbia'), ('torba'), ('ghiaia'), ('argilla'), ('limo');

INSERT INTO `componentiterreno` VALUES
  ('1', 'sabbia', '39'), ('1', 'torba', '8'), ('1', 'argilla', '41'),
  ('2', 'limo', '41'), ('2', 'torba', '13'), ('2', 'sabbia', '11'),
  ('3', 'ghiaia', '12'), ('3', 'argilla', '74.9'),
  ('4', 'sabbia', '75'), ('4', 'limo', '19'), ('4', 'torba', '5'),
  ('5', 'limo', '12.2'), ('5', 'ghiaia', '48.5'), ('5', 'sabbia', '18'),
  ('6', 'torba', '24'), ('6', 'sabbia', '14'), ('6', 'argilla', '24'),
  ('7', 'sabbia', '42'), ('7', 'torba', '45'),
  ('8', 'argilla', '49'), ('8', 'limo', '17'), ('8', 'sabbia', '18.5'),
  ('9', 'ghiaia', '71'), ('9', 'torba', '14'),
  ('10', 'argilla', '23.5'), ('10', 'ghiaia', '48'), ('10', 'sabbia', '24');

INSERT INTO `elementiterreno` (	`CodTerreno`, 
								`NomeElemento`, 
								`Concentrazione`) VALUES
  ('1', 'calcio', '14.2'), ('1', 'rame', '18'), ('1', 'ferro', '62'),
  ('2', 'zinco', '82'), ('2', 'cloro', '12.4'),
  ('3', 'nichel', '46.1'), ('3', 'fosforo', '41'), ('3', 'azoto', '3.9'),
  ('4', 'ferro', '41.6'), ('4', 'boro', '16.5'), ('4', 'azoto', '37'),
  ('5', 'molibdeno', '18'), ('5', 'cloro', '42'), ('5', 'boro', '7.8'),
  ('6', 'boro', '71'), ('6', 'azoto', '4.1'),
  ('7', 'zolfo', '47'), ('7', 'cloro', '13'), ('7', 'fosforo', '31.4'),
  ('8', 'cloro', '70'), ('8', 'potassio', '12.5'), ('8', 'boro', '6.3'),
  ('9', 'zinco', '19.7'), ('9', 'azoto', '76.1'),
  ('10', 'magnesio', '56'), ('10', 'molibdeno', '14.3'), 
    ('10', 'cloro', '4');

INSERT INTO `elementinecessarispecie` VALUES
  ('Mays', 'calcio', '13.4'), ('Mays', 'azoto', '41.2'), 
  ('Mays', 'fosforo', '36.2'), ('Mays', 'cloro', '7.8'), 
  ('Aestivum', 'ferro', '7.9'), ('Aestivum', 'zolfo', '28.4'), 
  ('Aestivum', 'rame', '15.6'), 
  ('Minor', 'magnesio', '9.4'), ('Minor', 'azoto', '18.6'), 
  ('Perennis', 'potassio', '47.1'), ('Perennis', 'fosforo', '11.9'),
  ('Perennis', 'zolfo', '19.5'), ('Perennis', 'molibdeno', '3.5'), 
  ('Officinalis', 'azoto', '29.4'), ('Officinalis', 'zinco', '2.9'), 
  ('Alba', 'zinco', '52.3'),
  ('Avium', 'molibdeno', '16.8'), ('Avium', 'zolfo', '31.2'),
  ('Moraceae', 'ferro', '34.2'), ('Moraceae', 'rame', '12.2'), 
  ('Moraceae', 'cloro', '10.2'), 
  ('Tiliaceae', 'fosforo', '15.3'), ('Tiliaceae', 'nichel', '9.0'),
  ('Rosaceae', 'calcio', '18.5'), ('Rosaceae', 'boro', '51.2'),
  ('Rosaceae', 'manganese', '5.6');

INSERT INTO `pianta` (	`CodPianta`,
						`NomeSpecie`,
						`DimAttuale`,
                        `Prezzo`,
                        `CodTerreno`, 
                        `CodContenitore`, 
                        `CodOrdine`) VALUES
  ('1', 'Mays', '28', '15', '4', NULL, '10'),
  ('2', 'Mays', '23', '20', '4', '8', NULL),
  ('3', 'Aestivum', '12', '48', '2', '9', '6'),
  ('4', 'Minor', '10', '10', '1', NULL, '3'),
  ('5', 'Perennis', '70', '60', '6', '6', NULL),
  ('6', 'Officinalis', '40', '30', '2', NULL, '9'),
  ('7', 'Avium', '47', '20', '8', '1', NULL),
  ('8', 'Moraceae', '15', '30', '7', '5', '1'),
  ('9', 'Tiliaceae', '19', '13', '10', '11', NULL),
  ('10', 'Rosaceae', '5', '8', '9', '7', '2'),
  ('11', 'Alba', '41', '40', '5', '12', '8'),
  ('12', 'Perennis', '34', '38', '3', '3', '5'),
  ('13', 'Minor', '29', '20', '2', NULL, '7'),
  ('14', 'Moraceae', '18', '15', '10', NULL, '4');

INSERT INTO `manutenzione` (`CodManutenzione`,
							`CodPianta`,
							`TipoManutenzione`, /* potatura, rinvaso, 
												concimazione, trattamento */
							`TipoCreazione`, /* su richiesta, 
											    programmata, automatica */
							`Costo`, -- euro
						-- it.wikipedia.org/wiki/Potatura#Metodi_di_potatura
							`TipoPotatura`, 
							`TipoSomm`, -- disciolto, nebulizzato
							`DataInizio`,
							`NumIntervAnnuali`,
							`Scadenza`) VALUES
  ('1', '1', 'potatura', 'su richiesta', '25', 'capitozzatura', NULL, 
	'2013-05-02', '3', '2020-04-05'),
  ('2', '2', 'rinvaso', 'su richiesta', '5', NULL, NULL, 
	'2013-10-05', '1', '2013-10-05'),
  ('3', NULL, 'concimazione', 'programmata', '7', NULL, 'disciolto', 
	'2014-01-14', '12', '2018-01-14'),
  ('4', '4', 'trattamento', 'su richiesta', '19', NULL, 'nebulizzato', 
	'2012-07-20', '5', '2012-11-20'),
  ('5', '5', 'potatura', 'programmata', '30', 'sfogliatura', NULL, 
	'2015-10-10', '3', '2017-10-10'),
  ('6', '6', 'rinvaso', 'su richiesta', '17', NULL, NULL, 
	'2014-05-05', '1', '2014-05-05'),
  ('7', '8', 'potatura', 'su richiesta', '36', 'piegatura', NULL, 
	'2014-07-12', '3', '2014-9-12'),
  ('8', '10', 'trattamento', 'programmata', '45', NULL, 'nebulizzato',
	'2016-12-25', '12', '2018-12-25'),
  ('9', NULL, 'concimazione', 'programmata', '16', NULL, 'disciolto', 
	'2017-01-01', '6', '2017-12-31'),
  ('10', '13', 'rinvaso', 'su richiesta', '8', NULL, NULL,
	'2015-10-09', '1', '2015-10-09');

INSERT INTO `prodotto` VALUES
  ('Muflix', 'MedProducts', '0', 'disciolto'),
  ('Frenox', 'GreenFix', '2', 'nebulizzato'),
  ('Muginex', 'MedProducts', '0', 'disciolto'),
  ('Trenofis', 'Plants Boss', '0', 'disciolto'),
  ('Axerol', 'GreenFix', '5', 'nebulizzato'),
  ('Picrifon', 'MedProducts', '0', 'disciolto'),
  ('Sorivan', 'GreenFix', '15', 'nebulizzato'),
  ('Cifitox', 'MedProducts', '1', 'disciolto'),
  ('Polinaf', 'Plants Boss', '3', 'nebulizzato'),
  ('Sfrex', 'MedProducts', '0', 'nebulizzato');

INSERT INTO `prodottitrattamento` (	`CodManutenzione`, 
									`NomeProdotto`, 
									`Dose`) VALUES
  ('4', 'Muflix', '15'),
  ('4', 'Frenox', '21'),
  ('4', 'Muginex', '2'),
  ('4', 'Trenofis', '4'),
  ('4', 'Axerol', '1'),
  ('8', 'Picrifon', '41'),
  ('8', 'Sorivan', '12'),
  ('8', 'Cifitox', '11'),
  ('8', 'Polinaf', '8'),
  ('8', 'Sfrex', '2');

INSERT INTO `periodimanutenzione` VALUES
  ('1', '2000-02-01', '2000-06-01'),
  ('4', '2000-01-01', '2000-03-01'),
  ('4', '2000-04-01', '2000-06-01'),
  ('4', '2000-07-01', '2000-12-01'),
  ('5', '2000-02-01', '2000-03-01'),
  ('5', '2000-07-01', '2000-09-01'),
  ('5', '2000-10-01', '2000-11-01'),
  ('7', '2000-06-01', '2000-12-01'),
  ('8', '2000-10-01', '2001-05-01'),
  ('9', '2000-12-01', '2000-03-01'),
  ('9', '2000-08-01', '2000-09-01');

INSERT INTO `somministrazioneconcimazione` (	`CodManutenzione`, 
												`NomeElemento`, 
												`Iterazione`, 
												`Quantita`) VALUES
  ('3', 'fosforo', '1', '24.3'),
  ('3', 'fosforo', '2', '20.3'),
  ('3', 'fosforo', '3', '16.3'),
  ('3', 'manganese', '1', '5.0'),
  ('3', 'manganese', '2', '10.0'),
  ('9', 'cloro', '1', '13.2'),
  ('9', 'cloro', '2', '15.2'),
  ('9', 'ferro', '1', '5.4'),
  ('9', 'ferro', '2', '6.3'),
  ('9', 'ferro', '3', '7.2');

INSERT INTO `esigenzaconcimazionepianta` VALUES
  ('1', '3'), ('2', '3'), ('4', '3'), ('7', '3'), ('9', '3'), 
  ('2', '9'), ('3', '9'), ('4', '9'), ('5', '9'), ('10', '9');

INSERT INTO `vaso` (`CodVaso`, 
					`Materiale`, 
					`DimensioneX`, 
					`DimensioneY`) VALUES
  ('1', 'cotto', '20', '20'), --
  ('2', 'ceramica', '30', '30'),
  ('3', 'terracotta', '45', '25'),
  ('4', 'cemento', '70', '70'), --
  ('5', 'cotto', '25', '30'),
  ('6', 'pietra', '35', '35'), --
  ('7', 'ceramia', '40', '20'),
  ('8', 'plastica', '80', '70'), --
  ('9', 'terracotta', '40', '25'),
  ('10', 'pietra', '15', '15'); --

INSERT INTO `scheda` (	`CodScheda`, 
						`CodPianta`, 
						`CodVaso`, 
						`Utente`, 
						`DataAcquisto`, 
						`Settore`, 
						`Collocazione`, 
						`PosX`, 
						`PosY`) VALUES
  ('1', '1', '6', 'jack86', '2016-06-05', '1', 'vaso', '3', '4'),
  ('2', '3', NULL, 'Paul311', '2016-07-12', '2', 'pienat erra', '1', '9'),
  ('3', '4', '1', 'RobJDK', '2016-02-13', '3', 'vaso', '3', '8'),
  ('4', '6', '10', 'Eric', '2016-10-09', '4', 'vaso', '4', '3'),
  ('5', '8', NULL, 'Eric', '2016-04-30', '5', 'piena terra', '8', '5'),
  ('6', '10', NULL, 'Eric', '2016-12-23', '6', 'piena terra', '1', '5'),
  ('7', '11', '8', 'Eric', '2016-08-04', '7', 'vaso', '6', '2'),
  ('8', '12', '4', 'MickeyMouse12', '2016-09-10', '8', 'vaso', '5', '3'),
  ('9', '13', NULL, 'RoseLover', '2016-11-18', '9', 
	'piena terra', '7', '6'),
  ('10', '14', NULL, 'Eric', '2016-01-28', '10', 'piena terra', '4', '5');

INSERT INTO `arredamento` (`CodSpazio`, `Versione`) VALUES
  ('1', '1'), ('1', '2'),
  ('2', '1'), 
  ('3', '1'), ('3', '2'),
  ('4', '1'),
  ('5', '1'),
  ('6', '1'),
  ('7', '1'), ('7', '2'), ('7', '3'),
  ('8', '1'),
  ('9', '1'), ('9', '2'),
  ('10', '1');

INSERT INTO `vasiarredamento` (	`CodVaso`, 
								`CodSpazio`, 
								`Versione`, 
								`CodPianta`, 
								`PosX`, 
								`PosY`) VALUES
  ('4', '6', '1', '12', '1', '9'),
  ('1', '10', '1', '4', '4', '3'),
  ('8', '9', '1', '11', '7', '5'),
  ('8', '9', '2', '11', '8', '5'),
  ('6', '3', '1', '1', '2', '2'),
  ('6', '3', '2', '1', '5', '3'),
  ('10', '1', '1', '6', '6', '4'),
  ('10', '1', '2', '6', '4', '5');

INSERT INTO `piantearredamentoinpienaterra` (	`CodPianta`, 
												`CodSpazio`, 
												`Versione`, 
												`PosX`, 
												`PosY`) VALUES
  ('14', '9', '1', '3', '2'),
  ('14', '9', '2', '3', '4'),
  ('10', '5', '1', '3', '8'),
  ('13', '4', '1', '1', '5'),
  ('3', '6', '1', '6', '2'),
  ('8', '1', '1', '6', '4'),
  ('8', '1', '2', '4', '5');

INSERT INTO `periodispecie` (	`NomeSpecie`, 
								`DataInizio`, 
								`DataFine`, 
								`Tipo`) VALUES
  ('Mays', '2000-10-01', '2001-02-01', 'riposo'),
  ('Mays', '2001-02-01', '2001-08-01', 'fruttificazione'),
  ('Mays', '2001-08-01', '2001-10-01', 'fioritura'),
  ('Aestivum', '2000-01-01', '2000-06-01', 'fioritura'),
  ('Aestivum', '2000-06-01', '2001-01-01', 'riposo'),
  ('Minor', '2000-04-01', '2000-12-01', 'fruttificazione'),
  ('Minor', '2000-12-01', '2001-04-01', 'riposo'),
  ('Perennis', '2000-07-01', '2000-11-01', 'fioritura'),
  ('Perennis', '2000-11-01', '2001-07-01', 'riposo'),
  ('Officinalis', '2000-04-01', '2000-08-01', 'fruttificazione'),
  ('Officinalis', '2000-08-01', '2001-04-01', 'riposo'),
  ('Alba', '2000-09-01', '2001-03-01', 'riposo'),
  ('Alba', '2001-03-01', '2001-09-01', 'fioritura'),
  ('Avium', '2000-10-01', '2001-02-01', 'riposo'),
  ('Avium', '2001-02-01', '2001-10-01', 'fruttificazione'),
  ('Moraceae', '2000-08-01', '2000-09-01', 'fruttificazione'),
  ('Moraceae', '2000-09-01', '2001-08-01', 'riposo'),
  ('Tiliaceae', '2000-05-01', '2000-08-01', 'fruttificazione'),
  ('Tiliaceae', '2000-08-01', '2001-05-01', 'riposo'),
  ('Rosaceae', '2000-04-01', '2000-10-01', 'fioritura'),
  ('Rosaceae', '2000-10-01', '2001-04-01', 'riposo');

INSERT INTO `periodiprodotti` VALUES
  ('Muflix', '2000-02-01', '2000-12-01'),
  ('Frenox', '2000-01-01', '2000-11-01'),
  ('Muginex', '2000-02-01', '2000-05-01'),
  ('Muginex', '2000-06-01', '2000-11-01'),
  ('Trenofis', '2000-01-01', '2000-10-01'),
  ('Axerol', '2000-05-01', '2001-04-01'),
  ('Sorivan', '2000-03-01', '2000-11-01'),
  ('Polinaf', '2000-10-01', '2001-09-01'),
  ('Sfrex', '2000-07-01', '2001-01-01'),
  ('Sfrex', '2000-02-01', '2000-06-01');

INSERT INTO `agentepatogeno` VALUES	
  ('Metcalfa', 'insetto'),	
  ('Psilla', 'insetto'),
  ('Cicalina', 'insetto'),
  ('Dorifora', 'insetto'),
  ('Acarus', 'acaro'),
  ('Crittogamis', 'crittogame'),
  ('Fongomus', 'fungo'),
  ('Brucialis', 'virus'),
  ('Destroplantus', 'virus'),
  ('Platterium', 'batterio');

INSERT INTO `prodottocombatte` (	`NomeProdotto`, 
									`NomeAgentePatogeno`, 
									`Dosaggio`) VALUES
  ('Muflix', 'Metcalfa', '15.4'),
  ('Frenox', 'Psilla', '9.2'),
  ('Muginex', 'Cicalina', '19.2'),
  ('Trenofis', 'Dorifora', '17.0'),
  ('Axerol', 'Acarus', '9.1'),
  ('Picrifon', 'Crittogamis', '24.3'),
  ('Sorivan', 'Fongomus', '17.5'),
  ('Cifitox', 'Brucialis', '11.1'),
  ('Polinaf', 'Destroplantus', '25.7'),
  ('Sfrex', 'Platterium', '16.0');

INSERT INTO `patologia` VALUES
  ('1', '2000-01-01', '2000-12-31', '21.3', '3.5'),
  ('2', '2000-02-01', '2000-12-31', '4.6', '8.2'),
  ('3', '2000-01-01', '2000-11-30', '19.2', '2.4'),
  ('4', '2000-02-01', '2000-12-31', '11.2', '1.3'),
  ('5', '2000-01-01', '2000-11-30', '4.1', '6.9'),
  ('6', '2000-02-01', '2000-12-31', '9.4', '4.0'),
  ('7', '2000-01-01', '2000-12-31', '15.1', '3.1'),
  ('8', '2000-02-01', '2000-12-31', '12.7', '2.4'),
  ('9', '2000-01-01', '2000-12-31', '45.3', '0.8'),
  ('10', '2000-04-01', '2000-12-31', '19.2', '2.4');

INSERT INTO `agentipatogenipatologia` VALUES
  ('1', 'Metcalfa'),
  ('1', 'Psilla'),
  ('2', 'Cicalina'),
  ('3', 'Dorifora'),
  ('4', 'Acarus'),
  ('5', 'Crittogamis'),
  ('6', 'Fongomus'),
  ('6', 'Brucialis'),
  ('7', 'Fongomus'),
  ('8', 'Destroplantus'),
  ('9', 'Platterium'),
  ('9', 'Psilla'),
  ('9', 'Cicalina'),
  ('10', 'Acarus');

INSERT INTO `principioattivo` VALUES
  ('acido acetilsalicilico'),
  ('alcaloide'),
  ('morfina'),
  ('nicotina'),
  ('terpene'),
  ('carotene'),
  ('glicoside'),
  ('digossina'),
  ('atracurio'),
  ('aloe');
  
INSERT INTO `principiattiviprodotto` VALUES
  ('Muflix', 'acido acetilsalicilico', '15.2'),
  ('Muflix', 'alcaloide', '9.2'),
  ('Frenox', 'morfina', '16.3'),
  ('Muginex', 'nicotina', '11.9'),
  ('Trenofis', 'terpene', '25.0'),
  ('Trenofis', 'carotene', '7.3'),
  ('Axerol', 'glicoside', '17.2'),
  ('Picrifon', 'digossina', '28.4'),
  ('Sorivan', 'atracurio', '12.3'),
  ('Sorivan', 'aloe', '4.5'),
  ('Cifitox', 'nicotina', '19.2'),
  ('Polinaf', 'morfina', '12.1'),
  ('Polinaf', 'glicoside', '10.2'),
  ('Sfrex', 'acido acetilsalicilico', '41.2'),
  ('Sfrex', 'alcaloide', '11.4'),
  ('Sfrex', 'atracurio', '2.4');

INSERT INTO `prodottipatologia` VALUES
  ('1', 'Muflix'),
  ('2', 'Frenox'),
  ('3', 'Muginex'),
  ('4', 'Trenofis'),
  ('5', 'Axerol'),
  ('6', 'Picrifon'),
  ('7', 'Sorivan'),
  ('8', 'Cifitox'),
  ('9', 'Polinaf'),
  ('10', 'Sfrex');

INSERT INTO `sintomo` VALUES
  ('1', 'Caduta delle foglie.'),
  ('2', 'Perdita di colore delle foglie.'),
  ('3', 'Lacerazione tronco.'),
  ('4', 'Lacerazione foglie.'),
  ('5', 'Marciume.'),
  ('6', 'Appassimento.'),
  ('7', 'Ingiallimento delle foglie.'),
  ('8', 'Presenza di sali bianchi sul terriccio.'),
  ('9', 'Danni alle radici.'),
  ('10', 'Copertura della foglia di un reticolato di strisce scure.');

INSERT INTO `sintomipatologia` (`CodPatologia`, `CodSintomo`) VALUES
  ('1', '1'),
  ('1', '5'),
  ('2', '8'),
  ('2', '9'),
  ('3', '3'),
  ('4', '4'),
  ('5', '5'),
  ('5', '8'),
  ('6', '5'),
  ('6', '6'),
  ('7', '7'),
  ('8', '5'),
  ('8', '8'),
  ('9', '9'),
  ('10', '10');

INSERT INTO `immagine` VALUES
  ('./sintomi/img1.png'),
  ('./sintomi/img2.png'),
  ('./sintomi/img3.png'),
  ('./sintomi/img4.png'),
  ('./sintomi/img5.png'),
  ('./sintomi/img6.png'),
  ('./sintomi/img7.png'),
  ('./sintomi/img8.png'),
  ('./sintomi/img9.png'),
  ('./sintomi/img10.png');

INSERT INTO `immaginisintomi` (`CodSintomo`, `URL`) VALUES
  ('1', './sintomi/img1.png'),
  ('2', './sintomi/img2.png'),
  ('3', './sintomi/img3.png'),
  ('4', './sintomi/img4.png'),
  ('5', './sintomi/img5.png'),
  ('6', './sintomi/img6.png'),
  ('7', './sintomi/img7.png'),
  ('8', './sintomi/img8.png'),
  ('9', './sintomi/img9.png'),
  ('10', './sintomi/img10.png');

INSERT INTO `reportdiagnostica` (`CodPianta`, `Timestamp`) VALUES
  ('1', '2016-01-14 11:40:15'),
  ('2', '2014-10-16 06:43:18'),
  ('4', '2016-02-03 19:15:46'),
  ('5', '2014-07-19 15:06:26'),
  ('6', '2016-11-29 05:45:00'),
  ('8', '2016-05-05 11:12:41'),
  ('9', '2015-11-08 13:59:56'),
  ('11', '2015-10-12 21:48:37'),
  ('11', '2016-02-23 08:36:57'),
  ('13', '2014-11-27 22:14:32');

INSERT INTO `patologiereport` (	`CodPianta`, 
								`Timestamp`, 
								`CodPatologia`) VALUES
  ('1', '2016-01-14 11:40:15', '1'),
  ('1', '2016-01-14 11:40:15', '4'),
  ('2', '2014-10-16 06:43:18', '2'),
  ('4', '2016-02-03 19:15:46', '3'),
  ('5', '2014-07-19 15:06:26', '4'),
  ('6', '2016-11-29 05:45:00', '5'),
  ('6', '2016-11-29 05:45:00', '9'),
  ('8', '2016-05-05 11:12:41', '3'),
  ('8', '2016-05-05 11:12:41', '6'),
  ('9', '2015-11-08 13:59:56', '7'),
  ('11', '2015-10-12 21:48:37', '2'),
  ('11', '2015-10-12 21:48:37', '8'),
  ('11', '2016-02-23 08:36:57', '9'),
  ('13', '2014-11-27 22:14:32', '10');

INSERT INTO `sintomireport` (`CodPianta`, `Timestamp`, `CodSintomo`) VALUES
  ('1', '2016-01-14 11:40:15', '3'),
  ('2', '2014-10-16 06:43:18', '4'),
  ('4', '2016-02-03 19:15:46', '7'),
  ('4', '2016-02-03 19:15:46', '9'),
  ('5', '2014-07-19 15:06:26', '1'),
  ('5', '2014-07-19 15:06:26', '10'),
  ('5', '2014-07-19 15:06:26', '9'),
  ('6', '2016-11-29 05:45:00', '2'),
  ('8', '2016-05-05 11:12:41', '2'),
  ('9', '2015-11-08 13:59:56', '4'),
  ('9', '2015-11-08 13:59:56', '6'),
  ('11', '2015-10-12 21:48:37', '5'),
  ('11', '2016-02-23 08:36:57', '7'),
  ('13', '2014-11-27 22:14:32', '4'),
  ('13', '2014-11-27 22:14:32', '8');

INSERT INTO `reportassunzioni` VALUES
  ('1', '1', '2', '0', '2000-02-01', '2000-03-01'),
  ('2', '1', '2', '0', '2000-03-01', '2000-04-01'),
  ('3', '1', '2', '0', '2000-04-01', '2000-05-01'),
  ('4', '1', '2', '0', '2000-05-01', '2000-06-01'),
  ('5', '1', '2', '0', '2000-06-01', '2000-07-01'),
  ('6', '1', '2', '1', '2000-07-01', '2001-07-01'),
  ('7', '1', '2', '0', '2000-11-01', '2001-12-01'),
  ('8', '6', '1', '0', '2001-03-01', '2001-04-01'),
  ('9', '6', '1', '0', '2001-04-01', '2001-05-01'),
  ('10', '6', '1', '0', '2001-05-01', '2001-06-01');

INSERT INTO `reportmanutenzione` VALUES
  ('potatura', '1', 'Mays', '20'),
  ('rinvaso', '1', 'Mays', '40'),
  ('potatura', '1', 'Aestivum', '45'),
  ('potatura', '2', 'Mays', '50'),
  ('trattamento', '1', 'Mays', '40'),
  ('rinvaso', '1', 'Minor', '15'),
  ('potatura', '3', 'Mays', '70'),
  ('potatura', '1', 'Officinalis', '35'),
  ('trattamento', '1', 'Rosaceae', '28'),
  ('potatura', '2', 'Officinalis', '75');

INSERT INTO `reportordini` (`CodRepOrdini`, `DaOrdinare`, `Clima`) VALUES
  ('1', '1', 'estivo'),
  ('2', '1', 'invernale'),
  ('3', '1', 'estivo'),
  ('4', '1', 'invernale'),
  ('5', '1', 'estivo'),
  ('6', '1', 'invernale'),
  ('7', '1', 'estivo'),
  ('8', '1', 'invernale'),
  ('9', '1', 'estivo'),
  ('10', '1', 'invernale');

INSERT INTO `speciereportordini` (	`CodRepOrdini`, 
									`NomeSpecie`, 
									`Quantita`) VALUES
  ('1', 'Mays', '2'), ('1', 'Aestivum', '1'),
  ('3', 'Minor', '1'),
  ('4', 'Perennis', '1'),
  ('6', 'Officinalis', '1'), ('6', 'Alba', '1'),
  ('8', 'Avium', '1'),
  ('9', 'Moraceae', '1'), ('9', 'Rosaceae', '3'),
  ('10', 'Tiliaceae', '1'), ('10', 'Moraceae', '1');