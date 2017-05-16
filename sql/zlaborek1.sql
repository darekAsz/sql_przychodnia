CREATE TABLE Pracownicy ( NumerPWZ CHAR(7) PRIMARY KEY CHECK ( NumerPWZ LIKE '[1-9][0-9][0-9][0-9][0-9][0-9][0-9]' ),
						 Nazwisko VARCHAR(20) NOT NULL,
						 Imie VARCHAR (20) NOT NULL )

CREATE TABLE Diagnosci (NumerPWZ CHAR(7) PRIMARY KEY REFERENCES Pracownicy ,
						NumerTel CHAR(9) UNIQUE CHECK( NumerTel LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') )

CREATE TABLE Lekarze (NumerPWZ CHAR(7)PRIMARY KEY  REFERENCES Pracownicy ,
					  Specjalizacja VARCHAR (20) NOT NULL,
					  Gabinet VARCHAR(3) )

CREATE TABLE Choroby (Nazwa VARCHAR (20) PRIMARY KEY,
					  Specjalizacja VARCHAR (20) NOT NULL )



CREATE TABLE Pacjenci (PESEL CHAR (11) PRIMARY KEY  CHECK ( PESEL LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' ), 
					   Nazwisko VARCHAR(20) NOT NULL,
					   Imie VARCHAR (20) NOT NULL ,
					   NrTelefonu CHAR (9) UNIQUE CHECK( NrTelefonu LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))

CREATE TABLE KartyPacjenta ( Numer_karty INT IDENTITY(1,1) PRIMARY KEY,
							 CzyWyleczony BIT,
							 PacjentPESEL CHAR (11) REFERENCES Pacjenci ,
							 NazwaChoroby  VARCHAR (20) REFERENCES Choroby )
							  

CREATE TABLE Wizyty (Nr_wizyty INT IDENTITY(1,1) PRIMARY KEY,
					 CzySieOdbyla BIT,
					 Data DATE CHECK ( Data LIKE '[2-3][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]')NOT NULL,
					 LekarzaPWZ CHAR(7) REFERENCES Lekarze ,
					 NumerKarty INT REFERENCES KartyPacjenta )




CREATE TABLE Leki (Nazwa VARCHAR(20) PRIMARY KEY,
				   Ilosc_tabl	INT NOT NULL,
				   Cena NUMERIC (6,2) NOT NULL,
				   NazwaChoroby VARCHAR (20) REFERENCES Choroby )
				   

CREATE TABLE Recepty (Indeks INT IDENTITY(1,1) PRIMARY KEY,
					  Liczba_pudelek INT NOT NULL,
					  NrWizyty INT REFERENCES Wizyty ,
					  NazwaLeku VARCHAR(20) REFERENCES Leki )








/*inserty*/

INSERT INTO Pracownicy  VALUES( '2345678', 'Nowak', 'Jan');
	INSERT INTO Diagnosci VALUES ( '2345678','605478091');

INSERT INTO Pracownicy  VALUES( '9857891', 'Bzik', 'Anna');
	INSERT INTO Diagnosci VALUES ( '9857891','601907651');

INSERT INTO Pracownicy  VALUES( '4528198', 'Macyk', 'Dominik');
	INSERT INTO Diagnosci VALUES ( '4528198','765459876');

INSERT INTO Pracownicy  VALUES( '9764100', 'Pol', 'Piotr');
	INSERT INTO Diagnosci VALUES ( '9764100','674567234');

INSERT INTO Pracownicy  VALUES( '9101761', 'Ulia', 'Maciej');
	INSERT INTO Diagnosci VALUES ( '9101761','437856578');

INSERT INTO Pracownicy  VALUES( '5409188', 'Itka', 'Lech');
	INSERT INTO Diagnosci VALUES ( '5409188','987260865');

INSERT INTO Pracownicy  VALUES( '2909754', 'Macio', 'Ilona');
	INSERT INTO Diagnosci VALUES ( '2909754','981123076');

INSERT INTO Pracownicy  VALUES( '1086549', 'Wuj', 'Pawe³');
	INSERT INTO Diagnosci VALUES ( '1086549','765986341');

INSERT INTO Pracownicy  VALUES( '9876112', 'Cielak', 'Tomasz');
	INSERT INTO Diagnosci VALUES ( '9876112','765109816');



	DROP TABLE Recepty;
	DROP TABLE Leki;
	DROP TABLE Wizyty;
	DROP TABLE KartyPacjenta;
	DROP TABLE Pacjenci;
	DROP TABLE Choroby;
	DROP TABLE Lekarze;
	DROP TABLE Diagnosci;
	DROP TABLE Pracownicy;