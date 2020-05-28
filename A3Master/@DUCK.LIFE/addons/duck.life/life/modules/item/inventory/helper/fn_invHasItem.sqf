/*

  Author: Duckfine
  Date created: 27-5-2020 20:52

  Description
    Checks if a inventory has a specific item

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
  "_item",
  ["_count", 1, [1]]

];

_schemaInvenoryItem = getArray(configFile >> "CfgSettings" >> "DEF_VITEM" >> "inventoryItem");



_return = -1;
{

  _xitem = [_schemaInvenoryItem, _x, "itemClass"] call DUC_CORE_fnc_getArrayValue;
  _xcount = [_schemaInvenoryItem, _x, "itemCount"] call DUC_CORE_fnc_getArrayValue;

  // Check if current looped item is equal to the searched one
  if(_xitem isEqualTo _item) then
  {
    //Check the amount
    if (_xcount > 0) exitWith
    {
      _return = _xcount;
    };
  };

} forEach _inventory;



// check if the inv has the right amount items
if(0 > (_return - _count)) exitWith
{
  true;
};


false;