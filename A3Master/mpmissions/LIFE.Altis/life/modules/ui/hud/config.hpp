/**
  * @Date:   30-04-2020 22:04
 * @Last modified time: 01-05-2020 12:57
  * @Copyright: (c) Duckfine
*/

#define HUD_POS_X safezoneX + safezoneW - HUD_WIDTH - HUD_BORDER_W
#define HUD_POS_Y safezoneY + safezoneH - HUD_HEIGHT - HUD_BORDER_H
#define HUD_WIDTH 0.11 * safezoneW
#define HUD_HEIGHT 0.25 * safezoneH

#define HUD_POS_X_COLLAPSED HUD_POS_X + HUD_WIDTH - HUD_WIDTH_COLLAPSED
#define HUD_WIDTH_COLLAPSED 0.03 * safezoneW

#define HUD_ICO_POS_X_COLLAPSED HUD_POS_X + HUD_WIDTH - HUD_WIDTH_COLLAPSED + HUD_ICO_OFFSET_W - 0.0060 * safezoneW

#define HUD_BORDER_W 0.025 * safezoneW
#define HUD_BORDER_H 0.1 * safezoneH

#define HUD_BAR_POS_X HUD_POS_X + HUD_WIDTH - HUD_BAR_WIDTH
#define HUD_BAR_WIDTH 0.0020 * safezoneW

#define HUD_ICO_SIZE 0.9 * HUD_WIDTH_COLLAPSED
#define HUD_ICO_POS_X HUD_POS_X + HUD_ICO_OFFSET_W
#define HUD_ICO_OFFSET_W 0.0090 * safezoneW

#define HUD_ICO_Y_1 HUD_TXT_Y_1 - 0.005 * safezoneH
#define HUD_ICO_Y_2 HUD_TXT_Y_2 - 0.005 * safezoneH
#define HUD_ICO_Y_3 HUD_TXT_Y_3 - 0.005 * safezoneH
#define HUD_ICO_Y_4 HUD_TXT_Y_4 - 0.005 * safezoneH
#define HUD_ICO_Y_5 HUD_TXT_Y_5 - 0.005 * safezoneH
#define HUD_ICO_Y_6 HUD_TXT_Y_6 - 0.005 * safezoneH
#define HUD_ICO_Y_7 HUD_TXT_Y_7 - 0.005 * safezoneH

#define HUD_TXT_WIDTH 0.08 * safezoneW
#define HUD_TXT_HEIGHT 0.02 * safezoneH
#define HUD_POS_TXT_X HUD_POS_X + 0.02 * safezoneW

#define HUD_TXT_SPACE 0.08 * HUD_HEIGHT + HUD_TXT_HEIGHT
#define HUD_TXT_Y_1 HUD_POS_Y  +  0.0090 * safezoneH
#define HUD_TXT_Y_2 HUD_TXT_Y_1 + HUD_TXT_SPACE
#define HUD_TXT_Y_3 HUD_TXT_Y_2 + HUD_TXT_SPACE
#define HUD_TXT_Y_4 HUD_TXT_Y_3 + HUD_TXT_SPACE
#define HUD_TXT_Y_5 HUD_TXT_Y_4 + HUD_TXT_SPACE
#define HUD_TXT_Y_6 HUD_TXT_Y_5 + HUD_TXT_SPACE
#define HUD_TXT_Y_7 HUD_TXT_Y_6 + HUD_TXT_SPACE

#define ASSETPATH(FILENAME) life\modules\ui\assets\FILENAME