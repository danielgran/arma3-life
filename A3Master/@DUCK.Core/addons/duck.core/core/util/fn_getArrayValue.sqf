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

  "_index"

];


params[

  "_schema",
  "_array",
  "_key"

];



// error trycatching
if (count _array > count _schema) exitWith { false; };

_index = -1;
{
	if ((_x select 0) isEqualTo _key) exitWith { _index = _forEachIndex};
} forEach _schema;

if (_index isEqualTo -1) exitWith { false; };

_array select _index;