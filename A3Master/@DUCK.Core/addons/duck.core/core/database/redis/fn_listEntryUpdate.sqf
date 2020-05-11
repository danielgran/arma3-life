/*

  Author: Duckfine
  Date created:   14-04-2020 21:28

  Description:
    updates an entry of a list in Redis DB

  Params:
    - INT databaseID of redisDB
    - string key
    - string value
    - array schema
    - string entry in schema


  Returns:
    -

*/


private[

  "_proceed",
  "_entryIndex",
  "_dataType"

];

params[

  ["_databaseID", 0, [1]],
  ["_key", "", [""]],
  "_value",
  ["_schema", [], [[]]],
  ["_entry", ""]

];



// Check if key exists in Redis DB
if ! ([_databaseID, _key] call DUC_CORE_redis_fnc_keyExists) exitWith { false; };

// Check if entry is available in schema
{
    if (_entry in (_x select 0)) exitWith
    {
      _proceed = true;
      _entryIndex = _forEachIndex;
      _dataType = _x select 1;
    };
} forEach _schema;

if ! (_proceed) exitWith { false; };


_value = [_value, _dataType] call DUC_CORE_redis_fnc_A3ValToDBVal;


_stmt = format["redis:listupdate:%1:%2:%3:%4", _databaseID, _key, _entryIndex, _value];

diag_log _stmt;

_databaseResult = "A3Redis" callExtension _stmt;

if (_databaseResult isEqualTo "TRUE") exitWith { true; };

false;


























//
