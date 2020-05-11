/*
Manages all incoming Database Server Queries.
Supports full Error support in EXTDB3 Console
Also Supports automatic detection if Query answer is a multi message thing
Author: Duckfine


Errorcodes for return:
1010: Connection to Database failed
1001: Return is empty
*/

_queryStatement		= [_this, 0, "", [""]] 	call BIS_fnc_param;
_callType			= [_this, 1, 0 , [0] ] 	call BIS_fnc_param;
_databaseID 		= [_this, 2, 0 , [0] ] 	call BIS_fnc_param;

_validCallTypes = [1,2]; //Calltype 0 not supported yet

_data = [];
_return = [];
_errormsg = "";
_isMultiMessage = false;
_failed = false;
_mainloop = true;
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

if (_databaseID isEqualTo 0) exitWith
{
	"extDB3" callExtension "1:ERRORLOG: Failed with Query, DatabaseID is empty";
};

//Check if Calltype is 1, because then there will be nothing returned
if (_callType isEqualTo 1) exitWith
{
	"extDB3" callExtension format["1:%1:%2", _databaseID, _queryStatement];
	"extDB3" callExtension format["1:QRYLOG: Performed Query 1 - %1 - %2", _databaseID, _queryStatement];
	true; //Will ever return true?
};

//Scan the results from Asynchronous Server Query
if (_callType isEqualTo 2) then
{
	_data = "extDB3" callExtension format["2:%1:%2", _databaseID, _queryStatement];
	"extDB3" callExtension format["1:QRYLOG: Performed Query 1 - %1 - %2", _databaseID, _queryStatement];
	_data = call compile format["%1",_data]; //Compile into arma readable code [RETURN TYPE, MESSAGE]
	
	_mainloop = true;
	while {_mainloop} do // Only here because it could be possible that we have to do this procedere again because we have to wait for the database
	{
		switch (_data select 0) do
		{
			case 0: //Error
			{
				"extDB3" callExtension format["1:ERRORLOG: Failed Statement - %1 - with %2", _queryStatement, _data];
				//TODO: inform Administrator
				_return = [1010]; //Connection to Database Failed, watch for details in log files
				_mainloop = false;
			};
			case 1: //OK -  Only execs when calltype was sync (0) and the answer fits in one message
			{
				if (!(_callType isEqualTo 0)) then // As yet this code will never  be executed
				{
					_failed = true;
					_mainloop = false;
					//inform Administrator
					"extDB3" callExtension format["1:ERRORLOG: Calltype was 0 (Sync) and the Return Type was not 1 Statement - %1", _queryStatement];
				};
				
				_mainloop = false;
			};
			case 2: //Receives the ID for further use 
			{
				_uniqueID = _data select 1;
				_mainloop = false;

				_innerloop = true;
				while {_innerloop} do 
				{
					_data = "extDB3" callExtension format["4:%1",_uniqueID]; //We have to get an result with the unique id
					_data = call compile format["%1", _data];
					
					switch (_data select 0) do
					{
						case 0: //Errormessage
						{
							"extDB3" callExtension format["1:ERRORLOG: Error when receiving the result - %1", _data];
							_failed = true;
							_innerloop = false;
						};
						case 1: //Return value is here, dont have to do it more often, cause thats it
						{
							_return = _data select 1;
							_return = _return select 0;
							
							if (isNil {_return}) then
							{
								_return = [1001];
							};
							"extDB3" callExtension format["1:QRYLOG: SINGLE RETURN ARRIVED - %1", _return];
							// COMPILE TO READABLE SQF FORMAT THEN RETURN
							_innerloop = false;
						};
						case 2: //ID - FATAL ERROR - CAN NOT BE POSSIBLE HERE - INFORM ADMIN
						{
							"extDB3" callExtension format["1:ERRORLOG: Fatal error - Called an answer with ID, returned ID again! - %1", _data];
							_failed = true;
							_innerloop = false;
						};
						case 3: // Not ready yet - sleep try again
						{
							if (_innerloopcounter < 10) then
							{
								uisleep 0.2;
								_innerloopcounter = _innerloopcounter + 1;
								_innerloop = true;
							} else
							{
								"extDB3" callExtension format["1:ERRORLOG: Error - Innerloopcounter exeeded max  - %1 - %2", _data, _queryStatement];
								_innerloop = false;
								_failed = true;
							};
						};
						case 5: // MULTI PART MESSAGE - USE 5 to fetch
						{
							_innerinnerloop = true;
							while{_innerinnerloop} do // Have to go on until empty string
							{
								_data = "extDB3" callExtension format["5:%1",_uniqueID]; //We have to get an result with the unique id
								_data = call compile format["%1", _data];
								switch(_data select 0) do
								{
									case 1:
									{
										if (_data select 1 isEqualTo "") then //empty String
										{
											_innerinnerloop = false;
										} else
										{
											_multireturn = _multireturn + _data select 1;
											_innerinnerloop = true;
										};
									};
									case 3: //WAIT - DATABASE NOT FINISHED YET
									{
										if (_innerinnerloopcounter < 10) then
										{
											uisleep 0.2;
											_innerinnerloopcounter = _innerinnerloopcounter + 1;
											_innerinnerloop = true;
										} else
										{
											_innerinnerloop = false;
											_failed = true;
											"extDB3" callExtension format["1:ERRORLOG: Error - Innerinnerloopcounter exceeded max - %1", _data];
										};
									};
								};
							};
							_innerloop = false;
						};
					};
				};
				_mainloop = false;
			};
			case 3: //WAIT - The Database has not finished yet
			{
				//Check for maximum tries, so this goes not forever
				if (_mainloopcounter < 10) then
				{
					uiSleep 0.1; // Could throw errors, because uisleep cant suspend time in some procederes
					_data = "extDB3" callExtension format["2:%1:%2", _databaseID, _queryStatement];
					_data = call compile format["%1",_data];
					_mainloop = true;
					_mainloopcounter = _mainloopcounter + 1;
				} else // Executed when tries are more than defined maximum
				{
					"extDB3" callExtension format["1:ERRORLOG: Waited too long for Database. Result was longer than 1000 ms [3], so we abort now. Statement -  %1 ", _queryStatement];
					_failed = true;
					_mainloop = false;
				};
			};
			/*case 5: //MULTIMSG // should NOT be executed here, because we dont gave a id //actually we dont need this
			{
				if (_callType in [5,4]) then
				{
					_isMultiMessage == true; //The answer is a multi message But we have to use a other database format
				} else
				{
					"extDB3" callExtension format["1:ERRORLOG: The Calltype was neither 5 nor 4 when the anser from the Server was 5! Statement - %1", _queryStatement];
					_failed = true;
				};
			
				_mainloop = false;
			};*/
		};
	};
	
	if(_failed) exitWith {[false];};
};
if(_failed) exitWith {[false];};

"extDB3" callExtension format["1:QRYLOG: Finished Query - %1 - with return - %2",_queryStatement ,_return];


_return;




































