#include "\duck.core\script_macros.hpp"
#include "\duck.life\life\modules\item\inventory\script_macros.hpp"
/*

  Author: Duckfine
  Date created: 28-5-2020 09:35

  Description
   Adds an item to an inventory

  Parameter:
    - inventory
	- item
	- count

  Returns:
    - bool true / false


 */

private[

  "_schemaInventoryItem",
  "_found",
  "_xitem",
  "_xcount",
  "_newItemCount",
  "_newItem"

];


params[

  "_inventory",
  "_item",
  ["_count", 0, [1]]

];

// nope
if(_count <= 0) exitWith { false; };


_schemaInventoryItem = INV_GET_SCHEMA_INVENTRY;

_found = false;
{
  _xitem = [_schemaInventoryItem, _x, "itemClassName"] call DUC_CORE_fnc_getArrayValue;
  _xcount = [_schemaInventoryItem, _x, "itemCount"] call DUC_CORE_fnc_getArrayValue;
  if(_xitem isEqualTo _item) exitWith
  {
    _found = true;
    _newItemCount = _xcount + _count;
    _newItem = [_schemaInventoryItem, _x, "itemCount", _newItemCount] call DUC_CORE_FNC_setArrayValue;
    _inventory set [_forEachIndex, _newItem];
  };
} forEach _inventory;




if (_found isEqualTo false) then
{
  // Create new item object / array
  _newItem = [];
  {
    _newItem pushBack "";
  } forEach _schemaInventoryItem;

  _newItem = [_schemaInventoryItem, _newItem, "itemClassName", _item] call DUC_CORE_FNC_setArrayValue;
  _newItem = [_schemaInventoryItem, _newItem, "itemCount", _count] call DUC_CORE_FNC_setArrayValue;
  _inventory pushBack _newItem;
};


_inventory;