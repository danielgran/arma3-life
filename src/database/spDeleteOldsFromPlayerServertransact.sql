DROP PROCEDURE IF EXISTS spDeleteOldsFromPlayerServertransact;
CREATE PROCEDURE spDeleteOldsFromPlayerServertransact()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE date INT;
  DECLARE cur1 CURSOR FOR (SELECT dateAdded
                           FROM player_servertransact
                           WHERE TIMESTAMPDIFF(MINUTE, FROM_UNIXTIME(dateAdded), NOW()) > 10);
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN cur1;
  read_loop:
  LOOP
    FETCH cur1 INTO date;
    IF done THEN
      LEAVE read_loop;
    END IF;
    DELETE FROM player_servertransact WHERE dateAdded = date;
  END LOOP;
  CLOSE cur1;
END;