/*

  Author: Duckfine
  Date created:   20-04-2020 14:50

  Description:
    Gets an entry of an array config [[string, id], ...]

  Params:
    - array config
    - string cfgname
    - datatype of entry


  Returns:
    - any value


    TODO Datatype

*/


private[

  "_return"

];

_return = objNull;

params[

  ["_config", []],
  ["_cfgName", ""],
  "_datatype"

];


{
    if (_cfgName isEqualTo (_x select 0)) exitWith
    {
      _return = (_x select 1);
    };
} forEach _config;

_return;




































//
