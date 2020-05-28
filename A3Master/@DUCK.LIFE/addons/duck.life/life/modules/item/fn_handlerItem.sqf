/*

  Author: Duckfine
  Date created: 27-5-2020 20:35

  Description
    <desc>

  Parameter:
    - <type> <name>

  Returns:
    - <type> <name>


 */


private[

  "_placeholder01",
  "_placeholder02"

];


params[

  ["_token", "", [""]],
  ["_sender", 0, [1]],
  ["_steamID64", "", [""]],
  ["_id", 0, [0]],
  ["_content", [], [[], ""]]

];


switch (_id) do {

    case (0): { // Item aus Inventar entfernen
        [_steamID64, _content] call DUC_LIFE_VITEM_fnc_removeItem;
    };

    case (1): { // Einzahlen
      //spawn handleQuery

    };

    case (1): { // Überweisen
      //spawn handleQuery

    };
};

// here return to client

[_token, "VITEM", _id, _content] remoteExec ["DUC_life_sys_fnc_receiveServer", _sender];


















































//
