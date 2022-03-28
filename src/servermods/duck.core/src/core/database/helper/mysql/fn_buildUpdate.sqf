

/*

[[["a3name"],["STRING"]],[["a3namealiases"],["DBARRAY"]],[["intid"],["STRING"]],[["rankTeam"],["SCALAR"]],[["rankDonator"],["SCALAR"]],[["nickname"],["STRING"]],[["location"],["DBARRAY"]],[["loggedAs"],["DBENUM"]],[["gearCivilian"],["DBARRAY"]],[["gearPolice"],["DBARRAY"]],[["gearMedic"],["DBARRAY"]],[["gearMechanic"],["DBARRAY"]],[["invVirtual"],["DBARRAY"]],[["alive"],["BOOL"]],[["arrested"],["DBARRAY"]],[["banned"],["BOOL"]],[["cash"],["INT"]],[["bank"],["INT"]],[["teamkills"],["INT"]],[["kills"],["INT"]],[["deaths"],["INT"]],[["xp"],["INT"]],[["levelPlayer"],["INT"]],[["levelPolice"],["INT"]],[["levelMedic"],["INT"]],[["levelMech"],["INT"]],[["playtime"],["INT"]],[["lastconnect"],["INT"]]]


//DBDUMP FROM queryHandler as it is
["Profi Bildungsdfghstopsdfg","","COD",0,"","der geist","",CIV,any,"","","","""[[],[],[],[`U_C_Poor_2`,[]],[],[],`H_Bandanna_cbr`,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]""","","",0,0,1e+009,1,5,2,500,4,10,10,10,10000,""]
*/



private[
  "_return",
  "_dataType",
  "_counter",
  "_arrayCount",
  "_mysqlvar",
  "_dbArray"
];

_return = "UPDATE ";

params[

  ["_schema", []],
  ["_dataSet", []], // the dataset according to the schema
  ["_table", "", ["a"]], // the table
  ["_where", "", ["a"]] // where statement

];

/*
_schema = [["a3name","STRING"],["a3namealiases","DBARRAY"],["intid","STRING"],["rankTeam","SCALAR"],["rankDonator","SCALAR"],["nickname","STRING"],["location","DBARRAY"],["loggedAs","DBENUM"],["gearCivilian","DBARRAY"],["gearPolice","DBARRAY"],["gearMedic","DBARRAY"],["gearMechanic","DBARRAY"],["invVirtual","DBARRAY"],["alive","BOOL"],["arrested","DBARRAY"],["banned","BOOL"],["cash","SCALAR"],["bank","SCALAR"],["teamkills","SCALAR"],["kills","SCALAR"],["deaths","SCALAR"],["xp","SCALAR"],["levelPlayer","SCALAR"],["levelPolice","SCALAR"],["levelMedic","SCALAR"],["levelMech","SCALAR"],["playtime","SCALAR"],["lastconnect","SCALAR"]];
_dataSet = ["Prof Bildungsstop",[],"COD PLAYERS","0","0","",[],"CIVILIAN",[],[],[],[],[],false,[],false,"0","0","0","0","0","0","0","0","0","0","0","0"];

_table = "players";
_where = "steamid64 = '76561198216442289'";
*/
_return = _return + _table + " SET ";

_arrayCount = count _schema;

_dbArray = [_schema, _dataSet] call duc_core_mysql_fnc_A3ArrayToDBArray;


{
  _mysqlvar = _x select 0;
  _dataType = _x select 1;

  _value = _dbArray select _forEachIndex;
  _insert = "";
  _counter = _forEachIndex + 1;

  _insert = _insert + _mysqlvar + " = ";

  if (_dataType isEqualTo "STRING" || _dataType isEqualTo "DBENUM" || _dataType isEqualTo "DBARRAY") then
  {
    _insert = _insert + "'" + _value + "'";
  } else
  {
    _insert = _insert + _value;
  };



  if (_counter < _arrayCount) then {
      _insert = _insert + ", ";
  };

  _return = _return + _insert;



} forEach _schema;

_return = _return + " WHERE " + _where;

diag_log _return;


_return;



































//
