/*
  Fetches Player information from the database and then returns it within an array

  Author: Duckfine


*/





private[

  "_schema",
  "_counter",
  "_insert",
  "_dataType",
  "_return"

];

_counter = 0;
_return = [];


params
[

  ["_steamID64", "", ["a"]],
  ["_schema", []]

];

_stmt = [_schema, "players", format["steamID64 = %1", _steamID64]] call DUC_core_mysql_fnc_buildSelect;
_databaseResult = [_stmt, 2, call ducv_core_dbidplayerdata] call DUC_core_mysql_fnc_queryHandler;

// _databaseResult = ["Prof Bildungsstop","","4CHZ2TWR4",0,0,"","","CIVILIAN","","","","","",0,"",0,0,0,0,0,0,0,0,0,0,0,0,0]

if (count _databaseResult isEqualTo 1 ) then
{
    _databaseResult = _databaseResult select 0;
};


_return = [_schema, _databaseResult] call DUC_core_mysql_fnc_DBArrayToA3Array;

diag_log _return;
_return;



























//
