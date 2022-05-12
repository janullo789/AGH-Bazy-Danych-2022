SELECT * FROM ksiegowosc.pracownicy

--a

ALTER TABLE ksiegowosc.pracownicy
ALTER COLUMN telefon VARCHAR(17);

UPDATE ksiegowosc.pracownicy
	SET telefon = '(+48)' + telefon

--b

UPDATE ksiegowosc.pracownicy
	SET telefon = SUBSTRING(telefon, 1, 8) + '-' +
					SUBSTRING(telefon, 9, 3) + '-' +
					SUBSTRING(telefon, 12, 3);

--c

SELECT TOP 1 UPPER(nazwisko)
	FROM ksiegowosc.pracownicy
	ORDER BY LEN(nazwisko) DESC;

--d

SELECT pc.* , HASHBYTES('MD5', CONVERT(VARCHAR, pe.kwota)) AS 'Pensja MD5'
	FROM ksiegowosc.wynagrodzenia wy
	JOIN ksiegowosc.pensje pe
	ON wy.id_pensji = pe.id_pensji
	JOIN ksiegowosc.pracownicy pc
	ON wy.id_pracownika = pc.id_pracownika;

--f

SELECT pc.id_pracownika, pc.imie, pc.nazwisko, pe.kwota AS Pensja, pr.kwota AS Premia
	FROM ksiegowosc.wynagrodzenia wy
	JOIN ksiegowosc.pensje pe
	ON wy.id_pensji = pe.id_pensji
	LEFT JOIN ksiegowosc.premie pr
	ON wy.id_premii = pr.id_premii
	JOIN ksiegowosc.pracownicy pc
	ON wy.id_pracownika = pc.id_pracownika;

--g

SELECT CONCAT('Pracownik', ''), pr.imie, pr.nazwisko,
		CONCAT('w ', 'miesiacu'), DATEPART(MONTH, gd.data_godziny) AS Miesiac,
		CONCAT('w ', 'roku'), DATEPART(YEAR, gd.data_godziny) AS Rok,
		CONCAT('otrzymal ', 'pensje calkowita na kwote:'),  (pe.kwota + (CASE 
																					WHEN pm.kwota IS NULL THEN 0
																					ELSE pm.kwota END) + (CASE
																											WHEN ((sum(gd.liczba_godzin)) < 8) THEN 0
																											ELSE ((sum(gd.liczba_godzin) - 8) * 50)  END)) AS 'Pensja + Premia + Nadgodziny',
		CONCAT('zl, ', 'gdzie wynagrodzenie zasadnicze wynosi³o:'), pe.kwota AS Pensja,
		CONCAT('z³, ', 'premia: '), pm.kwota AS Premia,
		CONCAT('z³, ', 'nadgodziny: '), (CASE
											WHEN ((sum(gd.liczba_godzin)) < 8) THEN 0
											ELSE ((sum(gd.liczba_godzin) - 8) * 50)  END) AS Nadgodziny,
		CONCAT('z³', '')
	FROM ksiegowosc.godziny gd
	JOIN ksiegowosc.pracownicy pr
	ON gd.id_pracownika = pr.id_pracownika
	JOIN ksiegowosc.wynagrodzenia wy
	ON gd.id_pracownika = wy.id_pracownika
	JOIN ksiegowosc.pensje pe
	ON wy.id_pensji= pe.id_pensji
	LEFT JOIN ksiegowosc.premie pm
	ON wy.id_premii= pm.id_premii
	GROUP BY DATEPART(YEAR, gd.data_godziny), DATEPART(MONTH, gd.data_godziny), gd.id_pracownika, pr.imie, pr.nazwisko, pe.kwota, pm.kwota;