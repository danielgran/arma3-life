/*

  NEVER NEEDED




  Author: Duckfine
  Date created:   11-04-2020 15:00
  Last modified: 11-04-2020 15:00

  Description:
    - Return an playerinfo from Redis DB

  Params:
    - schema array
    - string info (money, cash, banned, etc)
    - DB Key in redis (i.e. Player steamid64)

  Returns:
    - the stat with the correct format

*/


private[

  "_keys",
  "_listIndex",
  "_stmt",
  "_databaseResult",
  "_dataType"

];

_keys = [];



params[

  ["_schema", []],
  ["_lookup", ""],
  ["_dbKey", ""]

];




{
    _keys pushBack (_x select 0);
    if (_lookup isEqualTo (_x select 0)) then {
      _listIndex = _forEachIndex;
      _dataType = _x select 1;
    };
} forEach _schema;

// Wenn es den Key der gesucht wird nicht im schema gibt
if ! (_lookup in _keys) exitWith { objNull; };
// Wenn ja, dann...


_stmt = format["redis:listget:%1:%2", _dbKey, _listIndex];

_databaseResult = "A3Redis" callExtension _stmt;
diag_log format["CORE:GETINFOFROMDB: _stmt = %1", _stmt];
diag_log format["CORE:GETINFOFROMDB: _databaseResult = %1", _databaseResult];


_databaseResult = [_databaseResult, _dataType] call DUC_core_redis_fnc_DBValToA3Val;

_databaseResult;





































//
