/*
	Author: Duckfine
	
	Description:
		Calculates XP for next and actual Level for Client
		Used for GUI, etc that Player can see how much exp are lacking for next level
	
	Params:
		0: Player XP
*/

private["_playerXP", "_playerLevel", "_xpLevel", "_xpNextLevel", "_return"];
_playerXP = 0;


_playerXP = param[0];

_playerLevel = [_playerXP] call DUCLVL_fnc_calcLevel;

_xpLevel = (100 * (_playerLevel)^(2.57)) - 100;
_xpNextLevel = (100 * (_playerLevel + 1)^(2.57)) - 100;

_return = [_xpLevel, _xpNextLevel];
_return;