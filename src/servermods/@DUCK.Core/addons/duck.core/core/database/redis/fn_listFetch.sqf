/*
  Gets player dump from redis DB and puts into array
["Prof Bildungsstop","[]","3DIE6UTL5",0,0,"","[]","[]","[]","[]","[]","[]","false","[]","false",0,0,0,0,0,0,0,0,0,0,0,0]
*/

private[

  "_return",
  "_stmt",
  "_arrSize",
  "_returnArray"

];


params[

  ["_databaseID", 0, [1]],
  ["_key", "", ["a"]],
  ["_schema", []]

];

_returnArray = [];

_stmt = format ["redis:listsize:%1:%2", _databaseID, _key];
_arrSize = call compile ("A3Redis" callExtension _stmt);
diag_log format["DUCK:REDIS:LISTFETCH Statement : %1 AND Arraysize : %2", _stmt, _arrSize];
// Check if result is true

if(typeName _arrSize isEqualTo "SCALAR") then
{
  for "_i" from 0 to (_arrSize - 1) do
  {
    diag_log _i;
      _stmt = format ["redis:listget:%1:%2:%3", _databaseID, _key, _i];
      _result = "A3Redis" callExtension _stmt;
      diag_log _stmt;
      diag_log _result;


      _returnArray pushBack _result;
  };
};
diag_log format["REDIS:PLAYERFETCH: _returnarray = %1", _returnArray];

_returnArray = [_schema, _returnArray] call DUC_core_redis_fnc_DBArrayToA3Array;


_returnArray;



























//
