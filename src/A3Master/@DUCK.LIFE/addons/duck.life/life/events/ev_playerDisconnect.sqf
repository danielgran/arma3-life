/*

  Handles the serverside leave procedure of the player

  Author: Duckfine


*/
addMissionEventHandler ["HandleDisconnect", {
	private[
		"_playerSafe",
		"_schema"
	];
	params ["_unit", "_id", "_uid", "_name"];


	//todo calculate playtime and then push it into database | serverside?






	_schema = getArray(configFile >> "CfgSettings" >> "db_life" >> "tblplayers" >> "playerRelated");
	_schemaCfg = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIDs");
  _databaseID = [_schemaCfg, "playerdata", "SCALAR"] call DUC_CORE_fnc_getConfigEntry;

  _playerSafe = [_databaseID, _uid, _schema] call DUC_core_redis_fnc_listFetch;
  //[_uid, _schema, _playerSafe] call DUC_core_mysql_fnc_datasetUpdate;
  [_schema, _playerSafe, "players", format["steamid64 = '%1'", _uid]] call DUC_core_mysql_fnc_datasetUpdate;




	// Delete Redis Authentication key
	[_databaseID, format["auth#%1",_uid]] call DUC_core_redis_fnc_keyDelete;
	[_databaseID, _uid] call DUC_core_redis_fnc_keyDelete;





	false;
}];
