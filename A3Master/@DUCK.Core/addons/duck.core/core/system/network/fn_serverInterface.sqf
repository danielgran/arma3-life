/*

  Author: Duckfine
  Date created:   11-04-2020 23:22
  Last modified: 11-04-2020 23:22

  Description:
    - Receives all the requests from clients and then forwards the request to the specific models

  Params:
    - string TOKEN
    - string requestModule
    - string requestID
    - array /string Conent


  Returns:
    -

*/


private[

  "_tmp",
  "_proceed"

];

_proceed = true;

params[

  ["_sender", objNull],
  ["_steamID64", "", [""]],
  ["_token", "", [""]],
  ["_requestModule", "", [""]],
  ["_requestID", "", ["", 1]],
  ["_content", "", ["", []]]

];

diag_log "===============================";
diag_log "=====fn_serverInterface.sqf====";
diag_log "===============================";




diag_log format ["_sender: %1", _sender];
diag_log format ["_steamID64: %1", _steamID64];
diag_log format ["_token: %1", _token];
diag_log format ["_requestModule: %1", _requestModule];
diag_log format ["_requestID: %1", _requestID];
diag_log format ["_content: %1", _content];





// Errorhandling
if (_sender isEqualTo objNull) exitWith {
    diag_log "Sender was null";

    
    false;
};

// todo should be equal inform admin if its not
if(_sender != remoteExecutedOwner) exitWith
{ 
  diag_log "sender wasnt equal to remoteExecutedOwner";
  false;
};


// Authentication

// Generate new token if player has no
if(_token isEqualTo "") then
{
  _tmp = _steamID64 call DUC_core_auth_fnc_register;
  if (_tmp isEqualTo false) exitWith { _proceed = false; };


  // remoteexec authgenetter on client
  ["", "AUTH", 0, _tmp] remoteExec ["CDUC_SYS_fnc_receiveServer", remoteExecutedOwner];
  _proceed = false;
};

// Error
if !(_proceed) exitWith { false; };

// Check for Valid Token

_key = format ["auth#%1", _steamID64];
_schemaCfg = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIDs");
_databaseID = [_schemaCfg, "playerdata", "SCALAR"] call DUC_CORE_fnc_getConfigEntry;
_databaseResult = [_databaseID, _key, "STRING"] call DUC_core_redis_fnc_keyGet;
if !(_token isEqualTo _databaseResult) exitWith
{
  // todo kick player from server would be the best
  false;
};

diag_log format ["_sender: %1", _sender];
diag_log format ["_steamID64: %1", _steamID64];
diag_log format ["_token: %1", _token];
diag_log format ["_requestModule: %1", _requestModule];
diag_log format ["_requestID: %1", _requestID];
diag_log format ["_content: %1", _content];


switch (_requestModule) do {

  // todo every module has its own unique name with 3 chars
  case ("SYS"): {
      [_token, _sender, _steamID64, _requestID, _content] spawn DUC_core_sys_fnc_handlerSystem;
  };


  case ("ECO"): {
      [_token, _sender, _steamID64, _requestID, _content] spawn DUC_life_eco_fnc_handlerEconomy;
  };

  // Handling for garages, vehicles on map, upgrading, etc
  case ("VEH"): {

  };






};

























//
