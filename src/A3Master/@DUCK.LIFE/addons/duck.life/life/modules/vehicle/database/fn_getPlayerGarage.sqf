/*

  Author: Duckfine
  Date created:   18-04-2020 14:19

  Description:
    Fetches the player garage


  Params:
    - string | steamid64


  Returns:
    array | full array of vehicles the player has in its personal garage

*/

private[

  "_stmt",
  "_databaseResult",
  "_toGet",
  "_curByteSize",
  "_sendString",
  "_tmp",
  "_vehicles"

];

params[

  ["_steamID",""]

];

// Get the bytesizes of the vehicles
_stmt = format["CALL spGetPlayerGarageVehiclesByteSizes('%1')", _steamID];
_databaseResult = [_stmt, 2, (call ducv_core_id_dblife)] call DUC_core_mysql_fnc_queryHandler;

if(_databaseResult isEqualTo []) exitWith { false; };

// [[id, intid, size]] [[1,"a",408],[2,"a",413],[3,"a",450],[4,"a",557],[9,"a",550],[10,"a",551],[12,"a",419],[14,"a",364],[15,"a",364],[16,"a",381],[17,"a",381],[18,"a",381],[19,"a",381],[20,"a",381],[21,"a",381],[22,"a",381],[23,"a",381],[24,"a",381],[25,"a",381],[26,"a",381],[27,"a",381],[28,"a",381],[29,"a",381],[30,"a",381],[31,"a",381],[32,"a",381],[33,"a",381],[34,"a",381],[35,"a",381],[36,"a",381],[37,"a",381],[38,"a",381],[39,"a",381],[40,"a",381],[41,"a",381],[42,"a",381],[43,"a",381],[44,"a",381],[45,"a",381],[46,"a",381],[47,"a",381],[48,"a",381],[49,"a",381],[50,"a",381],[51,"a",381],[52,"a",381],[53,"a",381],[54,"a",381],[55,"a",381],[56,"a",384],[57,"a",155],[58,"a",381],[59,"a",381],[60,"a",381],[61,"a",381],[62,"a",381],[63,"a",381],[64,"a",381],[65,"a",381],[66,"a",381],[67,"a",381],[68,"a",381],[69,"a",381],[70,"a",381],[71,"a",381],[71,"a",381]]

//todo: add sizes together and then fetch the vehicles so the return will never be over 10.000 or maybe only slightly becaouse over 20.000 will deliver errors

_toGet = []; //[[id, intid], [id, intid], ...] tofetch from database
_curByteSize = 0;
_sendString = "";
_tmp = [];
_vehicles = [];

//_databaseResult = [[1,"a",408],[2,"a",413],[3,"a",450],[4,"a",557],[9,"a",550],[10,"a",551],[12,"a",419],[14,"a",364],[15,"a",364],[16,"a",381],[17,"a",381],[18,"a",381],[19,"a",381],[20,"a",381],[21,"a",381],[22,"a",381],[23,"a",381],[24,"a",381],[25,"a",381],[26,"a",381],[27,"a",381],[28,"a",381],[29,"a",381],[30,"a",381],[31,"a",381],[32,"a",381],[33,"a",381],[34,"a",381],[35,"a",381],[36,"a",381],[37,"a",381],[38,"a",381],[39,"a",381],[40,"a",381],[41,"a",381],[42,"a",381],[43,"a",381],[44,"a",381],[45,"a",381],[46,"a",381],[47,"a",381],[48,"a",381],[49,"a",381],[50,"a",381],[51,"a",381],[52,"a",381],[53,"a",381],[54,"a",381],[55,"a",381],[56,"a",384],[57,"a",155],[58,"a",381],[59,"a",381],[60,"a",381],[61,"a",381],[62,"a",381],[63,"a",381],[64,"a",381],[65,"a",381],[66,"a",381],[67,"a",381],[68,"a",381],[69,"a",381],[70,"a",381],[71,"a",381],[71,"a",381]];

{
  diag_log format["Nr: %1",_forEachIndex];
  // Check if bytesize is greate than arma 3 engine can handle as response from callExtension :(
  if (10000 < (_curByteSize + (_x select 2))) then
  {
    // send requests to mysql database
    {
      diag_log format["Sending now %1", str(_toGet)];
      _stmt = format["CALL spGetVehiclesFromGarage('%1')", ([_toGet] call DUC_CORE_mysql_fnc_A3ArrayToDBList)];
      _toGet = [];
      _tmp = [_stmt, 2, (call ducv_core_id_dblife)] call DUC_core_mysql_fnc_queryHandler;
      {
          _vehicles pushBack _x;
      } forEach _tmp;

    } forEach _toGet;

    _toGet = [];
  } else
  {
    diag_log format["An request has been added to the queue. Queuesize: %1", _curByteSize];

    _curByteSize = _curByteSize + (_x select 2);
    _toGet pushBack (_x select 0);
  };
} forEach _databaseResult;

_stmt = format["CALL spGetVehiclesFromGarage('%1')", ([_toGet] call DUC_CORE_mysql_fnc_A3ArrayToDBList)];
_tmp = [_stmt, 2, (call ducv_core_id_dblife)] call DUC_core_mysql_fnc_queryHandler;
{
  _vehicles pushBack _x;
} forEach _tmp;

_vehicles;