/**
 * @Date:   01-05-2020 13:25
 * @Last modified time: 01-05-2020 13:26
 * @Copyright: (c) Duckfine
*/

class DUCD_Picture
{
  // Picture as text and keep Aspect ratio
  style = 0x30 + 0x800;
  type = 0;
  shadow = 0;
  sizeEx = 0.023; // Otherwise error
  font = "RobotoCondensed"; // otherwise error
  w = 0.1;
  h = 0.1;
  x = 0;
  y = 0;
  colorBackground[] = {};
  colorText[] = {};
};


class DUCD_Picture_KeepRatio : DUCD_Picture
{
  style = 0x30;
  
};


class DUCD_Text : RscText
{
  font = "PuristaMedium";
  sizeEx = 0.045;
};


class DUCD_StrucText : RscStructuredText
{
  font = "PuristaMedium";
};
