CREATE OR REPLACE FUNCTION DubbeleTijd(    -- IN varchar2, OUT varchar2
    Openingstijd IN openingstijd.open%type,  
    Gesloten     IN openingstijd.gesloten%type,
    WinkelId     IN openingstijd.id%type,
    GekozenDag   IN openingstijd.dag%type )
  RETURN CHAR
IS
  Dubbeletijd CHAR(1) := 'N';
  -- haalt alle openingstijden en sluitingstijden op 
  CURSOR TijdenWinkels
  IS
    SELECT OPEN,
      gesloten
    FROM openingstijd
    WHERE winkel_id = WinkelId
    AND Dag         = GekozenDag;
BEGIN
  FOR OpenEnGeslotenTijden IN TijdenWinkels
  LOOP
    -- Checkt of tijden overlappen
    IF Openingstijd BETWEEN OpenEnGeslotenTijden.open AND OpenEnGeslotenTijden.Gesloten OR Gesloten BETWEEN OpenEnGeslotenTijden.open AND OpenEnGeslotenTijden.Gesloten OR Openingstijd <= OpenEnGeslotenTijden.open AND Gesloten >= OpenEnGeslotenTijden.Gesloten THEN
      Dubbeletijd                                                                                                                                                                       := 'Y';
    END IF;
  END LOOP;
RETURN Dubbeletijd;
END;