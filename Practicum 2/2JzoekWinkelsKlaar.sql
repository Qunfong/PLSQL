--WHERE postcode LIKE '%' || InvulCriteria || '%' AND rownum = 1;
CREATE OR REPLACE FUNCTION zoekWinkels(  -- IN Varchar2 , OUT Varchar2
  InvulCriteria IN VARCHAR2 )
  RETURN SYS_REFCURSOR
AS
v_CheckLengte   Varchar2(255) := InvulCriteria;
e_TeKort        EXCEPTION ; 
IsPostcode      CHAR(1)  := 'N';
Postcodes       sys_refcursor;
WinkelCur   sys_refcursor;
WinkelPlaatsCur sys_refcursor;
TestCur         sys_refcursor;
WinkelNaamCount NUMBER;
WinkelPlaatsCount NUMBER;
CountCityWinkelName NUMBER;
lat1             NUMBER;
lon1             NUMBER;
Afstand          NUMBER;
latPostcode      NUMBER;
lonPostcode      NUMBER;
VergelijkAfstand NUMBER default 9999999;
CURSOR WinkelNaam
IS 
SELECT COUNT(*)
FROM POSTCODE INNER JOIN WINKEL ON postcode.id = winkel.postcode_id_fk
WHERE UPPER(winkel.naam) LIKE UPPER('%'||InvulCriteria||'%');

CURSOR WinkelPlaats
IS 
SELECT COUNT(*)
FROM POSTCODE 
WHERE UPPER(city) LIKE UPPER('%'||InvulCriteria||'%');

CURSOR AlleLatLon
IS 
SELECT lat,lon,city
FROM postcode;



BEGIN

OPEN WinkelNaam;
LOOP 
FETCH WinkelNaam INTO WinkelNaamCount;
EXIT WHEN WinkelNaam%NOTFOUND;
END LOOP;
CLOSE WinkelNaam;

OPEN WinkelPlaats;
LOOP 
FETCH WinkelPlaats INTO WinkelPlaatsCount;
EXIT WHEN WinkelPlaats%NOTFOUND;
END LOOP;
CLOSE WinkelPlaats;

IF LENGTH(v_CheckLengte) < 3 
THEN 
raise e_Tekort;
END IF;
FOR i in 1..LENGTH(v_CheckLengte)
LOOP
    IF SUBSTR(InvulCriteria,1,1) BETWEEN '0' AND '9'
    THEN
    IsPostcode := 'Y';
    END IF;
END LOOP;

IF IsPostcode = 'Y'
THEN
    select AVG(lat), AVG(lon) INTO latPostcode,lonPostcode FROM Postcode WHERE UPPER(postcode) LIKE UPPER(InvulCriteria || '%');
    OPEN TestCur FOR 
  SELECT * FROM (SELECT w.naam,distance(lat,lon,latPostcode,lonPostcode,6387.7)
  FROM Postcode p, Winkel w
  WHERE p.id = w.Postcode_id_fk 
  ORDER BY distance(lat,lon, lat1 ,lon1  , 6387.7));
ELSIF WinkelNaamCount > 0 
THEN  
    OPEN WinkelCur FOR SELECT winkel.naam,postcode.city
    FROM POSTCODE INNER JOIN WINKEL ON postcode.id = winkel.postcode_id_fk
    WHERE UPPER(winkel.naam) LIKE UPPER('%'||InvulCriteria||'%') AND rownum <=4;
    dbms_output.put_line('Winkelnaam was >0');
    RETURN WinkelCur;
ELSE
    select AVG(lat),AVG(lon)
    into lat1,lon1
    FROM postcode
    WHERE UPPER(postcode.city) = UPPER(InvulCriteria);
  OPEN TestCur FOR 
  SELECT * FROM (SELECT w.naam,distance(lat,lon,lat1,lon1,6387.7)
  FROM Postcode p, Winkel w
  WHERE p.id = w.Postcode_id_fk 
  ORDER BY distance(lat,lon, lat1 ,lon1  , 6387.7));
END IF;
RETURN TestCur;
EXCEPTION 
    WHEN no_data_found THEN
    raise_application_error(-20000,'geen data');
    WHEN e_TeKort THEN 
    raise_application_error(-20000,'De lengte van de zoekopdracht is te kort');
END;
/
--toon gemiddelde lat , lon van de stad/winkelnaam
--vervolgens chcek je op steden die het dichst bij zijn

DECLARE
  emp_refcur_local      SYS_REFCURSOR;
  test1                 VARCHAR2(255);
  test2                 VARCHAR2(255);
  test3                 NUMBER;
  test4                 NUMBER;
  teststring            VARCHAR2(255) := '6361VK';
  Counter               NUMBER default 0;
BEGIN
  --Calling the function using parameters
  emp_refcur_local:=zoekWinkels(teststring);
  LOOP
  FETCH emp_refcur_local into test1,test2;
    EXIT WHEN  emp_refcur_local%NOTFOUND OR Counter =3;
    DBMS_OUTPUT.PUT_LINE('  test3  : ' || test1 || '   test4 :  '|| test2);
      Counter := Counter + 1;
  END LOOP;
END;

SELECT *
FROM POSTCODE 
WHERE UPPER(city) LIKE UPPER('%'||'GRO'||'%');
set serveroutput on;
SELECT *
FROM POSTCODE INNER JOIN WINKEL ON postcode.postcode_id = winkel.postcode_id_fk
WHERE UPPER(winkel.naam) LIKE UPPER('%'||'GRO'||'%');
select naam,city FROM WINKEL INNER JOIN POSTCODE ON postcode.id = winkel.postcode_id_fk 
    WHERE city LIKE '%' || 'Uden'|| '%' OR winkel.naam LIKE '%' || 'Uden' || '%';
    select * from WINKEL;
