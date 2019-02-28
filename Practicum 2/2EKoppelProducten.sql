DECLARE         
  v_Percentage    NUMBER(2);
  v_PercentageMax NUMBER(2);
  v_PercentageMin NUMBER(2);
  CURSOR Winkels
  IS
    SELECT Winkel.id FROM Winkel;
  CURSOR Producten
  IS
    SELECT id
    FROM
      (SELECT id
      FROM product
      ORDER BY dbms_random.value(v_PercentageMin,v_PercentageMax)
      )
  WHERE rownum <= dbms_random.value(v_PercentageMin,v_PercentageMax);
  v_RandomWinkel Producten%rowtype;
  v_RandomProduct Winkels%rowtype;
BEGIN
Select COUNT(id)
INTO v_PercentageMax
FROM product;
-- hiermee pak ik 90% + zodat het sowieso hoger is dan 90% van het aantal producten
v_PercentageMin := CEIL(v_PercentageMax * 0.9);
v_Percentage := dbms_random.value(v_PercentageMin,v_PercentageMax);
-- geeft random rows 90%+ aan de winkels
OPEN Winkels;
LOOP 
    FETCH winkels INTO v_RandomWinkel;
    EXIT WHEN winkels%NOTFOUND;
    OPEN Producten;
    LOOP
      FETCH Producten INTO v_RandomProduct;
      EXIT WHEN Producten%NOTFOUND;
        INSERT INTO WINKEL_PRODUCT(winkel_id,product_id) VALUES(v_RandomWinkel.id,v_RandomProduct.id);
        --dbms_output.put_line('random winkel    :'||v_RandomWinkel.id || ' random product id   :' || v_RandomProduct.id); 
    END LOOP;
    CLOSE Producten;
END LOOP;
CLOSE Winkels;
EXCEPTION 
    WHEN no_data_found THEN 
      raise_application_error(-20000,'De winkel tabel of de product tabel is leeg');
END;
