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

// Security
DUCV_SEC_AUTHTOKEN = "";

private _steamID64 = getPlayerUID player;
private _clientID = clientOwner;


// Get token to work with
[_clientID, _steamID64] remoteExec ["DUC_core_net_fnc_serverInterface", 2];

// waitUntil {DUCV_SEC_AUTHTOKEN != ""}; todo delete
// Player is now authenticated

// Send Request to server so that the player is beeing initialized
["SYS", 0, [name player]] call CDUC_SYS_fnc_sendServer;
// wait until variables are here from server
// waitUntil { !isNil "DUCV_alive" }; todo delete

// player has now variables from server so the init of life can begin

// init the life mod
[] call compile preprocessFileLineNumbers "life\lifeInit.sqf";




systemChat "INIT DONE";
