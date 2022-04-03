create
    definer = root@`%` procedure spRequestPlayerTransactToServer(IN parSteamID64 char(20), IN parServerFrom char(20),
                                                                 IN parServerTo char(30), IN parVehicle char(100),
                                                                 IN parVehicleSkin char(100), IN parVelocity char(100))
BEGIN

	# check if player is there and if player is not doing another transaction
	IF (((SELECT COUNT(p.id) FROM players p WHERE p.steamid64 = steamID64) > 0)
				AND 	(SELECT COUNT(pst.id) FROM player_servertransact pst WHERE pst.steamid64 = parSteamID64) <= 0)
	THEN
			
			
			INSERT INTO player_servertransact (player_id, steamid64, serverFrom, serverTo, vehicle, vehicleSkin, velocity) VALUES
			((SELECT p.id from players p WHERE p.steamid64 = parSteamID64), parSteamID64, parServerFrom, parServerTo, parVehicle, parVehicleSkin, parVelocity);
	
	ELSE
	  
		SELECT 'ERROR' as '';
		
		
	END IF;
	
	
END;

