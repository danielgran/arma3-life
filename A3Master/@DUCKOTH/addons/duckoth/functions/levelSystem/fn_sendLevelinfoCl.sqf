/*
	Author: Duckfine
	
	Description:
		Sends Levelinformations to Player
	
	Params:
		0: Playertarget
		1: Actual XP of Player

*/

private["_target", "_levelData", "_xpLevelNow", "_xpLevelNext", "_levelNow"];

_target = objNull;
_expNow = 0;
_levelNext = 0;
_levelData = [];
_levelNow = 0;


_target = param[0];
_expNow = param[1];

_levelData = [_expNow] call DUCLVL_fnc_calcNextLevel;
_levelNow = [_expNow] call DUCLVL_fnc_calcLevel;
_xpLevelNow = _levelData select 0;
_xpLevelNext = _levelData select 1;

[_xpLevelNow, _xpLevelNext, _levelNow] remoteExec ["DUCLVL_fnc_receiveLevelinfo", _target];

