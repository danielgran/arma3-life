/*

  Author: Duckfine
  Date created:   11-04-2020 23:56

  Description:
    Converts an A3 Value to an Redis DB Readable value (escape : and so on)

  Params:
    - obj value
    - string datatype


  Returns:
    -

*/


private[

  "_return"

];

params[

  "_value",
  ["_dataType", "", [""]]

];



switch (_dataType) do {

    case ("STRING"): {
        _return = _value;
    };
    case ("SCALAR"): {
        _return = _value call DUC_CORE_fnc_numberToString;
    };
    case ("BOOL"): {
        if(_value) exitWith { _return = "true"; };
        _return = "false";
    };
    case ("DBARRAY"): {
        _return = str(_value);
    };
    case ("DBENUM"): {
        _return = str(_value);
    };
};


_return;



































//
