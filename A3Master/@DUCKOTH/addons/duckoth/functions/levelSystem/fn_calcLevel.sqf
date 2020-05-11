/*
	Author: Duckfine
	
	Description:
		Calculates Level of Player by given exp
		
		
	Params:
		0: exp
*/

private["_exp", "_level", "_return"];
_exp = param[0];

_level = floor (((_exp + 100)/(100))^(1/2.57)); //Growth Rate: 2.57


_level;