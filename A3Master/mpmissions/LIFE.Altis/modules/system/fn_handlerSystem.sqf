/*

  Author: Duckfine
  Date created:   12-04-2020 20:00

  Description:
    -

  Params:
    - int receiveID
    - any content

  Returns:
    -

*/


private[

  "_placeholder"

];

params[

  ["_id", objNull],
  ["_content", []]

];




diag_log _content;

switch (_id) do {

    // Set / Update all client vars
    case (0): {
        [_content] call DUC_life_sys_fnc_setClientVars;
    };

};




































//
