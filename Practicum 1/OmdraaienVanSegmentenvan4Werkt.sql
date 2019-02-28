CREATE OR REPLACE FUNCTION AchtersteVoren(
    StudentNumber IN VARCHAR2) -- Studentnumber Varchar2 IN , Nieuwstudentnumber omgedraaid Varchar2 OUT
  RETURN VARCHAR2
IS
  NieuwStudentNumber VARCHAR2(100) ;
  Teller             INTEGER;
  Spatie             INTEGER DEFAULT 0 ;
BEGIN
  FOR Teller IN 1 .. CEIL(LENGTH(StudentNumber)/4) -- Pakt de 1/4 van de lengte en rond deze af naar boven
  LOOP
    IF Teller             = CEIL(LENGTH(StudentNumber)/4) THEN
      NieuwStudentNumber :=SUBSTR(StudentNumber, (4   *(Teller-1)+1)+Spatie ,4)|| NieuwStudentNumber; -- 4*(teller-1) is voor index
      Spatie             := Spatie                    + 1;
    ELSE
      NieuwStudentNumber :=SUBSTR(StudentNumber, (4*(Teller-1)+1)+Spatie ,4)||' '|| NieuwStudentNumber; -- 4*(teller-1) is voor index
      Spatie             := Spatie                 + 1;
    END IF;
  END LOOP;
RETURN NieuwStudentNumber;
END;