/*

  Author: Duckfine
  Date created:   03-05-2020 12:54

  Description:
    Checks if a players comes from another server


  Params:
    - string steamID64


  Returns:
    -

*/


private[

  "_placeholder01",
  "_placeholder02"

];

params[

  ["_steamID64",""]

];



_query = format ["CALL spGetPlayerServerTransaction('%1');", _steamID64];
_databaseResult = [_query, 0, (call ducv_core_id_dblife)] call DUC_core_mysql_fnc_queryHandler;





_schema = getArray(configFile >> "CfgSettings" >> "db_life" >> "tblPlayerServerTransact" >> "schema");

_return = [_schema, _databaseResult] call DUC_core_mysql_fnc_DBArrayToA3Array;










































//
