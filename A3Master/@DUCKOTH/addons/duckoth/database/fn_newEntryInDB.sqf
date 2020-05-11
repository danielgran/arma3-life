/*
Creates new Player Entry in Database
Should only called if its shure that there is no player existing

Author: Duckfine

Errorcodes:
2001: Player is objnull
*/

_player = [_this, 0, objNull, [objNull]] call BIS_fnc_param;


/*if (objNull isEqualTo objNull) exitWith
{
	diag_log format["[ERROR] - newEntryInDB - %1", (call DUCUT_)];
	
	false;
};
*/ // Temporary disabled by duckfine 18.04.2019
//players table

