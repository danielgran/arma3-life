/*

  Author: Duckfine
  Date created:   14-04-2020 21:14

  Description:
  Transfers money from the bankaccount of player one to player two

  BANK:
  PLAYER01 --> PLAYER02

  Params:
    - string steamid64 sender
    - string steamid64 receiver
    - int amount
    (- string usage) -> optional


  Returns:
    - true / false if transaction suceeded

*/


private[

  "_schema",
  "_moneySender",
  "_moneyReceiver"

];

params[

  ["_steamidSender","", [""]],
  ["_steamidReceiver", "", [""]],
  ["_amount", 0, [0]], //greater than 0
  ["_usage", "",[""]] // optional

];

// Errorchecks
// haha nice try
if (_amount <= 0 ) exitWith { false; };
if (_steamidSender isEqualTo _steamidReceiver) exitWith { false; };

_schema = getArray(configFile >> "CfgSettings" >> "db_life" >> "tblplayers" >> "playerRelated");

_schemaCfg = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIDs");
_databaseID = [_schemaCfg, "playerdata", "SCALAR"] call DUC_CORE_fnc_getConfigEntry;





// Get Money of Sender check if he has enogh money get money of receiver
_moneySender = [_databaseID, _steamidSender, _schema, "bank"] call DUC_CORE_redis_fnc_listEntryGet;
if ! ((typeName _moneySender) isEqualTo "SCALAR") exitWith { false; };

// no credit here
if ((_moneySender - _amount) < 0) exitWith { false; };

_moneyReceiver = [_databaseID, _steamidReceiver, _schema, "bank"] call DUC_CORE_redis_fnc_listEntryGet;
if ! ((typeName _moneyReceiver) isEqualTo "SCALAR") exitWith { false; };

// Set new values
_moneySender = _moneySender - _amount;
_moneyReceiver = _moneyReceiver + _amount;

// Update them into redis
_tmp01 = [_databaseID, _steamidSender, _moneySender, _schema, "bank"] call DUC_CORE_redis_fnc_listEntryUpdate;
_tmp02 = [_databaseID, _steamidReceiver, _moneyReceiver, _schema, "bank"] call DUC_CORE_redis_fnc_listEntryUpdate;

// Check if everything was fine
if (_tmp01 && _tmp02) exitWith { true; };

false;

































//
