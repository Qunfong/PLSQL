Create or replace Procedure updateWinkelPostcodeID
IS
  CURSOR postcode IS 
  SELECT postcode.id
  FROM postcode INNER JOIN winkel ON postcode.id = winkel.postcode_id_fk
  WHERE winkel.postcode <> postcode.postcode;
BEGIN
 FOR postcodesinloop IN postcode
 LOOP
 UPDATE WINKEL
 SET winkel.postcode_id_fk = (SELECT id
                             FROM POSTCODE
                             WHERE postcode.postcode_id = winkel.postcode_id AND rownum=1)
 WHERE winkel.postcode_id_fk = postcodesinloop.id;
 END LOOP;
EXCEPTION 
    WHEN no_data_found THEN
    raise_application_error(-20000,'Er zijn geen postcodes meer die fout zijn');
END;

/*DELETE FROM winkel;

SELECT * FROM openingstijd;*/