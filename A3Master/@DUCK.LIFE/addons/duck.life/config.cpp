/**
 * @Date:   2020-04-01T11:18:59+02:00
 * @Last modified time: 18-04-2020 21:34
 */






class CfgPatches
{
	class duck_life
	{
		name = "Ducks Life Server Mod";
		author = "Duckfine";
		url = "ONE-UNIT.NET";

		requiredAddons[] = { "duck_core" };
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions
{
	#include "functions.h"
};


class CfgSettings
{
	#include "life\modules\item\definitions.h"
};
