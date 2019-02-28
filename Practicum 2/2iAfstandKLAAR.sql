-- This routine calculates the distance between two points (given the
-- latitude/longitude of those points). It is being used to calculate
-- the distance between two locations using GeoDataSource (TM) prodducts
--
-- Calculate distance between two points lat1,lon1 and lat2,lon2
-- Uses radius of earth in kilometers or miles as an argurments
--
-- Typical radius:  3963.0 (miles) (Default if no value specified)
--                  6387.7 (km)
--
-- Note: NVL function is used on all variables to replace NULL values with 0 (zero).
--
-- For enquiries, please contact sales@geodatasource.com
-- Official Web site: http://www.geodatasource.com
--
-- Thanks to Bill Dykstra for contributing the source code.
--
-- GeoDataSource.com (C) All Rights Reserved 2015
--
CREATE OR REPLACE FUNCTION distance(
    Lat1   IN NUMBER,
    Lon1   IN NUMBER,
    Lat2   IN NUMBER,
    Lon2   IN NUMBER,
    Radius IN NUMBER DEFAULT 3963)
  RETURN NUMBER
IS
  -- Convert degrees to radians
  DegToRad NUMBER := 57.29577951;
BEGIN
  RETURN(NVL(Radius,0) * ACOS((sin(NVL(Lat1,0) / DegToRad) * SIN(NVL(Lat2,0) / DegToRad)) + (COS(NVL(Lat1,0) / DegToRad) * COS(NVL(Lat2,0) / DegToRad) * COS(NVL(Lon2,0) / DegToRad - NVL(Lon1,0)/ DegToRad))));
END;
/
CREATE OR REPLACE PROCEDURE zoekWinkelVoorAdres(
      postcode   IN VARCHAR2,
      huisnummer IN VARCHAR2,
      Toevoeging IN VARCHAR2,
      winkel_id OUT VARCHAR2,
      afstand OUT VARCHAR2 )
  AS
    v_Latitude       VARCHAR2(1000);
    v_longitude      VARCHAR2(1000);
    v_Postcode_id    VARCHAR2(1000);
    v_StraatNaam     VARCHAR2(1000);
    v_land           VARCHAR2(1000);
    v_Woonplaats     VARCHAR2(1000);
    v_Huisnummer     VARCHAR2(1000) := huisnummer;
    v_Toevoeging     VARCHAR2(1000) := Toevoeging;
    v_Postcode       VARCHAR2(1000) := postcode;
    v_KortsteAfstand NUMBER DEFAULT 9999999;
    v_Afstand        NUMBER DEFAULT 0;
    v_WinkelNaam     VARCHAR2(1000);
    -- haalt alle posities(dus lat en lon) van alle winkels die belangrijk zijn UIT de POSTCODE tabel
    CURSOR Posities
    IS
      SELECT lat,
        lon,
        winkel.id   AS wid,
        winkel.naam AS wNaam
      FROM WINKEL
      INNER JOIN POSTCODE
      ON postcode.id = winkel.postcode_id_fk;
BEGIN
  zoekAdres(v_StraatNaam,v_Huisnummer,v_Toevoeging,v_Postcode, v_Woonplaats,v_land,v_Postcode_id);
  -- selecteert latitude en longitude die bij de postcode hoort
  SELECT lat,lon
  INTO v_Latitude,v_longitude
  FROM Postcode
  WHERE postcode.id = v_Postcode_id;
  -- zoekt naar alle winkels en geeft daarbij de positie , vervolgens sorteert hij dit
  FOR Positie IN Posities
    LOOP
      v_Afstand          := distance(v_Latitude,v_longitude,Positie.Lat,Positie.lon);
      IF v_Afstand        < v_kortsteAfstand THEN
        v_kortsteAfstand := v_Afstand;
        winkel_id        := Positie.wid;
        v_WinkelNaam     := Positie.wNaam;
        afstand          := ROUND(v_kortsteAfstand *1000);
        dbms_output.put_line('Korste Afstand    : ' || v_kortsteAfstand || '  WinkelId  : '||winkel_id || 'winkelnaam   :  '|| v_WinkelNaam);
      END IF ;
    END LOOP;
EXCEPTION 
    WHEN no_data_found THEN
    raise_application_error(-20000,'Dit adres bestaat niet');
END;

/*
SET SERVEROUTPUT ON;
DECLARE
  postcode      VARCHAR2(6) := '6063BM';
  huisnr        NUMBER := 3;
  toevoeging    VARCHAR(5);
  outputId      WINKEL.ID%TYPE;
  outputAfstand NUMBER := 0;
BEGIN
  zoekWinkelVoorAdres(postcode, huisnr, toevoeging, outputId, outputAfstand);
  DBMS_OUTPUT.PUT_LINE(outputid);
  DBMS_OUTPUT.PUT_LINE(outputAfstand);
END;
*/