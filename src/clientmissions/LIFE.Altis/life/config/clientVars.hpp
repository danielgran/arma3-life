class DUC_lif
{

  class Variables
  {
    // Setup vars which are set with setVariable / global vars
    global[] = 
    {
      {"DUCV_HUD_CLOSED", "true"},
      {"DUCV_ACT_TAZED", "false"},
      {"DUCV_PLACEHOLDER", """place"""}
    };


    // Variables which get null after death / atta
    player[] = 
    {
      {"LIF_firstSpawn", "true"}
      //{"LIF_alive", "BOOL", true},
      //{"LIF_alive", "BOOL", true}
    };

    mission[] = 
    {

    };


  };

};