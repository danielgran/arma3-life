/*

  Author: Duckfine
  Date created:   14-04-2020 21:09

  Description:
    Handles the request for the player to deposit something to his cash
    also does update in Redis DB

    (BANK ---> CASH)

  Params:
    - string STEAMID64
    - int amount


  Returns:
    -

*/


private[

  "_moneyBank",
  "_moneyCash",
  "_stmt",
  "_databaseResult"

];

params[

  ["_steamID64","", [""]],
  ["_amount", 0, [1]]

];



// funny
if (_amount <= 0) exitWith { false; };


_schema = getArray(configFile >> "CfgSettings" >> "db_life" >> "tblplayers" >> "playerRelated");

_schemaCfg = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIDs");
_databaseID = [_schemaCfg, "playerdata", "SCALAR"] call DUC_CORE_fnc_getConfigEntry;

_moneyBank = [_databaseID, _steamID64, _schema, "bank"] call DUC_CORE_redis_fnc_listEntryGet;
if ! ((typeName _moneyBank) isEqualTo "SCALAR") exitWith { false; };

// TODO if false typename inform admin /|\  \|/

_moneyCash = [_databaseID, _steamID64, _schema, "cash"] call DUC_CORE_redis_fnc_listEntryGet;
if ! ((typeName _moneyCash) isEqualTo "SCALAR") exitWith { false; };


// Check if player has enogh money cash
if (_moneyCash < _amount) exitWith { false; };



_moneyCash = _moneyCash - _amount;
_moneyBank = _moneyBank + _amount;

_tmp01 = [_databaseID, _steamID64, _moneyCash, _schema, "cash"] call DUC_CORE_redis_fnc_listEntryUpdate;
_tmp02 = [_databaseID, _steamID64, _moneyBank, _schema, "bank"] call DUC_CORE_redis_fnc_listEntryUpdate;

if (_tmp01 && _tmp02) exitWith { true; };

false;













































//
