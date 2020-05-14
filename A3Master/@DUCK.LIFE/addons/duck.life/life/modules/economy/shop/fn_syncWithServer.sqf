/*

  Author: Duckfine
  Date created: 14-5-2020 23:38

  Description
    Syncs the mysql server with the rediscache if available
	if the rediscache is not there (server brand new, etc) the script
	pulls the data from the server
	also if the shopcount db and redis are not the same, the server will push
	redis to mysql and then read all shops 

  Parameter:
    - <type> <name>

  Returns:
    - <type> <name>


 */

private[

  "_schema",
  "_placeholder02"

];


params[

  "ph01",
  "ph02"

];

//Get Redis Shopdata

_schema = getArray(configFile >> "CfgSettings" >> "db_life" >> "tblEcoShopServerInfo" >> "schema");
_schemaCfg = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIDs");
_databaseID = [_schemaCfg, "shopdata", "SCALAR"] call DUC_CORE_fnc_getConfigEntry;


_dataRedis = [_databaseID, , _schema, "bank"] call DUC_CORE_redis_fnc_listEntryGet;

_moneySender = [_databaseID, _steamidSender, _schema, "bank"] call DUC_CORE_redis_fnc_listEntryGet;

// check if mysql count and redis count are the same 

// no: fresh data



//Check if redis holds shopdata

//yes: check if counts are the same
//no: pull fresh shop data





