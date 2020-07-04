/*
 * @Date:   30-04-2020 15:24
 * @Last modified time: 01-05-2020 14:22
 * @Copyright: (c) Duckfine
 */



#include "config.hpp"



class DUCG_tlt_HUD
{
  idd = 15000;
  name = "DUCG_tlt_HUD";
  duration = 1000;
  onLoad = "uiNamespace setVariable [""DUCG_tlt_HUD"", _this select 0]";
  class controls
  {
    class hud_bg: RscText
    {
      idc = 15010;
      x = HUD_POS_X;
      y = HUD_POS_Y;
      w = HUD_WIDTH;
      h = HUD_HEIGHT;
      colorBackground[] = {0.294,0.294,0.294,0.62};
    };
    class hud_bar: RscText
    {
      idc = 15020;
      x = HUD_BAR_POS_X;
      y = HUD_POS_Y;
      w = HUD_BAR_WIDTH
      h = HUD_HEIGHT;
      colorBackground[] = {0.035,0.373,0.059,0.75};
    };
    class hud_ico_cash : DUCD_Picture
    {
      idc = 15030;
      text = ASSETPATH(ico_mid_cash.paa);
      x = HUD_ICO_POS_X;
	     y = HUD_ICO_Y_1;
      w = HUD_ICO_SIZE;
	     h = HUD_ICO_SIZE;
    };
    class hud_ico_bank : DUCD_Picture
    {
      idc = 15040;
      text = ASSETPATH(ico_mid_bank.paa);
      x = HUD_ICO_POS_X;
	    y = HUD_ICO_Y_2;
      w = HUD_ICO_SIZE;
	    h = HUD_ICO_SIZE;
    };
    class hud_ico_players : DUCD_Picture
    {
      idc = 15050;
      text = ASSETPATH(ico_mid_player.paa);
      x = HUD_ICO_POS_X;
	    y = HUD_ICO_Y_3;
      w = HUD_ICO_SIZE;
	    h = HUD_ICO_SIZE;
    };
    class hud_ico_cops : DUCD_Picture
    {
      idc = 15060;
      text = ASSETPATH(ico_mid_cop.paa);
      x = HUD_ICO_POS_X;
	    y = HUD_ICO_Y_4;
      w = HUD_ICO_SIZE;
	    h = HUD_ICO_SIZE;
    };
    class hud_ico_medics : DUCD_Picture
    {
      idc = 15070;
      text = ASSETPATH(ico_mid_med.paa);
      x = HUD_ICO_POS_X;
	    y = HUD_ICO_Y_5;
      w = HUD_ICO_SIZE;
	    h = HUD_ICO_SIZE;
    };
    class hud_ico_mechs : DUCD_Picture
    {
      idc = 15080;
      text = ASSETPATH(ico_mid_mech.paa);
      x = HUD_ICO_POS_X;
	    y = HUD_ICO_Y_6;
	    w = HUD_ICO_SIZE;
	    h = HUD_ICO_SIZE;
    };
    class hud_txt_cash: DUCD_StrucText
    {
      idc = 15090;
	    text = "<t font=""PuristaMedium"" align=""center"" valign=""middle"" size=""1.1"">100000</t>"; //--- ToDo: Localize;
      style = 0x0C;
	    x = HUD_POS_TXT_X;
	    y = HUD_TXT_Y_1;
	    w = HUD_TXT_WIDTH;
	    h = HUD_TXT_HEIGHT;
    };
    class hud_txt_online_cop: DUCD_StrucText
    {
	    idc = 15100;
      text = "<t font=""PuristaMedium"" align=""center"" valign=""middle"" size=""1.1"">1000</t>"; //--- ToDo: Localize;
      x = HUD_POS_TXT_X;
	    y = HUD_TXT_Y_2
	    w = HUD_TXT_WIDTH;
	    h = HUD_TXT_HEIGHT;
    };
    class hud_txt_online_civ: DUCD_StrucText
    {
      idc = 15110;
      text = "<t font=""PuristaMedium"" align=""center"" valign=""middle"" size=""1.1"">100</t>"; //--- ToDo: Localize;
      x = HUD_POS_TXT_X;
      y = HUD_TXT_Y_3;
      w = HUD_TXT_WIDTH;
      h = HUD_TXT_HEIGHT;
    };
    class duc_txt_online_cop: DUCD_StrucText
    {
    	 idc = 15120;
      text = "<t font=""PuristaMedium"" align=""center"" valign=""middle"" size=""1.1"">10</t>"; //--- ToDo: Localize;
    	 x = HUD_POS_TXT_X;
    	 y = HUD_TXT_Y_4;
    	 w = HUD_TXT_WIDTH;
    	 h = HUD_TXT_HEIGHT;
    };
    class duc_txt_online_medic: DUCD_StrucText
    {
    	 idc = 15130;
      text = "<t font=""PuristaMedium"" align=""center"" valign=""middle"" size=""1.1"">1</t>"; //--- ToDo: Localize;
    	 x = HUD_POS_TXT_X;
    	 y = HUD_TXT_Y_5;
    	 w = HUD_TXT_WIDTH;
    	 h = HUD_TXT_HEIGHT;
    };
    class duc_txt_online_mechanic: DUCD_StrucText
    {
    	 idc = 15140;
      text = "<t font=""PuristaMedium"" align=""center"" valign=""middle"" size=""1.1"">2</t>"; //--- ToDo: Localize;
    	 x = HUD_POS_TXT_X;
    	 y = HUD_TXT_Y_6;
    	 w = HUD_TXT_WIDTH;
       h = HUD_TXT_HEIGHT;
    };
  };
};
