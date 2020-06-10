/*

  Handles all incoming PLayer requests for economics
  -> Bank abheben / einzahlen / überweisen



  [player, AUTHTOKEN, 0, 1000] remoteExec "bla bla bla" -> Abheben
  [player, AUTHTOKEN, 1, 1000] remoteExec "bla bla bla" -> Einzahlen bla bla abla
  [player, AUTHTOKEN, 2, 1000, otherPlayer (intid, etc) ] --> Überweisung

*/



params[

  ["_token", "", [""]],
  ["_sender", 0, [1]],
  ["_steamID64", "", [""]],
  ["_id", 0, [0]],
  ["_content", [], [[], ""]]

];

switch (_id) do {

    case (0): { // Abheben
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

[_token, "ECO", _id, _content, _sender] call DUC_CORE_NET_fnc_sendClient;




