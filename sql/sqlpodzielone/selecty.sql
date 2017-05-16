/*Iloœæ pacjentów, którzy chorowali na nadciœnienie i zostali wyleczeni*/

SELECT COUNT(KP.Numer_karty) AS Liczba
FROM KartyPacjenta KP
WHERE KP.CzyWyleczony = '1' AND KP.NazwaChoroby='Nadciœnienie'

/*Iloœæ pacjentów, którzy chorowali na dowoln¹ chorobê i zostali wyleczeni*/


SELECT KP.NazwaChoroby,COUNT(KP.Numer_karty) AS Liczba
FROM KartyPacjenta KP
WHERE KP.CzyWyleczony = '1' 
GROUP BY KP.NazwaChoroby


/*Na którego pacjenta przepisano najwiêcej recept*/
SELECT KP.PacjentPESEL, COUNT(R.Indeks) AS Ilosc
FROM Recepty R, Wizyty W,KartyPacjenta KP
WHERE W.NumerKarty=KP.Numer_karty AND R.NrWizyty= W.Nr_wizyty
GROUP BY KP.PacjentPESEL



CREATE VIEW IloscRecept AS 
SELECT  W.NumerKarty,COUNT(R.NrWizyty) AS Recept
FROM Recepty R, Wizyty W
WHERE R.NrWizyty= W.Nr_wizyty
GROUP BY W.NumerKarty


SELECT TOP 1 KP.PacjentPESEL,IL.Recept
FROM IloscRecept IL, KartyPacjenta KP,Pacjenci P
WHERE IL.NumerKarty=KP.Numer_karty
GROUP BY KP.PacjentPESEL,IL.Recept
ORDER BY 2 DESC


/*Iloœæ pacjentów w bazie*/
SELECT COUNT (P.PESEL) AS Liczba
FROM Pacjenci P

/*Iloœæ kardiologów w bazie*/
SELECT COUNT(NumerPWZ) AS ilosc
FROM Lekarze L
WHERE L.Specjalizacja='Kardiologia'

/*który lekarz przepisa³ nawiêcej leków w roku 2014*/
SELECT	P.Imie, P.Nazwisko, P.NumerPWZ,SUM(R.Liczba_pudelek) AS IloscPudelek
FROM Lekarze L, Wizyty W, Recepty R, Pracownicy P
WHERE L.NumerPWZ=P.NumerPWZ AND L.NumerPWZ=W.LekarzaPWZ AND W.Nr_wizyty=R.NrWizyty AND DATEPART(YEAR, W.Data) = '2014'
GROUP BY P.Imie, P.Nazwisko, P.NumerPWZ


/*Który diagnosta uówi³ najwiêcej wizyt, które siê odby³y*/
SELECT P.Imie, P.Nazwisko, D.NumerPWZ, COUNT(W.Nr_wizyty) AS Wizyt
FROM Diagnosci D, Wizyty W, Pracownicy P
WHERE	D.NumerPWZ=P.NumerPWZ AND D.NumerPWZ=W.PWZD AND W.CzySieOdbyla='1'
GROUP BY P.Imie, P.Nazwisko, D.NumerPWZ

/*Ile wizyt przeprowadzil ile wizyt*/
SELECT   P.Imie, P.Nazwisko, L.NumerPWZ, COUNT(W.Nr_wizyty) AS Wizyt
FROM Lekarze L, Pracownicy P, Wizyty W
WHERE L.NumerPWZ=P.NumerPWZ AND W.LekarzaPWZ= L.NumerPWZ AND W.CzySieOdbyla='1' 
GROUP BY P.Imie, P.Nazwisko, L.NumerPWZ 
ORDER BY 4 ASC

/*Lekarz który przeprowadzi³ najmniej wizyt*/
CREATE VIEW Wiz AS 
	SELECT   P.Imie, P.Nazwisko, L.NumerPWZ, COUNT(W.Nr_wizyty) AS Wizyt
	FROM Lekarze L, Pracownicy P, Wizyty W
	WHERE L.NumerPWZ=P.NumerPWZ AND W.LekarzaPWZ= L.NumerPWZ AND W.CzySieOdbyla='1' 
	GROUP BY P.Imie, P.Nazwisko, L.NumerPWZ 


SELECT * FROM Wiz 
WHERE Wizyt=(SELECT MIN (Wizyt) FROM Wiz)


/*szczegó³owe informacje o lekarzach*/
SELECT P.NumerPWZ, P.Imie,P.Nazwisko, L.Specjalizacja,L.Gabinet
FROM Pracownicy P
 JOIN Lekarze L
ON P.NumerPWZ=L.NumerPWZ

/*szczegó³owe informacje o pacjentach*/
SELECT P.PESEL,P.Imie,P.Nazwisko,P.NrTelefonu, KP.Numer_karty,KP.CzyWyleczony,KP.NazwaChoroby
FROM Pacjenci P
	JOIN KartyPacjenta KP
	ON KP.PacjentPESEL=P.PESEL


/*najdro¿szy lek*/
SELECT  L.Nazwa,L.Cena
FROM Leki L
WHERE L.Cena= (SELECT MAX(Cena) FROM Leki)