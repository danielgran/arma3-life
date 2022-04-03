DROP PROCEDURE IF EXISTS spGetPlayerServerTransaction;
CREATE PROCEDURE spGetPlayerServerTransaction(IN parSteamID64 char(20))
process:
BEGIN
  # check if player is in database
  IF (SELECT COUNT(id) FROM players WHERE steamid64 = parSteamID64) <= 0
  THEN

    select '01' as 'info';
    LEAVE process;

  END IF;

  # check if player has an active transaction
  IF (SELECT COUNT(id) FROM player_servertransact WHERE steamid64 = parSteamID64) <= 0
  THEN

    select '02' as 'info';
    LEAVE process;

  END IF;

  # Errorchecks done, now return the needed data
  SELECT steamid64, serverFrom, serverTo, vehicle, vehicleSkin, velocity
  FROM player_servertransact
  WHERE steamid64 = parSteamID64;
  DELETE FROM player_servertransact WHERE steamid64 = parSteamID64;
END;