/*

  Author: Duckfine
  Date created:   12-04-2020 03:23

  Description:
    Gets an value with key from the Redis DB

  Params:
    - string key
    - string datatype


  Returns:
    - any value

*/


private[

  "_stmt",
  "_databaseResult"

];

params[

  ["_databaseID", 0, [1]],
  ["_key", "", [""]],
  ["_dataType", "", [""]]

];


_stmt = format ["redis:get:%1:%2", _databaseID, _key];
_databaseResult = "A3Redis" callExtension _stmt;

_databaseResult = [_databaseResult, _dataType] call duc_core_redis_fnc_DBValToA3Val;
_databaseResult;



































//
