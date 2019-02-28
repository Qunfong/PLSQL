
CREATE OR REPLACE FUNCTION zoekWinkelsInProvincie( -- IN Varchar2 , OUT Varchar2
    Provincie IN VARCHAR2 )
  RETURN SYS_REFCURSOR
AS
  Winkels sys_refcursor;
BEGIN
  -- zoekt alle winkelnamen voor de ingevoerde postcode
  OPEN winkels FOR SELECT Winkel.naam FROM Winkel INNER JOIN POSTCODE ON winkel.postcode_id_fk = postcode.id WHERE postcode.province_code = Provincie;
  RETURN Winkels;
END;
DECLARE
  emp_refcur_local SYS_REFCURSOR;
  winkelnaam VARCHAR2(255);
  provincie  VARCHAR2(255) := 'NB';
BEGIN
  --Calling the function using parameters
  emp_refcur_local:=zoekWinkelsInProvincie(provincie);
  LOOP
    FETCH emp_refcur_local INTO winkelnaam;
    EXIT
  WHEN emp_refcur_local%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('winkels :  '||winkelnaam);
  END LOOP;
END;
