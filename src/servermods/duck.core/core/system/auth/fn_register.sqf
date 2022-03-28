/*

  Author: Duckfine
  Last modified: 11-04-2020 23:53

  Description:
    registers an new player to the db and does some checks

  Params:
    - steamID64


  Returns:
    -

*/


private[

  "_databaseResult",
  "_key",
  "_token",
  "_pattern"

];

_pattern = "X0X0X0X0X0X";

params[

  ["_steamID64", "", [""]]

];

_key = format ["auth#%1", _steamID64];


_schemaCfg = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIDs");
_databaseID = [_schemaCfg, "playerdata", "SCALAR"] call DUC_CORE_fnc_getConfigEntry;


// Kicks out any requests that would overwrite the current authtoken
_databaseResult = [_databaseID, _key] call DUC_core_redis_fnc_keyExists;

if (_databaseResult) exitWith {
    false;
};


_token = [_pattern] call DUC_core_fnc_generateID;
[_databaseID, _key, _token] call DUC_core_redis_fnc_keySet;

_token;






































//
