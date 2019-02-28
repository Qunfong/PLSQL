DECLARE
  CURSOR Winkels
  IS
    SELECT id FROM Winkel;
  CURSOR COUPONs
  IS
    SELECT id
    FROM
      (SELECT id FROM COUPON ORDER BY dbms_random.value(1,20)
      )
  WHERE rownum <= dbms_random.value(1,20);
  v_Aantal NUMBER(2) DEFAULT 0;
  v_RandomCoupon COUPONs%rowtype;
  v_Winkel WINKELS%rowtype;
  -- haalt rijen uit coupons en koppelt deze aan winkels
BEGIN
  v_Aantal := DBMS_RANDOM.VALUE(1,20);
  --voor elke winkel
  OPEN WINKELS;
  LOOP
    FETCH WINKELS INTO v_Winkel;
      EXIT WHEN Winkels%NOTFOUND;
      -- een rij met coupons
       OPEN COUPONs;
       LOOP
          FETCH COUPONs into v_RandomCoupon;
          EXIT WHEN COUPONs%NOTFOUND;
            INSERT INTO WINKEL_COUPON(Winkel_id, coupon_id) VALUES (v_Winkel.id,v_RandomCoupon.id);
            dbms_output.put_line('WINKEL ID  : ' ||v_Winkel.id||'coupongcode  : '||v_RandomCoupon.id);
      END LOOP;
  CLOSE COUPONs;
  END LOOP;
  CLOSE WINKELS;
  dbms_output.put_line(V_Aantal);
EXCEPTION 
    WHEN no_data_found THEN
    raise_application_error(-20000,'De winkel tabel of de coupon tabel is leeg');
END;

/*
DELETE FROM WINKEL_COUPON;
SELECT * FROM WINKEL_COUPON;*/