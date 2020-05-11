/*
	Creates Current Timestamp for mysql
	- current timestamp mysql	--> 0
	- duration					--> 1
	- Log Stamp					--> 2
	
	
	
	2019-04-06 18:15:45
	
	Author: Duckfine
*/

private["_mode", "_return"];


_mode = 0;
_timeStamp = "";
_return = [];

_mode = [_this, 0, [0], [0]] call BIS_fnc_param;



switch (_mode) do
{
	case 0: //Current Timestamp
	{
		_temp = call compile ("real_date" callExtension "");
		_timeStamp = format["%1-%2-%3 %4:%5:00", _temp select 0, _temp select 1, _temp select 2, _temp select 3, _temp select 4];
		_return set [0, _timeStamp];
	};
	
	case 1:
	{
	};
	
	case 2:
	{
		_temp = call compile ("real_date" callExtension "");
		_timeStamp = format["[%1.%2.%3 - %4:%5", _temp select 0, _temp select 1, _temp select 2, _temp select 3, _temp select 4];
	};
};



_return;