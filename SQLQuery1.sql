CREATE DATABASE firma;

CREATE SCHEMA rozliczenia;

--Tworzenie tabeli

CREATE TABLE rozliczenia.pracownicy (
	id_pracownika INT PRIMARY KEY NOT NULL, --id_pracownika INT IDENTITY(1,1) PRIMARY KEY NOT NULL
	imie NVARCHAR(50) NOT NULL,
	nazwisko NVARCHAR(50) NOT NULL,
	adres NVARCHAR(255) NOT NULL,
	telefon INT NOT NULL
);

CREATE TABLE rozliczenia.godziny (
	id_godziny INT PRIMARY KEY NOT NULL,
	data DATE NOT NULL,
	liczba_godzin INT NOT NULL,
	id_pracownika INT NOT NULL, CONSTRAINT FK_id_pracownika_godziny FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy (id_pracownika)
);

CREATE TABLE rozliczenia.pensje (
	id_pensji INT PRIMARY KEY NOT NULL,
	stanowisko NVARCHAR(50),
	kwota DECIMAL(10,2) NOT NULL,
	id_premii INT, CONSTRAINT FK_id_premii FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie (id_premii)
);

CREATE TABLE rozliczenia.premie (
	id_premii INT PRIMARY KEY NOT NULL,
	rodzaj NVARCHAR(255),
	kwota DECIMAL(10,2) NOT NULL
);

--Modyfikacje tabeli

ALTER TABLE rozliczenia.pensje ADD id_pracownika INT NOT NULL, CONSTRAINT FK_id_pracownika_pensje FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy (id_pracownika);

--Wyswietlania tabeli

SELECT * FROM rozliczenia.pracownicy
SELECT * FROM rozliczenia.godziny
SELECT * FROM rozliczenia.pensje
SELECT * FROM rozliczenia.premie

--Wprowadzanie do tabeli

INSERT INTO rozliczenia.pracownicy VALUES (1, 'Anna', 'Nowak', 'Bolechowice 32-082 ul. Zielona 105', 493202321);
INSERT INTO rozliczenia.pracownicy VALUES (2, 'Adam', 'Nowaczek', 'Bolechowice 32-082 ul. Morska 125', 862892123);
INSERT INTO rozliczenia.pracownicy VALUES (3, 'Jakub', 'Pitek', 'Wiêckowice 32-082 ul. Cicha 15', 201512034);
INSERT INTO rozliczenia.pracownicy VALUES (4, 'Marek', 'Przybylski', 'Bolechowice 32-082 ul. Zielona 245', 923123902);
INSERT INTO rozliczenia.pracownicy VALUES (5, 'Justyna', 'GwóŸdŸ', 'Bibice 30-087 ul. Czerowna 105', 482342012);
INSERT INTO rozliczenia.pracownicy VALUES (6, 'Wojciech', 'Aparat', 'Kraków 30-020 ul. Urzêdnicza', 234202321);
INSERT INTO rozliczenia.pracownicy VALUES (7, 'Micha³', 'Zbroja', 'Zabierzów 32-080 ul. Poziomkowa 105', 693234501);
INSERT INTO rozliczenia.pracownicy VALUES (8, 'Dorota', 'GwóŸdŸ', 'Rzeszów  32-082 ul. Mokra 2', 302678251);
INSERT INTO rozliczenia.pracownicy VALUES (9, 'Maciej', 'Bardoñ', 'Katowice 35-020 ul. Brzydka 195', 829412581);
INSERT INTO rozliczenia.pracownicy VALUES (10, 'Karol', 'Wiœniewski', 'Kraków 30-432 ul. Zagrodzie 7', 832953235);

INSERT INTO rozliczenia.godziny VALUES (1, '2022-04-04', 5, 1);
INSERT INTO rozliczenia.godziny VALUES (2, '2022-04-03', 10, 1);
INSERT INTO rozliczenia.godziny VALUES (3, '2022-04-01', 6, 1);
INSERT INTO rozliczenia.godziny VALUES (4, '2022-04-04', 2, 3);
INSERT INTO rozliczenia.godziny VALUES (5, '2022-04-04', 2, 5);
INSERT INTO rozliczenia.godziny VALUES (6, '2022-04-03', 6, 5);
INSERT INTO rozliczenia.godziny VALUES (7, '2022-04-02', 2, 5);
INSERT INTO rozliczenia.godziny VALUES (8, '2022-04-01', 7, 6);
INSERT INTO rozliczenia.godziny VALUES (9, '2022-04-04', 4, 7);
INSERT INTO rozliczenia.godziny VALUES (10, '2022-04-04', 1, 10);

INSERT INTO rozliczenia.premie VALUES (1, 'Rodzaj 1', 100); 
INSERT INTO rozliczenia.premie VALUES (2, 'Rodzaj 2', 200);
INSERT INTO rozliczenia.premie VALUES (3, 'Rodzaj 3', 300); 
INSERT INTO rozliczenia.premie VALUES (4, 'Rodzaj 4', 400);
INSERT INTO rozliczenia.premie VALUES (5, 'Rodzaj 5', 500); 
INSERT INTO rozliczenia.premie VALUES (6, 'Rodzaj 6', 600);
INSERT INTO rozliczenia.premie VALUES (7, 'Rodzaj 7', 700); 
INSERT INTO rozliczenia.premie VALUES (8, 'Rodzaj 8', 800);
INSERT INTO rozliczenia.premie VALUES (9, 'Rodzaj 9', 900); 
INSERT INTO rozliczenia.premie VALUES (10, 'Rodzaj 10', 1000);

INSERT INTO rozliczenia.pensje VALUES (1, 'menadzer', 9800, 5, 1);
INSERT INTO rozliczenia.pensje VALUES (2, 'kierownik wydzia³u', 7800, 2, 2);
INSERT INTO rozliczenia.pensje VALUES (3, 'kierownik wydzia³u', 7800, 3, 3);
INSERT INTO rozliczenia.pensje VALUES (4, 'kierownik wydzia³u', 7800, 1, 4);
INSERT INTO rozliczenia.pensje VALUES (5, 'pracownik', 5800, NULL, 5);
INSERT INTO rozliczenia.pensje VALUES (6, 'pracownik', 5800, 9, 6);
INSERT INTO rozliczenia.pensje VALUES (7, 'pracownik', 5800, 2, 7);
INSERT INTO rozliczenia.pensje VALUES (8, 'sta¿ysta', 3800, NULL, 8);
INSERT INTO rozliczenia.pensje VALUES (9, 'sta¿ysta', 3800, NULL, 9);
INSERT INTO rozliczenia.pensje VALUES (10, 'ochroniarz', 3300, 1, 10);

--5

SELECT nazwisko, adres FROM rozliczenia.pracownicy

--6

SET DATEFIRST 1;
SELECT DATEPART(dw, data) FROM rozliczenia.godziny
SELECT DATEPART(mm, data) FROM rozliczenia.godziny

--7

EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN'

--ALTER TABLE rozliczenia.pensje DROP COLUMN kwota_netto;

ALTER TABLE rozliczenia.pensje ADD kwota_netto AS kwota_brutto/1.23;

