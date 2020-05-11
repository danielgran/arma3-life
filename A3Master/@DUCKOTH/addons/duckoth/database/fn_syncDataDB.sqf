/*
	Sends Data from Player to the Database
	SECURITY RISK HERE
	Dataset:
	0: name
	1: xp
	2: level
	3: money
	4: kills
	5: teamkills
	6: deaths
	

	Author: Duckfine
*/


private["_player", "_dataSet", "_query"];

_player = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_dataSet = [_this, 1, [], [[0]]] call BIS_fnc_param;
_query = "";
_databaseResult = [];


//Check for "valid" Data
if ((_player isEqualTo objNull) or _dataSet isEqualTo []) exitWith
{
	["Error while Update"] remoteExec ["DUCREC_fnc_receiveServerMessage", _player];
	false;
};

//Set to vars

_name = _dataSet select 0;
_xp = _dataSet select 1;
_level = _dataSet select 2;
_money = _dataSet select 3;
_kills = _dataSet select 4;
_teamkills = _dataSet select 5;
_deaths = _dataSet select 6;
_pid = getPlayerUID _player;

//Send update Request to query handler

_query = format["UPDATE players SET a3name = '%1', xp = %2, level = %3, money = %4, kills = %5, teamkills = %6, deaths = %7 WHERE steamid64 = '%8'",_name,_xp,_level,_money,_kills,_teamkills,_deaths,_pid ];
_databaseResult = [_query, 1, (call dckdb_playerdata_id)] call DUCDB_fnc_queryHandler;

//inform client that was successful or not

["Successfully updated Data"] remoteExec ["DUCREC_fnc_receiveServerMessage", _player];