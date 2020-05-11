/*

  Author: Duckfine
  Date created:   12-04-2020 03:23

  Description:
    Gets an value with key from the Redis DB

  Params:
    - INT databaseID (which database is used in redis?)
    - string key
    - string datatype


  Returns:
    - any value

*/


private[

  "_stmt",
  "_databaseResult",
  "_dataType",
  "_proceed",
  "_entryIndex"

];

_proceed = false;

params[

  ["_databaseID", 0, [1]],
  ["_key", "", [""]],
  ["_schema", []],
  ["_entry", ""]

];


// Check if key exists in Redis DB
_stmt = format ["redis:get:%1:%2", _databaseID, _key];
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




_stmt = format ["redis:listget:%1:%2:%3", _databaseID, _key, _entryIndex];
_databaseResult = "A3Redis" callExtension _stmt;

_databaseResult = [_databaseResult, _dataType] call duc_core_redis_fnc_DBValToA3Val;

_databaseResult;



































//
