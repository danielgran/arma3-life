/*

  Author: Duckfine
  Date created: 31-8-2020 16:51

  Description
    Gets executed on target player which should be tazed

  Parameter:
    - <type> <name>

  Returns:
    - <type> <name>


 */

private[

  "_placeholder01",
  "_placeholder02"

];

params[

  ["_source", objNull, [objNull]],
  ["_target", objNull, [objNull]]

];

if (!canSuspend) exitWith { false; };
if (!(isPlayer _target) || !(isPlayer _source)) exitWith { false; }; 
if (getPlayerUID _source isEqualTo getPlayerUID _target) exitWith { false; };
if (player getVariable "DUCV_ACT_TAZED" isEqualTo true) exitWith { false; };

player setVariable ["DUCV_ACT_TAZED", true];

disableUserInput true;
hint "u have been tazed";
//playSound3D ["taze", player, false, getPos player, 1, 25]; // TODO REPLACE WITH EITHER OWN METHOD OR WITH PLAYSOUND
[getpos player, 30, "taze"] call CDUC_CORE_fnc_playSoundGlobal;
player switchMove "AparPercMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon";
sleep 10;
disableUserInput false;

player setVariable ["DUCV_ACT_TAZED", false];



