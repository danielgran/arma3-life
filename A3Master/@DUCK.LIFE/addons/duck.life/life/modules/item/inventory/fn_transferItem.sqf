/*

  Author: Duckfine
  Date created: 28-5-2020 21:36

  Description
    Transfers one item from inv a to b (player to player)

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

  ["_steamID64Sender", "", ["a"]],
  "_info" // [_item, _count, _steamID64Receiver]

];


_item = _info select 0;
_count = _info select 1;
_steamID64Receiver = _info select 2;

if(_steamID64Sender isEqualTo "" || _steamID64Receiver isEqualTo "") exitWith { false; };




_schema = getArray(configFile >> "CfgSettings" >> "db_life" >> "tblplayers" >> "playerRelated");
_schemaCfg = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIDs");
_databaseID = [_schemaCfg, "playerdata", "SCALAR"] call DUC_CORE_fnc_getConfigEntry;



// get inventory from player a (sender)
_inventoryA = [_databaseID, _steamID64Sender, _schema, "invVirtual"] call DUC_CORE_redis_fnc_listEntryGet;

// check if player has item
_hasItem = [_inventoryA, _item, _count] call DUC_LIFE_VITEM_FNC_invHasItem;

if !(_hasItem isEqualTo true) exitWith { false; };

// remove the item from player a's inv
_inventoryA = []

// add item to inventory from player b
