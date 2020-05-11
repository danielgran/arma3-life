#define __SVAR__(var1,var2) var1 = compileFinal (if(typeName var2 isEqualTo "STRING") then {var2} else {str(var2)})
#define __SCVAR__(var) var = compileFinal (if(typeName var isEqualTo "STRING") then {var} else {str(var)})
#include "\@DUCKOTH\addons\duckoth\util\oop.h"
//todo really implement this ????

/*
	Zuständig für essentielle Abläufe, wie DB verbindung, etc.

	Author: Duckfine / Daniel G
*/

[] call compile preprocessFileLineNumbers "duckoth\configuration.sqf";



if (!isNil(serverInitDone) or serverInitDone isEqualTo true) exitWith {diag_log "INIT EXECUTED TWICE?";};  //Alarm, weil unerlaubterweise die Init erneut ausgeführt wurde
serverInitDone = false; // only for security purpose

duc_dbavailable = false;
duc_pubVar_serverReady = false;
publicVariable "duc_pubVar_serverReady";



//Check if extDB3 is available

if (("extDB3" callExtension "9:VERSION") isEqualTo "") exitWith
{
	dck_pubVar_serverReady = false;
	publicVariable "dck_pubVar_serverReady";
	diag_log "EXTDB3 ERROR WURDE NICHT RICHTIG INSTALLIERT";
	duc_dbavailable = false;
};



// Connect to Database "playerdata"

if (isNil {uiNamespace getVariable "dckdb_playerdata_id"} ) then {
	dckdb_playerdata_id = round(random(999999));
	__SVAR__(dckdb_playerdata_id,dckdb_playerdata_id);
	uiNamespace setVariable ["dckdb_playerdata_id", dckdb_playerdata_id];

	//Add all Databases from configuration.sqf
	{
		"extDB3" callExtension format["9:ADD_DATABASE:%1", _x];
		"extDB3" callExtension format["9:ADD_DATABASE_PROTOCOL:%1:SQL:%2:TEXT2",_x, (call dckdb_playerdata_id)];
	} forEach dckdb_availableDatabases;

	//Add logging for specific logs

	"extDB3" callExtension "9:ADD_PROTOCOL:LOG:ERRORLOG:errorlog";
	diag_log "EXTDB3 Errorlogging enabled";

	if (getNumber(configFile >> "CfgSettings" >> "Logging" >> "playerdata") isEqualTo 1) then {
		"extDB3" callExtension "9:ADD_PROTOCOL:LOG:PLAYERDATA:playerdata";
		diag_log "Logging for Playerdata Database enabled!"
	};

	if (getNumber(configFile >> "CfgSettings" >> "Logging" >> "qrylog") isEqualTo 1) then {
		"extDB3" callExtension "9:ADD_PROTOCOL:LOG:QRYLOG:allquerys";
		diag_log "Logging for all Database Querys enabled!"
	};
};


// Lock Database

"extDB3" callExtension "9:LOCK";

switch("extDB3" callExtension "9:LOCK_STATUS") do
{
	case "[0]":
	{
		diag_log "EXTDB3 ERROR LOCKING FAILED";
	};
	case "[1]":
	{
		diag_log "EXTDB3 SUCCESSFULLY LOCKED";
	};
};

//Enable Global Point System
if (getNumber(configFile >> "CfgSettings" >> "Functionality" >> "pointSystem") isEqualTo 1) then
{
	["[Pointsystem] Enabled!", 0] call DUCUT_fnc_a3logapi;
	call DCKPNT_fnc_init;
};



//Enable MVS
if (getNumber(configFile >> "CfgSettings" >> "Functionality" >> "missionVoteSystem") isEqualTo 1) then
{
	["[MVS] Enabled!",0] call DUCUT_fnc_a3logapi;
	call DCKMVS_fnc_init;
} else
{
	dck_mvs = false;
	publicVariable "dck_mvs";
};



//DB Connection is ready?

_databaseResult = ["SHOW PROCESSLIST", 2, (call dckdb_playerdata_id)] call DUCDB_fnc_queryHandler;
if (_databaseResult isEqualTo [1010]) then // Check if Databaseconnection is established
{
	duc_dbavailable = false;
} else
{
	duc_dbavailable = true;
};



call compile preprocessFileLineNumbers "duckoth\classes\PLAYERSAFE.sqf";
"sayHelloWorld" call PLAYERSAFE;



duc_serverReady = true; //hier schon?

publicVariable "duc_serverReady";
publicVariable "duc_dbavailable";
