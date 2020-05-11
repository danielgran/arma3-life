/*

  Author: Duckfine
  Date created:   19-04-2020 18:41

  Description:
    Handles all from server coming data for vehicledata

  Params:
    - call ID


  Returns:
    - Nothing (yet)

*/


private[

  "_placeholder01",
  "_placeholder02"

];

params[

  ["_id", objNull],
  ["_content", []]

];


diag_log _content;

switch (_id) do {

    // Get All Vehicles in Personal Garage
    case (0): {
        [_content] call DUC_life_sys_fnc_setClientVars;
    };

};






























//
