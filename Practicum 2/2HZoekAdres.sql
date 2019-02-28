CREATE OR REPLACE PROCEDURE zoekAdres( -- IN Varchar2 , OUT Varchar2
    v_StraatNaam OUT VARCHAR2,
    v_Huisnummer  IN OUT VARCHAR2,
    v_Toevoeging  IN OUT VARCHAR2,
    v_Postcode    IN OUT VARCHAR2,
    v_Woonplaats  OUT    VARCHAR2,
    v_land        OUT    VARCHAR2,
    v_Postcode_id OUT    VARCHAR2 )
AS
  v_CheckBestaan VARCHAR2(255);
  v_IsHetMixed   VARCHAR2(255);
  e_Combinatie   EXCEPTION;
  -- Haalt alle postcodes op die gelijk zijn aan de ingevoerde postcode
  CURSOR Postcodes
  IS
    SELECT * FROM Postcode WHERE postcode = v_postcode;
BEGIN
  v_land := 'NL';
  -- Selecteert het type huisnummer
  SELECT numbertype INTO V_IsHetMixed FROM postcode WHERE postcode = v_Postcode;
  IF V_IsHetMixed = 'even' AND MOD(TO_NUMBER(v_Huisnummer),2) <> 0 THEN
    dbms_output.put_line('het hoort even te zijn');
  ELSIF V_IsHetMixed = 'odd' AND MOD(TO_NUMBER(v_Huisnummer),2) <> 1 THEN
    dbms_output.put_line('het hoort oneven te zijn');
  END IF;
  -- Controleert de combinatie postcodes in de postcodetabel
  FOR Postcode IN Postcodes
  LOOP
    IF Postcode.postcode = v_Postcode AND v_Huisnummer BETWEEN Postcode.minnumber AND Postcode.maxnumber AND Postcode.numbertype = V_IsHetMixed THEN
      v_StraatNaam      := postcode.street;
      v_woonplaats      := postcode.city;
      v_Postcode_id     := postcode.id;
    ELSE
      raise e_combinatie;
    END IF;
  END LOOP;
EXCEPTION
  WHEN no_data_found THEN
  raise_application_error(-20000,'Er zijn foute waardes ingevoerd');
  WHEN e_combinatie THEN
  raise_application_error(-20000,'De combinatie klopt niet');
END;


/
/*SET SERVEROUTPUT ON;
DECLARE
  ipostcode     VARCHAR2(6) := '1234AA';
  huisnr        NUMBER := 23;
  toevoeging    VARCHAR2(5) := '';
  ID            postcode.id%type;
  straat        postcode.street%type;
  woonplaats    postcode.city%type;
  land          VARCHAR2(20);
BEGIN
  zoekAdres(straat, huisnr, toevoeging, ipostcode, woonplaats, land, ID);
  DBMS_OUTPUT.PUT_LINE(iPostcode || ' ' || huisnr || ' ' || toevoeging || ' ' || ID || ' ' || straat || ' ' || woonplaats || ' ' || land);
END;*/