/*

  Author: Duckfine
  Date created:   11-04-2020 13:22
  Last modified: 11-04-2020 13:41

  Description:
  Converts
  ["Prof. Bildungsstop","[]","3DIE6UTL5",0,0,"","[]","[]","[]","[]","[]","[]","false","[]","false",0,0,0,0,0,0,0,0,0,0,0,0]

  to

  ["Prof", [], "adsf", 0,0 "", [], [], ...., false,...]

  Params:
    - array schema
    - array redis db array

  Returns:
    - array a3

*/

private [
  "_dataType",
  "_insert",
  "_return",
  "_value"

];

_return = [];

params[

  ["_schema", []],
  ["_playerSafe", []]

];

diag_log "================================================";
diag_log "============MYSQLDBARRAYTOA3ARRAY===============";
diag_log format["_schema = %1", _schema];
diag_log format["_playerSafe = %1", _playerSafe];
diag_log "================================================";

{

    _dataType = _x select 1;
    _insert = "";
    _value = _playerSafe select _forEachIndex;

    diag_log format["CORE:DBARRAYTOA3ARRAY: _value = %1", _value];
    diag_log format["CORE:DBARRAYTOA3ARRAY: _dataType = %1", _dataType];

    _insert = [_value, _dataType] call DUC_core_redis_fnc_DBValToA3Val;

    _return pushBack _insert;

} forEach _schema;

diag_log _return;

_return;


















//
