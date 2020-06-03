#include "\duck.core\script_macros.hpp"
/*

  Author: Duckfine
  Date created: 27-5-2020 20:39

  Description
    Removes Item(s) from Players inventory

  Parameter:
    - STRING steamid64
    - ARRAY info ["itemname", count as scalar]

  Returns:
    - BOOL succeeded

*/




private[

  "_placeholder01",
  "_placeholder02"

];


params[

  ["_steamID64", "", ["a"]],
  "_info" //["invtype", "item1", count] //invtype not used yeet

];

// Errorhandling
if (_info select 2 <= 0) exitWith { false; };
if !(typeName _info isEqualTo "ARRAY") exitWith { false; };

// Get inventory from redis




_schema = DEF_DB_GET_SCHEMA("db_life", "tblplayers", "playerRelated")
_schemaCfg = DEF_DB_GET_SCHEMA("db_life", "Redis", "dbIDs")
_databaseID = [_schemaCfg, "playerdata", "SCALAR"] call DUC_CORE_fnc_getConfigEntry;

_inventory = [_databaseID, _steamID64, _schema, "invVirtual"] call DUC_CORE_redis_fnc_listEntryGet;


_itemCount = [_inventory, _info select 1] call DUC_LIFE_VITEM_fnc_invGetItemCount;
// no item found
if(_itemCount isEqualTo 0) exitWith { false; };

if (_itemCount <= (_info select 2)) then
{
  _inventory = [_inventory, _info select 1] call DUC_LIFE_VITEM_fnc_invDeleteItem;
} else {
  _itemCount = _itemCount - (_info select 2);
  _inventory = [_inventory, _info select 1, _itemCount] call DUC_LIFE_VITEM_fnc_invSetItem;
};


// update entry in cache

_tmp01 = [_databaseID, _steamID64, _inventory, _schema, "invVirtual"] call DUC_CORE_redis_fnc_listEntryUpdate;

true;




