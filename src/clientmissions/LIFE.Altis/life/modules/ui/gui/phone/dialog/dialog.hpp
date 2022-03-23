#include "defines.hpp"
#include "idcs.hpp"

#define SCALEFACTOR getNumber (configFile >> "uiScaleFactor")
#define GRID_X(gridType, gridScale, num) (pixelW * gridType * (((num) * (gridScale)) / SCALEFACTOR))
#define GRID_Y(gridType, gridScale, num) (pixelH * gridType * (((num) * (gridScale)) / SCALEFACTOR))
#define FONT(num) (1.5 * pixelH * pixelGridNoUIScale * num) //(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * num)


#define PHONE_X 0
#define PHONE_Y 0

#define PHONE_SIZE 0.66
#define PHONE_W safezoneW * PHONE_SIZE
#define PHONE_H safezoneH * PHONE_SIZE


#define ASSETPATH(FILENAME) life\modules\ui\assets\phone\FILENAME


class DUCG_PHONE
{
  
  idd = DUCG_PHONE_IDC_Display;
  onLoad = "";
  onUnload = "";


  class ControlsBackground
  {
    class Phone : DUCD_ItemGroup_NoScrollBar
    {

      idc = DUCG_PHONE_IDC_PhoneControlsBackground;
      x = PHONE_X;
      y = PHONE_Y;     
      w = safezoneW;
      h = safezoneH;

      class Controls
      {
        class PhoneBackground : DUCD_Picture
        {
          idc = DUCG_PHONE_IDC_PhoneBackground;
          text = ASSETPATH(background\sq_bg01_ca.paa);
          x = 0;
	        y = 0;
          w = PHONE_W;
          h = PHONE_H;
        };
        class PhoneFrame : DUCD_Picture
        {
          idc = DUCG_PHONE_IDC_PhoneFrame;
          text = ASSETPATH(sq_phone_frame_ca.paa);
          x = 0;
	        y = 0;
          w = PHONE_W;
          h = PHONE_H;
        };



      };
    };
  };

  class Controls
  {
    class PhoneControls : DUCD_ItemGroup_NoScrollBar
    {
      idc = DUCG_PHONE_IDC_PhoneControls;
      x = PHONE_X;
      y = PHONE_Y;


      // App Icons
      class Controls
      {
      
      
      };


    };
  };
};


// App: Bank
class DUCG_PHONE_APP_BANK
{
  idd = DUCG_PHONE_IDC_APP_Bank;


  class Controls
  {
    class Headline: DUCD_StrucText
    {
      idc = 15090;
	    text = "<t font=""PuristaMedium"" align=""center"" valign=""middle"" size=""1.1"">Sparkasse</t>"; //--- ToDo: Localize;
      style = 0x0C;
	    x = PHONE_X + PHONE_W / 2;
	    y = PHONE_Y + PHONE_H / 2;
	    w = 1;
	    h = 1;
    };
  };


};