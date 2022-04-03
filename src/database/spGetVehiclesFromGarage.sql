DROP PROCEDURE IF EXISTS spGetVehiclesFromGarage;
CREATE PROCEDURE spGetVehiclesFromGarage(IN VehicleIDs varchar(10000))
BEGIN
  SET @ids = VehicleIDs;
  PREPARE stmt FROM 'SELECT * FROM garagevehicle WHERE id IN (?)';
  EXECUTE stmt USING @ids;
  DEALLOCATE PREPARE stmt;
END;

