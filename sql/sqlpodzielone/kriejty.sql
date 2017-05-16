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



CREATE TABLE Pacjenci (PESEL CHAR (11) PRIMARY KEY  CHECK ( PESEL LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' ), 
					   Nazwisko VARCHAR(20) NOT NULL,
					   Imie VARCHAR (20) NOT NULL ,
					   NrTelefonu CHAR (9)   CHECK( NrTelefonu LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))

CREATE TABLE KartyPacjenta ( Numer_karty INT IDENTITY(1,1) PRIMARY KEY,
							 CzyWyleczony BIT,
							 PacjentPESEL CHAR (11) REFERENCES Pacjenci NOT NULL,
							 NazwaChoroby  VARCHAR (20) REFERENCES Choroby NOT NULL,
							 PWZdiagnosty CHAR(7)REFERENCES Diagnosci NOT NULL)
							  

CREATE TABLE Wizyty (Nr_wizyty INT IDENTITY(1,1) PRIMARY KEY,
					 CzySieOdbyla BIT,
					 Data DATE /*CHECK ( Data LIKE '[2-3][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]')*/NOT NULL,
					 LekarzaPWZ CHAR(7) REFERENCES Lekarze NOT NULL,
					 NumerKarty INT REFERENCES KartyPacjenta NOT NULL,
					 PWZD CHAR(7)REFERENCES Diagnosci NOT NULL)




CREATE TABLE Leki (Nazwa VARCHAR(20) PRIMARY KEY,
				   Ilosc_tabl	INT ,
				   Cena NUMERIC (6,2) NOT NULL,
				   NazwaChoroby VARCHAR (20) REFERENCES Choroby NOT NULL)
				   

CREATE TABLE Recepty (Indeks INT IDENTITY(1,1) PRIMARY KEY,
					  Liczba_pudelek INT NOT NULL,
					  NrWizyty INT REFERENCES Wizyty NOT NULL,
					  NazwaLeku VARCHAR(20) REFERENCES Leki NOT NULL)




