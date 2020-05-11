/*

  Author: Duckfine
  Date created:   28-04-2020 09:55

  SPAWNED SCRIPT

  Description:
    Initializes an player serverside (DB Procedure etc)

  Params:
    - string steamid64


  Returns:
    -

*/


private[

  "_exists",
  "_playerBlueprint",
  "_schema"

];


params[

  ["_steamID64", "", [""]],
  ["_content", []]

];


diag_log "=========initPlayer========";
diag_log format["_steamID64 = %1", _steamID64];
diag_log format["_content = %1", _content];
diag_log "===========================";


_name = _content select 0;


//MySQL check player
_exists = [_steamID64] call DUC_core_mysql_fnc_playerCheck;

if (_exists isEqualTo [true]) then {

  diag_log "[DUCK:POSTINIT] Player already exists in Database :-)";

};

// Player unknown in Database
if (_exists isEqualTo [false]) then
{
  [_steamID64, _name] call DUC_core_mysql_fnc_playerNew;
  diag_log "[DUCK:POSTINIT] Player was created in MYSQL Database";
};


_schema = getArray(configFile >> "CfgSettings" >> "db_life" >> "tblplayers" >> "playerRelated");
_schemaCfg = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIDs");
_databaseID = [_schemaCfg, "playerdata", "SCALAR"] call DUC_CORE_fnc_getConfigEntry;

if ([_databaseID, _steamID64] call DUC_core_redis_fnc_keyExists) then
{
  // save dump to mysql
  _playerSafe = [_databaseID, _steamID64, _schema] call DUC_core_redis_fnc_listFetch;
  [_uid, _schema, _playerSafe] call DUC_core_mysql_fnc_datasetUpdate;

} else
{
  // Get Players info and put it into redis

  //Fetch playerdata from MySQL
  _dump = [_steamID64, _schema] call DUC_core_mysql_fnc_datasetFetch;
  [_databaseID, _steamID64, _dump] call DUC_core_redis_fnc_listAdd;
};


































//
