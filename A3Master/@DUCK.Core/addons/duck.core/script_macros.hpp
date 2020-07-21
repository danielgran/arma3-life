/*

  Author: Duckfine
  Date created: 3-6-2020 13:59

  Description
    Defines some standard macros

 */

////////////////////////////////
//     ______                 //
//    / ____/___  ________    //
//   / /   / __ \/ ___/ _ \   //
//  / /___/ /_/ / /  /  __/   //
//  \____/\____/_/   \___/    //
////////////////////////////////

#define DEF_CORE_CONST_SERVERID getNumber(configFile >> "CfgSettings" >> "serverID")
#define DEF_CORE_PRINT_DEBUG(MSG) diag_log MSG

#define DEF_CORE_GET_OBJECT_VALUE(SCHEMA, OBJECT, FIELD) ([SCHEMA, OBJECT, FIELD] call DUC_CORE_fnc_getArrayValue)


/////////////////////////////////////////////
//           ____           ___            //
//          / __ \___  ____/ (_)____       //
//         / /_/ / _ \/ __  / / ___/       //
//        / _, _/  __/ /_/ / (__  )        //
//       /_/ |_|\___/\__,_/_/____/         //
/////////////////////////////////////////////



#define DEF_DB_GET_SCHEMA(DB, TBL, SCH) (getArray(configFile >> "CfgSettings" >> DB >> TBL >> SCH))
#define DEF_DB_REDIS_GET_DBID(KEY) ([DEF_DB_GET_SCHEMA("db_life", "Redis", "dbIDs"), KEY, "SCALAR"] call DUC_CORE_fnc_getConfigEntry)



/////////////////////////////////////////////////
//           __  ___      _____ ____    __     //
//          /  |/  /_  __/ ___// __ \  / /     //
//         / /|_/ / / / /\__ \/ / / / / /      //
//        / /  / / /_/ /___/ / /_/ / / /___    //
//       /_/  /_/\__, //____/\___\_\/_____/    //
/////////////////////////////////////////////////

// Exec query without rs
#define DEF_DB_MYSQL_EXEC_QUERY(QUERY) [QUERY, 0, (call ducv_core_dbidplayerdata)] call DUC_core_mysql_fnc_queryHandler
// Exec query with rs (ResultSet)
#define DEF_DB_MYSQL_EXEC_QUERY_RS(QUERY) [QUERY, 2, (call ducv_core_dbidplayerdata)] call DUC_core_mysql_fnc_queryHandler








