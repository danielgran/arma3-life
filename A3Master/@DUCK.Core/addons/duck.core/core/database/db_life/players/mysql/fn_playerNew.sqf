/*
  Inserts new Player in Database

  Author: Duckfine
*/

private[ "_pattern", "_playerInternalID", "_steamID64", "_a3name", "_proceed", "_count", "_max"];

_pattern = "0XXX0XXX0";


params [
  "_steamID64",
  "_a3name"
];



/*
// Birth of a new PlayerID
_playerInternalID = [_pattern] call DUC_core_fnc_generateID;

_proceed = true;
_count = 0;
_max = 100;
while {_proceed} do {
    if(_count > _max) exitWith {false}; // todo inform somehow admin or write it in log
    _count = _count + 1;

    _query = format ["SELECT id FROM players WHERE intid = '%1'", _playerInternalID];
    _databaseResult = [_query, 2, (call ducv_core_dbidplayerdata)] call DUC_core_mysql_fnc_queryHandler;

    // If no id is found


    if ! ( _databaseResult isEqualTo [[]] ) then
    {
      _proceed = false;
    } else
    {
      _playerInternalID = [_pattern] call DUC_core_mysql_fnc_generateID;
    };

    //todo should return false
};
*/

_query = format ["CALL spAddNewUser('%1', '%2');", _steamID64, _a3name];
_databaseResult = [_query, 0, (call ducv_core_dbidplayerdata)] call DUC_core_mysql_fnc_queryHandler;
// check if player was created successfully
true; //todo check query handler always return true also if i set data in an db which literaklly not exists wtf what i have coded
