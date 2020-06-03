/*

  Author: Duckfine
  Date created: 3-6-2020 13:59

  Description
    Defines some standard database macros

 */


/////////////////////////////////////////////
//           ____           ___            //
//          / __ \___  ____/ (_)____       //
//         / /_/ / _ \/ __  / / ___/       //
//        / _, _/  __/ /_/ / (__  )        //
//       /_/ |_|\___/\__,_/_/____/         //
/////////////////////////////////////////////



#define DEF_DB_GET_SCHEMA(DB, TBL, SCH) getArray(configFile >> "CfgSettings" >> DB >> TBL >> SCH);
#define DEF_DB_REDIS_GET_DBID(KEY) [DEF_DB_GET_SCHEMA("db_life", "Redis", "dbIDs"), KEY, "SCALAR"] call DUC_CORE_fnc_getConfigEntry;










