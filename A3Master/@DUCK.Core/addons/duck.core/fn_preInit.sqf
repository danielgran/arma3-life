diag_log "_____  _    _  _____ _  __  _____ ____  _____  ______  ";
diag_log "|  __ \| |  | |/ ____| |/ / / ____/ __ \|  __ \|  ____|";
diag_log "| |  | | |  | | |    | ' / | |   | |  | | |__) | |__   ";
diag_log "| |  | | |  | | |    |  <  | |   | |  | |  _  /|  __|  ";
diag_log "| |__| | |__| | |____| . \ | |___| |__| | | \ \| |____ ";
diag_log "|_____/ \____/ \_____|_|\_(_)_____\____/|_|__\_\______|";
diag_log "                                                       ";
diag_log "       |  __ \|  __ \|  ____|_   _| \ | |_   _|__   __|";
diag_log " ______| |__) | |__) | |__    | | |  \| | | |    | |   ";
diag_log "|______|  ___/|  _  /|  __|   | | | . ` | | |    | |   ";
diag_log "       | |    | | \ \| |____ _| |_| |\  |_| |_   | |   ";
diag_log "       |_|    |_|  \_\______|_____|_| \_|_____|  |_|   ";



// let init only be executed once
if (!isNil(serverInitDone) or serverInitDone isEqualTo true) exitWith {diag_log "INIT EXECUTED TWICE?";};  //Alarm, weil unerlaubterweise die Init erneut ausgeführt wurde
serverInitDone = false;


#define __SVAR__(var1,var2) var1 = compileFinal (if(typeName var2 isEqualTo "STRING") then {var2} else {str(var2)})
#define __SCVAR__(var) var = compileFinal (if(typeName var isEqualTo "STRING") then {var} else {str(var)})


//Redis Server init

// Connect to RedisServer
_con = call DUC_core_redis_fnc_connect;
// Check Redis Extension Version
_a3rversion = call DUC_core_redis_fnc_checkVersion;


if (_a3rversion isEqualTo "") exitWith
{
  diag_log text "[DUCK:CORE] A3Redis wurde nicht gefunden";
  // Server isnt ready yet
  // todo stop server from beeing starting and exiting --> have to mail/sms/push this to an administrator
};

diag_log format["[DUCK:CORE] ArmaRedisClient wurde geladen! Version: %1", _a3redis];





//MySQL Server Initialize
if (("extDB3" callExtension "9:VERSION") isEqualTo "") exitWith
{
	diag_log "EXTDB3 ERROR WURDE NICHT RICHTIG INSTALLIERT";
	duc_core_dbavailable = false;
};


if (isNil {uiNamespace getVariable "ducv_core_dbidplayerdata"} ) then {
	ducv_core_dbidplayerdata = round(random(999999));
	__SVAR__(ducv_core_dbidplayerdata, ducv_core_dbidplayerdata);
	uiNamespace setVariable ["ducv_core_dbidplayerdata", ducv_core_dbidplayerdata];


  //init "playerdata" extdb3 db
  "extDB3" callExtension format["9:ADD_DATABASE:%1", "playerdata"];
	"extDB3" callExtension format["9:ADD_DATABASE_PROTOCOL:%1:SQL:%2:TEXT2", "playerdata", (call ducv_core_dbidplayerdata)];

	//Add logging for specific logs

	"extDB3" callExtension "9:ADD_PROTOCOL:LOG:ERRORLOG:errorlog";
	diag_log "[DUCK:CORE] EXTDB3 Errorlogging enabled";

	if (getNumber(configFile >> "CfgSettings" >> "Logging" >> "extdb_playerdata") isEqualTo 1) then {
		"extDB3" callExtension "9:ADD_PROTOCOL:LOG:PLAYERDATA:playerdata";
		diag_log "[DUCK:CORE] Logging for Playerdata Database enabled!"
	};

	if (getNumber(configFile >> "CfgSettings" >> "Logging" >> "extdb_querylog") isEqualTo 1) then {
		"extDB3" callExtension "9:ADD_PROTOCOL:LOG:QRYLOG:allquerys";
		diag_log "[DUCK:CORE] Logging for all Database Querys enabled!"
	};
};



// Lock Database
"extDB3" callExtension "9:LOCK";

switch("extDB3" callExtension "9:LOCK_STATUS") do
{
	case "[0]":
	{
		diag_log "[DUCK:CORE] EXTDB3 ERROR LOCKING FAILED";
	};
	case "[1]":
	{
		diag_log "[DUCK:CORE] EXTDB3 SUCCESSFULLY LOCKED";
	};
};




_databaseResult = ["SHOW PROCESSLIST", 2, (call ducv_core_dbidplayerdata)] call DUC_core_mysql_fnc_queryHandler;
if (_databaseResult isEqualTo [[]]) then // Check if Databaseconnection is established
{
  diag_log "[DUCK:CORE] Connection to Database failed";
} else
{
	diag_log "[DUCK:CORE] Connectiontest to Database succeeded";
};























//TODO: some sort of control structure if everything loaded fine
serverInitDone = true;






























"END PREINIT" call test_fnc_log;
//