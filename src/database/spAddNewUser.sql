create
    definer = root@`%` procedure spAddNewUser(IN steamID char(20), IN ingamename char(30))
BEGIN

	DECLARE default_cash 						INT DEFAULT 0;
	DECLARE default_bank 						INT DEFAULT 0;
	DECLARE default_gearCivilian 		TEXT DEFAULT '"""[[],[],[],[],[],[],``,``,[],[``,``,``,``,``,``]]"""';
	DECLARE default_gearPolice 			TEXT DEFAULT '"""[[],[],[],[],[],[],``,``,[],[``,``,``,``,``,``]]"""';
	DECLARE default_gearMedic				TEXT DEFAULT '"""[[],[],[],[],[],[],``,``,[],[``,``,``,``,``,``]]"""';
	DECLARE default_gearMechanic		TEXT DEFAULT '"""[[],[],[],[],[],[],``,``,[],[``,``,``,``,``,``]]"""';
	DECLARE default_invVirt					TEXT DEFAULT '"""[]"""';
	
	SET default_cash 			    = 1000;
	SET default_bank 			    = 0;
	SET default_gearCivilian 		= '"""[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]"""';
	SET default_gearPolice 			= '"""[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]"""';
	SET default_gearMedic 			= '"""[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]"""';
	SET default_gearMechanic 		= '"""[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]"""';
	SET default_invVirt 		    = '"""[]"""';

	IF ((SELECT COUNT(id) FROM players WHERE steamid64 = steamID) = 0) THEN
		INSERT INTO players (steamid64, a3name, location, bank, cash, gearCivilian, gearPolice, gearMedic, gearMechanic, invVirtual, arrested,  firstconnect) VALUES 
												(steamID, ingamename, '"[]"', default_bank, default_cash, default_gearCivilian, default_gearPolice, default_gearMedic, default_gearMechanic, default_invVirt, '"[]"', 0);
		INSERT INTO garage (size, owner_type, owner_id) VALUES (10, 'PLAYER', (SELECT id FROM players WHERE steamid64 = steamID));
	ELSE
		SELECT 'Player already exists!' as 'error';
	END IF;
	
	
END;

