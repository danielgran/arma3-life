#include "\duck.core\script_macros.hpp"
/*

  Author: Duckfine
  Date created: 4-8-2020 20:20

  Description
    Copys MySQL Player Garage to the Cache

  Parameter:
    - <type> <name>

  Returns:
    - <type> <name>


 */

private[

  "_steamid64",
  "_schema",
  "_dump"

];

params[

  ["_steamID64", "", ["a"]]

];

_vehicles = [_steamID64] call duc_life_veh_fnc_getPlayerGarage;

diag_log _vehicles;

_schemaVehicle = DEF_DB_GET_SCHEMA("db_life", "tblGarageVehicle", "schema");
{
  
  diag_log _x;


  _xIntID = DEF_CORE_GET_OBJECT_VALUE(_schemaVehicle, _x, "intid");
  [1, format["%1#%2", _steamID64, _xIntID], _x] call DUC_core_redis_fnc_listAdd;
	
} forEach _vehicles;