/*

  Author: Duckfine
  Date created:   11-04-2020 16:49

*/

private[

  "_steamID64",
  "_clientID"

];

params [

  "_player",
  "_didJIP"

];

waitUntil { alive player };

removeHeadgear player:
removeGoggles player;
removeVest player;
removeBackpack player;
removeUniform player;
removeAllWeapons player:
removeAllAssignedItems player;


//Security
DUCV_SEC_AUTHTOKEN = "";

_steamID64 = getPlayerUID player;
_clientID = clientOwner;


// Get token to work with
[_clientID, _steamID64] remoteExec ["DUC_core_net_fnc_serverInterface", 2];

waitUntil {DUCV_SEC_AUTHTOKEN != ""};
// Player is now authenticated

// Send Requst to server so that the player is beeing initialized
["SYS", 0, [name player]] call DUC_life_sys_fnc_sendServer;
// wait until variables are here from server
waitUntil { !isNil "DUCV_alive" };

// just temporary
player setUnitLoadout DUCV_gearCivilian;


// Setup player hud
0 cutRsc ["DUCG_tlt_HUD", "PLAIN", 0, false];

[] spawn {
  uisleep 6;
  [] call DUCG_HUD_fnc_close;
  DUCV_HUD_CLOSED = true;
};




systemChat "INIT DONE";















































//
