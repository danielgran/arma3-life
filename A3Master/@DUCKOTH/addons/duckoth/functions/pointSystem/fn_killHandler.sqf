/*
	This script should handle all Kills which are made on the server
	Also it should determine if kill was tk, not allowed, etc, log it, weapon, distance, etc
	
	Author: Duckfine
	

*/
{
_x addEventHandler ["Fired", {

params["_unit", "_weapon"];

_unit sideChat "HALLO";

}];} forEach allPlayers;