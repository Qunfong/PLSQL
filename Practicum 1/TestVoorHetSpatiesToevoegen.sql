CREATE OR REPLACE FUNCTION MaakSpaties(
    StudentNumber VARCHAR2) -- Varchar2 Studentnumber IN, Varchar2 elke 4 tekens een spatie OCUT
  RETURN VARCHAR2
IS
  Letter           CHAR(1);
  ISIN             VARCHAR2(80);
  NewStudentNumber VARCHAR2(80) := 'iets';
BEGIN
  NewStudentNumber := regexp_replace(StudentNumber,'[[:space:]]*','');
  FOR i IN 1 .. LENGTH(NewStudentNumber)
  LOOP
    Letter     := SUBSTR(NewStudentNumber,i,1);
    IF MOD(i,4) = 0 --Checkt voor 4 letters nadat newstudentnummer uit alleen maar getallen bestaat
      THEN
      IF i    = LENGTH(NewStudentNumber) AND MOD(i,4) = 0 THEN
        ISIN := ISIN || Letter;
      ELSE
        ISIN := ISIN || Letter || ' '; -- als er 4 letters zijn dan voegt hij een spatie toe
      END IF;
    ELSE
      ISIN := ISIN || Letter;
    END IF;
  END LOOP;
RETURN ISIN;
END;