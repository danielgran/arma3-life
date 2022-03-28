/*

  Author: Duckfine
  Date created:   18-04-2020 21:03

  Description:
    Converts [1,2,4,5,6] into '1','2','3','4','5','6'

  Params:
    - array


  Returns:
    - string

*/


private[

  "_placeholder01"

];

params[

  ["_toConvert", [], [[]]]

];


_toConvert = str(_toConvert);

_toConvert = [_toConvert, "[", "\'"] call DUC_CORE_fnc_replaceString;
_toConvert = [_toConvert, "]", "\'"] call DUC_CORE_fnc_replaceString;
_toConvert = [_toConvert, """", ""] call DUC_CORE_fnc_replaceString;
_toConvert = [_toConvert, ",", "\', \'"] call DUC_CORE_fnc_replaceString;

_toConvert;






















//
