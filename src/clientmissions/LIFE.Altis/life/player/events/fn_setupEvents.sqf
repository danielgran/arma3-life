/*

  Author: Duckfine
  Date created: 31-8-2020 16:58

  Description
    Sets up all eventhandlers once

 */

if !((player getVariable "ducc_eventhandlerssetup") isEqualTo true) then
{
  player setVariable ["ducc_eventhandlerssetup", true];
};
if (player getVariable "ducc_eventhandlerssetup" isEqualTo false) exitWith { false; };
if (isNull player) exitWith { false; };

private[

  "_placeholder01",
  "_placeholder02"

];



player addEventHandler ["HandleDamage", {_this call CDUC_EVENT_fnc_playerDamaged}];
hint "added all evenets";
