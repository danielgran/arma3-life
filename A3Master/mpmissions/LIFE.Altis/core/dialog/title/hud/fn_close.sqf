/*

  Author: Duckfine
  Date created:   01-05-2020 01:07

  Description:
    Closes the HUD Dialog
  CODE MUST BE SPAWNED
  Params:
    -


  Returns:
    -

*/
#include "config.hpp"


private[

  "_sidebar",
  "_display",
  "_sidebar",
  "_iconCash",
  "_iconBank",
  "_iconUsers",
  "_iconCops",
  "_iconMedics",
  "_iconMechs",
  "_txtCash",
  "_txtBank",
  "_txtUsers",
  "_txtCops",
  "_txtMedics",
  "_txtMechs",
  "_controls"

];

params[

  ["_placeholder03",""],
  ["_placeholder04", ""]

];


disableSerialization;

_display = uiNamespace getVariable ["DUCG_tlt_HUD", displayNull];

// Set all controls to work with
_background = _display displayCtrl 15010;
_sidebar = _display displayCtrl 15020;
_iconCash = _display displayCtrl 15030;
_iconBank = _display displayCtrl 15040;
_iconUsers = _display displayCtrl 15050;
_iconCops = _display displayCtrl 15060;
_iconMedics = _display displayCtrl 15070;
_iconMechs = _display displayCtrl 15080;
_txtCash = _display displayCtrl 15090;
_txtBank = _display displayCtrl 15100;
_txtUsers = _display displayCtrl 15110;
_txtCops = _display displayCtrl 15120;
_txtMedics = _display displayCtrl 15130;
_txtMechs = _display displayCtrl 15140;

_controls = [_txtCash, _txtBank, _txtUsers, _txtCops, _txtMedics, _txtMechs,
_iconCash, _iconBank, _iconUsers, _iconCops, _iconMedics, _iconMechs];



// Move Icons
_iconCash ctrlSetPosition   [HUD_ICO_POS_X_COLLAPSED, HUD_ICO_Y_1, HUD_ICO_SIZE, HUD_ICO_SIZE];
_iconBank ctrlSetPosition   [HUD_ICO_POS_X_COLLAPSED, HUD_ICO_Y_2, HUD_ICO_SIZE, HUD_ICO_SIZE];
_iconUsers ctrlSetPosition  [HUD_ICO_POS_X_COLLAPSED, HUD_ICO_Y_3, HUD_ICO_SIZE, HUD_ICO_SIZE];
_iconCops ctrlSetPosition   [HUD_ICO_POS_X_COLLAPSED, HUD_ICO_Y_4, HUD_ICO_SIZE, HUD_ICO_SIZE];
_iconMedics ctrlSetPosition [HUD_ICO_POS_X_COLLAPSED, HUD_ICO_Y_5, HUD_ICO_SIZE, HUD_ICO_SIZE];
_iconMechs ctrlSetPosition  [HUD_ICO_POS_X_COLLAPSED, HUD_ICO_Y_6, HUD_ICO_SIZE, HUD_ICO_SIZE];

//Outfade text
_txtCash ctrlSetPosition    [HUD_POS_TXT_X, HUD_TXT_Y_1, HUD_TXT_WIDTH, 0];
_txtBank ctrlSetPosition    [HUD_POS_TXT_X, HUD_TXT_Y_2, HUD_TXT_WIDTH, 0];
_txtUsers ctrlSetPosition   [HUD_POS_TXT_X, HUD_TXT_Y_3, HUD_TXT_WIDTH, 0];
_txtCops ctrlSetPosition    [HUD_POS_TXT_X, HUD_TXT_Y_4, HUD_TXT_WIDTH, 0];
_txtMedics ctrlSetPosition  [HUD_POS_TXT_X, HUD_TXT_Y_5, HUD_TXT_WIDTH, 0];
_txtMechs ctrlSetPosition   [HUD_POS_TXT_X, HUD_TXT_Y_6, HUD_TXT_WIDTH, 0];

// Move Background
_background ctrlSetPosition [HUD_POS_X_COLLAPSED, HUD_POS_Y, HUD_WIDTH_COLLAPSED, HUD_HEIGHT];

_background ctrlCommit 0.25;
{
  _x ctrlCommit 0.25;
} forEach _controls;

uisleep 0.25;


// "Lock" side bar

_sidebar ctrlSetPosition [HUD_POS_X_COLLAPSED - HUD_BAR_WIDTH, HUD_POS_Y, HUD_BAR_WIDTH, HUD_HEIGHT];
_sidebar ctrlCommit 0.4;

uisleep 0.4;

































//
