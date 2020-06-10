/*

  Author: Duckfine
  Date created: 9-6-2020 21:09

  Description
    Init for life

  Parameter:
    - <type> <name>

  Returns:
    - <type> <name>


 */


// Set Debug mode active comment out if not needed
#define DEBUG asd

#ifdef DEBUG

diag_log "==========================================================";
diag_log "ArmA 3 Life by Duckfine starting up";
diag_log "==========================================================";



#endif


// init all default variables
[] call compile preprocessFileLineNumbers "life\player\setupVars.sqf";








// Setup player hud
0 cutRsc ["DUCG_tlt_HUD", "PLAIN", 0, false];

[] spawn {
  uisleep 6;
  [] call CDUC_HUD_fnc_close;
  DUCV_HUD_CLOSED = true;
};
