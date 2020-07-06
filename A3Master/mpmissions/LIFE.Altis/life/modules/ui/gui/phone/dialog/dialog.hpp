#include "defines.hpp"
#include "idcs.hpp"

#define SCALEFACTOR getNumber (configFile >> "uiScaleFactor")
#define GRID_X(gridType, gridScale, num) (pixelW * gridType * (((num) * (gridScale)) / SCALEFACTOR))
#define GRID_Y(gridType, gridScale, num) (pixelH * gridType * (((num) * (gridScale)) / SCALEFACTOR))
#define FONT(num) (1.5 * pixelH * pixelGridNoUIScale * num) //(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * num)


#define ASSETPATH(FILENAME) life\modules\ui\assets\phone\FILENAME


class DUCG_PHONE {
  
  idd = DUCG_HANDY_IDC_Display;
  onLoad = "";
  onUnload = "";


  class controls
  {
     class PhoneFrame : DUCD_Picture
     {
      idc = DUCG_HANDY_IDC_PhoneFrame;
      text = ASSETPATH(phone_frame.paa);
      x = safezoneX;
	    y = safezoneY;
      w = 1;
	    h = 1;
     };






  };

};