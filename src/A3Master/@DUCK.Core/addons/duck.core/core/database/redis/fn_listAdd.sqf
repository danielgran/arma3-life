/*
  Adds List of a Player in Redis DB

  Author: Duckfine

*/

private[

  "_new",
  "_stmt"

];


params[

  ["_databaseID", 0, [1]],
  "_key",
  "_schema"

];

//processing?
//todo here typehandling of all kinds of vars

{
  switch(typeName _x) do
  {
    case ("SCALAR"): {
        _new = _x call DUC_core_fnc_numberToString;
        _schema set [_foreachindex, _new];
    };
  };
} foreach _schema;

{
  diag_log format["saving: %1", _x];

  _stmt = format["redis:listadd:%1:%2:%3", _databaseID, _key, _x];
  "A3Redis" callExtension _stmt;
} forEach _schema;
