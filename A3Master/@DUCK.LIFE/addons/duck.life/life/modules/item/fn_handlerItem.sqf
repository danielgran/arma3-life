#include "\duck.core\script_macros.hpp"
#include "\duck.life\life\modules\item\inventory\script_macros.hpp"
/*

  Author: Duckfine
  Date created: 27-5-2020 20:35

  Description
    <desc>

  Parameter:
    - <type> <name>

  Returns:
    - <type> <name>


 */


private[

  "_placeholder01",
  "_placeholder02"

];


params[

  ["_token", "", [""]],
  ["_sender", 0, [1]],
  ["_steamID64", "", [""]],
  ["_id", 0, [0]],
  ["_content", [], [[], ""]]

];


switch (_id) do {

    case (0): { // Item aus Spielerinventar entfernen
      // Extract content
      _item = _content select 0;
      _count = _content select 1;

      _databaseID = DEF_DB_REDIS_GET_DBID("playerdata");
      _databaseSchema = DEF_DB_GET_SCHEMA("db_life", "tblplayers", "playerRelated");
      _databaseKey =  "invVirtual";

      [_databaseID, _databaseSchema, _databaseKey, _steamID64, _item, _count] call DUC_LIFE_VITEM_fnc_removeItem;
    };

    case (1): { // Item dem Inventar hinzufügen
      [_steamID64, _content] call DUC_LIFE_VITEM_fnc_addItem;


    };

    case (1): { // Überweisen
      //spawn handleQuery

    };
};

// here return to client

[_token, "VITEM", _id, _content, _sender] call DUC_CORE_NET_fnc_sendClient;


















































//
