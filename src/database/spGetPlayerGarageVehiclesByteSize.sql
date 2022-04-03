DROP PROCEDURE IF EXISTS spGetPlayerGarageVehiclesByteSizes;
CREATE PROCEDURE spGetPlayerGarageVehiclesByteSizes(IN steamID varchar(20))
BEGIN
  DECLARE nPlayerID INT UNSIGNED;
  DECLARE nGarageID INT UNSIGNED;

  DECLARE done INT DEFAULT FALSE;
  DECLARE a, b CHAR(200);
  DECLARE curVehicles CURSOR FOR SELECT id, intid FROM garagevehicle WHERE ownerID = nGarageID;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  DROP TABLE IF EXISTS tblTMPplayerVehiclesDataSize;

  CREATE TEMPORARY TABLE tblTMPplayerVehiclesDataSize
  (
    id    INT UNSIGNED,
    intid VARCHAR(20),
    size  INT UNSIGNED
  );

  SET nPlayerID = (SELECT id from players WHERE steamid64 = steamID);
  SET nGarageID = (SELECT id FROM garage WHERE owner_id = nPlayerID AND owner_type = 'PLAYER');

  OPEN curVehicles;
  read_loop:
  LOOP
    FETCH curVehicles INTO a, b;

    INSERT INTO tblTMPplayerVehiclesDataSize (id, intid, size)
    VALUES (a, b, (SELECT SUM(
                                COALESCE(CHAR_LENGTH(intid), 0)
                                + COALESCE(CHAR_LENGTH(nameClass), 0)
                                + COALESCE(CHAR_LENGTH(nameDisplay), 0)
                                + COALESCE(CHAR_LENGTH(canSpawn), 0)
                                + COALESCE(CHAR_LENGTH(priceBuy), 0)
                                + COALESCE(CHAR_LENGTH(ownerID), 0)
                                + COALESCE(CHAR_LENGTH(inventoryVirt), 0)
                                + COALESCE(CHAR_LENGTH(fuel), 0)
                                + COALESCE(CHAR_LENGTH(hitInfo), 0)
                                + COALESCE(CHAR_LENGTH(cargoBackpack), 0)
                                + COALESCE(CHAR_LENGTH(cargoItem), 0)
                                + COALESCE(CHAR_LENGTH(cargoWeapon), 0)
                                + COALESCE(CHAR_LENGTH(cargoMagazine), 0)
                                + COALESCE(CHAR_LENGTH(turretWeapon), 0)
                                + COALESCE(CHAR_LENGTH(turretAmmo), 0)
                            )
                   FROM garagevehicle
                   WHERE id = a
    ));

    IF done THEN
      LEAVE read_loop;
    END IF;
  END LOOP;
  CLOSE curVehicles;
  SELECT * FROM tblTMPplayerVehiclesDataSize;
  DROP TABLE IF EXISTS tblTMPplayerVehiclesDataSize;
END;