/*

  Author: Duckfine
  Date created:   30-04-2020 22:18

  Description:
    Toggles the GUI

    CODE MUST BE SPAWNED

  Params:
    -


  Returns:
    -

*/
#include "config.hpp"


if(!canSuspend) exitWith {};
if (!DUCV_HUD_CLOSED) exitWith {};
DUCV_HUD_CLOSED = false;

[] call GUI_fnc_open;

uisleep 6;

[] call GUI_fnc_close;
DUCV_HUD_CLOSED = true;






















//
