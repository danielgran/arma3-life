/*

  Author: Duckfine
  Date created: 14-5-2020 23:38

  Description
    Syncs the mysql server with the rediscache if available
	if the rediscache is not there (server brand new, etc) the script
	pulls the data from the server
	also if the shopcount db and redis are not the same, the server will push
	redis to mysql and then read all shops 

  HAS TO BE SPAWNED

  Parameter:
    - <type> <name>

  Returns:
    - <type> <name>


 */
/*
params[


];


*/

private[

  "_schema",
  "_placeholder02"

];




if (!canSuspend) exitWith { false; };

// GET MYSQL DATA
_stmt = format["CALL spGetEconomyShopData('%1')", 1]; //TODO MAKE GLOBAL VARIABLE SERVER ID
_databaseResult = [_stmt, 2, (call ducv_core_dbidplayerdata)] call DUC_core_mysql_fnc_queryHandler;

diag_log _databaseResult;





// like []





//Get Redis Shopdata

// check if mysql count and redis count are the same 

// no: fresh data



//Check if redis holds shopdata

//yes: check if counts are the same
//no: pull fresh shop data





