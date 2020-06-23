#include "\duck.core\script_macros.hpp"
/*

  Author: Duckfine
  Date created: 11-6-2020 00:07

  Description
    Sends a message to an client


 */

params[

  ["_token", "", ["a"]],
  ["_module", "", ["a"]],
  ["_id", -1, [1]],
  "_content",
  "_sender"

];

[_token, _module, _id, _content] remoteExec ["CDUC_SYS_fnc_receiveServer", _sender];
