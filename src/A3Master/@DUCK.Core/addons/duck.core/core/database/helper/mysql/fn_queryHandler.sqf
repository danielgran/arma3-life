/*
Manages all incoming Database Server Queries.
Supports full Error support in EXTDB3 Console
Also Supports automatic detection if Query answer is a multi message thing
Author: Duckfine


*/


private ["_data", "_return", "_errormsg", "_isMultiMessage", "_failed", "_mainloop", "_innerloop",
"_innerinnerloop", "_mainloopcounter", "_innerloopcounter", "_innerinnerloopcounter", "_multireturn",
"_uniqueID", "_queryStatement", "_callType", "_databaseID", "_validCallTypes"];



_queryStatement		= [_this, 0, "", [""]] 	call BIS_fnc_param;
_callType			= [_this, 1, 0 , [0] ] 	call BIS_fnc_param;
_databaseID 		= [_this, 2, 0 , [0] ] 	call BIS_fnc_param;

diag_log "================================================";
diag_log "================MYSQLQUERYHANDLER===============";
diag_log format["_queryStatement = %1", _queryStatement];
diag_log format["_callType = %1", _callType];
diag_log format["_databaseID = %1", _databaseID];
diag_log "================================================";



_validCallTypes = [0,1,2];

_data = [];
_return = [];
_errormsg = "";
_isMultiMessage = false;
_failed = false;
_loop = true;
_innerloop = true;
_innerinnerloop = true;
_mainloopcounter = 0;
_innerloopcounter = 0;
_innerinnerloopcounter = 0;
_multireturn = [];
_uniqueID = 0;



//Errorchecks
if (_queryStatement isEqualTo "") exitWith
{
	"extDB3" callExtension "1:ERRORLOG: Failed with Query, Statement is empty";
	false;
};

//Check if Calltype is valid - also has security reasons for not abusing my function (9 are system commands)
if (!(_callType in _validCallTypes)) exitWith
{
	"extDB3" callExtension "1:ERRORLOG: Failed with Query, Calltype is not valid";
	false;
};
_key = "extDB3" callExtension format ["%1:%2:%3", _callType, _databaseID, _queryStatement];
"extDB3" callExtension format["1:QRYLOG: Performed Query - _callType = %1 - _queryStatement %2", _callType, _queryStatement];

diag_log "================================================";
diag_log "================MYSQLQUERYHANDLER===============";
diag_log format["_key = %1", _key];
diag_log "================================================";



if (_callType isEqualTo 0) exitWith {true}; // No need to get any response
if (_callType isEqualTo 1) exitWith {true}; // No need to get any response

_key = call compile format ["%1",_key];
diag_log "================================================";
diag_log "================MYSQLQUERYHANDLER===============";
diag_log format["_key = %1", _key];
diag_log "================================================";

_key = (_key select 1);

diag_log "================================================";
diag_log "================MYSQLQUERYHANDLER===============";
diag_log format["_key = %1", _key];
diag_log "================================================";

_queryResult = "extDB3" callExtension format ["4:%1", _key];

diag_log "================================================";
diag_log "================MYSQLQUERYHANDLER===============";
diag_log format["_queryResult = %1", _queryResult];
diag_log "================================================";


if (_queryResult isEqualTo "[3]") then {
    for "_i" from 0 to 1 step 0 do {
        if (!(_queryResult isEqualTo "[3]")) exitWith {};
        _queryResult = "extDB3" callExtension format ["4:%1", _key];
    };
};

if (_queryResult isEqualTo "[5]") then {
    _loop = true;
    for "_i" from 0 to 1 step 0 do { // extDB3 returned that result is Multi-Part Message
        _queryResult = "";
        for "_i" from 0 to 1 step 0 do {
            _pipe = "extDB3" callExtension format ["5:%1", _key];
            if (_pipe isEqualTo "") exitWith {_loop = false};
            _queryResult = _queryResult + _pipe;
        };
    if (!_loop) exitWith {};
    };
};



diag_log "================================================";
diag_log "================MYSQLQUERYHANDLER===============";
diag_log format["_queryResult = %1", _queryResult];
diag_log "================================================";
//Now Informations are here





"extDB3" callExtension format["1:QRYLOG: Performed Query 1 - %1 - %2", _databaseID, _queryStatement];

_queryResult = call compile _queryResult;
_queryResult = _queryResult select 1;


_return = _queryResult;

"extDB3" callExtension format["1:QRYLOG: Finished Query - %1 - with return - %2",_queryStatement ,_return];
diag_log "================================================";
diag_log "================MYSQLQUERYHANDLER===============";
diag_log format["_return = %1", _return];
diag_log "================================================";


_return;
