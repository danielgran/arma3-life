/*
  Inserts new Player in Database

  Author: Duckfine
*/

private["_query", "_databaseResult"];

params [
  "_steamID64",
  "_a3name"
];


_query = format ["CALL spAddNewUser('%1', '%2');", _steamID64, _a3name];
_databaseResult = [_query, 0, (call ducv_core_id_dblife)] call DUC_core_mysql_fnc_queryHandler;
// check if player was created successfully
true; //todo check query handler always return true also if i set data in an db which literaklly not exists wtf what i have coded
