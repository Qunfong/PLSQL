CREATE OR REPLACE PROCEDURE updateWinkelPostcodeID
IS
  -- Dit haalt alle foute postcodes op, dus de postcodes die niet kloppen 
  -- Volgens de postcode tabel
  CURSOR postcode
  IS
    SELECT postcode.id
    FROM postcode
    INNER JOIN winkel
    ON postcode.id         = winkel.postcode_id_fk
    WHERE winkel.postcode <> postcode.postcode;
BEGIN
  FOR postcodesinloop IN postcode
  LOOP
    -- Hij update de foute postcodes met de goed uit de postcode tabel
    UPDATE WINKEL
    SET winkel.postcode_id_fk =
      (SELECT id
      FROM POSTCODE
      WHERE postcode.postcode_id = winkel.postcode_id
      AND rownum                 =1
      )
    WHERE winkel.postcode_id_fk = postcodesinloop.id;
  END LOOP;
END;
/*
DELETE FROM winkel;

SELECT * FROM openingstijd;
*/