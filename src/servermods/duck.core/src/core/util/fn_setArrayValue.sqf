/*

  Author: Duckfine
  Date created: 27-5-2020 19:45

  Description
    Returns the value of an array regarding to the schema via the key

  Parameter:
    - <type> <name>

  Returns:
    - <type> <name>


 */




private[

  "_placeholder01",
  "_placeholder02"

];


params[

  "_schema",
  "_array",
  "_key",
  "_value"

];



// error trycatching
if (count _array > count _schema) exitWith { false; };

_index = -1;
{
  // if schemas name is equal to the searched name
  if ((_x select 0) isEqualTo _key) exitWith
  {
    _array set [_forEachIndex, _value];
    _index = _forEachIndex;
  };
} forEach _schema;
// not found
if (_index isEqualTo -1) exitWith { false; };

_array;






































//