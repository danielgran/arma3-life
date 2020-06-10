/*
  Inserts new Player in Database

  Author: Duckfine
*/

private[ "_pattern", "_playerInternalID", "_steamID64", "_a3name", "_proceed", "_count", "_max"];

_pattern = "0XXX0XXX0";


params [
  "_steamID64",
  "_a3name"
];


_query = format ["CALL spAddNewUser('%1', '%2');", _steamID64, _a3name];
_databaseResult = [_query, 0, (call ducv_core_dbidplayerdata)] call DUC_core_mysql_fnc_queryHandler;
// check if player was created successfully
true; //todo check query handler always return true also if i set data in an db which literaklly not exists wtf what i have coded
