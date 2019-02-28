CREATE OR REPLACE FUNCTION DeRestDeling(
    StudentNumber VARCHAR2) --Varchar2 Studentnumber IN, Modulo Varchar2 OUT
  RETURN VARCHAR2
IS
  NieuweVarcharStudentNumber VARCHAR2(50) DEFAULT NULL;
  EersteHelft                VARCHAR2(30);
  TweedeHelft                VARCHAR2(30);
  EersteModulo               VARCHAR2(10);
  TweedeModulo               VARCHAR2(10);
BEGIN
  EersteHelft     := SUBSTR(StudentNumber,1,FLOOR(LENGTH(studentNumber)/2)); -- Pakt de helft van de lengte, hij pakt vanaf het begin de string tot de helft en dit rond hij af naar beneden
  TweedeHelft     := SUBSTR(StudentNumber,LENGTH(EersteHelft)          +1);  -- hetzelfde als Eerstehelft maar dan voor het einde
  EersteModulo    := MOD(EersteHelft,62);                                    -- Hij pakt de modulo van het getal
  TweedeModulo    := MOD(EersteModulo || TweedeHelft,62);                    -- Dit plakt hij aan de tweede helft en rekent daarvan de modulo
  IF(TweedeModulo <= 9)                                                      -- als het restgetal kleiner is dan 9 dan wordt er een 0 aan toegevoegd
    THEN
    NieuweVarcharStudentNumber := '0' || TweedeModulo;
  ELSE
    NieuweVarcharStudentNumber := TweedeModulo;
  END IF;
RETURN NieuweVarcharStudentNumber;
END;
/