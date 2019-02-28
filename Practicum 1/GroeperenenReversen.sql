CREATE OR REPLACE FUNCTION ReverseString(
    StudentNumber IN VARCHAR2) -- Studentnumber Varchar2 IN, Omgedraaide Studentnumber Varchar2 OUT
  RETURN VARCHAR2
IS
  NieuwStudentNumber         VARCHAR2(50) ;
  Teller                     INTEGER;
  Letter                     CHAR(1) DEFAULT 'x';
  indexwanneerjemoetreversen NUMBER(3) DEFAULT 2;
  Gedeelte                   VARCHAR2(80) DEFAULT 'test';
  BeginIndex                 NUMBER(38) DEFAULT 1;
  Totaal                     VARCHAR2(80);
BEGIN
  FOR Teller IN REVERSE 1 .. LENGTH(StudentNumber)
  LOOP
    NieuwStudentNumber := NieuwStudentNumber || SUBSTR(StudentNumber, Teller,1);
  END LOOP;
--<<outer_loop>>
FOR i IN 1 .. LENGTH(NieuwStudentNumber)
LOOP
  Letter                       := SUBSTR(NieuwStudentNumber,i,1);
  IF Letter                     =' ' THEN
    indexwanneerjemoetreversen := i-1;
    Gedeelte                   := SUBSTR(NieuwStudentNumber,BeginIndex,indexwanneerjemoetreversen);
    BeginIndex                 := BeginIndex + i; --hier gaat iets mis
    --inner_loop>>
    FOR j IN REVERSE 1..LENGTH(Gedeelte)
    LOOP
      Totaal := Totaal || SUBSTR(Gedeelte,j,1);
    END LOOP; --inner_loop;
  END IF;
END LOOP; --outer_loop;
--dbms_output.put_line(NieuwStudentNumber);
dbms_output.put_line(totaal);
RETURN Totaal;
END;
--show error function ReverseString;