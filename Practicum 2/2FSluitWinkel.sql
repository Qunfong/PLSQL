CREATE OR REPLACE PROCEDURE sluitWinkel(   -- IN Varchar2
    Winkel_id IN Winkel.id%type )
AS
BEGIN
  -- delete alles van de winkels eerst en vervolgens update hij de winkel
  DELETE
  FROM OPENINGSTIJD
  WHERE winkel_id = Winkel_id;
  DELETE FROM WINKEL_PRODUCT WHERE winkel_id = Winkel_id;
  DELETE FROM WINKEL_COUPON WHERE winkel_id = Winkel_id;
  UPDATE WINKEL SET Opgeheven = 1 WHERE id = Winkel_id;
EXCEPTION 
    WHEN no_data_found THEN
    raise_application_error(-20000,'De winkel bestaat niet meer');
END;