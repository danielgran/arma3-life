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

  "_query",
  "_databaseResult",
  "_schema",
  "_return"

];

params[

  ["_steamID64",""]

];



_query = format ["CALL spGetPlayerServerTransaction('%1');", _steamID64];
_databaseResult = [_query, 2, (call ducv_core_id_dblife)] call DUC_core_mysql_fnc_queryHandler;

// todo Mehr KANN zurück kommen?
_databaseResult = _databaseResult select 0;
// Check if player is not in the system
if (_databaseResult isEqualTo ["01"]) exitWith { false; };

// Check if player has no active transaction
if (_databaseResult isEqualTo ["02"]) exitWith { false; };

if (count _databaseResult <= 2) exitWith { false; };




_schema = getArray(configFile >> "CfgSettings" >> "db_life" >> "tblPlayerServerTransact" >> "schema");

_return = [_schema, _databaseResult] call DUC_core_mysql_fnc_DBArrayToA3Array;





_return;




































//
