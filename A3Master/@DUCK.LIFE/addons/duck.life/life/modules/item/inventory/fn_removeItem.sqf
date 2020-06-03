#include "\duck.core\script_macros.hpp"
#include "\duck.life\life\modules\item\inventory\script_macros.hpp"
/*

  Author: Duckfine
  Date created: 3-6-2020 13:51

  Description
    <desc>

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

  "_databaseID",
  "_databaseSchema",
  "_databaseKey", // i.e. invVirtual
  "_steamID64Sender",
  "_item",
  "_count"

];

_inventory = [_databaseID, _steamID64Sender, _databaseSchema, _databaseKey] call DUC_CORE_redis_fnc_listEntryGet;
_inventory = [_inventory, _item, _count] call DUC_LIFE_VITEM_FNC_invRemoveItem;
[_databaseID, _steamID64Sender, _inventory, _databaseSchema, _databaseKey] call DUC_CORE_redis_fnc_listEntryUpdate;
true;