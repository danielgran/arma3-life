/*

  Updates COMPLETE Player in MySQL Database

  Author: Duckfine


*/
private[
  "_stmt"

];


params[
  ["_steamid64", "", ["a"]],
  ["_schema", []],
  ["_playerSafe", []]

];


// Processing

//TODO USE TONICS METHODS  TO CONVERT ARRAYS
//_dbDump set [4, (str(_dbDump select 4))]; // Arma 3 Player Inventory
//_dbDump set [5, (str(_dbDump select 5))]; // Arma 3 Virtual Inventory


// ["76561198216442289","COD","Prof Bildungsstopfen","","","",0,0,0,0,3.94672e+007,0,0,0,0,0,0,"",""]


//rank lacks (security issue)
_stmt = [_schema, _playerSafe, "players", format["steamid64 = '%1'", _steamid64]] call DUC_core_mysql_fnc_buildUpdate;

diag_log _stmt;

[_stmt, 1, call ducv_core_dbidplayerdata] call DUC_core_mysql_fnc_queryHandler;
