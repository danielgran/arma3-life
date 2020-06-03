#include "\duck.core\script_macros.hpp"
#include "\duck.life\life\modules\item\inventory\script_macros.hpp"
/*

  Author: Duckfine
  Date created: 28-5-2020 19:51

  Description
    Removes certain item in inventory

  Parameter:
    - inventory
    - item
    - count

  Returns:
    - the edited inventory

 */




private[

  "_placeholder01",
  "_placeholder02"

];


params[

  "_inventory",
  "_item",
  ["_count", 0, [1]]

];



_schemaInventoryItem = INV_GET_SCHEMA_INVENTRY;

_return = -1;
{
	_xitem = [_schemaInventoryItem, _x, "itemClassName"] call DUC_CORE_fnc_getArrayValue;
  diag_log _xitem;
  diag_log _item;
  _xcount = [_schemaInventoryItem, _x, "itemCount"] call DUC_CORE_fnc_getArrayValue;
  diag_log _xcount;


  if(_xitem isEqualTo _item) exitWith 
  {
    // delete item from inventory
    if(_count isEqualTo 0 || _xcount <= 0 || _xcount - _count <= 0) then
    {
      _inventory deleteAt _forEachIndex;
      _return = true;
    } else
    {
      _newItemCount = _xcount - _count;
      _newItem = [_schemaInventoryItem, _x, "itemCount", _newItemCount] call DUC_CORE_FNC_setArrayValue;
      _inventory set [_forEachIndex, _newItem];
    };
  };
} forEach _inventory;

_inventory;