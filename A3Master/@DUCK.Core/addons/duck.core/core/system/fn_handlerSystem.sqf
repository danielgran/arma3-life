/*

  Author: Duckfine
  Date created:   12-04-2020 15:25

  Description:
    Handles all incoming Requests from players regarding to the system

  Params:
    -


  Returns:
    -

*/

private[

  "_schema",
  "_content"

];


params[

  ["_token", "", [""]],
  ["_sender", 0, [1]],
  ["_steamID64", "", [""]],
  ["_id", 0, [0]],
  ["_content", [], [[], ""]]

];

switch (_id) do {

    // Init Player so everything is loaded fine
    case (0): {
      // content here is name of player
      [_steamID64, _content] call DUC_core_sys_fnc_initPlayer;
      _content = [_steamID64, _content] call DUC_core_net_fnc_prepClientVars;
    };

    case (1): { // Einzahlen
      //call handleQuery

    };

    case (2): { // Überweisen
      //call handleQuery

    };
};

// here return to client

[_token, "SYS", _id, _content] remoteExec ["DUC_life_sys_fnc_receiveServer", _sender];


































//
