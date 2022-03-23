/*
  Checks if a String is a number









*/

_digits = ["1","2","3","4","5","6","7","8","9","0"];

params[

  ["_string", "", ["a"]]

];

_return = true;

_array = _string splitString "";


{
  //Check if is parseable
  if !((_x in _digits)) exitWith { _return = false };

} forEach _array;

_return;

























//
