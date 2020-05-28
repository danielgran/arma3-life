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

  "_placeholder01",
  "_placeholder02"

];


params[

  "_inventory",
  "_item",
  ["_count", 0, [1]]

];

if (_count <= 0) exitWith { false; };


// Check if inv has item
_invItemInfo = [_inventory, _item] call duc_life_vitem_fnc_invHasItem;

// If inv has no item add it then exit
if !(_invItemInfo) exitWith 
{
  _inventory = [_inventory, _item, _count] call DUC_LIFE_VITEM_FNC_invAddItem;
  _inventory;
};

{
  // If item classname is equal to item 
  if (_x select 0 isEqualTo _item) exitWith
  {
	 //set it
    _inventory set [_forEachIndex, _count];
  };
} forEach _inventory;

_inventory;


































 //