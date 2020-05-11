/*
Handles all incoming querys to the diffrent databases

Author Duckfine

*/

/*
WIKI
Message Format
CALL_TYPE:PROTOCOL_NAME:DATA
CALL_TYPE
0 = Sync  
1 = ASync (Doesnt save/return results, use for updating DB Values)  
2 = ASync + Save (Returns ID, for use with 5)

4 = Get (Retrieve Single Part Message)
5 = Get (Retrieves Multi-Msg Message)

9 = System Commands

Returned Message Format

[TYPE]  
[TYPE,DATA]
TYPE
0=ERROR       (When Error encounter, data = basic info)  
1=OK      
2=ID         (ID = ID for ASYNC / Multi-part Message)  
3=WAIT       (WAIT, means extDB hasn't got result yet)  
5=MULTIMSG   (When you call 4:, it will return [5] if message is Multi-part)  

*/
private["_stmnt","_databaseID","_callType","_return","_result","_loop","_pipe"];


_stmnt		= [_this, 0, "", ["a"]] call BIS_fnc_param;
_callType	= [_this, 1, 0, [0]] call BIS_fnc_param;
_databaseID	= [_this, 2, 0, [0]] call BIS_fnc_param;
_multiarray = [_this, 3, false, [true]]call BIS_fnc_param;
_return = false;
_result = "";

"extDB3" callExtension format["1:QRYLOG: New Query Statement %1", _stmnt];
"extDB3" callExtension format["1:QRYLOG: To Database %1", _databaseID];





_data = "extDB3" callExtension format["%1:%2:%3", _callType, _databaseID, _stmnt];

"extDB3" callExtension format["1:QRYLOG:data var %1", _data];

if (_callType isEqualTo 1) exitWith {true;}; //Only Update Data, does not return anything


_data = call compile format["%1",_data];

"extDB3" callExtension format["1:QRYLOG:data var %1", _data];
_data = _data select 1;
"extDB3" callExtension format["1:QRYLOG:data var %1", _data];

_loop = true;
while{_loop} do {
	_result = "extDB3" callExtension format ["4:%1",_data];
	"extDB3" callExtension format["1:QRYLOG:result var %1", _result];
	if(_result isEqualTo "[5]") then {
		_result = "";
		while {true} do {
			_pipe = "extDB3" callExtension format ["5:%1",_data];
			if(_pipe isEqualTo "") exitWith {_loop = false};
			_result = _result + _pipe;
			"extDB3" callExtension format["1:QRYLOG:result var %1", _result];
		};
	} else {
		"extDB3" callExtension format["1:QRYLOG:result BEFORE IF var %1", _result];
		if(_result isEqualTo "[3]") then {
			//sleep 0.1; /del by duckfine, suspending is not allowed in this context error
			if (canSuspend) then
			{
				uiSleep 0.1;
			};
		} else {
			_loop = false;
		};
	};
};


_result = call compile _result;
"extDB3" callExtension format["1:QRYLOG:result 2 LAST var %1", _result];
if(_result select 0 isEqualTo 0) exitWith {false};



if(count (_result select 1) isEqualTo 0) exitWith {
"extDB3" callExtension format["1:QRYLOG:ISEQUALTO 0  %1", _result];

}; //Wenn ein leere Antwort vorhanden sein sollte
_return = _result select 1;


if(!_multiarray && (count _return) > 0) then {
	_return = _return select 0;
	"extDB3" callExtension format["1:QRYLOG:result 1 LAST var %1", _result];
};
"extDB3" callExtension format["1:QRYLOG:return var %1", _return];
_return;














