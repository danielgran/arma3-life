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
  ["_playerVelocity", [], [[]]]

];


// sql insert player transact

// CALL spPTSServerTransactPlayer('76561198216442289', 1, 0, 'B_MBT_01_mlrs_F', 'EinCoolerSkin.paa', """[0,20,0]""");
_schema = DEF_DB_GET_SCHEMA("db_life", "tblPlayerServerTransact", "schema");
_insertArray = [_schema, [_steamID64, DEF_CORE_CONST_SERVERID, _serverTarget, _vehicleName, _vehicleSkin, _playerVelocity]] call DUC_CORE_MYSQL_FNC_A3ArrayToDBArray;

_query = format["CALL spPTSServerTransactPlayer('%1', %2, %3, '%4', '%5', '%6');", _insertArray select 0, _insertArray select 1, _insertArray select 2, _insertArray select 3, _insertArray select 4, _insertArray select 5];

// Register the send event in db
DEF_DB_MYSQL_EXEC_QUERY(_query);














