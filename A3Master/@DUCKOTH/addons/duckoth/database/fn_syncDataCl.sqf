/*
Sends Full Dataset to Client
Executed at Client only when he Joins the Server and clinit is fired
Author: Duckfine

*/
private["_query","_databaseResult","_playerUID","_target","_data","_level", "_levelData", "_levelNow", "_levelNext"];
_query = "";
_databaseResult  = [];
_playerUID = "";
_target = objNull;
_data = []; // Array of complete Dataset
_level = 0;
_levelData = [];
_levelNow = 0;
_levelNext = 1;



_target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_playerUID = [_this, 1, "", ["a"]]  call BIS_fnc_param;



//Check if player exists in DB

_query = format ["SELECT id FROM players WHERE steamid64 = '%1'", _playerUID];
_databaseResult = [_query, 2, (call dckdb_playerdata_id)] call DUCDB_fnc_queryHandler;

if (_databaseResult isEqualTo [1001]) then //If Player does not Exist
{
	_pIntID = call DUCDB_fnc_newPlayerIntID;
	_dateStamp = ( [0] call DUCUT_fnc_getTimeStamp) select 0;
	_query = format ["INSERT INTO players (steamid64, intid, a3name, playtime, firstconnect, lastconnect) values (%1,'%2','%3','%4','%5','%5')", _playerUID, _pIntID, name _target, "00:00:00", _dateStamp];
	_databaseResult = [_query, 1, (call dckdb_playerdata_id)] call DUCDB_fnc_queryHandler;
	if (_databaseResult isEqualTo true) then
	{
	};
	uisleep 0.5;


};


_query = format ["SELECT intid, a3name, rank, banned, xp, level, money, kills, teamkills, deaths FROM players WHERE steamid64 = '%1'", _playerUID];
_databaseResult = [_query, 2, (call dckdb_playerdata_id)] call DUCDB_fnc_queryHandler;

if (_playerUID isEqualTo "") exitWith {[false] remoteExec ["DUCSYNC_fnc_receiveData", _target]}; //Check if playerid is valid


//Calculate Level of Player
_level = [_databaseResult select 4] call DUCLVL_fnc_calcLevel;

//Sending XP Informations to Player
[_target, _databaseResult select 4] call DUCLVL_fnc_sendLevelinfoCl;


_data set [0, _databaseResult select 0]; //player INT ID
_data set [1, _databaseResult select 1]; //NAME
_data set [2, _databaseResult select 2]; //rank
_data set [3, _databaseResult select 3]; //banned
_data set [4, _databaseResult select 4]; //xp
_data set [5, _level]; //level
_data set [6, _databaseResult select 6]; //money
_data set [7, _databaseResult select 7]; //kills
_data set [8, _databaseResult select 8]; //teamkills
_data set [9, _databaseResult select 9]; //deaths

[_data] remoteExec ["DUCSYNC_fnc_receiveData", _target]
