CREATE OR REPLACE FUNCTION MaakUnicode(
    StudentNumber VARCHAR2) --Varchar2 Studentnumber IN , Varchar2 Universiteitscode OUT
  RETURN VARCHAR2
IS
  Letter  CHAR(1);
  UniCode VARCHAR2(5);
  Positie NUMBER DEFAULT 0;
BEGIN
  UniCode := SUBSTR(StudentNumber,INSTR(Studentnumber,' ',-1)+1); -- pakt studentnummer, -1 zoekt vanaf achter, je vindt de laatste spatie en lees vanaf dan
  RETURN UniCode;
END;