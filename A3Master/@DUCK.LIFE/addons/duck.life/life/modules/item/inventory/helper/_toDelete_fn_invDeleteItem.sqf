/*

  Author: Duckfine
  Date created: 28-5-2020 19:51

  Description
    Deletes certain item in inventory

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

  "_inventory",
  "_item"

];



_schemaInvenoryItem = getArray(configFile >> "CfgSettings" >> "DEF_VITEM" >> "inventoryItem");

_return = -1;
{
	_xitem = [_schemaInvenoryItem, _x, "itemClass"] call DUC_CORE_fnc_getArrayValue;


  if(_xitem isEqualTo _item) exitWith 
  {
    _inventory deleteAt _forEachIndex;
    _return = true;
  };


} forEach _inventory;

_inventory;