/*

  Author: Duckfine
  Date created: 9-6-2020 21:16

  Description
    Sets all variables the client needs to work during the game

  Parameter:
    - <type> <name>

  Returns:
    - <type> <name>


 */

#ifndef setupvarsdone
#define setupvarsdone asd

private[

  "_vars",
  "_placeholder02"

];

// Setup vars which are set with setVariable / global vars
_vars = getArray(missionConfigFile >> "CfgSettings" >> "DUC_LIF" >> "Variables" >> "player");
{
  [] call compile format["player setVariable[""%1"", %2, false];", _x select 0, _x select 1];
} forEach _vars;


// Setup public vars
_vars = getArray(missionConfigFile >> "CfgSettings" >> "DUC_LIF" >> "Variables" >> "global");
{
  [] spawn compile format["%1 = %2", _x select 0, _x select 1];  
} forEach _vars;





#endif