/*

  Author: Duckfine
  Date created: 28-5-2020 09:18

  Description
    Sets an item to an inventory

  Parameter:
    - inventory
	- item
	- count

  Returns:
    - bool true / false


 */

private[

  "_invHasItem",
  "_inventory",
  "_schemaInvenoryItem",
  "_xitem",
  "_xcount"

];


params[

  "_inventory",
  "_item",
  ["_count", 0, [1]]

];

if (_count <= 0) exitWith { false; };


// Check if inv has item
_invHasItem = [_inventory, _item] call duc_life_vitem_fnc_invHasItem;

// If inv has no item add it then exit
if !(_invHasItem) exitWith 
{
  _inventory = [_inventory, _item, _count] call DUC_LIFE_VITEM_FNC_invAddItem;
  _inventory;
};



_schemaInvenoryItem = getArray(configFile >> "CfgSettings" >> "DEF_VITEM" >> "inventoryItem");

{


  _xitem = [_schemaInvenoryItem, _x, "itemClass"] call DUC_CORE_fnc_getArrayValue;
  _xcount = [_schemaInvenoryItem, _x, "itemCount"] call DUC_CORE_fnc_getArrayValue;

  // If item classname is equal to item 
  if (_xitem isEqualTo _item) exitWith
  {
    //set it


    _inventory set [_forEachIndex, [_xitem, _count]];
  };
} forEach _inventory;

_inventory;


































 //