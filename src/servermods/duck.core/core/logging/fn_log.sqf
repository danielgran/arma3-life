/*
  Description: Logs something to the server RPT log.
*/

params
[
  ["_message", "", ["a"]],
  ["_logLevel", 0, [0]]
];

private _outputMessage = "";


switch (_logLevel) do {
  case 0: { // Debug
    _outputMessage = format["[DEBUG] %1", _message];
  };
  case 1: { // Info
    _outputMessage = format["[INFO] %1", _message];
  };
  case 2: { // Warning
    _outputMessage = format["[WARNING] %1", _message];
  };
  case 3: { // Error
    _outputMessage = format["[ERROR] %1", _message];
  };
  case 4: { // Fatal
    _outputMessage = format["[FATAL] %1", _message];
  };
  default { };
};

diag_log _outputMessage;