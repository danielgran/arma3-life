/*

  Author: Duckfine
  Date created: 19-5-2020 21:35

  Description
    <desc>

  Parameter:
    - <type> <name>

  Returns:
    - <type> <name>


 */




private[

  "_databaseID",
  "_regex"

];


params[

  "_stmt",
  "_databaseResult"

];




_stmt = format["redis:dbkeys:%1:%2", _databaseID, _regex];
_databaseResult = "A3Redis" callExtension _stmt;

_databaseResult = [] call compile _databaseResult;
_databaseResult;