/*

  Author: Duckfine
  Date created: long time ago

  Description
    Checks if Player exists in Database

 */

private
[

  "_query",
  "_databaseResult",
  "_return"

];

params [

  ["_steamID64", "", ["a"]]

];


_query = "";
_databaseResult = "";
_return = [];

_query = format ["SELECT id FROM players WHERE steamid64 = '%1'", _steamID64];
_databaseResult = [_query, 2, call ducv_core_id_dblife] call DUC_core_mysql_fnc_queryHandler;

if(_databaseResult isEqualTo []) then
{
   _return = false;
} else
{
  _return = true;
};

_return;
