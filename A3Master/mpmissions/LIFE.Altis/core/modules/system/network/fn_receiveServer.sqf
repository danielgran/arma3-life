/*

  Author: Duckfine
  Date created:   11-04-2020 16:25
  Last modified: 11-04-2020 16:25

  Description:
    - Handles incoming data from server

  Params:
    - token
    -


  Returns:
    -

*/


private[
  "_placeholder"

];

params[

  ["_token", ""],
  ["_receiveModule", ""],
  ["_receiveID", 0],
  ["_content", [], [[], ""]]

];


// todo insert here the player global var token lol placeholder
// log some accessrestriction or so into client rpt
if ((_token isEqualTo "") && (_receiveModule isEqualTo "AUTH") && (_receiveID isEqualTo 0) && (DUCV_SEC_AUTHTOKEN isEqualTo "")) exitWith
{
  // todo on accesstoken change endmission for player (anonymous while loop on client?)
  DUCV_SEC_AUTHTOKEN = _content;
  hint format ["Successful authenticated with server! Your Accesstoken: %1", _content];
};

// todo kick player
if ! (_token isEqualTo DUCV_SEC_AUTHTOKEN ) exitWith
{
  hint str("Malicious activity detected! Aborting...");
};

switch (_receiveModule) do {

  case ("SYS"): {
      [_receiveID, _content] spawn DUC_life_sys_fnc_handlerSystem;
  };

    default {
        hint str(_content);
    };
};

































//
