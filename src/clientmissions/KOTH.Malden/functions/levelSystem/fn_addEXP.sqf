/*
	Author: Duckfine
	
	Description:
		Called when the player somehow gets EXP
		
	Params:
		0: How Much EXP have to added
		
	ToDo:
		Some Security functionality?
*/

private["_addEXP"];

_addEXP = 0;

_addEXP = param[0];

ducp_xp = ducp_xp + _addEXP;


if (ducp_xp >= ducp_xpNextLevel or ducp_xp <= ducp_xpLevel) then
{
	[] call DUCLVL_fnc_nextLevelEvent; //sends old level to function
};