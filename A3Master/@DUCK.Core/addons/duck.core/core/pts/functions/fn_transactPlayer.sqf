#include "\duck.core\script_macros.hpp"
/*

  Author: Duckfine
  Date created: 25-6-2020 19:03

  Description
    Transacts a player from one server to another

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

  "_sender", // who wants to travel
  ["_steamID64", "", ["a"]],
  ["_serverTarget", 0, [1]],
  ["_vehicleName", "", ["a"]],
  ["_vehicleSkin", "", ["a"]],
  ["_playerVelocity", "", ["a"]]

];


// sql insert player transact

// CALL sp_PTSServerTransactPlayer('76561198216442289', 1, 0, 'B_MBT_01_mlrs_F', 'EinCoolerSkin.paa', """[0,20,0]""");

//  TODO SET SERVER VALUES LIKE ID
_query = format["CALL sp_PTSServerTransactPlayer('%1', %2, %3, '%4', '%5', '%6');", _steamID64, 0, _serverTarget, _vehicleName, _vehicleSkin, _playerVelocity];

// Register the send event in db
DEF_DB_MYSQL_EXEC_QUERY(_query);














