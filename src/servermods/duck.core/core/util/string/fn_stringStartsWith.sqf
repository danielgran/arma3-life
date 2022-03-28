/*

  Checks if certain String starts with an given String




  Author: Duckfine



*/

private["_return"];


params[

  ["_toCheck", "", ["a"]],
  ["_rule", "", ["a"]]

];

_toCheck = _toCheck splitString "";
_rule = _stringstart splitString "";
_return = true;


{
diag_log _forEachIndex;
  if ! ((_toCheck select _forEachIndex) isEqualTo (_rule select _forEachIndex)) exitWith {_return = false;};
} forEach _rule;

_return;









//
