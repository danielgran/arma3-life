/*

  Handles the serverside join procedure of the player

  Author: Duckfine


*/

addMissionEventHandler ["PlayerConnected",
{
  private [

    "_exists",
    "_playerBlueprint",
    "_dump",
    "_schema",
    "_schemaCfg"
  ];


  params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

	diag_log "Client connected";
  diag_log _this;

  // Redis side cache
  _schema = getArray(configFile >> "CfgSettings" >> "db_life" >> "tblplayers" >> "playerRelated");

  _schemaCfg = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIDs");
  _databaseID = [_schemaCfg, "playerdata", "SCALAR"] call DUC_CORE_fnc_getConfigEntry;

  // Delete authkey if there is one
  [_databaseID, format["auth#%1", _uid]] call DUC_core_redis_fnc_keyDelete;










}];
