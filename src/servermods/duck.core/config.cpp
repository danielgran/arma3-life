class CfgPatches
{
	class duck_core
	{
		name = "DUCK.CORE";
		author = "Duckfine";
		url = "ONE-UNIT.NET";

		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions
{
	#include "functions.h"
};

class CfgRemoteExec
{
	#include "CfgRemoteExec.hpp"
};


class CfgSettings
{
	ServerID = 1;
 	// Settings for DB related stuff
	#include "duck.core/core/database/db_life/settings.h"

	class Logging
	{
		A3Log = true;
		extdb_playerdata = true;
		extdb_querylog = true; //Logs every single query to server
	};
};
