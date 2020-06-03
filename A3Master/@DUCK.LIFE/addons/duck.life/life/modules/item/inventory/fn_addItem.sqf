/*

  Author: Duckfine
  Date created: 28-5-2020 21:19

  Description:
	Adds an item to player (cache)

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
  "_info" //["invtype", "item1", count] //invtype not used yeet

];

_schema = getArray(configFile >> "CfgSettings" >> "db_life" >> "tblplayers" >> "playerRelated");

_schemaCfg = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIDs");
_databaseID = [_schemaCfg, "playerdata", "SCALAR"] call DUC_CORE_fnc_getConfigEntry;

_inventory = [_databaseID, _steamID64, _schema, "invVirtual"] call DUC_CORE_redis_fnc_listEntryGet;
_inventory = [_inventory, _info select 1, _info select 2] call DUC_CORE_redis_fnc_invAddItem;

_tmp01 = [_databaseID, _steamID64, _inventory, _schema, "invVirtual"] call DUC_CORE_redis_fnc_listEntryUpdate;

true;
