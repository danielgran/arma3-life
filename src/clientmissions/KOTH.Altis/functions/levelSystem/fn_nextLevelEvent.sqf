/*
	Author: Duckfine
	
	Description:
		Fired if Player reaches new Level
		
	ToDo:
		Some Sort of GUI action if Player reaches a new Level#
		Saving
		Barebone version just for functionality
*/

private["_player", "_exp"];

_exp = ducp_xp;
_player = player;


[_player, _exp] remoteExec ["DUCLVL_fnc_sendLevelinfoCl", 2];

call DUCSYNC_fnc_sendData;