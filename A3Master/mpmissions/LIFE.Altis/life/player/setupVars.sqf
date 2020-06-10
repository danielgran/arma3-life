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

  "_clientVars",
  "_placeholder02"

];


_clientVars = getArray(missionConfigFile >> "CfgSettings" >> "DUC_LIF" >> "Variables" >> "player");
{
  [] call compile format["player setVariable[""%1"", %2, false];", _x select 0, _x select 1];
} forEach _clientVars;




#endif