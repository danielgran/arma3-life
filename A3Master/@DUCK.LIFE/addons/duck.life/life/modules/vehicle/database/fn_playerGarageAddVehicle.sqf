#include "\duck.core\script_macros.hpp"
/*

  Author: Duckfine
  Date created: 21-7-2020 17:07

  Description
    Adds an vehicle to an player garage in cache ( database )

  Parameter:
    - string steamid64 player
	- string vehicle class name
	- int quant

  Returns:
    - bool successful


 */

 private[

  "_placeholder01",
  "_placeholder02"

];

params[

  ["_steamID64", "", ["a"]],   // Player
  ["_vehicle", "", ["a"]],     // ItemClassname
  ["_quant", 0, [1]],    // Quantity

];



// TODO 
_playerGarage = [_steamID64] call DUC_LIFE_VEH_fnc_getPlayerGarage;

{
	
} forEach  ;




