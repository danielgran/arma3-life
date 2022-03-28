/*

  Converts an A3 valid array to an DB valid array
  WITH SCHEMATIC


  Author: Duckfine

  SCHMA:
[["a3name","STRING"],["a3namealiases","DBARRAY"],["intid","STRING"],["rankTeam","SCALAR"],["rankDonator","SCALAR"],["nickname","STRING"],["location","DBARRAY"],["loggedAs","DBENUM"],["gearCivilian","DBARRAY"],["gearPolice","DBARRAY"],["gearMedic","DBARRAY"],["gearMechanic","DBARRAY"],["invVirtual","DBARRAY"],["alive","BOOL"],["arrested","DBARRAY"],["banned","BOOL"],["cash","SCALAR"],["bank","SCALAR"],["teamkills","SCALAR"],["kills","SCALAR"],["deaths","SCALAR"],["xp","SCALAR"],["levelPlayer","SCALAR"],["levelPolice","SCALAR"],["levelMedic","SCALAR"],["levelMech","SCALAR"],["playtime","SCALAR"],["lastconnect","SCALAR"]]



  DBResult:
["Prof Bildungsstop","","COD PLAYERS",0,0,"","","CIVILIAN","""[[`LMG_Zafir_F`,``,``,`optic_Aco_smg`,[`150Rnd_762x54_Box`,88],[],``],[`launch_RPG7_F`,``,``,``,[`RPG7_F`,1],[],``],[`hgun_Pistol_heavy_01_green_F`,``,``,``,[`11Rnd_45ACP_Mag`,11],[],``],[`U_B_T_Soldier_SL_F`,[[`11Rnd_45ACP_Mag`,3,11]]],[`V_PlateCarrierSpec_rgr`,[]],[`B_Carryall_taiga_F`,[[`150Rnd_762x54_Box`,1,150],[`150Rnd_762x54_Box_Tracer`,1,150],[`150Rnd_762x54_Box`,1,110]]],`H_HelmetSpecB`,`G_Combat`,[`Rangefinder`,``,``,``,[],[],``],[`ItemMap`,`C_UavTerminal`,`ItemRadio`,`ItemCompass`,`ItemWatch`,`NVGogglesB_gry_F`]]""","""[[`LMG_Zafir_F`,``,``,`optic_Aco_smg`,[`150Rnd_762x54_Box`,88],[],``],[`launch_RPG7_F`,``,``,``,[`RPG7_F`,1],[],``],[`hgun_Pistol_heavy_01_green_F`,``,``,``,[`11Rnd_45ACP_Mag`,11],[],``],[`U_B_T_Soldier_SL_F`,[[`11Rnd_45ACP_Mag`,3,11]]],[`V_PlateCarrierSpec_rgr`,[]],[`B_Carryall_taiga_F`,[[`150Rnd_762x54_Box`,1,150],[`150Rnd_762x54_Box_Tracer`,1,150],[`150Rnd_762x54_Box`,1,110]]],`H_HelmetSpecB`,`G_Combat`,[`Rangefinder`,``,``,``,[],[],``],[`ItemMap`,`C_UavTerminal`,`ItemRadio`,`ItemCompass`,`ItemWatch`,`NVGogglesB_gry_F`]]""","""[[`LMG_Zafir_F`,``,``,`optic_Aco_smg`,[`150Rnd_762x54_Box`,88],[],``],[`launch_RPG7_F`,``,``,``,[`RPG7_F`,1],[],``],[`hgun_Pistol_heavy_01_green_F`,``,``,``,[`11Rnd_45ACP_Mag`,11],[],``],[`U_B_T_Soldier_SL_F`,[[`11Rnd_45ACP_Mag`,3,11]]],[`V_PlateCarrierSpec_rgr`,[]],[`B_Carryall_taiga_F`,[[`150Rnd_762x54_Box`,1,150],[`150Rnd_762x54_Box_Tracer`,1,150],[`150Rnd_762x54_Box`,1,110]]],`H_HelmetSpecB`,`G_Combat`,[`Rangefinder`,``,``,``,[],[],``],[`ItemMap`,`C_UavTerminal`,`ItemRadio`,`ItemCompass`,`ItemWatch`,`NVGogglesB_gry_F`]]""","""[[`LMG_Zafir_F`,``,``,`optic_Aco_smg`,[`150Rnd_762x54_Box`,88],[],``],[`launch_RPG7_F`,``,``,``,[`RPG7_F`,1],[],``],[`hgun_Pistol_heavy_01_green_F`,``,``,``,[`11Rnd_45ACP_Mag`,11],[],``],[`U_B_T_Soldier_SL_F`,[[`11Rnd_45ACP_Mag`,3,11]]],[`V_PlateCarrierSpec_rgr`,[]],[`B_Carryall_taiga_F`,[[`150Rnd_762x54_Box`,1,150],[`150Rnd_762x54_Box_Tracer`,1,150],[`150Rnd_762x54_Box`,1,110]]],`H_HelmetSpecB`,`G_Combat`,[`Rangefinder`,``,``,``,[],[],``],[`ItemMap`,`C_UavTerminal`,`ItemRadio`,`ItemCompass`,`ItemWatch`,`NVGogglesB_gry_F`]]""","",0,"",0,0,0,0,0,0,0,0,0,0,0,0,0]



*/
private[

  "_return",
  "_dataType",
  "_value",
  "_insert"

];

// A3Array
_return = [];

params[

  ["_schema", []],
  ["_dbarray", []]

];



//DEBUG
diag_log "================================================";
diag_log "============MYSQLDBARRAYTOA3ARRAY===============";
diag_log format["_schema = %1", _schema];
diag_log format["_dbarray = %1", _dbarray];
diag_log "================================================";




{
  _dataType = (_x select 1);

  _value = _dbarray select _forEachIndex;
  _insert = "";


  switch (_dataType) do
  {

    case ("STRING"): {
      _insert = _value;
    };

    case ("SCALAR"): {
      _insert = _value;
    };

    case ("BOOL"): {
      if(_value isEqualTo 1) exitWith {_insert = true;};
      _insert = false;
    };


    case ("DBARRAY"): {
      //enogh here?
      if(count (_value splitString "") < 8) exitWith {_insert = []};
      _insert = [_value] call DUC_core_fnc_mresStringToArray;
    };

    case ("DBENUM"):
    {
      _insert = str(_value);
    };

  };


  _return pushBack _insert;

} forEach _schema;

diag_log _return;
_return;
