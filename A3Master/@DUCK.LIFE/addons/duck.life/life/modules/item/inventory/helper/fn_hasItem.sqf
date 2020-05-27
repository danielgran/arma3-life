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
  "_itemClassname",
  ["_count", 0]

];

_schemaInvenoryItem = getArray(configFile >> "CfgSettings" >> "DEF_VITEM" >> "inventoryItem");


{

    // 


  _xitem = [_schemaInvenoryItem, _x, "itemClass"] call DUC_CORE_fnc_getArrayValue;
  _xcount = [_schemaInvenoryItem, _x, "itemCount"] call DUC_CORE_fnc_getArrayValue;


  _return = -1;


  // Check if current looped item is equal to the searched one
  if(_xitem isEqualTo _itemClassname) then
  {
    //Check the amount
    if (_xcount > 0) exitWith
    {
      _return = _xcount;
    };
    if (_xcount isEqualTo 0) exitWith
    {
      _return = false;
    };
  };

} forEach _inventory;

if(_return isEqualTo -1) exitWith
{
  
};

_found;







