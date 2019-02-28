CREATE OR REPLACE FUNCTION Getal(
    StudentNumber VARCHAR2) -- Er komt een Varchar2 Studentnumber IN en er gaat een Varchar2 OUT
  RETURN VARCHAR2
IS
type alfabetsarray IS VARRAY(26) OF CHAR(1);
type waardeLetter IS  VARRAY(26) OF INTEGER;
Letters alfabetsarray;
Waarde waardeLetter;
Totaalgetal VARCHAR2(100) DEFAULT '';
total       CHAR(2);
BEGIN
  Letters := alfabetsarray('A', 'B', 'C', 'D', 'E','F','G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P','Q', 'R', 'S', 'T','U','V','W','X','Y','Z'); -- maakt array voor alfabet
  Waarde  := waardeLetter(16, 17, 18, 19, 20, 21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41);                                       -- maakt array met getallen evenlang als alfabet
  <<outer_loop>>
  FOR i IN 1..LENGTH(StudentNumber) -- laat de outer_loop lopen tot de lengte van het studentnummer
  LOOP
    total := SUBSTR(StudentNumber,i,1); -- loopt het studentnummer af
    <<inner_loop>>
    FOR j IN 1..Letters.COUNT
    LOOP
      IF Letters(j) = total -- haalt de index op van de letters
        THEN
        total := Waarde(j); -- haalt het cijfer wat bij de letter hoort
      ELSE
        total := total;
      END IF;
    END LOOP inner_loop;
    Totaalgetal := Totaalgetal||total;
    Totaalgetal := TO_CHAR(Totaalgetal);
  END LOOP outer_loop;
RETURN Totaalgetal;
END;