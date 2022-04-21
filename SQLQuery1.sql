--1
CREATE DATABASE firma;

--2
CREATE SCHEMA ksiegowosc;

--4

CREATE TABLE ksiegowosc.pracownicy (
	id_pracownika INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	imie NVARCHAR(50) NOT NULL,
	nazwisko NVARCHAR(50) NOT NULL,
	adres NVARCHAR(255) NOT NULL,
	telefon INT NOT NULL
);

EXEC sp_addextendedproperty  
     @name = N'Komentarz' 
    ,@value = N'Tabela zawiarajaca innfomracje o pracownikach' 
    ,@level0type = N'SCHEMA', @level0name = 'ksiegowosc' 
    ,@level1type = N'TABLE',  @level1name = 'pracownicy' 
GO	

CREATE TABLE ksiegowosc.godziny (
	id_godziny INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	data_godziny DATE NOT NULL,
	liczba_godzin INT NOT NULL,
	id_pracownika INT NOT NULL, CONSTRAINT FK_id_pracownika_godziny FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy (id_pracownika)
);

EXEC sp_addextendedproperty  
     @name = N'Komentarz' 
    ,@value = N'Tabela zawiarajaca informacje o godzinach' 
    ,@level0type = N'SCHEMA', @level0name = 'ksiegowosc' 
    ,@level1type = N'TABLE',  @level1name = 'godziny' 
GO	

CREATE TABLE ksiegowosc.pensje (
	id_pensji INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	stanowisko NVARCHAR(50),
	kwota DECIMAL(10,2) NOT NULL,
);

EXEC sp_addextendedproperty  
     @name = N'Komentarz' 
    ,@value = N'Tabela zawiarajaca informacje o pensjach'
    ,@level0type = N'SCHEMA', @level0name = 'ksiegowosc' 
    ,@level1type = N'TABLE',  @level1name = 'pensje' 
GO	

CREATE TABLE ksiegowosc.premie (
	id_premii INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	rodzaj NVARCHAR(255),
	kwota DECIMAL(10,2) NOT NULL
);

EXEC sp_addextendedproperty  
     @name = N'Komentarz' 
    ,@value = N'Tabela zawiarajaca informacje o premiach' 
    ,@level0type = N'SCHEMA', @level0name = 'ksiegowosc' 
    ,@level1type = N'TABLE',  @level1name = 'premie' 
GO	

CREATE TABLE ksiegowosc.wynagrodzenia (
	id_wynagrodzenia INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	data_wynagrodzenia DATE NOT NULL,
	id_pracownika INT NOT NULL, CONSTRAINT FK_id_pracownika_wynagrodzenia FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy (id_pracownika),
	id_godziny INT NOT NULL, CONSTRAINT FK_id_godziny_wynagrodzenia FOREIGN KEY (id_godziny) REFERENCES  ksiegowosc.godziny (id_godziny),
	id_pensji INT NOT NULL, CONSTRAINT FK_id_pensji_wynagrodzenia FOREIGN KEY (id_pensji) REFERENCES  ksiegowosc.pensje (id_pensji),
	id_premii INT, CONSTRAINT FK_id_premie_wynagrodzenia FOREIGN KEY (id_premii) REFERENCES  ksiegowosc.premie (id_premii)
);

EXEC sp_addextendedproperty  
     @name = N'Komentarz' 
    ,@value = N'Tabela zbiorcza dotyczaca wynagrodzen, zawiera odwolania do indentyfikatorow z poszczegolnych tabel' 
    ,@level0type = N'SCHEMA', @level0name = 'ksiegowosc' 
    ,@level1type = N'TABLE',  @level1name = 'wynagrodzenia' 
GO	

--5

INSERT INTO ksiegowosc.pracownicy VALUES ('Anna', 'Nowak', 'Bolechowice 32-082 ul. Zielona 105', 493202321);
INSERT INTO ksiegowosc.pracownicy VALUES ('Adam', 'Nowaczek', 'Bolechowice 32-082 ul. Morska 125', 862892123);
INSERT INTO ksiegowosc.pracownicy VALUES ('Jakub', 'Pitek', 'Wiêckowice 32-082 ul. Cicha 15', 201512034);
INSERT INTO ksiegowosc.pracownicy VALUES ('Marek', 'Przybylski', 'Bolechowice 32-082 ul. Zielona 245', 923123902);
INSERT INTO ksiegowosc.pracownicy VALUES ('Justyna', 'GwóŸdŸ', 'Bibice 30-087 ul. Czerowna 105', 482342012);
INSERT INTO ksiegowosc.pracownicy VALUES ('Wojciech', 'Aparat', 'Kraków 30-020 ul. Urzêdnicza', 234202321);
INSERT INTO ksiegowosc.pracownicy VALUES ('Micha³', 'Zbroja', 'Zabierzów 32-080 ul. Poziomkowa 105', 693234501);
INSERT INTO ksiegowosc.pracownicy VALUES ('Dorota', 'GwóŸdŸ', 'Rzeszów  32-082 ul. Mokra 2', 302678251);
INSERT INTO ksiegowosc.pracownicy VALUES ('Maciej', 'Bardoñ', 'Katowice 35-020 ul. Brzydka 195', 829412581);
INSERT INTO ksiegowosc.pracownicy VALUES ('Karol', 'Wiœniewski', 'Kraków 30-432 ul. Zagrodzie 7', 832953235);

SELECT * FROM ksiegowosc.pracownicy

INSERT INTO ksiegowosc.godziny VALUES ('2022-04-04', 5, 1);
INSERT INTO ksiegowosc.godziny VALUES ('2022-04-03', 10, 1);
INSERT INTO ksiegowosc.godziny VALUES ('2022-04-01', 6, 1);
INSERT INTO ksiegowosc.godziny VALUES ('2022-04-04', 2, 3);
INSERT INTO ksiegowosc.godziny VALUES ('2022-04-04', 2, 5);
INSERT INTO ksiegowosc.godziny VALUES ('2022-04-04', 8, 5);
INSERT INTO ksiegowosc.godziny VALUES ('2022-04-03', 6, 5);
INSERT INTO ksiegowosc.godziny VALUES ('2022-04-02', 2, 5);
INSERT INTO ksiegowosc.godziny VALUES ('2022-04-01', 7, 6);
INSERT INTO ksiegowosc.godziny VALUES ('2022-04-02', 7, 6);
INSERT INTO ksiegowosc.godziny VALUES ('2022-04-04', 4, 7);
INSERT INTO ksiegowosc.godziny VALUES ('2022-04-04', 1, 10);
INSERT INTO ksiegowosc.godziny VALUES ('2022-03-04', 12, 5);

SELECT * FROM ksiegowosc.godziny

INSERT INTO ksiegowosc.pensje VALUES ('menadzer', 9800);
INSERT INTO ksiegowosc.pensje VALUES ('kierownik wydzia³u glowny', 7800);
INSERT INTO ksiegowosc.pensje VALUES ('kierownik wydzia³u zastepca', 7000);
INSERT INTO ksiegowosc.pensje VALUES ('kierownik wydzia³u pomocnik', 6500);
INSERT INTO ksiegowosc.pensje VALUES ('programista', 5800);
INSERT INTO ksiegowosc.pensje VALUES ('grafik', 5800);
INSERT INTO ksiegowosc.pensje VALUES ('handlowiec', 4800);
INSERT INTO ksiegowosc.pensje VALUES ('sta¿ysta', 3800);
INSERT INTO ksiegowosc.pensje VALUES ('sta¿ysta poczatkujacy', 3300);
INSERT INTO ksiegowosc.pensje VALUES ('ochroniarz', 3300);

SELECT * FROM ksiegowosc.pensje

INSERT INTO ksiegowosc.premie VALUES ('Rodzaj 1', 100); 
INSERT INTO ksiegowosc.premie VALUES ('Rodzaj 2', 200);
INSERT INTO ksiegowosc.premie VALUES ('Rodzaj 3', 300); 
INSERT INTO ksiegowosc.premie VALUES ('Rodzaj 4', 400);
INSERT INTO ksiegowosc.premie VALUES ('Rodzaj 5', 500); 
INSERT INTO ksiegowosc.premie VALUES ('Rodzaj 6', 600);
INSERT INTO ksiegowosc.premie VALUES ('Rodzaj 7', 700); 
INSERT INTO ksiegowosc.premie VALUES ('Rodzaj 8', 800);
INSERT INTO ksiegowosc.premie VALUES ('Rodzaj 9', 900); 
INSERT INTO ksiegowosc.premie VALUES ('Rodzaj 10', 1000);

SELECT * FROM ksiegowosc.premie

INSERT INTO ksiegowosc.wynagrodzenia VALUES ('2022-04-24', 1, 2, 1, 5); 
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('2022-04-24', 2, 1, 5, NULL);
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('2022-04-28', 3, 4, 4, NULL); 
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('2022-04-30', 4, 10, 5, 1);
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('2022-04-22', 5, 3, 10, 2); 
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('2022-04-24', 6, 9, 9, NULL);
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('2022-04-20', 7, 8, 2, 10); 
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('2022-04-21', 8, 5, 5, 5);
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('2022-04-27', 9, 3, 4, NULL); 
INSERT INTO ksiegowosc.wynagrodzenia VALUES ('2022-04-26', 10, 2, 1, 3);

SELECT * FROM ksiegowosc.wynagrodzenia

--6

--a

SELECT id_pracownika, nazwisko
	FROM ksiegowosc.pracownicy

--b p³aca jako sama pensja

SELECT wy.id_pracownika, pe.kwota
	FROM ksiegowosc.wynagrodzenia wy
	JOIN ksiegowosc.pensje pe
	ON wy.id_pensji = pe.id_pensji
	WHERE pe.kwota > 4000;

--b p³aca jako sama pensja + premia

SELECT wy.id_pracownika, pe.kwota AS Pensja, pr.kwota AS Premia
	FROM ksiegowosc.wynagrodzenia wy
	JOIN ksiegowosc.pensje pe
	ON wy.id_pensji = pe.id_pensji
	LEFT JOIN ksiegowosc.premie pr
	ON wy.id_premii = pr.id_premii
	WHERE (pe.kwota + (CASE
						WHEN wy.id_premii IS NULL THEN 0
						ELSE pr.kwota END)) > 4000;

--c

SELECT wy.id_pracownika, pe.kwota
	FROM ksiegowosc.wynagrodzenia wy
	JOIN ksiegowosc.pensje pe
	ON wy.id_pensji = pe.id_pensji
	WHERE pe.kwota > 5000 AND wy.id_premii IS NULL;

--d

SELECT id_pracownika, imie, nazwisko
	FROM ksiegowosc.pracownicy
	WHERE imie LIKE 'J%';
	
--e

SELECT id_pracownika, imie, nazwisko
	FROM ksiegowosc.pracownicy
	WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';

--f

SELECT pr.imie, pr.nazwisko, sum(gd.liczba_godzin) AS liczba_godzin, sum(gd.liczba_godzin) - 8 AS liczba_nadgodzin,
		DATEPART(MONTH, gd.data_godziny) AS Miesiac, DATEPART(YEAR, gd.data_godziny) AS Rok
	FROM ksiegowosc.godziny gd
	JOIN ksiegowosc.pracownicy pr
	ON gd.id_pracownika = pr.id_pracownika
	GROUP BY DATEPART(YEAR, gd.data_godziny), DATEPART(MONTH, gd.data_godziny), gd.id_pracownika, pr.imie, pr.nazwisko
	HAVING sum(gd.liczba_godzin) > 8

--g

SELECT pc.imie, pc.nazwisko, pe.kwota
	FROM ksiegowosc.wynagrodzenia wy
	JOIN ksiegowosc.pensje pe
	ON wy.id_pensji = pe.id_pensji
	JOIN ksiegowosc.pracownicy pc
	ON wy.id_pracownika = pc.id_pracownika
	WHERE pe.kwota BETWEEN 3000 AND 6000;

--h

SELECT pr.imie, pr.nazwisko, sum(gd.liczba_godzin) - 8 AS liczba_nadgodzin,
		DATEPART(MONTH, gd.data_godziny) AS Miesiac, DATEPART(YEAR, gd.data_godziny) AS Rok
	FROM ksiegowosc.godziny gd
	JOIN ksiegowosc.pracownicy pr
	ON gd.id_pracownika = pr.id_pracownika
	LEFT JOIN ksiegowosc.wynagrodzenia wy
	ON gd.id_pracownika = wy.id_pracownika
	WHERE wy.id_premii IS NULL
	GROUP BY DATEPART(YEAR, gd.data_godziny), DATEPART(MONTH, gd.data_godziny), gd.id_pracownika, pr.imie, pr.nazwisko
	HAVING sum(gd.liczba_godzin) > 8

--i

SELECT pc.id_pracownika, pc.imie, pc.nazwisko, pe.kwota
	FROM ksiegowosc.wynagrodzenia wy
	JOIN ksiegowosc.pensje pe
	ON wy.id_pensji = pe.id_pensji
	JOIN ksiegowosc.pracownicy pc
	ON wy.id_pracownika = pc.id_pracownika
	ORDER BY pe.kwota

--j

SELECT pc.id_pracownika, pc.imie, pc.nazwisko, pe.kwota, pr.kwota
	FROM ksiegowosc.wynagrodzenia wy
	JOIN ksiegowosc.pensje pe
	ON wy.id_pensji = pe.id_pensji
	JOIN ksiegowosc.pracownicy pc
	ON wy.id_pracownika = pc.id_pracownika
	LEFT JOIN ksiegowosc.premie pr
	ON wy.id_premii = pr.id_premii
	ORDER BY pe.kwota DESC, pr.kwota DESC;

--k

SELECT pe.stanowisko, count(wy.id_pensji) AS ilosc_pracowników
	FROM ksiegowosc.pensje pe
	JOIN ksiegowosc.wynagrodzenia wy
	ON pe.id_pensji = wy.id_pensji
	GROUP BY pe.stanowisko;

--l za p³ace uzna³em pensje i premie

SELECT AVG(pe.kwota + (CASE
						WHEN wy.id_premii IS NULL THEN 0
						ELSE pr.kwota END)) AS srednia,
		MIN(pe.kwota + (CASE
						WHEN wy.id_premii IS NULL THEN 0
						ELSE pr.kwota END)) AS minimalna,
		MAX(pe.kwota + (CASE
						WHEN wy.id_premii IS NULL THEN 0
						ELSE pr.kwota END)) AS maksymalan
		FROM ksiegowosc.wynagrodzenia wy
		JOIN ksiegowosc.pensje pe
		ON wy.id_pensji = pe.id_pensji
		LEFT JOIN ksiegowosc.premie pr
		ON wy.id_premii = pr.id_premii
		WHERE pe.stanowisko = 'menadzer';

--m

SELECT SUM(pe.kwota + (CASE
						WHEN wy.id_premii IS NULL THEN 0
						ELSE pr.kwota END)) AS suma
		FROM ksiegowosc.wynagrodzenia wy
		JOIN ksiegowosc.pensje pe
		ON wy.id_pensji = pe.id_pensji
		LEFT JOIN ksiegowosc.premie pr
		ON wy.id_premii = pr.id_premii;

--f

SELECT pe.stanowisko, SUM(pe.kwota + (CASE
						WHEN wy.id_premii IS NULL THEN 0
						ELSE pr.kwota END)) AS suma
		FROM ksiegowosc.wynagrodzenia wy
		JOIN ksiegowosc.pensje pe
		ON wy.id_pensji = pe.id_pensji
		LEFT JOIN ksiegowosc.premie pr
		ON wy.id_premii = pr.id_premii
		GROUP BY pe.stanowisko;

--g

SELECT pe.stanowisko, COUNT(wy. id_premii) AS liczba_premie
		FROM ksiegowosc.wynagrodzenia wy
		JOIN ksiegowosc.pensje pe
		ON wy.id_pensji = pe.id_pensji
		GROUP BY pe.stanowisko;

--h

ALTER TABLE ksiegowosc.godziny NOCHECK CONSTRAINT ALL
ALTER TABLE ksiegowosc.wynagrodzenia NOCHECK CONSTRAINT ALL
DELETE pc FROM ksiegowosc.pracownicy pc
JOIN ksiegowosc.wynagrodzenia wy
ON pc.id_pracownika = wy.id_pracownika
JOIN ksiegowosc.pensje pe
ON pe.id_pensji = wy.id_pensji
WHERE pe.kwota < 3500
ALTER TABLE ksiegowosc.godziny CHECK CONSTRAINT ALL
ALTER TABLE ksiegowosc.wynagrodzenia CHECK CONSTRAINT ALL