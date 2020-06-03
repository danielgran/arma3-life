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

  "_placeholder01",
  "_placeholder02"

];


params[

  "_inventory",
  "_item",
  ["_count", 0, [1]]

];

// nope
if(_count <= 0) exitWith { false; };


_itemCount = [_inventory, _item] call DUC_LIFE_VITEM_fnc_invGetItemCount;


if(_itemCount isEqualTo 0) exitWith
{
  _inventory pushBack [_item, _count];
  _inventory;
};

_inventory = [_inventory, _item, _count] call DUC_LIFE_VITEM_invSetItem;


_inventory;