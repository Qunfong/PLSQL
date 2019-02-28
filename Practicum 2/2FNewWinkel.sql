CREATE OR REPLACE FUNCTION NieuwWinkel(  -- IN Varchar2 , OUT Varchar2
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
  e_Combinatie     EXCEPTION ;
BEGIN
  -- Het winkel_id wat d.m.v sequence wordt aangeroepen
  v_winkel_id      := winkel_fcseq.nextval;
  v_Postcode_id_fk := '122';
  -- creeërt postcode_id d.m.v laatste 2 tekens
  V_Postcode_id := V_Postcode_id ||ASCII(SUBSTR(v_postcode,LENGTH(v_postcode)-1,1));
  V_Postcode_id := TO_CHAR(SUBSTR(v_postcode,1,4) || V_Postcode_id || ASCII(SUBSTR(v_postcode,LENGTH(v_postcode),1)));
  -- maakt van alle steden met hoofdletters alleen de eerste met hoofdletter
  dbms_output.put_line(v_Postcode_id ||'        ' || v_winkel_id);
  v_Stad := InitCap(LOWER(v_Stad));
  -- maakt s gravenhagen met kleine letter s
  IF v_Stad          = '''S-Gravenhage' THEN
    v_Stad          := '''s-Gravenhage';
  ELSIF v_Stad       = 'Bergen Op Zoom' THEN
    v_Stad          := 'Bergen op Zoom';
  ELSIF v_Stad       = '''S-Hertogenbosch' THEN
    v_Stad          := '''s-Hertogenbosch';
  ELSIF v_Stad       ='Etten Leur' THEN
    v_Stad          := 'Etten-Leur';
  ELSIF v_Stad       ='De Plaetse' THEN
    v_Stad          :='de Plaetse';
  ELSIF v_Stad       ='Ijmuiden' THEN
    v_Stad          :='IJmuiden';
  ELSIF v_StraatNaam = 'Zevenkampsering,' THEN
    v_StraatNaam    := 'Zevenkampse Ring';
  ELSIF v_Stad       = 'Alphen Aan Den Rijn' THEN
    v_Stad          := 'Alphen aan den Rijn';
  ELSIF v_Straatnaam = 'tVlak' THEN
    v_Straatnaam    := '''t Vlak';
  ELSIF v_Stad       = 'Berkel En Rodenrijs' THEN
    v_Stad          := 'Berkel en Rodenrijs';
  END IF;
IF v_Stad          = 'HoogvlietRotterdam' THEN
  v_Stad          :='Hoogvliet Rotterdam';
ELSIF v_Stad       = 'Capelle Aan Den Ijssel' THEN
  v_Stad          :='Capelle aan den IJssel';
ELSIF v_StraatNaam = 'Van Hogendorpplein' THEN
  v_StraatNaam    := 'van Hogendorpplein';
ELSIF v_StraatNaam = 'P.C.Hooftlaan' THEN
  v_StraatNaam    := 'P.C. Hooftlaan';
ELSIF v_StraatNaam = 's-Gravenzandseweg' THEN
  v_StraatNaam    :='''s-Gravenzandseweg';
ELSIF v_Stad       = 'Oud Beijerland' THEN
  v_Stad          := 'Oud-Beijerland';
ELSIF v_StraatNaam = 'P S Gerbrandystraat' THEN
  v_StraatNaam    := 'P.S. Gerbrandystraat';
ELSIF v_StraatNaam = 'GeneraalEisenhouwerplein' THEN
  v_StraatNaam    := 'Generaal Eisenhowerplein';
ELSIF v_Straatnaam = 'Van Hogendorplaan' THEN
  v_Straatnaam    := 'van Hogendorplaan';
ELSIF v_Straatnaam = 'van Leeuwenhoeklaan' THEN
  v_Straatnaam    := 'Van Leeuwenhoeklaan';
END IF;
-- Dit haalt alle huisnummers met een '-' of '/' uit elkaar
FOR i IN 1..LENGTH(v_Huisnummer)
LOOP
  v_CheckTeken      := SUBSTR(v_Huisnummer,i,1);
  IF v_CheckTeken    = '/' OR v_CheckTeken = '-' THEN
    v_HuisnummerMin := SUBSTR(v_Huisnummer,0,i-1);
    v_HuisnummerMax := SUBSTR(v_Huisnummer,i  +1);
  END IF;
END LOOP;
dbms_output.put_line('de ascii test    '|| ASCII(v_Huisnummer) || 'normale huisnummer   ' || v_Huisnummer);
dbms_output.put_line('v_huisnummermax en min :       '|| v_HuisnummerMin ||'    '|| v_HuisnummerMax);
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
dbms_output.put_line('Huisnummer' || ' : '|| v_HuisnummerTest ||'HuisnummerMin   :'|| v_HuisnummerMin || '   v_Huisnummermax :'||v_HuisnummerMax || '  Toevoeging  : '||v_Toevoeging);
--dbms_output.put_line(V_Naam ||'        '||v_Straatnaam||'        '||v_Huisnummer||'         '||
--v_Stad||'       '||v_Landcode||'       '||v_Postcode||'    '||TelefoonNummer);
IF v_HuisnummerMin IS NOT NULL THEN
  v_Huisnummer     := v_HuisnummerMin;
ELSE
  v_Huisnummer := v_HuisnummerTest;
END IF;
IF v_toevoeging IS NULL THEN
  v_toevoeging  := 'geen';
END IF;
dbms_output.put_line(' winkelid : ' || v_winkel_id ||' postcodeidfk' ||v_Postcode_id_fk||'naam  : '||v_Naam||'postcode  : '||v_Postcode||'postcode_id   : '|| V_Postcode_id||'Huisnummer  : '|| v_Huisnummer || 'Toevoeging :  '|| v_Toevoeging || 'Telefoonnummer :  ' || v_TelefoonNummer || 'opgeheven :  ' || 'N');
INSERT
INTO WINKEL VALUES
  (
    v_winkel_id,
    v_Postcode_id_fk,
    v_Naam,
    v_Postcode,
    V_Postcode_id,
    v_Huisnummer,
    v_Toevoeging,
    v_TelefoonNummer,
    0
  );
updateWinkelPostcodeID();
SELECT postcode_id_fk
INTO v_CheckPenH
FROM WINKEL
WHERE postcode = v_Postcode
AND huisnr     = v_Huisnummer;
dbms_output.put_line('straatnaam : '|| v_StraatNaam || 'City :  '|| v_Stad || 'postcode  : '|| v_postcode);
SELECT id
INTO v_CheckSenW
FROM POSTCODE
WHERE street = v_StraatNaam
AND city     = v_Stad
AND postcode = v_postcode;
-- checkt de informatie van postcode huisnummer en straat woonplaats
IF v_CheckPenH = v_CheckSenW THEN
  dbms_output.put_line('de combi postcode huisnummer / straat woonplaats klopt');
ELSE
  raise e_Combinatie;
END IF;
RETURN NULL;
EXCEPTION 
    WHEN e_Combinatie THEN
      raise_application_error(-20000,'De combinatie klopt niet');
END;