CREATE OR REPLACE FUNCTION Verhuizen(    -- IN Varchar2, OUT Varchar2
    Naam           IN VARCHAR2,
    StraatNaam     IN VARCHAR2 ,
    Huisnummer     IN VARCHAR2,
    Stad           IN VARCHAR2,
    Landcode       IN VARCHAR2,
    Postcode       IN VARCHAR2,
    TelefoonNummer IN VARCHAR2 )
  RETURN VARCHAR2
AS
  v_Naam           VARCHAR2(255) := TRIM(' ' FROM Naam) ;
  v_StraatNaam     VARCHAR2(255) := TRIM(' ' FROM StraatNaam);
  v_Huisnummer     VARCHAR2(255) := TRIM(' ' FROM Huisnummer);
  v_HuisnummerTest VARCHAR2(255) ;
  v_CheckTeken     VARCHAR2(255) DEFAULT NULL;
  v_Stad           VARCHAR2(255) := TRIM(' ' FROM Stad);
  v_Landcode       VARCHAR2(255) := TRIM(' ' FROM Landcode);
  v_Postcode       VARCHAR2(255) := TRIM(' ' FROM Postcode);
  v_TelefoonNummer VARCHAR2(255) := TRIM('-' FROM (TRIM(' ' FROM TelefoonNummer)));
  v_Postcode_id    VARCHAR2(255) ;
  v_Toevoeging     VARCHAR2(255) ;
  v_HuisnummerMax  VARCHAR2(255) DEFAULT NULL;
  v_HuisnummerMin  VARCHAR2(255) DEFAULT NULL;
  v_postcode_id_fk VARCHAR2(255) DEFAULT NULL;
  v_winkel_id      VARCHAR2(255) DEFAULT NULL;
  v_CheckPenH      VARCHAR2(255) ;
  v_CheckSenW      VARCHAR2(255) ;
BEGIN
 -- Maakt v_postcode_id d.m.v ascii
  V_Postcode_id      := V_Postcode_id ||ASCII(SUBSTR(v_postcode,LENGTH(v_postcode)-1,1));
  V_Postcode_id      := TO_CHAR(SUBSTR(v_postcode,1,4) || V_Postcode_id || ASCII(SUBSTR(v_postcode,LENGTH(v_postcode),1)));
  IF v_HuisnummerMin IS NULL AND v_HuisnummerMax IS NULL --een methode om letters te checken   --(TO_CHAR(ASCII(v_Huisnummer)) <> v_Huisnummer)
    THEN
    FOR i IN 1..LENGTH(v_Huisnummer)
    LOOP
      v_CheckTeken := SUBSTR(v_Huisnummer,i,1);
      IF v_CheckTeken BETWEEN '0' AND '9' THEN
        v_HuisnummerTest := v_HuisnummerTest || v_Checkteken;
      ELSE
        v_Toevoeging := v_CheckTeken;
      END IF;
    END LOOP;
  END IF;
-- update winkel met de nieuwe waardes
UPDATE WINKEL
SET naam         = v_Naam,
  postcode       = v_Postcode,
  Postcode_id    = V_Postcode_id,
  huisnr         = v_Huisnummer ,
  toevoeging     = v_Toevoeging ,
  telNr          = v_TelefoonNummer,
  postcode_id_fk = v_postcode_id_fk
WHERE winkel.id  = v_winkel_id;
updateWinkelPostcodeID();
END;