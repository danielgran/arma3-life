/*

  Author: Duckfine
  Date created: 28-5-2020 19:43

  Description
    Checks an inventory for an item and returns the number of items found

  Parameter:
    - <type> <name>

  Returns:
    - <type> <name>


 */




private[

  "_schemaInventoryItem",
  "_xitem",
  "_xcount",
  "_return"

];


params[

  "_inventory",
  "_item"

];


_schemaInventoryItem = getArray(configFile >> "CfgSettings" >> "DEF_VITEM" >> "inventoryItem");

_return = -1;
{
  _xitem =  [_schemaInventoryItem, _x, "itemClass"] call DUC_CORE_fnc_getArrayValue;
  _xcount = [_schemaInventoryItem, _x, "itemCount"] call DUC_CORE_fnc_getArrayValue;

  if (_xitem isEqualTo _item) exitWith
  {
	_return = _xcount;
  };

} forEach _inventory;

if(_return > 0) exitWith { _return; };

0;





















//
