create
    definer = root@`%` procedure spGetVehiclesFromGarage(IN VehicleIDs varchar(10000))
BEGIN

  DECLARE szStatement VARCHAR(4000);
  SET @ids = VehicleIDs;
  PREPARE stmt FROM 'SELECT * FROM garagevehicle WHERE id IN (?)';
  EXECUTE stmt USING @ids;
  DEALLOCATE PREPARE stmt;
	
END;

