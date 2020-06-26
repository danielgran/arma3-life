#include "\duck.core\script_macros.hpp"
/*

  Author: Duckfine
  Date created:   12-04-2020 03:13

  Description:
    Prepares the array of db vars which are sent to the client

  Params:
    - steamID64
    - any content

  Returns:
    Array of the playerdata like [["money", 1000], ["intid", "ASDF"], ...]

*/


private[

  "_schema",
  "_schemaCfg",
  "_databaseID",
  "_databaseResult",
  "_return"

];

_return = [];

params[

  ["_steamID64", "", [""]],
  ["_content", ""]

];

// Preperation of client vars related to the player figure (money, etc)

_schema = getArray(configFile >> "CfgSettings" >> "db_life" >> "tblplayers" >> "playerRelated");
_schemaCfg = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIDs");
_databaseID = [_schemaCfg, "playerdata", "SCALAR"] call DUC_CORE_fnc_getConfigEntry;


_databaseResult = [_databaseID, _steamID64, _schema] call DUC_core_redis_fnc_listFetch;
// returns ["Prof Bildungsstop",[],"3TLQ9BMS4",123,0,"",[],[],[],[],[],[],true,[],false,0,0,0,0,0,0,0,0,0,0,0,0]

{
    _return pushBack [_x select 0, _databaseResult select _forEachIndex];
} forEach _schema;





// Preperation of Server global vars

_return pushBack ["G_SERVERID", DEF_CORE_CONST_SERVERID];



_return;


























//
