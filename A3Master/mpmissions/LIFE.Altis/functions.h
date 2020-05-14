/**
 * @Date:   01-04-2020 17:19
 * @Last modified time: 01-05-2020 14:17
 * @Copyright: (c) Duckfine
 */



class System
{
  tag = "DUC_life_sys";

  class Handler
  {
    file = "modules\system\network";
    class receiveServer {};
    class sendServer {};
  };

  class Setter
  {
    file = "modules\system";

    class setClientVars {};
    class handlerSystem {};
  }

};


class Connection
{
  tag = "DUC_LIFE_CON";

  class ServerSwitch
  {
      file = "modules\server";

      class serverSwitch {};
  };
};


class HUD
{
  tag = "DUCG_HUD";

  class Overlay
  {
    file = "core\dialog\title\hud";

    class close {};
    class open {};
    class toggle {};
  };
};


class ECO
{
  tag = "DUC_ECO";

  class Money
  {
    file = "modules\economy\money";

    class deposit {};
    class transfer {};
    class withdraw {};
  }
}





































//
