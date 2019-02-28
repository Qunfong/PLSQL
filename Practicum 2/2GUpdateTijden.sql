CREATE OR REPLACE FUNCTION NieuwWinkelMetTijd(    -- IN Varchar2 , OUT Varchar2
    ID      IN VARCHAR2,
    Dag     IN VARCHAR2 ,
    Periode IN VARCHAR2 )
  RETURN VARCHAR2
AS
  v_winkel_id     VARCHAR2(255) := ID;
  v_Dag           VARCHAR2(255) := Dag;
  v_Periode       VARCHAR2(255) := Periode;
  v_PeriodeStuk   VARCHAR2(255) DEFAULT NULL;
  v_Opentijd      DATE ;
  v_SluitingsTijd DATE ;
  v_teller        NUMBER DEFAULT 1;
  v_tellerCheck   NUMBER DEFAULT 1;
  e_Overlapping   EXCEPTION;
BEGIN
  v_Periode := regexp_replace(v_Periode, '[[:space:]]*','');
  DELETE FROM openingstijd WHERE winkel_id = v_winkel_id AND DAG = v_Dag ;
  WHILE v_teller <= LENGTH(v_Periode)
  LOOP
    v_PeriodeStuk := SUBSTR(v_periode,v_teller,11);
    v_teller      := v_teller*11 + 1;
    --WHILE v_tellerCheck <= LENGTH(v_PeriodeStuk)
    --LOOP
    v_Opentijd      := TO_DATE(SUBSTR(v_PeriodeStuk,1,5),'hh24:mi');
    v_SluitingsTijd := TO_DATE(SUBSTR(v_PeriodeStuk,7),'hh24:mi');
    --v_tellerCheck := v_tellerCheck *5 ;
    IF DubbeleTijd(v_Opentijd,v_SluitingsTijd,v_winkel_id,v_Dag) = 'N' THEN
      dbms_output.put_line('winkel id  : '||v_winkel_id || 'dag  :  '||v_Dag || 'openingstijd : '|| TO_CHAR(v_Opentijd, 'HH24:MI') || 'sluitingstijd : '|| TO_CHAR(v_SluitingsTijd, 'HH24:MI'));
      INSERT
      INTO openingstijd
        (winkel_id,dag,OPEN,gesloten)
        VALUES
        (v_winkel_id,v_Dag,v_Opentijd,v_SluitingsTijd);
    ELSE
      raise e_overlapping;
    END IF;
    --END LOOP;
  END LOOP;
RETURN NULL;
EXCEPTION 
    WHEN e_overlapping THEN
    raise_application_error(-20000,'er is overlap in tijden');
END;
/*SELECT openingstijd.id,
  TO_CHAR(OPEN, 'HH24:MI'),
  TO_CHAR(gesloten, 'HH24:MI'),
  dag,
  winkel_id
FROM OPENINGSTIJD
INNER JOIN winkel
ON openingstijd.winkel_id = winkel.id
WHERE winkel_id           = 5496
ORDER BY openingstijd.id;
BEGIN
  dbms_output.put_line(NieuwWinkelMetTijd(5496,'za','16:00-18:00 22:30-23:00'));
END;*/