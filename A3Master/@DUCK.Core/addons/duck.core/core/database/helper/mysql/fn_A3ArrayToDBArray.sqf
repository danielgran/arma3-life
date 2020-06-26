private[

  "_return",
  "_dataType",
  "_value",
  "_insert"

];

_return = [];

params [

  ["_schema", []],
  ["_a3array", []]

];


/*
_schema = [["a3name","STRING"],["a3namealiases","DBARRAY"],["intid","STRING"],["rankTeam","SCALAR"],["rankDonator","SCALAR"],["nickname","STRING"],["location","DBARRAY"],["loggedAs","DBENUM"],["gearCivilian","DBARRAY"],["gearPolice","DBARRAY"],["gearMedic","DBARRAY"],["gearMechanic","DBARRAY"],["invVirtual","DBARRAY"],["alive","BOOL"],["arrested","DBARRAY"],["banned","BOOL"],["cash","SCALAR"],["bank","SCALAR"],["teamkills","SCALAR"],["kills","SCALAR"],["deaths","SCALAR"],["xp","SCALAR"],["levelPlayer","SCALAR"],["levelPolice","SCALAR"],["levelMedic","SCALAR"],["levelMech","SCALAR"],["playtime","SCALAR"],["lastconnect","SCALAR"]];

_a3array = ["Prof Bildungsstop",[],"COD PLAYERS",0,0,"",[],"CIVILIAN",[],[],[],[['LMG_Zafir_F','','','optic_Aco_smg',['150Rnd_762x54_Box',88],[],''],['launch_RPG7_F','','','',['RPG7_F',1],[],''],['hgun_Pistol_heavy_01_green_F','','','',['11Rnd_45ACP_Mag',11],[],''],['U_B_T_Soldier_SL_F',[['11Rnd_45ACP_Mag',3,11]]],['V_PlateCarrierSpec_rgr',[]],['B_Carryall_taiga_F',[['150Rnd_762x54_Box',1,150],['150Rnd_762x54_Box_Tracer',1,150],['150Rnd_762x54_Box',1,110]]],'H_HelmetSpecB','G_Combat',['Rangefinder','','','',[],[],''],['ItemMap','C_UavTerminal','ItemRadio','ItemCompass','ItemWatch','NVGogglesB_gry_F']],[],false,[],false,0,0,0,0,0,0,0,0,0,0,0,0];
*/

{

  _dataType = (_x select 1);
  _value = _a3array select _forEachIndex;
  _insert = "";

  diag_log _dataType;

  switch (_dataType) do {
    case ("STRING"): {
      _insert = _value call DUC_core_fnc_mresString;
    };

    case ("SCALAR"): {
      _insert = _value call DUC_core_fnc_numberToString;
    };

    case ("BOOL"): {
      if (_value) exitWith { _insert = "1"; };
      _insert = "0";
    };



    case ("DBARRAY"): {
      diag_log (count (str(_value) splitString ""));
      if (count (str(_value) splitString "") < 5) exitWith {_insert = [[]] call DUC_core_fnc_mresArrayToString;};
      // playerdata can go corrupted
      _insert = [_value] call DUC_core_fnc_mresArrayToString;
    };

    case ("DBENUM"):
    {
      _insert = """" + _value + """";
    };

  };

  _return pushBack _insert;

} forEach _schema;


diag_log _return;
_return;
