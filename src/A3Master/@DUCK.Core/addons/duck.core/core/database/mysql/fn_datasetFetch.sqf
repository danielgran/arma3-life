/*

  Author: Duckfine
  Date created: long time ago 

  Description
      Fetches Player information from the database and then returns it within an array


  Parameter:
    - <type> <name>

  Returns:
    - <type> <name>

todo 
 */




private[

  "_stmt",
  "_databaseResult",
  "_return"

];

_counter = 0;
_return = [];


params
[

  ["_steamID64", "", ["a"]],
  ["_schema", []]

];

_stmt = [_schema, "players", format["steamID64 = '%1'", _steamID64]] call DUC_core_mysql_fnc_buildSelect;
_databaseResult = [_stmt, 2, call ducv_core_id_dblife] call DUC_core_mysql_fnc_queryHandler;

if (count _databaseResult isEqualTo 1 ) then
{
    _databaseResult = _databaseResult select 0;
};

_return = [_schema, _databaseResult] call DUC_core_mysql_fnc_DBArrayToA3Array;

diag_log _return;
_return;



























//
