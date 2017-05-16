

/*inserty*/
/*diagnosci------------------------------------------------*/
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
	/*lekarze--------------------------------------------------*/
INSERT INTO Pracownicy  VALUES( '5897654', 'Lolek', 'Mateusz');
	INSERT INTO Lekarze VALUES ( '5897654','Ginekologia','110');

INSERT INTO Pracownicy  VALUES( '9878651', 'Komorowski', 'Pawe³');
	INSERT INTO Lekarze VALUES ( '9878651','Alergologia',NULL);

INSERT INTO Pracownicy  VALUES( '9080012', 'Dziwik', 'Miko³aj');
	INSERT INTO Lekarze VALUES ( '9080012','Kardiologia','114');

INSERT INTO Pracownicy  VALUES( '5548977', 'Karczewska', 'Anna');
	INSERT INTO Lekarze VALUES ( '5548977','Kardiologia',NULL);

INSERT INTO Pracownicy  VALUES( '2781410', 'Mosi¹dz', 'Marta');
	INSERT INTO Lekarze VALUES ( '2781410','Kardiologia','210');

INSERT INTO Pracownicy  VALUES( '2987090', 'Lulo', 'Kamil');
	INSERT INTO Lekarze VALUES ( '2987090','Neurologia','213');

INSERT INTO Pracownicy  VALUES( '4516910', 'Pyr', 'Konrad');
	INSERT INTO Lekarze VALUES ( '4516910','Neurologia','212');

INSERT INTO Pracownicy  VALUES( '8070928', 'Kit', 'Jakub');
	INSERT INTO Lekarze VALUES ( '8070928','Okulistyka',NULL);

INSERT INTO Pracownicy  VALUES( '7160982', 'Tarta', 'Janusz');
	INSERT INTO Lekarze VALUES ( '7160982','Okulistyka','315');

INSERT INTO Pracownicy  VALUES( '8240957', 'M¹dra', 'Weronika');
	INSERT INTO Lekarze VALUES ( '8240957','Ginekologia','312');

	/*choroby i leki*/
INSERT INTO Choroby  VALUES( 'Endometrioza', 'Ginekologia');
	INSERT INTO Leki VALUES( 'Maculatum',NULL, 17.70 , 'Endometrioza');
	INSERT INTO Leki VALUES( 'Femifertil',30, 10.90 , 'Endometrioza');

INSERT INTO Choroby  VALUES( 'Zapalenie ', 'Ginekologia'); /*przydatków*/
	INSERT INTO Leki VALUES( 'Biostreptaza',6, 8.75 , 'Zapalenie');
	INSERT INTO Leki VALUES( 'Viasnne',28, 17.90 , 'Zapalenie');

INSERT INTO Choroby  VALUES( 'Mastocytoza', 'Alergologia');
	INSERT INTO Leki VALUES( 'Loratadyna',10, 15.90 , 'Mastocytoza');

INSERT INTO Choroby  VALUES( 'Uk¹szenia', 'Alergologia');
	INSERT INTO Leki VALUES( 'Comarol',NULL, 7.19 , 'Uk¹szenia');
	INSERT INTO Leki VALUES( 'Entil',NULL, 9.39 , 'Uk¹szenia');

INSERT INTO Choroby  VALUES( 'U¿¹dlenie', 'Alergologia');
	INSERT INTO Leki VALUES( 'Fenistil',NULL, 9.90 , 'U¿¹dlenie');

INSERT INTO Choroby  VALUES( 'Nadciœnienie', 'Kardiologia');
	INSERT INTO Leki VALUES( 'Betaloc',28, 10.99 , 'Nadciœnienie');
	INSERT INTO Leki VALUES( 'Enap-h',20, 7.99 , 'Nadciœnienie');

INSERT INTO Choroby  VALUES( 'Udar', 'Kardiologia');
	INSERT INTO Leki VALUES( 'Aclotin',60, 28.20 , 'Udar');

INSERT INTO Choroby  VALUES( 'Zakrzepica', 'Kardiologia');
	INSERT INTO Leki VALUES( 'Warfin',100, 35.50 , 'Zakrzepica');

INSERT INTO Choroby  VALUES( 'Migrena', 'Neurologia');
	INSERT INTO Leki VALUES( 'Migrastop',10, 8.99 , 'Migrena');
	INSERT INTO Leki VALUES( 'Migren',60, 18.00 , 'Migrena');

INSERT INTO Choroby  VALUES( 'Encefalopatia', 'Neurologia');
	INSERT INTO Leki VALUES( 'Duphalac',10, 16.00 , 'Encefalopatia');

INSERT INTO Choroby  VALUES( 'Jaskra', 'Okulistyka');
	INSERT INTO Leki VALUES( 'Betaxolol',30, 35.40 , 'Jaskra');
	INSERT INTO Leki VALUES( 'Rozalin',NULL, 11.20 , 'Jaskra');

INSERT INTO Choroby  VALUES( '£zawienie', 'Okulistyka');
	INSERT INTO Leki VALUES( 'Contrahist',28, 6.99 , '£zawienie');

INSERT INTO Choroby  VALUES( 'Jêczmieñ', 'Okulistyka');
	INSERT INTO Leki VALUES( 'Garasome',NULL, 19.90 , 'Jêczmieñ');





INSERT INTO Pacjenci VALUES ('92067554890', 'Korzeniowski', 'Piotr','504908765');
	INSERT INTO KartyPacjenta VALUES (0,'92067554890','Jêczmieñ','5409188');
		INSERT INTO Wizyty VALUES (0,'2014-11-22',
			(SELECT top 1 NumerPWZ  FROM Lekarze  WHERE Specjalizacja=(SELECT Specjalizacja  FROM Choroby WHERE Nazwa='Jêczmieñ') ORDER BY NEWID()),
			IDENT_CURRENT( 'KartyPacjenta' ),'9764100');
				INSERT INTO Recepty VALUES ( 2, IDENT_CURRENT( 'Wizyty' ),(SELECT top 1 Nazwa FROM Leki WHERE NazwaChoroby='Jêczmieñ'));


INSERT INTO Pacjenci VALUES ('91047891678','Malik','Piotr','876120987');
	INSERT INTO KartyPacjenta VALUES (1,'91047891678','Nadciœnienie','5409188');
		INSERT INTO Wizyty VALUES (1,'2014-11-27','9080012',IDENT_CURRENT( 'KartyPacjenta' ),'4528198');
			INSERT INTO Recepty VALUES (1,IDENT_CURRENT( 'Wizyty' ),'Betaloc');
			INSERT INTO Recepty VALUES (2,IDENT_CURRENT( 'Wizyty' ),'Enap-h');
		INSERT INTO Wizyty VALUES (0,'2014-12-27','9080012',IDENT_CURRENT( 'KartyPacjenta' ),'4528198');
	INSERT INTO KartyPacjenta VALUES (1,'91047891678','£zawienie','9764100');
		INSERT INTO Wizyty VALUES (1,'2014-7-27','8070928',IDENT_CURRENT( 'KartyPacjenta' ),'2345678');


INSERT INTO Pacjenci VALUES ('87650987650','Ksamp','£ukasz','876109671');
	INSERT INTO KartyPacjenta VALUES (0,'87650987650','Uk¹szenia','9764100');
		INSERT INTO Wizyty VALUES (1,'2014-11-21','9878651',IDENT_CURRENT( 'KartyPacjenta' ),'4528198');
			INSERT INTO Recepty VALUES (3,IDENT_CURRENT( 'Wizyty' ),'Comarol');
		INSERT INTO Wizyty VALUES (0,'2014-11-22','9878651',IDENT_CURRENT( 'KartyPacjenta' ),'2345678');

INSERT INTO Pacjenci VALUES ('91871098471','S³oik','Piotr','575487852');
	INSERT INTO KartyPacjenta VALUES (0,'91871098471','Encefalopatia','4528198');

INSERT INTO Pacjenci VALUES ('88291076549','P³omka','Adam','601284519');

INSERT INTO Pacjenci VALUES ('67289018765','Paluszek','Jan','768654781');
	INSERT INTO KartyPacjenta VALUES (0,'67289018765','Mastocytoza','4528198');
		INSERT INTO Wizyty VALUES (1,'2014-10-12','9878651',IDENT_CURRENT( 'KartyPacjenta' ),'2345678');
			INSERT INTO Recepty VALUES (1,IDENT_CURRENT( 'Wizyty' ),'Loratadyna');
		INSERT INTO Wizyty VALUES (1,'2014-09-02','9878651',IDENT_CURRENT( 'KartyPacjenta' ),'2345678');
			INSERT INTO Recepty VALUES (1,IDENT_CURRENT( 'Wizyty' ),'Loratadyna');

INSERT INTO Pacjenci VALUES ('76789876412','Okoñ','Andrzej','554678763');
	INSERT INTO KartyPacjenta VALUES (1,'76789876412','Endometrioza','4528198');
		INSERT INTO Wizyty VALUES (1,'2013-10-11','8240957',IDENT_CURRENT( 'KartyPacjenta' ),'9764100');
			INSERT INTO Recepty VALUES (5,IDENT_CURRENT( 'Wizyty' ),'Maculatum');
			INSERT INTO Recepty VALUES (5,IDENT_CURRENT( 'Wizyty' ),'Femifertil');

INSERT INTO Pacjenci VALUES ('87690987654','Kawka','Marzena','987916782');
	INSERT INTO KartyPacjenta VALUES (1,'87690987654','Nadciœnienie','2345678');
		INSERT INTO Wizyty VALUES (1,'2014-10-18','5548977',IDENT_CURRENT( 'KartyPacjenta' ),'2345678');
			INSERT INTO Recepty VALUES (3,IDENT_CURRENT( 'Wizyty' ),'Enap-h');
			INSERT INTO Recepty VALUES (1,IDENT_CURRENT( 'Wizyty' ),'Betaloc');
		INSERT INTO Wizyty VALUES (1,'2014-10-11','2781410',IDENT_CURRENT( 'KartyPacjenta' ),'9764100');
			INSERT INTO Recepty VALUES (2,IDENT_CURRENT( 'Wizyty' ),'Enap-h');