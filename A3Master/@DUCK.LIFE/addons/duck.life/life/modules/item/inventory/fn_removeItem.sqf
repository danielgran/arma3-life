/*

  Author: Duckfine
  Date created: 27-5-2020 20:39

  Description
    Removes Item(s) from Players inventory

  Parameter:
    - STRING steamid64
    - ARRAY info ["itemname", count as scalar]

  Returns:
    - BOOL succeeded


 */




private[

  "_placeholder01",
  "_placeholder02"

];


params[

  ["_steamID64", "", ["a"]],
  ["_info", [], [[]]]

];


_schema = getArray(configFile >> "CfgSettings" >> "db_life" >> "tblplayers" >> "playerRelated");

_schemaCfg = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIDs");
_databaseID = [_schemaCfg, "playerdata", "SCALAR"] call DUC_CORE_fnc_getConfigEntry;

_vinv = [_databaseID, _steamID64, _schema, "invVirtual"] call DUC_CORE_redis_fnc_listEntryGet;
















