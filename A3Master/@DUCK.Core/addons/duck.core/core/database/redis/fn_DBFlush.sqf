/*

  Author: Duckfine
  Date created: 27-5-2020 19:01

  Description
    Flushes a Redis DB

  Parameter:
    - int databaseID

 */




private[

  "_stmt",
  "_databaseResult"

];


params[

  "_databaseID"

];

_stmt = format["redis:dbflush:%1", _databaseID];
_databaseResult = "A3Redis" callExtension _stmt;


