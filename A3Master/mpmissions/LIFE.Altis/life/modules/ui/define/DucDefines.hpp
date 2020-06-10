/**
 * @Date:   01-05-2020 13:25
 * @Last modified time: 01-05-2020 13:26
 * @Copyright: (c) Duckfine
 */

 class DUCD_Picture : RscPicture
 {
   // Picture as text and keep Aspect ratio
   style = 0x30 + 0x800;
   w = 0.1;
   h = 0.1;

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
