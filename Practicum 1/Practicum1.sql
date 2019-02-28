-- Zet de server output aan
set serveroutput on

-- TOEGEVOEGD DOOR NICO KUIJPERS
@MaakLandcode.sql
@MaakUniCode.sql
@LetterNaarGetalDITWERKT.sql
@OmdraaienVanSegmentenvan4Werkt.sql
@TestVoorHetSpatiesToevoegen.sql
@DeRestDelinV2g.sql

-- Maak de landen tabel
CREATE TABLE Country
(
  ID NUMBER PRIMARY KEY,
  Code VARCHAR2(3) UNIQUE NOT NULL,
  Name VARCHAR2(50) UNIQUE NOT NULL
);

-- Maak de universiteiten tabel
CREATE TABLE University
(
  ID NUMBER PRIMARY KEY,
  Code VARCHAR2(4) UNIQUE NOT NULL,
  CountryID NUMBER NOT NULL,
  Name VARCHAR2(100) NOT NULL,
  SNL NUMBER NOT NULL,
  FOREIGN KEY (CountryID) REFERENCES Country(ID)
);

-- Voeg wat landen toe
INSERT INTO Country VALUES (1, 'NL', 'The Netherlands');
INSERT INTO Country VALUES (2, 'FR', 'France');
INSERT INTO Country VALUES (3, 'DE', 'Germany');
INSERT INTO Country VALUES (4, 'GB', 'United Kingdom');
INSERT INTO Country VALUES (5, 'BE', 'Belgium');
INSERT INTO Country VALUES (6, 'US', 'United States of America');
INSERT INTO Country VALUES (7, 'CA', 'Canada');

-- Universiteiten in Gelderland
INSERT INTO University VALUES (0, 'TUA',   1, 'Theologische Universiteit Apeldoorn', 8);
INSERT INTO University VALUES (1, 'RUN',   1, 'Radboud Universiteit Nijmegen', 10);
INSERT INTO University VALUES (2, 'WUR',   1, 'Wageningen Universiteit', 10);

-- Universiteiten in Groningen
INSERT INTO University VALUES (3, 'RUG',   1, 'Rijksuniversiteit Groningen', 7);

-- Universiteiten in Limburg
INSERT INTO University VALUES (4, 'UM',    1, 'Universiteit Maastricht', 8);
INSERT INTO University VALUES (5, 'OU',    1, 'Open Universiteit', 7);
INSERT INTO University VALUES (6, 'MSM',   1, 'Maastricht School of Management', 10);

-- Universiteiten in Noord-Brabant
INSERT INTO University VALUES (7, 'TUE',   1, 'Technische Universiteit Eindhoven', 9);
INSERT INTO University VALUES (8, 'TIU',   1, 'Universiteit van Tilburg', 9);

-- Universiteiten in Noord-Holland
INSERT INTO University VALUES (9, 'UVA',   1, 'Universiteit van Amsterdam', 10);
INSERT INTO University VALUES (10, 'VU',   1, 'Vrije Universiteit', 9);

-- Universiteiten in Overijssel
INSERT INTO University VALUES (11, 'PTHU', 1, 'Protestantse Theologische Universiteit vestiging Kampen', 7);
INSERT INTO University VALUES (12, 'TUK',  1, 'Theologische Universiteit Kampen', 6);
INSERT INTO University VALUES (13, 'UT',   1, 'Universiteit Twente', 7);

-- Universiteiten in Utrecht
INSERT INTO University VALUES (14, 'UU',   1, 'Universiteit Utrecht', 8);
INSERT INTO University VALUES (15, 'NBU',  1, 'Nyenrode Business Universiteit', 10);
INSERT INTO University VALUES (16, 'UVH',  1, 'Universiteit voor Humanistiek', 6);
INSERT INTO University VALUES (17, 'KTU',  1, 'Katholieke Theologische Universiteit', 6);
INSERT INTO University VALUES (18, 'TIAS', 1, 'TiasNimbas Business School', 7);

-- Universiteiten in Zeeland
INSERT INTO University VALUES (19, 'UCR',  1, 'University College Roosevelt', 7);

-- Universiteiten in Noord-Holland
INSERT INTO University VALUES (20, 'TUD',  1, 'Technische Universiteit Delft', 9);
INSERT INTO University VALUES (21, 'UL',   1, 'Universiteit Leiden', 10);
INSERT INTO University VALUES (22, 'RUR',  1, 'Erasmus Universiteit Rotterdam', 10);
INSERT INTO University VALUES (23, 'UOPX', 6 , 'University of Phoenix', 30);

-- Een functie om een International Student Identification Number (ISIN) te genereren
CREATE OR REPLACE FUNCTION generateISIN(
    countryCode Country.Code%TYPE,
    universityCode University.Code%TYPE,
    studentNumber VARCHAR2 )
  RETURN VARCHAR2
AS
  newStudentNumber VARCHAR2(70) := '';
BEGIN
  newStudentNumber := countryCode || studentNumber;
  --dbms_output.put_line(newStudentNumber);
  newStudentNumber := universityCode || newStudentNumber;
  --dbms_output.put_line(newStudentNumber);
  --dbms_output.put_line(MaakSpaties(Getal(newStudentNumber)));
  newStudentNumber := regexp_replace(AchtersteVoren(MaakSpaties(Getal(newStudentNumber))),'[[:space:]]*','');
  --dbms_output.put_line(newStudentNumber);
  --dbms_output.put_line(DeRestDeling(newStudentNumber));
  newStudentNumber := countryCode||' '||MaakSpaties(studentNumber||DeRestDeling(newStudentNumber))||' '||universityCode;
  dbms_output.put_line(newStudentNumber);
EXCEPTION -- hier geef ik aan welke foutmelding de exceptions moeten geven
WHEN OTHERS THEN
  raise_application_error(-20000,'er is iets fout gegaan');
  RETURN newStudentNumber;
END;
/
-- Een functie die controleert of een gegeven ISIN voldoet aan de eisen
CREATE OR REPLACE FUNCTION checkForCorrectness(
    ISIN VARCHAR2)
  RETURN INTEGER
AS
  Landcode          VARCHAR2(10);
  UniCode           VARCHAR2(10);
  SNL               VARCHAR2(100);
  CountryCodeId     VARCHAR2(100);
  studentNumber     VARCHAR2(100);
  OudeISIN          VARCHAR2(100);
  isCorrect         INTEGER := 1;
  CheckISIN         VARCHAR2(100);
  FormatException   EXCEPTION;
  LengthException   EXCEPTION;
  LandcodeException EXCEPTION;
  UniCodeException  EXCEPTION;
BEGIN
  CheckISIN := ISIN;
  OudeISIN  := ISIN;
  Landcode  := MaakLandcode(ISIN);
  UniCode   := MaakUnicode(ISIN);
  IF NOT REGEXP_LIKE(ISIN,'^[A-Z]{2}\s([0-9]{4}\s){1,8}([0-9]{1,4})\s[A-Z]{2,4}$') -- checkt het format 2 letters, aantal keer groepjes van 4 en het laatste groepje tusen 1-4 en vervolgens 2 tot 4 letters op het einde
    THEN
    raise FormatException; -- gooit een formatexception op als het formaat van het studentnummer niet klopt
    RETURN isCorrect;
  END IF;
SELECT Id --haalt country id op uit Country m.b.v Country.Code
INTO CountryCodeId
FROM Country
WHERE Country.Code = Landcode;
SELECT University.SNL -- haalt de SNL op d.m.v country.code en university.code Dit had ook gekund d.m.v een inner-join
INTO SNL
FROM Country,
  University
WHERE Country.id    = CountryCodeId
AND University.Code = UniCode;
CheckISIN          := REPLACE(CheckISIN,Landcode,NULL); --haalt de landcode uit het nieuwe studentnummer
CheckISIN          := REPLACE(CheckISIN,Unicode,NULL);  -- haalt de Unicode uit het nieuwe studentnummer
CheckISIN          := REPLACE(CheckISIN,' ',NULL);      --haalt de spaties uit het nieuwe studentnummer
dbms_output.put_line(CheckISIN);
CheckISIN := SUBSTR(CheckISIN,1,LENGTH(CheckISIN)-2); -- haalt de checksum er van af
dbms_output.put_line(CheckISIN);
studentNumber := CheckISIN;
IF SNL        != LENGTH(studentNumber) -- checkt lengte met benodigde volgens de database
  THEN
  raise LengthException; -- gooit de lengte exception op als je lengte in de database niet klopt met de lengte van binnenkomende parameter
  RETURN 0;
END IF;
CheckISIN := UniCode || Landcode || CheckISIN;
dbms_output.put_line(CheckISIN);
CheckISIN := regexp_replace(AchtersteVoren(MaakSpaties(Getal(CheckISIN))),'[[:space:]]*','');
dbms_output.put_line(CheckISIN);
CheckISIN := Landcode||' '||MaakSpaties(studentNumber||DeRestDeling(CheckISIN))||' '||UniCode; -- voert generateISIN opnieuw uit en checkt dit met het nieuwe studentnummer
dbms_output.put_line('De nieuwe:   ' || CheckISIN);
dbms_output.put_line('De nieuwe:   ' || OudeISIN);
IF(CheckISIN = OudeISIN) THEN
  isCorrect := 1;
ELSE
  isCorrect := 0;
END IF;
dbms_output.put_line(isCorrect);
RETURN isCorrect;
EXCEPTION -- hier geef ik aan welke foutmelding de exceptions moeten geven
WHEN FormatException THEN
  raise_application_error(-20000,'Format is fout');
WHEN LengthException THEN
  raise_application_error(-20000,'Lengte van het student komt niet overeen met die in de database');
WHEN no_data_found THEN
  raise_application_error(-20000,'De landcode of unicode staat niet in de database');
END;
/
-- Een hulp functie die bij de test cases wordt gebruik
CREATE OR REPLACE PROCEDURE ASSERT_EQUALS (
  actual VARCHAR2,
  expected VARCHAR2
)
AS
BEGIN
  IF (NVL(actual, -1) ^= NVL(expected, -2)) THEN
    RAISE_APPLICATION_ERROR(-20000, 'ASSERT FAILS. ' || actual || ' != ' || expected);
  END IF;
END;
/

-- Test cases
DECLARE
  isCorrect INTEGER := 1;
  aantal INTEGER := 0;
BEGIN
  -- Test de generateISIN() functie
  ASSERT_EQUALS(generateISIN('NL', 'TUE', '123456789'), 'NL 1234 5678 944 TUE');
  
  -- Test een aantal foutief gegenereerde ISIN's
  BEGIN ASSERT_EQUALS(generateISIN('NL', 'TUE', '3216972543'), 'NL 3216 9725 4340 TUE');
    DBMS_OUTPUT.PUT_LINE('ERROR: Incorrect student nummer is verwerkt!');
    EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Verwacht: Student nummer is te lang');
  END;
  -- Test de checkForCorrectness() functie
  --ASSERT_EQUALS(checkForCorrectness('NL 3216 54 TUE'), isCorrect);
  --ASSERT_EQUALS(checkForCorrectness(...
  
  -- Deze twee functies moeten elkaar kunnen verifi?ren
  --ASSERT_EQUALS(checkForCorrectness(generateISIN('NL', 'TUE', 321697254)), isCorrect);
  --ASSERT_EQUALS(checkForCorrectness(...

END;
/

-- TESTEN TOEGEVOEGD DOOR NICO KUIJPERS
@testscriptA.sql
@testscriptB.sql

-- Drop alle tables, functies en procedures weer
DROP TABLE University;
DROP TABLE Country;
DROP FUNCTION generateISIN;
DROP FUNCTION checkForCorrectness;
DROP PROCEDURE ASSERT_EQUALS;