/*

  Author: Duckfine
  Date created: 27-5-2020 20:39

  Description
    Removes Item(s) from Players inventory

  Parameter:
    - STRING steamid64
    - ARRAY info ["itemname", count as scalar]

  Returns:
    - BOOL succeeded


 */




private[

  "_placeholder01",
  "_placeholder02"

];


params[

  ["_steamID64", "", ["a"]],
  "_info" //[[inv], "item1", count]

];

//Errorhandling
if (_info select 2 <= 0) exitWith { false; };
if !(typeName _info isEqualTo "ARRAY") exitWith { false; };

_inventory = [_info select 0, _info select 1, _info select 2] call DUC_LIFE_VITEM_FNC_invSetItem;


// update entry in redis


_schema = getArray(configFile >> "CfgSettings" >> "db_life" >> "tblplayers" >> "playerRelated");

_schemaCfg = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIDs");
_databaseID = [_schemaCfg, "playerdata", "SCALAR"] call DUC_CORE_fnc_getConfigEntry;

// todo get inventory from redis

// todo here update redis


_tmp01 = [_databaseID, _steamID64, _inventory, _schema, "bank"] call DUC_CORE_redis_fnc_listEntryUpdate;









