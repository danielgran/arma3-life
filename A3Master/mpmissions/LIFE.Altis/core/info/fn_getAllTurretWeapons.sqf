/*

  Author: Duckfine
  Date created:   17-04-2020 22:17

  Description:
    Gets all attached weapons of a vehicle

  Params:
    - object vehicle


  Returns:
    array [["WEPNAME", "turretPath"], ...]

*/


private[

  "_result",
  "_getAnyMagazines",
  "_findRecurse",
  "_class"

];

params[

  "_vehicle"

];

_result = [];
_findRecurse = {
    private ["_root", "_class", "_path", "_currentPath"];
    _root = (_this select 0);
    _path = +(_this select 1);
    for "_i" from 0 to count _root -1 do {
        _class = _root select _i;
        if (isClass _class) then {
            _currentPath = _path + [_i];
            {
                _result set [count _result, [_x, _currentPath]];
            } foreach getArray (_class >> "weapons");
            _class = _class >> "turrets";
            if (isClass _class) then {
               systemChat str(_currentPath);
                [_class, _currentPath] call _findRecurse;
            };
        };
    };
};

_class = (
    configFile >> "CfgVehicles" >> (
        switch (typeName _this) do {
            case "STRING" : {_this};
            case "OBJECT" : {typeOf _this};
            default {nil}
        }
    ) >> "turrets"
);

[_class, []] call _findRecurse;
_result;




/*

[[1,"B_GEN_Offroad_01_gen_F","Offroader","",20000,1,"[]",1,[["hitlfwheel","hitlf2wheel","hitrfwheel","hitrf2wheel","hitfuel","hitengine","hitbody","hitglass1","hitglass2","hitrglass","hitlglass","hitglass3","hitglass4","hitglass5","hitglass6","hitlbwheel","hitlmwheel","hitrbwheel","hitrmwheel","hithull","#light_l","#light_r","#light_l","#light_r","#light_l","#light_r"],["wheel_1_1_steering","wheel_1_2_steering","wheel_2_1_steering","wheel_2_2_steering","palivo","motor","karoserie","glass1","glass2","","","","","","","","","","","palivo","light_l","light_r","light_l","light_r","light_l","light_r"],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]],"[]",[["FirstAidKit"],[4]],"[]","[]","[]","[]"],[2,"B_G_Van_01_fuel_F","Truck","",35000,1,"[]",1,"","","","","","",""]]
*/























//
