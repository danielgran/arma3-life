/*

  Author: Duckfine
  Date created:  11-04-2020 23:54

  Description:
    Adds new Key with value to DB

  Params:
    - INT Databaseid
    - string key
    - string value


  Returns:
    -

*/


private[

  "_stmt",
  "_databaseResult",
  "_check",
  "_return"

];

params[

  ["_databaseID", 0, [1]],
  ["_key", "", ["a"]],
  "_value"

];


_stmt = format["redis:set:%1:%2:%3", _databaseID, _key, _value];
_databaseResult = "A3Redis" callExtension _stmt;



_check = call compile _databaseResult;

_return = false;
if(_check) then {_return = true;};
_return;






































//
