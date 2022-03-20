/*
Client Init
Author: Duckfine
*/


waitUntil {!isNull(player) and (player isEqualTo player)}; // and serverisready
waitUntil { !isNull findDisplay 46 }; //Wait until Player has Display

_player = player;
_playerUID = getPlayerUID _player;

//Check if DB Connection is valid

if (duc_dbavailable isEqualTo true) then
{
	[_player, _playerUID] remoteExec ["DUCDB_fnc_syncDataCl", 2]; //Kompletter Request an Daten und eventueller neuer DB Eintrag
} else
{
	failMission "LOSER"; //ToDo: Some sort of "offline" Mode?
};

if (typeName _playerUID == "NUMBER") then
{
	parseText _playerUID; // should never be executed, just looks cool
};

_player addAction ["Playermenu", {[] call DUCGUI_fnc_openPlayerMenu}];

