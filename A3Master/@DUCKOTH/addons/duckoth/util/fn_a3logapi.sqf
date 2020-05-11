/*
	Talks with the A3Log Modification
	
	Author: Duckfine
	
	procType:
	0: DUCKOTH Standard log
*/

if (getNumber(configFile >> "CfgSettings" >> "Logging" >> "A3Log") isEqualTo 0) exitWith {false;}; //Check if a3log is active

private[];

_procType = [_this, 0, 0, [1]] call BIS_fnc_param;
_msg = [_this, 0, "", ["a"]] call BIS_fnc_param;


if (_msg isEqualTo "") exitWith {["NOTHING","DUCKOTH"] call A3Log; false;};

switch (_procType) do
{
	case 0: //Standard DUCKOTH Log
	{
		[_msg, "DUCKOTH"] call A3Log;
	};
};

true;