/*

  Author: Duckfine
  Date created:   12-04-2020 02:02

  Description:
    sets the client vars which are sent from server

  Params:
    - array clientvars from server: [["a3name","Prof Bildungsstop"],["a3namealiases",[]],["intid","3TLQ9BMS4"],["rankTeam",0],["rankDonator",0],["nickname",""],["location",[]],["gearCivilian",[]],["gearPolice",[]],["gearMedic",[]],["gearMechanic",[]],["invVirtual",[]],["alive",true],["arrested",[]],["banned",false],["cash",0],["bank",0],["teamkills",0],["kills",0],["deaths",0],["xp",0],["levelPlayer",0],["levelPolice",0],["levelMedic",0],["levelMech",0],["playtime",0],["lastconnect",0]]

  Returns:
    -

*/


private[

  "_placeholder"

];

params[

  ["_clientVars", []]

];


{
  if((typeName (_x select 1)) == "STRING" ) then
  {
    call compile format["DUCV_%1 = ""%2"";", toUpper (_x select 0), _x select 1];
  } else
  {
    call compile format["DUCV_%1 = %2;", toUpper (_x select 0), _x select 1];
  };
} forEach _clientVars;





































//
