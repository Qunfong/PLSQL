DECLARE                                   -- IN Winkelid, HuidigeTijd, Periode, boolean bezorgen OUT open of gesloten , cursor met alle tijden
  emp_refcur_local SYS_REFCURSOR;
  opengesloten BOOLEAN;
  tijden       VARCHAR2(100);
  datum        DATE;
  Counter      NUMBER DEFAULT 0;
BEGIN
-- hier wordt de methode aangeroepen met data
  zoekWinkelVoorAdres(5405,sysdate,21,TRUE,opengesloten,emp_refcur_local);
  IF opengesloten = true THEN
    dbms_output.put_line('hij is open');
  ELSE
    dbms_output.put_line('hij is gesloten');
  END IF;
  LOOP
    FETCH emp_refcur_local INTO tijden,datum;
    EXIT
    -- haalt de 1st mogelijke tijd op
  WHEN emp_refcur_local%NOTFOUND OR Counter = 1;
    DBMS_OUTPUT.PUT_LINE('Tijden :  '||tijden ||'    dagen : '|| datum);
    Counter := Counter + 1;
  END LOOP;
END;              
              