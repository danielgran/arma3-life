diag_log "asd";
private["_pub", "_owner"];
_pub = [_this,0,"",[""]] call BIS_fnc_param;
_owner = [_this,1, ObjNull, [ObjNull]] call BIS_fnc_param;

_owner = owner _owner;

[_pub] remoteExec ["BAS_fnc_receiveData", 0, false];