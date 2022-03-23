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
  w = 1;
  h = 1;
  x = 0;
  y = 0;
  colorBackground[] = {};
  colorText[] = {1, 1, 1, 1.0};
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

class DUCD_ScrollBar {
	color[] = {1, 1, 1, 0.6};
	colorActive[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.3};
	thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	shadow = 0;
	scrollSpeed = 0.06;
	width = 0;
	height = 0;
	autoScrollEnabled = 0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};


class DUCD_ItemGroup
{
  type = 15; // CT_CONTROLS_GROUP
	style = 16; // ST_MULTI
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	shadow = 0;

	class VScrollBar: DUCD_ScrollBar {
		width = 0.021;
	};

	class HScrollBar: DUCD_ScrollBar {
		height = 0.028;
	};

	class Controls {};
};


class DUCD_ItemGroup_NoScrollBar : DUCD_ItemGroup
{
  class VScrollbar: VScrollBar {
		width = 0;
	};

	class HScrollbar: HScrollBar {
		height = 0;
	};
};