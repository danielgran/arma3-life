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

//todo check if item is there


_inventory pushBack [_item, _count];

_inventory;