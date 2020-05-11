/*

  Author: Duckfine
  Date created:   11-04-2020 15:42
  Last modified: 11-04-2020 15:42

  Description:
    - Converts Redis- DB Value to A3 Valid Value

  Params:
    - string datatype
    - string value


  Returns:
    - a3 value

*/


private[

  "_return"

];

params[

  ["_value", ""],
  ["_dataType", ""]

];


switch (_dataType) do {
    case ("STRING"): {
        _return = _value;
    };
    case ("SCALAR"): {
        _return = parseNumber _value;
    };
    case ("BOOL"): {
        if (_value isEqualTo "true") exitWith { _return = true; };
        _return = false;
    };
    case ("DBARRAY"): {
        _return = call compile _value;
    };
    case ("DBENUM"): {
        _return = str(_value);
    };
};


_return;



































//
