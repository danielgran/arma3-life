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


if (!(isPlayer _target)) exitWith { false; }; 

if (!canSuspend) exitWith { false; };

hint "u have been tazed";


player switchMove "AparPercMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon";



