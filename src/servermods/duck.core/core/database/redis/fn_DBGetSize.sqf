/*

  Author: Duckfine
  Date created: 15-5-2020 00:04

  Description
    Returns the Size of an db (number of stored keys)

  Parameter:
    - <type> <name>

  Returns:
    - <type> <name>


 */




private[

  "_stmt",
  "_databaseResult"

];


params[

  ["_databaseID", 0, [1]]

];


_stmt = format["redis:dbsize:%1", _databaseID];
_databaseResult = "A3Redis" callExtension _stmt;

_databaseResult = [_databaseResult, "SCALAR"] call duc_core_redis_fnc_DBValToA3Val;
_databaseResult;

