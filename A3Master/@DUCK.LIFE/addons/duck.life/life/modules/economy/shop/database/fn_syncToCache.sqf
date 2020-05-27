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

diag_log format["databaseresult: %1", _databaseResult];


_schemaSP = getArray(configFile >> "CfgSettings" >> "db_life" >> "tblEcoShopServerInfo" >> "schemaSP");
_schemaCache = getArray(configFile >> "CfgSettings" >> "db_life" >> "tblEcoShopServerInfo" >> "schemaCache");

// [[shopID, shopName, shopClass, warehouse]]
_redisarray = [];


_done = [];
{

  _shopName = [_schemaSP, _x, "shopName"] call DUC_CORE_fnc_getArrayValue;

  // Check if shop has content
  if !(_shopName isEqualTo "") then
  {
    _shopID =         [_schemaSP, _x, "shopID"] call DUC_CORE_fnc_getArrayValue;
    _shopType =       [_schemaSP, _x, "shopType"] call DUC_CORE_fnc_getArrayValue;
    _itemClass =      [_schemaSP, _x, "itemClass"] call DUC_CORE_fnc_getArrayValue;
    _itemName =       [_schemaSP, _x, "itemName"] call DUC_CORE_fnc_getArrayValue;
    _itemIsVirtual =  [_schemaSP, _x, "itemIsVirtual"] call DUC_CORE_fnc_getArrayValue;
    _itemType =       [_schemaSP, _x, "itemType"] call DUC_CORE_fnc_getArrayValue;
    _itemPriceBuy =   [_schemaSP, _x, "itemPriceBuy"] call DUC_CORE_fnc_getArrayValue;
    _itemPriceSell =  [_schemaSP, _x, "itemPriceSell"] call DUC_CORE_fnc_getArrayValue;
    _itemStock =      [_schemaSP, _x, "itemStock"] call DUC_CORE_fnc_getArrayValue;

    
  
    _shopID = str(_shopid);

    if !(_shopid in _done) then
    {
      _done pushBack _shopid;
      _redisarray pushBack [_shopID, _shopName, _shopType, []];
    };


    // Loop through redis array to search current shopid
    {
      // if current shop id is in the searched one exit with push the item back
      if((_x select 0) isEqualTo _shopID) exitWith 
      {
        (_x select 3) pushBack [_itemClass, _itemName, _itemIsVirtual, _itemType, _itemPriceBuy, _itemPriceSell, _itemStock];
      };
    } forEach _redisarray;

    };

} forEach _databaseResult;

diag_log format["_redisarray: %1", _redisarray];




_schemaRedisDB = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIds");

_databaseID = [_schemaRedisDB, "shopdata", "SCALAR"] call DUC_CORE_fnc_getConfigEntry;

// Loop through redis array to push it into redis cache
{
  // Delete old
  [_databaseID, _x select 0] call DUC_CORE_Redis_fnc_keyDelete;
  [_databaseID, _x select 0, _x] call DUC_core_redis_fnc_listAdd;

} forEach _redisarray;







// [[shopid, [warehouse]], shop2]






// like []





//Get Redis Shopdata

// check if mysql count and redis count are the same 

// no: fresh data



//Check if redis holds shopdata

//yes: check if counts are the same
//no: pull fresh shop data





