/*

  Author: Duckfine
  Date created:   12-04-2020 01:54

  Description:
    Handles all Requests shich have to be sent to the server

  Params:
    - string / int module
    - string / int moduleID
    - string / array / int / bool etc any content


  Returns:
    - nothing

    --> Calls the mainTalker on the server

*/


private[

  "_token",
  "_sender",
  "_steamID64"

];

_token = DUCV_SEC_AUTHTOKEN;
_sender = clientOwner;
_steamID64 = getPlayerUID player;

params[

  ["_moduleName", ""],
  ["_moduleID", ""],
  ["_content", ""]

];

if (_content isEqualTo "") then
{
  [_sender, _steamID64, _token, _moduleName, _moduleID] remoteExec ["DUC_core_net_fnc_serverInterface", 2];
} else
{
  [_sender, _steamID64, _token, _moduleName, _moduleID, _content] remoteExec ["DUC_core_net_fnc_serverInterface", 2];
};







//
