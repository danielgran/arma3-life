/**
 * @Date:   01-04-2020 17:19
 * @Last modified time: 01-05-2020 14:17
 * @Copyright: (c) Duckfine
 */





class GUI
{
  tag = "CDUC_GUI";

  class xyz
  {
    file = "life\modules\ui\gui";
  }
};

class HUD
{
  tag = "CDUC_HUD";

  class Overlay
  {
    file = "life\modules\ui\hud";

    class close {};
    class open {};
    class toggle {};
  };
};



class ECO
{
  tag = "CDUC_ECO";

  class Money
  {
    file = "life\modules\economy\money";

    class deposit {};
    class transfer {};
    class withdraw {};
  }
}





class Events
{
  tag = "CDUC_EVENT";

  class Events
  {
    file = "life\player\events";

    class setupEvents {};
    
    class playerDamaged {};
  };
}



class Actions
{
  tag = "CDUC_ACT";

  class Action
  {
    file = "life\player\actions";

    class taze {};
  };
}



























//
