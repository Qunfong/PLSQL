CREATE OR REPLACE FUNCTION MaakLandcode(
    StudentNumber VARCHAR2) --Varchar2 Studentnumber IN , Varchar2 Landcode OUT
  RETURN VARCHAR2
IS
  Letter   CHAR(1);
  Landcode VARCHAR2(2);
BEGIN
  FOR i IN 1 .. LENGTH(StudentNumber)
  LOOP
    IF(SUBSTR(StudentNumber,i,1)) = ' ' THEN
      RETURN Landcode;
    ELSE
      Letter   := SUBSTR(StudentNumber,i,1); -- pakt de eerste 2 letters, dus de landcode
      Landcode := Landcode || Letter;
    END IF;
  END LOOP;
END;