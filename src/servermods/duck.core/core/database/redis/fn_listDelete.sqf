/*
  Author: Duckfine

  Description:
    Removes Player from Redis DB


*/

private[

  "_stmt",
  "_return"

];


params[

  ["_databaseID", 0, [1]],
  ["_key", "", [""]]

];

_return = false;

_stmt = formatText ["redis:delete:%1:%2", _databaseID, _key];
"A3Redis" callExtension _stmt;

if(_stmt isEqualTo "TRUE") then
{
  _return = true;
} else
{
  _return = false;
};



_return;



























//
