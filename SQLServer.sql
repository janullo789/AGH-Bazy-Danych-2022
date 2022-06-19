--Stworzenie bazy danych

CREATE DATABASE Projekt1;

--Stworzenie schamatu

CREATE SCHEMA tg;

--Stworzenie tabeli znormalizowanych

CREATE TABLE tg.GeoEon (
	id_eon INT PRIMARY KEY NOT NULL,
	nazwa_eon NVARCHAR(50) NOT NULL
);

CREATE TABLE tg.GeoEra (
	id_era INT PRIMARY KEY NOT NULL,
	id_eon INT NOT NULL, CONSTRAINT FK_id_eon FOREIGN KEY (id_eon) REFERENCES tg.GeoEon (id_eon),
	nazwa_era NVARCHAR(50) NOT NULL
);

CREATE TABLE tg.GeoOkres (
	id_okres INT PRIMARY KEY NOT NULL,
	id_era INT NOT NULL, CONSTRAINT FK_id_era FOREIGN KEY (id_era) REFERENCES tg.GeoEra (id_era),
	nazwa_okres NVARCHAR(50) NOT NULL
);

CREATE TABLE tg.GeoEpoka (
	id_epoka INT PRIMARY KEY NOT NULL,
	id_okres INT NOT NULL, CONSTRAINT FK_id_okres FOREIGN KEY (id_okres) REFERENCES tg.GeoOkres (id_okres),
	nazwa_epoka NVARCHAR(50) NOT NULL
);

CREATE TABLE tg.GeoPietro (
	id_pietro INT PRIMARY KEY NOT NULL,
	id_epoka INT NOT NULL, CONSTRAINT FK_id_epoka FOREIGN KEY (id_epoka) REFERENCES tg.GeoEpoka (id_epoka),
	nazwa_pietro NVARCHAR(50) NOT NULL
);

--Uzupelnienie tabeli znormalizowanych

INSERT INTO tg.GeoEon VALUES(1, 'Fanerozoik');

SELECT * FROM tg.GeoEon;

INSERT INTO tg.GeoEra VALUES(1, 1, 'Kenozoik');
INSERT INTO tg.GeoEra VALUES(2, 1, 'Mezozoik');
INSERT INTO tg.GeoEra VALUES(3, 1, 'Paleozoik');

SELECT * FROM tg.GeoEra;

INSERT INTO tg.GeoOkres VALUES(1, 1, 'Czwartorzêd');
INSERT INTO tg.GeoOkres VALUES(2, 1, 'Neogen');
INSERT INTO tg.GeoOkres VALUES(3, 1, 'Paleogen');
INSERT INTO tg.GeoOkres VALUES(4, 2, 'Kreda');
INSERT INTO tg.GeoOkres VALUES(5, 2, 'Jura');
INSERT INTO tg.GeoOkres VALUES(6, 2, 'Trias');
INSERT INTO tg.GeoOkres VALUES(7, 3, 'Perm');
INSERT INTO tg.GeoOkres VALUES(8, 3, 'Karbon');
INSERT INTO tg.GeoOkres VALUES(9, 3, 'Dewon');
INSERT INTO tg.GeoOkres VALUES(10, 3, 'Sylur');
INSERT INTO tg.GeoOkres VALUES(11, 3, 'Ordowik');
INSERT INTO tg.GeoOkres VALUES(12, 3, 'Kambr');

SELECT * FROM tg.GeoOkres;

INSERT INTO tg.GeoEpoka VALUES(1, 1, 'Halocen');
INSERT INTO tg.GeoEpoka VALUES(2, 1, 'Plejstocen');
INSERT INTO tg.GeoEpoka VALUES(3, 2, 'Pliocen');
INSERT INTO tg.GeoEpoka VALUES(4, 2, 'Miocen');
INSERT INTO tg.GeoEpoka VALUES(5, 3, 'Oligocen');
INSERT INTO tg.GeoEpoka VALUES(6, 3, 'Eocen');
INSERT INTO tg.GeoEpoka VALUES(7, 3, 'Paleocen');
INSERT INTO tg.GeoEpoka VALUES(8, 4, 'PóŸna Kreda');
INSERT INTO tg.GeoEpoka VALUES(9, 4, 'Wczesna Kreda');
INSERT INTO tg.GeoEpoka VALUES(10, 5, 'Jura PóŸna');
INSERT INTO tg.GeoEpoka VALUES(11, 5, 'Jura Œrodkowa');
INSERT INTO tg.GeoEpoka VALUES(12, 5, 'Jura Wczesna');
INSERT INTO tg.GeoEpoka VALUES(13, 6, 'PóŸny Trias');
INSERT INTO tg.GeoEpoka VALUES(14, 6, 'Œrodkowy Trias');
INSERT INTO tg.GeoEpoka VALUES(15, 6, 'Wczesny Trias');
INSERT INTO tg.GeoEpoka VALUES(16, 7, 'Loping');
INSERT INTO tg.GeoEpoka VALUES(17, 7, 'Gwadalup');
INSERT INTO tg.GeoEpoka VALUES(18, 7, 'Cisural');
INSERT INTO tg.GeoEpoka VALUES(19, 8, 'Pensylwan');
INSERT INTO tg.GeoEpoka VALUES(20, 8, 'Missisip');
INSERT INTO tg.GeoEpoka VALUES(21, 9, 'PóŸny Dewon');
INSERT INTO tg.GeoEpoka VALUES(22, 9, 'Œrodkowy Dewon');
INSERT INTO tg.GeoEpoka VALUES(23, 9, 'Wczesny Dewon');
INSERT INTO tg.GeoEpoka VALUES(24, 10, 'Przydol');
INSERT INTO tg.GeoEpoka VALUES(25, 10, 'Ludlow');
INSERT INTO tg.GeoEpoka VALUES(26, 10, 'Wenlok');
INSERT INTO tg.GeoEpoka VALUES(27, 10, 'Ladower');
INSERT INTO tg.GeoEpoka VALUES(28, 11, 'Ordowik PóŸny');
INSERT INTO tg.GeoEpoka VALUES(29, 11, 'Ordowik Œrodkowy');
INSERT INTO tg.GeoEpoka VALUES(30, 11, 'Ordowik wczesny');
INSERT INTO tg.GeoEpoka VALUES(31, 12, 'Furong');
INSERT INTO tg.GeoEpoka VALUES(32, 12, 'Miaoling');
INSERT INTO tg.GeoEpoka VALUES(33, 12, 'Oddzia³ 2');
INSERT INTO tg.GeoEpoka VALUES(34, 12, 'Terenew');

SELECT * FROM tg.GeoEpoka;

INSERT INTO tg.GeoPietro VALUES(1, 1, 'Megalaj');
INSERT INTO tg.GeoPietro VALUES(2, 1, 'Northgrip');
INSERT INTO tg.GeoPietro VALUES(3, 1, 'Grenland');
INSERT INTO tg.GeoPietro VALUES(4, 2, 'PóŸny');
INSERT INTO tg.GeoPietro VALUES(5, 2, 'Chiban');
INSERT INTO tg.GeoPietro VALUES(6, 2, 'Kalabr');
INSERT INTO tg.GeoPietro VALUES(7, 2, 'Gelas');
INSERT INTO tg.GeoPietro VALUES(8, 3, 'Piacent');
INSERT INTO tg.GeoPietro VALUES(9, 3, 'Zankl');
INSERT INTO tg.GeoPietro VALUES(10, 4, 'Messyn');
INSERT INTO tg.GeoPietro VALUES(11, 4, 'Torton');
INSERT INTO tg.GeoPietro VALUES(12, 4, 'Serrawal');
INSERT INTO tg.GeoPietro VALUES(13, 4, 'Lang');
INSERT INTO tg.GeoPietro VALUES(14, 4, 'Burdyga³');
INSERT INTO tg.GeoPietro VALUES(15, 4, 'Akwitan');
INSERT INTO tg.GeoPietro VALUES(16, 5, 'Szat');
INSERT INTO tg.GeoPietro VALUES(17, 5, 'Rupel');
INSERT INTO tg.GeoPietro VALUES(18, 6, 'Priabon');
INSERT INTO tg.GeoPietro VALUES(19, 6, 'Barton');
INSERT INTO tg.GeoPietro VALUES(20, 6, 'Lutet');
INSERT INTO tg.GeoPietro VALUES(21, 6, 'Iprez');
INSERT INTO tg.GeoPietro VALUES(22, 7, 'Tanet');
INSERT INTO tg.GeoPietro VALUES(23, 7, 'Zeland');
INSERT INTO tg.GeoPietro VALUES(24, 7, 'Dan');
INSERT INTO tg.GeoPietro VALUES(25, 8, 'Mastrycht');
INSERT INTO tg.GeoPietro VALUES(26, 8, 'Kampan');
INSERT INTO tg.GeoPietro VALUES(27, 8, 'Santon');
INSERT INTO tg.GeoPietro VALUES(28, 8, 'Koniak');
INSERT INTO tg.GeoPietro VALUES(29, 8, 'Turon');
INSERT INTO tg.GeoPietro VALUES(30, 8, 'Cenoman');
INSERT INTO tg.GeoPietro VALUES(31, 9, 'Alb');
INSERT INTO tg.GeoPietro VALUES(32, 9, 'Apt');
INSERT INTO tg.GeoPietro VALUES(33, 9, 'Barrem');
INSERT INTO tg.GeoPietro VALUES(34, 9, 'Hoteryw');
INSERT INTO tg.GeoPietro VALUES(35, 9, 'Walan¿yn');
INSERT INTO tg.GeoPietro VALUES(36, 9, 'Berrias');
INSERT INTO tg.GeoPietro VALUES(37, 10, 'Tyton');
INSERT INTO tg.GeoPietro VALUES(38, 10, 'Kimeryd');
INSERT INTO tg.GeoPietro VALUES(39, 10, 'Oksford');
INSERT INTO tg.GeoPietro VALUES(40, 11, 'Kelowej');
INSERT INTO tg.GeoPietro VALUES(41, 11, 'Baton');
INSERT INTO tg.GeoPietro VALUES(42, 11, 'Bajos');
INSERT INTO tg.GeoPietro VALUES(43, 11, 'Aalen');
INSERT INTO tg.GeoPietro VALUES(44, 12, 'Toark');
INSERT INTO tg.GeoPietro VALUES(45, 12, 'Pliensbach');
INSERT INTO tg.GeoPietro VALUES(46, 12, 'Synemur');
INSERT INTO tg.GeoPietro VALUES(47, 12, 'Hettang');
INSERT INTO tg.GeoPietro VALUES(48, 13, 'Retyk');
INSERT INTO tg.GeoPietro VALUES(49, 13, 'Noryk');
INSERT INTO tg.GeoPietro VALUES(50, 13, 'Karnik');
INSERT INTO tg.GeoPietro VALUES(51, 14, 'Ladyn');
INSERT INTO tg.GeoPietro VALUES(52, 14, 'Anizyk');
INSERT INTO tg.GeoPietro VALUES(53, 15, 'Olenek');
INSERT INTO tg.GeoPietro VALUES(54, 15, 'Ind');
INSERT INTO tg.GeoPietro VALUES(55, 16, 'Czangsing');
INSERT INTO tg.GeoPietro VALUES(56, 16, 'Wucziaping');
INSERT INTO tg.GeoPietro VALUES(57, 17, 'Kapitan');
INSERT INTO tg.GeoPietro VALUES(58, 17, 'Word');
INSERT INTO tg.GeoPietro VALUES(59, 17, 'Road');
INSERT INTO tg.GeoPietro VALUES(60, 18, 'Kungur');
INSERT INTO tg.GeoPietro VALUES(61, 18, 'Artinsk');
INSERT INTO tg.GeoPietro VALUES(62, 18, 'Sakmar');
INSERT INTO tg.GeoPietro VALUES(63, 18, 'Assel');
INSERT INTO tg.GeoPietro VALUES(64, 19, 'G¿el');
INSERT INTO tg.GeoPietro VALUES(65, 19, 'Kasimow');
INSERT INTO tg.GeoPietro VALUES(66, 19, 'Moskow');
INSERT INTO tg.GeoPietro VALUES(67, 19, 'Baszkir');
INSERT INTO tg.GeoPietro VALUES(68, 20, 'Serpuchow');
INSERT INTO tg.GeoPietro VALUES(69, 20, 'Wizen');
INSERT INTO tg.GeoPietro VALUES(70, 20, 'Turnej');
INSERT INTO tg.GeoPietro VALUES(71, 21, 'Famen');
INSERT INTO tg.GeoPietro VALUES(72, 21, 'Fran');
INSERT INTO tg.GeoPietro VALUES(73, 22, '¯yewt');
INSERT INTO tg.GeoPietro VALUES(74, 22, 'Eifel');
INSERT INTO tg.GeoPietro VALUES(75, 23, 'Ems');
INSERT INTO tg.GeoPietro VALUES(76, 23, 'Prag');
INSERT INTO tg.GeoPietro VALUES(77, 23, 'Lochkow');
INSERT INTO tg.GeoPietro VALUES(78, 24, 'Przydol');
INSERT INTO tg.GeoPietro VALUES(79, 25, 'Ludford');
INSERT INTO tg.GeoPietro VALUES(80, 25, 'Gorst');
INSERT INTO tg.GeoPietro VALUES(81, 26, 'Homer');
INSERT INTO tg.GeoPietro VALUES(82, 26, 'Szejnwud');
INSERT INTO tg.GeoPietro VALUES(83, 27, 'Telicz');
INSERT INTO tg.GeoPietro VALUES(84, 27, 'Aeron');
INSERT INTO tg.GeoPietro VALUES(85, 27, 'Ruddan');
INSERT INTO tg.GeoPietro VALUES(86, 28, 'Hirnant');
INSERT INTO tg.GeoPietro VALUES(87, 28, 'Kat');
INSERT INTO tg.GeoPietro VALUES(88, 28, 'Sandb');
INSERT INTO tg.GeoPietro VALUES(89, 29, 'Darriwil');
INSERT INTO tg.GeoPietro VALUES(90, 29, 'Daping');
INSERT INTO tg.GeoPietro VALUES(91, 30, 'Flo');
INSERT INTO tg.GeoPietro VALUES(92, 30, 'Termadok');
INSERT INTO tg.GeoPietro VALUES(93, 31, 'Piêtro 10');
INSERT INTO tg.GeoPietro VALUES(94, 31, 'Dziangszan');
INSERT INTO tg.GeoPietro VALUES(95, 31, 'Paib');
INSERT INTO tg.GeoPietro VALUES(96, 32, 'Gu¿ang');
INSERT INTO tg.GeoPietro VALUES(97, 32, 'Drum');
INSERT INTO tg.GeoPietro VALUES(98, 32, 'Wuliuan');
INSERT INTO tg.GeoPietro VALUES(99, 33, 'Piêtro 4');
INSERT INTO tg.GeoPietro VALUES(100, 33, 'Piêtro 3');
INSERT INTO tg.GeoPietro VALUES(101, 34, 'Piêtro 2');
INSERT INTO tg.GeoPietro VALUES(102, 34, 'Fortun');

SELECT * FROM tg.GeoPietro;

--Stworzenie tabeli zdenormalizowanych

SELECT pie.id_pietro, pie.nazwa_pietro, ep.id_epoka, ep.nazwa_epoka, ok.id_okres, ok.nazwa_okres, er.id_era, er.nazwa_era, eo.id_eon, eo.nazwa_eon
	INTO tg.GeoTabela FROM tg.GeoPietro pie
								JOIN tg.GeoEpoka ep ON pie.id_epoka = ep.id_epoka
								JOIN tg.GeoOkres ok ON ep.id_okres = ok.id_okres
								JOIN tg.GeoEra er ON ok.id_era = er.id_era
								JOIN tg.GeoEon eo ON er.id_eon = eo.id_eon;

ALTER TABLE tg.GeoTabela ADD PRIMARY KEY (id_pietro);

SELECT * FROM tg.GeoTabela;

--Stworzenie tabeli dziesiec i milion

CREATE TABLE tg.Dziesiec (
	cyfra INT NOT NULL,
	bit INT NOT NULL   
);

INSERT INTO tg.Dziesiec VALUES (0, 00000000),
							(1, 00000001),
							(2, 00000010),
							(3, 00000011),
							(4, 00000100),
							(5, 00000101),
							(6, 00000110),
							(7, 00000111),
							(8, 00001000),
							(9, 00001001);

SELECT * FROM tg.Dziesiec;

CREATE TABLE tg.Milion (
	liczba INT NOT NULL,
	cyfra INT NOT NULL,
	bit INT NOT NULL
);

INSERT INTO tg.Milion SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra + 10000*a5.cyfra + 100000*a6.cyfra 
						AS liczba , a1.cyfra AS cyfra, a1.bit AS bit
						FROM tg.Dziesiec a1, tg.Dziesiec a2, tg.Dziesiec a3, tg.Dziesiec a4, tg.Dziesiec a5, tg.Dziesiec a6;

SELECT * FROM tg.Milion;

--Zapytanie 1

SELECT COUNT(*) FROM tg.Milion INNER JOIN tg.GeoTabela ON
(tg.Milion.liczba%102 = (tg.GeoTabela.id_pietro));--Zapytanie 2SELECT COUNT(*) FROM tg.Milion mi INNER JOIN tg.GeoPietro pie ON (mi.liczba%102 = pie.id_pietro)
								JOIN tg.GeoEpoka ep ON pie.id_epoka = ep.id_epoka
								JOIN tg.GeoOkres ok ON ep.id_okres = ok.id_okres
								JOIN tg.GeoEra er ON ok.id_era = er.id_era
								JOIN tg.GeoEon eo ON er.id_eon = eo.id_eon;--Zapytania 3SELECT COUNT(*) FROM tg.Milion WHERE tg.Milion.liczba%102=
(SELECT id_pietro FROM tg.GeoTabela WHERE tg.Milion.liczba%102=(id_pietro));--Zapytanie 4SELECT COUNT(*) FROM tg.Milion mi WHERE mi.liczba%102 IN
(SELECT pie.id_pietro FROM tg.GeoPietro pie 
								JOIN tg.GeoEpoka ep ON pie.id_epoka = ep.id_epoka
								JOIN tg.GeoOkres ok ON ep.id_okres = ok.id_okres
								JOIN tg.GeoEra er ON ok.id_era = er.id_era
								JOIN tg.GeoEon eo ON er.id_eon = eo.id_eon);--Dodanie indeksówCREATE INDEX idx_geoera ON tg.GeoEra (id_eon);
CREATE INDEX idx_geookres ON tg.GeoOkres (id_era);
CREATE INDEX idx_geoepoka ON tg.GeoEpoka (id_okres);
CREATE INDEX idx_geopietro ON tg.GeoPietro (id_epoka);

