SET SERVEROUTPUT ON;
--originele dump incl. opmaakfouten en paar fouten in postcodes/straten!
BEGIN
dbms_output.put_line(ImportWinkel('Amsterdam Aalsmeerweg',
'Aalsmeerweg',
'14-16',
'Amsterdam',
'NL',
'1059AJ',
'0204122131'));

/*Select * FROM POSTCODE WHERE street = 'Aalsmeerweg' AND City = 'Amsterdam' AND Postcode = '1059AJ';
DELETE FROM WINKEL;
Select * FROM WINKEL;*/

dbms_output.put_line(ImportWinkel('Amsterdam Bos en Lommerweg',
'Bos en Lommerweg ',
'215',
'AMSTERDAM ',
'NL ',
'1055DT',
'0206847676'));

dbms_output.put_line(ImportWinkel('Amsterdam Ceintuurbaan',
'Ceintuurbaan ',
'314',
'AMSTERDAM ',
'NL ',
'1072GL',
'0204705292'));

dbms_output.put_line(ImportWinkel('Amsterdam Noord',
'Kamperfoelieweg ',
'40',
'AMSTERDAM ',
'NL ',
'1032HP',
'0203340008'));

dbms_output.put_line(ImportWinkel('Amsterdam Oostelijke Handelskade',
'Oostelijke Handelskade ',
'142',
'AMSTERDAM ',
'NL ',
'1019BP',
'0204350660'));

dbms_output.put_line(ImportWinkel('Amsterdam Overtoom',
'Overtoom ',
'71',
'AMSTERDAM ',
'NL ',
'1054HC',
'0204122131'));

dbms_output.put_line(ImportWinkel('Osdorp',
'Pieter Calandlaan ',
'212 e',
'Amsterdam ',
'NL ',
'1069LA',
'0206673880 '));

dbms_output.put_line(ImportWinkel('Den Haag Goudenregenplein',
'Goudenregenplein ',
'3',
'''s-Gravenhage',
'NL',
'2565GH',
'0703616111'));

dbms_output.put_line(ImportWinkel('Den Haag Oude Haagweg',
'Oude Haagweg ',
'36',
'''s-Gravenhage',
'NL ',
'2552EP',
'0704400020'));

dbms_output.put_line(ImportWinkel('Den Haag Torenstraat',
'Torenstraat ',
'140',
'''s-Gravenhage',
'NL ',
'2513BW',
'0703467757'));

dbms_output.put_line(ImportWinkel('Scheveningen',
'Zeesluisweg ',
'6',
'''s-Gravenhage',
'NL ',
'2583DR',
'0703060022'));

dbms_output.put_line(ImportWinkel('Assen',
'Mr. P.J. Troelstralaan ',
'199 A',
'ASSEN ',
'NL ',
'9402BG',
'0592350060'));


dbms_output.put_line(ImportWinkel('Emmen',
'Spoorstraat ',
'6',
'EMMEN ',
'NL ',
'7811GB',
'0591724400'));

dbms_output.put_line(ImportWinkel('Meppel',
'Prinsengracht ',
'13',
'Meppel ',
'NL ',
'7941KD',
'0522743110 '));

dbms_output.put_line(ImportWinkel('Almere',
'Cinemadreef ',
'238',
'ALMERE ',
'NL ',
'1325ES',
'0365359494'));

dbms_output.put_line(ImportWinkel('Almere Buiten',
'Makassarweg ',
'209',
'ALMERE ',
'NL ',
'1335HW',
'0365213990'));

dbms_output.put_line(ImportWinkel('Lelystad',
'Weversstraat ',
'26',
'LELYSTAD ',
'NL ',
'8223AC',
'0320213018 '));

dbms_output.put_line(ImportWinkel('Drachten',
'Noordkade ',
'56',
'DRACHTEN ',
'NL ',
'9203CE',
'0512510015'));

dbms_output.put_line(ImportWinkel('Heerenveen',
'Trambaan ',
'11',
'HEERENVEEN ',
'NL ',
'8441BH',
'0513625635'));

dbms_output.put_line(ImportWinkel('Leeuwarden',
'Oostergrachtswal ',
'5',
'LEEUWARDEN ',
'NL ',
'8921AA',
'0582120026'));

dbms_output.put_line(ImportWinkel('Sneek',
'Gedempte Pol ',
'32',
'SNEEK ',
'NL ',
'8601BZ',
'0515411045'));

dbms_output.put_line(ImportWinkel('Apeldoorn',
'Arnhemseweg ',
'251',
'Apeldoorn ',
'NL ',
'7333NA',
'0555761188'));

dbms_output.put_line(ImportWinkel('Arnhem',
'Middelgraaflaan ',
'65',
'ARNHEM ',
'NL ',
'6832AP',
'0263883993'));

dbms_output.put_line(ImportWinkel('Arnhem Centrum',
'Jansbinnensingel ',
'27',
'ARNHEM ',
'NL ',
'6811AL',
'0263510100'));

dbms_output.put_line(ImportWinkel('Ede',
'Rozenplein ',
'62',
'Ede ',
'NL ',
'6713EN',
'0318504100'));

dbms_output.put_line(ImportWinkel('Harderwijk',
'Vondellaan ',
'90',
'HARDERWIJK ',
'NL ',
'3842EJ',
'0341410010'));

dbms_output.put_line(ImportWinkel('Nijmegen',
'Groenestraat ',
'243',
'NIJMEGEN ',
'NL ',
'6531HJ',
'0243500670'));

dbms_output.put_line(ImportWinkel('Tiel',
'Plein ',
'53',
'TIEL ',
'NL ',
'4001LH',
'0344610004'));

dbms_output.put_line(ImportWinkel('Velp',
'President Kennedylaan ',
'71',
'VELP ',
'NL ',
'6883AR',
'0263610001'));

/*Select*
FROM POSTCODE 
WHERE postcode = '6883AR';*/


dbms_output.put_line(ImportWinkel('Wageningen',
'Stadsbrink ',
'34',
'WAGENINGEN ',
'NL ',
'6701AL',
'0317410040'));

dbms_output.put_line(ImportWinkel('Wijchen',
'Touwslagersbaan ',
'7B',
'WIJCHEN ',
'NL ',
'6602AH',
'0242100100'));

dbms_output.put_line(ImportWinkel('Delfzijl',
'De Wending ',
'7',
'delfzijl ',
'NL ',
'9933KM',
'0596743101'));

dbms_output.put_line(ImportWinkel('Groningen Boterdiep',
'Boterdiep ',
'1',
'GRONINGEN ',
'NL ',
'9712LH',
'0505266600'));

dbms_output.put_line(ImportWinkel('Groningen Paddepoel',
'Zonnelaan ',
'281A',
'GRONINGEN ',
'NL ',
'9742BG',
'0505710012'));

dbms_output.put_line(ImportWinkel('Groningen Paterswoldseweg',
'Paterswoldseweg ',
'322',
'GRONINGEN ',
'NL ',
'9727BX',
'0505250300'));

dbms_output.put_line(ImportWinkel('Hoogezand',
'Gorecht-Oost ',
'76',
'Hoogezand ',
'NL ',
'9603AC',
'0598743103 '));

dbms_output.put_line(ImportWinkel('AC Sevenum',
'Kleefsedijk ',
'29',
'Sevenum ',
'NL ',
'5975NV',
'0774672895'));

dbms_output.put_line(ImportWinkel('Brunssum',
'Schiffelerstraat ',
'15-17',
'Brunssum ',
'NL ',
'6441CN',
'0452100121'));

dbms_output.put_line(ImportWinkel('Geleen',
'Rijksweg Centrum ',
'68',
'GELEEN ',
'NL ',
'6161EH',
'0462100106'));

dbms_output.put_line(ImportWinkel('Landgraaf',
'Hoogstraat ',
'54',
'landgraaf ',
'NL ',
'6373HW',
'0452100120'));

dbms_output.put_line(ImportWinkel('Maastricht',
'Koningin Emmaplein ',
'18',
'Maastricht ',
'NL ',
'6211NG',
'0433216747'));

dbms_output.put_line(ImportWinkel('Roermond',
'Stationsplein ',
'14',
'ROERMOND ',
'NL ',
'6041GN',
'0475310012'));

dbms_output.put_line(ImportWinkel('Sittard',
'Stationsstraat ',
'49',
'SITTARD ',
'NL ',
'6131AX',
'0464000143'));

dbms_output.put_line(ImportWinkel('Venlo',
'Koninginnesingel',
'80',
'VENLO ',
'NL ',
'5911KG',
'0773510000'));

dbms_output.put_line(ImportWinkel('Weert',
'Dries ',
'8',
'WEERT ',
'NL ',
'6006HS',
'0495520030 '));

dbms_output.put_line(ImportWinkel('Bergen op Zoom',
'Antwerpsestraat',
'2',
'Bergen op Zoom',
'NL ',
'4611AG',
'0164247030'));

dbms_output.put_line(ImportWinkel('Breda Graaf Hendrik III Plein',
'Graaf Hendrik III plein ',
'51',
'BREDA ',
'NL ',
'4819CK',
'0765200345'));

dbms_output.put_line(ImportWinkel('Breda Kesterenlaan',
'Kesterenlaan ',
'170',
'BREDA ',
'NL ',
'4822WK',
'0765422113'));

dbms_output.put_line(ImportWinkel('Den Bosch',
'Leonardo da Vinciplein ',
'44',
'''s-Hertogenbosch ',
'NL ',
'5223DR',
'0736233111'));

dbms_output.put_line(ImportWinkel('Den Bosch Empel',
'Burgemeesters Godschalxstraat',
'42',
'''s-Hertogenbosch',
'NL ',
'5236AC',
'0736444222'));


dbms_output.put_line(ImportWinkel('Dongen',
'Europaplein ',
'53',
'DONGEN ',
'NL ',
'5101VW',
'0162749101'));

dbms_output.put_line(ImportWinkel('Eindhoven Gestel',
'Karel de Grotelaan ',
'351',
'Eindhoven ',
'NL ',
'5654NN',
'0402570999'));

dbms_output.put_line(ImportWinkel('Eindhoven Tongelre',
'Dirigentplein ',
'97',
'EINDHOVEN ',
'NL ',
'5642RK',
'0404100121'));

dbms_output.put_line(ImportWinkel('Eindhoven Woensel',
'Elckerlyclaan ',
'77',
'EINDHOVEN ',
'NL ',
'5625EP',
'0402483060'));

dbms_output.put_line(ImportWinkel('Etten Leur',
'Markt ',
'99b',
'ETTEN LEUR ',
'NL ',
'4875CD',
'0765081111'));

dbms_output.put_line(ImportWinkel('Geldrop',
'Dommeldalseweg ',
'2b',
'GELDROP',
'NL ',
'5664RP',
'0402854087'));

dbms_output.put_line(ImportWinkel('Helmond',
'Noord Koninginnewal ',
'23',
'HELMOND ',
'NL ',
'5701NJ',
'0492552878'));

dbms_output.put_line(ImportWinkel('Helmond Brandevoort',
'de Plaetse ',
'91',
'Helmond',
'NL ',
'5708ZK',
'0492743013'));

dbms_output.put_line(ImportWinkel('Oosterhout',
'Heuveleind ',
'13',
'OOSTERHOUT ',
'NL ',
'4901LL',
'0162433838'));


dbms_output.put_line(ImportWinkel('Oss',
'Klaphekkenstraat ',
'5a',
'OSS',
'NL ',
'5341CH',
'0412655066'));

dbms_output.put_line(ImportWinkel('Roosendaal',
'Boulevard ',
'8',
'ROOSENDAAL ',
'NL ',
'4701EV',
'0165565300'));

dbms_output.put_line(ImportWinkel('Tilburg Laarstraat',
'Laarstraat ',
'1',
'Tilburg ',
'NL ',
'5025VJ',
'0134686866'));

dbms_output.put_line(ImportWinkel('Tilburg Thomas van Aquinostraat',
'Thomas van Aquinostraat ',
'37',
'TILBURG ',
'NL ',
'5042HA',
'0134637638'));

dbms_output.put_line(ImportWinkel('Uden',
'Oranjestraat ',
'19/21',
'UDEN ',
'NL ',
'5401CB',
'0413245009'));

dbms_output.put_line(ImportWinkel('Valkenswaard',
'Dommelseweg ',
'5',
'Valkenswaard ',
'NL ',
'5554NL',
'0404100110'));

dbms_output.put_line(ImportWinkel('Veghel',
'Bolkenplein ',
'9/10',
'VEGHEL ',
'NL ',
'5461HH',
'0413320403'));

dbms_output.put_line(ImportWinkel('Veldhoven',
'Burgemeester van Hooffln ',
'67',
'VELDHOVEN ',
'NL ',
'5503BK',
'0402556636'));

dbms_output.put_line(ImportWinkel('Waalwijk',
'St. Antoniusstraat ',
'138',
'WAALWIJK ',
'NL ',
'5144AG',
'0416566088 '));

dbms_output.put_line(ImportWinkel('Alkmaar',
'Vondelstraat ',
'61',
'ALKMAAR ',
'NL ',
'1813BA',
'0722100160'));

dbms_output.put_line(ImportWinkel('Amstelveen',
'Hueseplein ',
'4',
'AMSTELVEEN ',
'NL ',
'1185HH',
'0203457666'));

dbms_output.put_line(ImportWinkel('Den Helder',
'Marsdiepstraat ',
'172',
'DEN HELDER ',
'NL ',
'1784AT',
'0223610040'));

dbms_output.put_line(ImportWinkel('Diemen',
'Burgemeester de Kievietstraat ',
'13',
'DIEMEN ',
'NL ',
'1111GJ',
'0204162800'));

dbms_output.put_line(ImportWinkel('Haarlem Tesselschadeplein',
'Tesselschadeplein ',
'1',
'HAARLEM ',
'NL ',
'2026SV',
'0235400555'));

dbms_output.put_line(ImportWinkel('Haarlem Zuid',
'Nice Passage ',
'10',
'HAARLEM ',
'NL ',
'2037AJ',
'0235404455'));

dbms_output.put_line(ImportWinkel('Heemskerk',
'Bachplein ',
'21',
'HEEMSKERK ',
'NL ',
'1962CE',
'0251242226'));

dbms_output.put_line(ImportWinkel('Heerhugowaard',
'Raadhuisstraat ',
'14',
'HEERHUGOWAARD ',
'NL ',
'1701EK',
'0725762940'));

dbms_output.put_line(ImportWinkel('Hoofddorp',
'Almkerkplein ',
'2',
'HOOFDDORP ',
'NL ',
'2134DR',
'0235620388'));

dbms_output.put_line(ImportWinkel('Hoorn',
'Veemarkt',
'45-47',
'HOORN ',
'NL ',
'1621JB',
'0229210318'));

dbms_output.put_line(ImportWinkel('IJmuiden',
'Kennemerlaan ',
'77',
'IJMUIDEN ',
'NL ',
'1972EJ',
'0255545910'));


dbms_output.put_line(ImportWinkel('Noordwijk',
'Kerkstraat ',
'40',
'NOORDWIJK ',
'NL ',
'2201KN',
'0713610979'));

dbms_output.put_line(ImportWinkel('Purmerend',
'Wormerplein ',
'89',
'PURMEREND ',
'NL ',
'1442CD',
'0299420009'));

dbms_output.put_line(ImportWinkel('Zaandam',
'Zuiddijk ',
'45',
'ZAANDAM ',
'NL ',
'1501CB',
'0756705501 '));

dbms_output.put_line(ImportWinkel('Almelo',
'Vincent van Goghplein ',
'12',
'ALMELO ',
'NL ',
'7606HP',
'0546459996'));

dbms_output.put_line(ImportWinkel('Deventer',
'Brinkgreverweg ',
'80-82',
'Deventer ',
'NL ',
'7413AE',
'0570621100'));


dbms_output.put_line(ImportWinkel('Enschede',
'Kuipersdijk ',
'3B',
'ENSCHEDE ',
'NL ',
'7512CA',
'0534824000'));

dbms_output.put_line(ImportWinkel('Enschede West',
'G.J. van Heekstraat ',
'223',
'ENSCHEDE ',
'NL ',
'7521EE',
'0534300081'));

dbms_output.put_line(ImportWinkel('Hengelo',
'Boekeloseweg ',
'11',
'HENGELO ',
'NL ',
'7553DK',
'0742420203'));

/*
dbms_output.put_line(ImportWinkel('Kampen',
'Buitennieuwstraat ',
'9',
'KAMPEN',
'NL ',
'8261AP',
'0383331517'));
*/


dbms_output.put_line(ImportWinkel('Zwolle',
'Diezerkade ',
'5',
'ZWOLLE ',
'NL ',
'8021CW',
'0384531339'));

dbms_output.put_line(ImportWinkel('Zwolle Bachplein',
'Bachplein ',
'8',
'ZWOLLE ',
'NL ',
'8031HR',
'0384210080'));

BEGIN
dbms_output.put_line(ImportWinkel('Rotterdam Hoogvliet',
'In de Fuik ',
'90',
'Hoogvliet Rotterdam',
'NL ',
'3192HD',
'0102160075'));
END;


dbms_output.put_line(ImportWinkel('Rotterdam Mariniersweg',
'Mariniersweg ',
'70A',
'ROTTERDAM ',
'NL ',
'3011NS',
'0104118070'));

dbms_output.put_line(ImportWinkel('Rotterdam Noord',
'Stadhoudersweg ',
'72a',
'Rotterdam ',
'NL ',
'3039CG',
'0104667411'));

dbms_output.put_line(ImportWinkel('Rotterdam Schiebroek',
'Peppelweg ',
'93 A',
'ROTTERDAM ',
'NL ',
'3053GE',
'0102184703'));

dbms_output.put_line(ImportWinkel('Rotterdam Vuurplaat',
'Vuurplaat ',
'328-330',
'ROTTERDAM ',
'NL ',
'3071AR',
'0102150370'));

dbms_output.put_line(ImportWinkel('Rotterdam Zevenkamp',
'Zevenkampsering, ',
'303 B',
'ROTTERDAM ',
'NL ',
'3068HG',
'0102205151'));

dbms_output.put_line(ImportWinkel('Rotterdam Zuidplein',
'Zuidplein ',
'117',
'Rotterdam ',
'NL ',
'3083CN',
'0103100700 '));


dbms_output.put_line(ImportWinkel('Amersfoort',
'Prinses Julianaplein ',
'3',
'AMERSFOORT ',
'NL ',
'3811NM',
'0334220422'));

dbms_output.put_line(ImportWinkel('Amersfoort Vathorst',
'Wouda ',
'11',
'AMERSFOORT ',
'NL ',
'3825MA',
'0332588883'));

dbms_output.put_line(ImportWinkel('Bussum',
'De Clinge ',
'1',
'BUSSUM ',
'NL ',
'1401EV',
'0356914377'));

dbms_output.put_line(ImportWinkel('De Meern',
'Albanusweg ',
'137',
'De Meern ',
'NL ',
'3453HA',
'0306667737'));

dbms_output.put_line(ImportWinkel('Hilversum',
'Havenstraat ',
'12',
'HILVERSUM ',
'NL ',
'1211KL',
'0356289888'));

dbms_output.put_line(ImportWinkel('Houten',
'Lange Schaft ',
'13b',
'HOUTEN ',
'NL ',
'3991AP',
'0306390830'));

dbms_output.put_line(ImportWinkel('Maarssen',
'Bisonspoor ',
'1190',
'MAARSSEN ',
'NL ',
'3605KX',
'0346283008'));

dbms_output.put_line(ImportWinkel('Nieuwegein',
'Nedereindseweg ',
'7',
'NIEUWEGEIN ',
'NL ',
'3438AA',
'0306072727'));

dbms_output.put_line(ImportWinkel('Soest',
'Steenhoffstraat ',
'16',
'SOEST ',
'NL ',
'3764BL',
'0356921783'));

dbms_output.put_line(ImportWinkel('Utrecht Adelaarstraat',
'Adelaarstraat ',
'69',
'UTRECHT ',
'NL ',
'3514CC',
'0302430777'));

dbms_output.put_line(ImportWinkel('Utrecht Marnixlaan',
'Marnixlaan ',
'21',
'UTRECHT ',
'NL ',
'3552HB',
'0302452170'));

dbms_output.put_line(ImportWinkel('Utrecht Rijnlaan',
'Rijnlaan ',
'6a',
'UTRECHT ',
'NL ',
'3522BN',
'0302888712'));

dbms_output.put_line(ImportWinkel('Veenendaal',
'Nieuweweg ',
'87',
'Veenendaal ',
'NL ',
'3905LH',
'0318517055'));

dbms_output.put_line(ImportWinkel('Woerden',
'Leidsestraatweg ',
'12',
'WOERDEN ',
'NL ',
'3443BV',
'0348411194'));

dbms_output.put_line(ImportWinkel('Zeist',
'Montaubanstraat ',
'251',
'ZEIST ',
'NL ',
'3701HN',
'0306932266 '));

dbms_output.put_line(ImportWinkel('Goes',
'Zusterstraat ',
'7',
'GOES ',
'NL ',
'4461JA',
'0113748110'));

dbms_output.put_line(ImportWinkel('Middelburg',
'Pottenbakkerssingel ',
'10',
'MIDDELBURG ',
'NL ',
'4331NA',
'0118673040'));

dbms_output.put_line(ImportWinkel('Terneuzen',
'Axelsestraat ',
'68',
'TERNEUZEN ',
'NL ',
'4537AL',
'0115622220'));

dbms_output.put_line(ImportWinkel('Vlissingen',
'Badhuisstraat ',
'1',
'VLISSINGEN',
'NL ',
'4381LM',
'0118430334 '));

dbms_output.put_line(ImportWinkel('Alphen aan den Rijn',
'Concertweg ',
'5',
'ALPHEN AAN DEN RIJN ',
'NL ',
'2402JG',
'0172417327'));

dbms_output.put_line(ImportWinkel('Barendrecht',
'tVlak',
'10',
'BARENDRECHT',
'NL ',
'2991EP',
'0180439004'));

dbms_output.put_line(ImportWinkel('Berkel en Rodenrijs',
'Wilhelminastraat',
'14',
'BERKEL EN RODENRIJS ',
'NL ',
'2651DL',
'0105110002'));



dbms_output.put_line(ImportWinkel('Capelle a/d Yssel',
'Slotplein',
'22',
'Capelle aan den IJssel',
'NL ',
'2902HP',
'0104502373'));


dbms_output.put_line(ImportWinkel('Delft Binnenwatersloot',
'Binnenwatersloot ',
'12a',
'Delft ',
'NL ',
'2611BK',
'0152148124'));

dbms_output.put_line(ImportWinkel('Delft Papsouwselaan',
'Papsouwselaan ',
'123b',
'Delft ',
'NL ',
'2624AK',
'0152855666'));

dbms_output.put_line(ImportWinkel('Dordrecht Bamendaweg',
'Bamendaweg ',
'40',
'DORDRECHT ',
'NL ',
'3319GS',
'0786219200'));

dbms_output.put_line(ImportWinkel('Dordrecht Van Oldenbarneveltplein',
'Van Oldenbarneveltplein ',
'73',
'DORDRECHT ',
'NL ',
'3317ES',
'0786515230'));

dbms_output.put_line(ImportWinkel('Gorinchem',
'Kazerneplein ',
'21',
'GORINCHEM ',
'NL ',
'4201MB',
'0183653070'));

dbms_output.put_line(ImportWinkel('Gouda',
'Van Hogendorpplein ',
'21',
'GOUDA ',
'NL ',
'2805BM',
'0182551110'));


dbms_output.put_line(ImportWinkel('Hellevoetsluis',
'Westkade ',
'45',
'HELLEVOETSLUIS ',
'NL ',
'3221AV',
'0181338807'));

dbms_output.put_line(ImportWinkel('Leiden',
'Stationsweg ',
'17',
'LEIDEN ',
'NL ',
'2312AS',
'0715141428'));

dbms_output.put_line(ImportWinkel('Leiderdorp',
'Laan van Berendrecht ',
'11a',
'LEIDERDORP',
'NL ',
'2352VR',
'0712100240'));

dbms_output.put_line(ImportWinkel('Leidschendam',
'Damplein ',
'16',
'LEIDSCHENDAM ',
'NL ',
'2265AC',
'0703275959'));

BEGIN
dbms_output.put_line(ImportWinkel('Maassluis',
'P.C. Hooftlaan',
'8',
'MAASSLUIS ',
'NL ',
'3142GH',
'0102540555'));
END;

dbms_output.put_line(ImportWinkel('Naaldwijk',
's-Gravenzandseweg',
'18',
'NAALDWIJK ',
'NL ',
'2671JN',
'0174200000'));



dbms_output.put_line(ImportWinkel('Nootdorp',
'Koningin Julianastraat ',
'24',
'Nootdorp ',
'NL ',
'2631BM',
'0153109491'));

dbms_output.put_line(ImportWinkel('Oud Beijerland',
'Beijersehof',
'3',
'Oud Beijerland ',
'NL ',
'3262VR',
'0186610050'));


dbms_output.put_line(ImportWinkel('Papendrecht',
'P S Gerbrandystraat ',
'64',
'PAPENDRECHT',
'NL ',
'3354BW',
'0786416666'));


dbms_output.put_line(ImportWinkel('Ridderkerk',
'Irisstraat ',
'4',
'Ridderkerk ',
'NL',
'2981BN',
'0180497527'));

dbms_output.put_line(ImportWinkel('Rijswijk',
'GeneraalEisenhouwerplein',
'4',
'RIJSWIJK ',
'NL ',
'2284XV',
'0703948039'));

dbms_output.put_line(ImportWinkel('Schiedam',
'Oranjestraat ',
'7',
'SCHIEDAM ',
'NL',
'3111AM',
'0104269414'));

dbms_output.put_line(ImportWinkel('Spijkenisse',
'Gorsstraat ',
'16',
'SPIJKENISSE ',
'NL ',
'3201DB',
'0181619000'));

dbms_output.put_line(ImportWinkel('Vlaardingen',
'Van Hogendorplaan ',
'19a',
'VLAARDINGEN ',
'NL ',
'3135BB',
'0104719877'));

dbms_output.put_line(ImportWinkel('Voorburg',
'Koningin Julianalaan ',
'234',
'VOORBURG ',
'NL ',
'2274JR',
'0703864044'));

dbms_output.put_line(ImportWinkel('Voorschoten',
'Planciusplantsoen ',
'26b',
'VOORSCHOTEN ',
'NL ',
'2253TS',
'0715762211'));

dbms_output.put_line(ImportWinkel('Wassenaar',
'Oostdorperweg ',
'37',
'WASSENAAR ',
'NL ',
'2242NE',
'0705115556'));

dbms_output.put_line(ImportWinkel('Zoetermeer',
'van Leeuwenhoeklaan ',
'10',
'ZOETERMEER ',
'NL ',
'2713RB',
'0793160211'));

dbms_output.put_line(ImportWinkel('Zwijndrecht',
'Burgemeester Jansenlaan ',
'49',
'ZWIJNDRECHT ',
'NL ',
'3331HD',
'0786126131'));
END;

--select * FROM WINKEl;