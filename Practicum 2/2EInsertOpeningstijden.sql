Create or replace Procedure InsertOpeningstijden
IS
  CURSOR Winkels IS 
  SELECT Winkel.id
  FROM Winkel ;
BEGIN
-- Insert voor elke winkel in winkels de openingstijd 16:00 tot 22:00 van ma t/m zo
FOR Winkel IN Winkels
 LOOP
    INSERT INTO OPENINGSTIJD(id,WINKEL_ID,dag,open,gesloten)VALUES(OPENINGSTIJD_FCSEQ.nextval,winkel.id,'ma',TO_DATE('16:00','hh24:mi'),TO_DATE('22:00','hh24:mi'));
    INSERT INTO OPENINGSTIJD(id,WINKEL_ID,dag,open,gesloten)VALUES(OPENINGSTIJD_FCSEQ.nextval,winkel.id,'di',TO_DATE('16:00','hh24:mi'),TO_DATE('22:00','hh24:mi'));
    INSERT INTO OPENINGSTIJD(id,WINKEL_ID,dag,open,gesloten)VALUES(OPENINGSTIJD_FCSEQ.nextval,winkel.id,'wo',TO_DATE('16:00','hh24:mi'),TO_DATE('22:00','hh24:mi'));
    INSERT INTO OPENINGSTIJD(id,WINKEL_ID,dag,open,gesloten)VALUES(OPENINGSTIJD_FCSEQ.nextval,winkel.id,'do',TO_DATE('16:00','hh24:mi'),TO_DATE('22:00','hh24:mi'));
    INSERT INTO OPENINGSTIJD(id,WINKEL_ID,dag,open,gesloten)VALUES(OPENINGSTIJD_FCSEQ.nextval,winkel.id,'vr',TO_DATE('16:00','hh24:mi'),TO_DATE('22:00','hh24:mi'));
    INSERT INTO OPENINGSTIJD(id,WINKEL_ID,dag,open,gesloten)VALUES(OPENINGSTIJD_FCSEQ.nextval,winkel.id,'za',TO_DATE('16:00','hh24:mi'),TO_DATE('22:00','hh24:mi'));
    INSERT INTO OPENINGSTIJD(id,WINKEL_ID,dag,open,gesloten)VALUES(OPENINGSTIJD_FCSEQ.nextval,winkel.id,'zo',TO_DATE('16:00','hh24:mi'),TO_DATE('22:00','hh24:mi'));
 END LOOP;
END;
select * from openingstijd;
BEGIN
InsertOpeningstijden();
END;