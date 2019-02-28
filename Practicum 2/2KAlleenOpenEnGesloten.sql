select to_char(datum.day, 'hh24:mi'), datum.day
FROM Openingstijd o, (Select trunc(sysdate) + 1/24/4*rownum AS day
                    FROM DUAL
                    CONNECT BY trunc(sysdate) + 1/24/4*rownum <= trunc(sysdate)+21) Datum
                    WHERE to_date('01-06-2015'||to_char(Datum.day,'HH24:MI'),'DD-MM-YYYY HH24:MI') BETWEEN (o.open+1/24/2) and (o.gesloten-1/24/2) 
                    AND winkel_id = 5405;

DECLARE 
emp_refcur_local      SYS_REFCURSOR;
opengesloten          BOOLEAN;
tijden                Varchar2(100);
datum                 DATE;
Counter               Number default 0;
BEGIN 
zoekWinkelVoorAdres(5405,sysdate,21,TRUE,opengesloten,emp_refcur_local);
  IF opengesloten = true
  THEN
  dbms_output.put_line('hij is open');
  ELSE
  dbms_output.put_line('hij is gesloten');
  END IF;
LOOP
  FETCH emp_refcur_local into tijden,datum;
    EXIT WHEN  emp_refcur_local%NOTFOUND OR Counter = 1;
    DBMS_OUTPUT.PUT_LINE('Tijden :  '||tijden  ||'    dagen : '|| datum);
    Counter := Counter + 1;
END LOOP;
END;                    
                    
                    
DECLARE 
emp_refcur_local      SYS_REFCURSOR;
opengesloten          BOOLEAN;
tijden                Varchar2(100);
datum                 DATE;
BEGIN 
zoekWinkelVoorAdres(5405,sysdate,21,TRUE,opengesloten,emp_refcur_local);
  IF opengesloten = true
  THEN
  dbms_output.put_line('hij is open');
  ELSE
  dbms_output.put_line('hij is gesloten');
  END IF;
LOOP
  FETCH emp_refcur_local into tijden,datum;
    EXIT WHEN  emp_refcur_local%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Tijden :  '||tijden  ||'    dagen : '|| datum);
END LOOP;
END;
set serveroutput on;





CREATE OR REPLACE PROCEDURE zoekWinkelVoorAdres(  -- IN Varchar2 , OUT Varchar2
  Winkelid    IN    winkel.id%type,
  HuidigeTijd IN    DATE,
  Periode     IN    NUMBER default 21,
  Bezorgen    IN    BOOLEAN,
  OpenBool    OUT   BOOLEAN,
  Tijdstippen OUT   SYS_REFCURSOR
  )
AS
BeginTijd     DATE default sysdate;
  Tijd          Varchar2(255);
  TijdInDate    DATE;
  DagC           Varchar2(255);
  CheckTijd   Number;
          
BEGIN
--begin openingstijd check
DagC := SUBSTR(to_char(sysdate, 'Day'),0,2);
Tijd := to_char(sysdate,'hh24:mi');
TijdInDate := TO_DATE('01-06-2015'||Tijd, 'DD-MM-YYYY HH24:MI');
Select count(*)
INTO CheckTijd
FROM Openingstijd
WHERE UPPER(DagC) = UPPER(openingstijd.dag) AND winkel_id = Winkelid AND TijdInDate BETWEEN open AND gesloten;
IF CheckTijd > 0 
THEN 
dbms_output.put_line('Hij is open');
OpenBool := TRUE;
ELSE
dbms_output.put_line('Hij is gesloten');
OpenBool := FALSE;
END IF;
--eind openingstijdcheck
IF Bezorgen = true
THEN
OPEN Tijdstippen FOR select to_char(Datum.day, 'hh24:mi'), Datum.day
FROM Openingstijd o, (Select trunc(sysdate) + 1/24/4*rownum AS day
                    FROM DUAL
                    CONNECT BY trunc(sysdate) + 1/24/4*rownum <= trunc(sysdate)+21) Datum
                    WHERE to_date('01-06-2015'||to_char(Datum.day,'HH24:MI'),'DD-MM-YYYY HH24:MI') BETWEEN (o.open+1/24/2) and (o.gesloten-1/24/2) 
                    AND winkel_id = Winkelid AND o.dag = substr(to_char(datum.day, 'day'),1,2);
ELSIF Bezorgen = false
THEN
OPEN Tijdstippen FOR select to_char(Datum.dag, 'hh24:mi'), Datum.dag
FROM Openingstijd op, (Select trunc(sysdate) + 1/24/4*rownum AS dag
                    FROM DUAL
                    CONNECT BY trunc(sysdate) + 1/24/4*rownum <= trunc(sysdate)+21) Datum
                    WHERE to_date('01-06-2015'||to_char(Datum.dag,'HH24:MI'),'DD-MM-YYYY HH24:MI') BETWEEN (op.open+1/24/4) and (op.gesloten-1/24/4)
                    AND winkel_id = Winkelid AND op.dag = substr(to_char(datum.dag, 'day'),1,2);

END IF;
END;













DECLARE
  BeginTijd     DATE default sysdate;
  Tijd          Varchar2(255);
  TijdInDate    DATE;
  DagC           Varchar2(255);
  CheckTijd   Number;
  CURSOR Openingstijden
IS 
SELECT dag,open,gesloten
FROM Openingstijd;
BEGIN
 DagC := SUBSTR(to_char(sysdate, 'Day'),0,2);
Tijd := to_char(sysdate,'hh24:mi');
TijdInDate := TO_DATE('01-06-2015'||Tijd, 'DD-MM-YYYY HH24:MI');
Select count(*)
INTO CheckTijd
FROM Openingstijd
WHERE UPPER(DagC) = UPPER(openingstijd.dag) AND winkel_id = Winkelid AND TijdInDate BETWEEN open AND gesloten;
IF CheckTijd > 0 
THEN 
dbms_output.put_line('Hij is open');
ELSE
dbms_output.put_line('Hij is gesloten');
END IF;
END;

select 
to_char(trunc(sysdate,'HH')+(15*round(to_char( trunc(sysdate,'MI'),'MI')/15))/1440,'DD-mon-YYYY hh24:mi:ss') 
from dual ;