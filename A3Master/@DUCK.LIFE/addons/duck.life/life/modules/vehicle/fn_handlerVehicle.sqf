/*

Handles all incoming requests todo with vehicles, garages, upgrading of vehicles, etc

*/



params[

  ["_token", "", [""]],
  ["_sender", 0, [1]],
  ["_steamID64", "", [""]],
  ["_id", 0, [0]],
  ["_content", [], [[], ""]]

];

switch (_id) do {


    // Get Player Garage
    case (0): {
        //[_player] call DUC_life_eco_fnc_withdraw;
    };

    case (1): { // Einzahlen
      //spawn handleQuery

    };

    case (1): { // Überweisen
      //spawn handleQuery

    };
};

// here return to client

[_token, "VEH", _id, _content] remoteExec ["DUC_life_sys_fnc_receiveServer", _sender];


















































//
