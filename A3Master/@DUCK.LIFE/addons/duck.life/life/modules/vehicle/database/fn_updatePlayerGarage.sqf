#include "\duck.core\script_macros.hpp"
/*

  Author: Duckfine
  Date created: 5-8-2020 21:04

  Description
    Syncs MySQL and Redis (provided that redis cache is up to date)

  Parameter:
    - <type> <name>

  Returns:
    - <type> <name>


 */




private[

  "_placeholder01",
  "_placeholder02"

];


params[

  ["_steamID64", "", ["a"]],
  ["_ph02", "", ["a"]]

];




// Get playergarage fresh from db
// TODO Could be simplified by only getting the ids but this also works
_playergarageMySQL = [_steamID64] call duc_life_veh_fnc_getPlayerGarage;
//[[1,"asd","GWAGON","f",1,1234,11,"""[`12345541`]""","[[`bottleWater`,19],[`dasIstEinGeheimesItemDuHure`,46400],[`keinItem`,103030]]",1,"","","","","","","",""],[2,"asdf","asf","a",1,23,11,"","",1,"","","","","","","",""]]
_mysqlIDs = [];

{
	_mysqlIDs set [_forEachIndex, str(_x select 0)];
} forEach _playergarageMySQL;


// ["1","3","5","6","10"] // 10 is custom added




_databaseID = DEF_DB_REDIS_GET_DBID("garagedata");

_redisIDs = [_databaseID, format["%1#%2", _steamID64, "*"]] call duc_core_redis_fnc_DBGetKeys;
// ["asdf#123"]
{
	_redisIDS set [_forEachIndex, (_x splitString "#") select 1];
	
} forEach _redisIDs;

// ["1","3","5","6","8", "#n#yXc4Fa"] // #n# stands for newly added and does not have a mysql id yet with some random id

// Find differences between mysql and redis

// Find vehicles which are not in cache but in mysql
_schemaVehicle = DEF_DB_GET_SCHEMA("db_life", "tblGarageVehicle", "schema");

{
  if !(_x in _redisIDs) then
	{
    _newVehIndex = -1;
    _mysqlID = _x;
    {
      if(_x select 0 isEqualTo _mysqlID) exitWith { _newVehIndex = _x; };
      
    } forEach _playergarageMySQL;

    // only if new veh from mysql could be found in mysql ?
    if !(_newVehIndex isEqualTo -1) then
    {
    _newVeh = _playergarageMySQL select _newVehIndex;
    _key = _xIntID = DEF_CORE_GET_OBJECT_VALUE(_schemaVehicle, _x, "intid");
    [1, format["%1#%2", _steamID64, _key], _newVeh] call DUC_core_redis_fnc_listAdd;
    };

	};
	
} forEach _mysqlIDs;



// cache now up to date now update everything to mysql


[_schema, _playerSafe, "players", format["steamid64 = '%1'", _steamID64]] call DUC_core_mysql_fnc_datasetUpdate;


// get new entrys in mysql


_playerGarageRedis = [_steamid64] call duc_life_veh_fnc_getPLayerarage; 
{

  // Current result is saved in variable _x

  if !(_x in _mysqlIDs) then
  {
    // add vehicle to mysql
    
  };
  
} forEach _redisIDs;

