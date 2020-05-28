/**
 * @Date:   2020-04-01T11:18:59+02:00
 * @Last modified time: 18-04-2020 21:35
 */



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

 	// Settings for DB related stuff
	#include "core\database\db_life\settings.h"




	class Logging
	{
		A3Log = true;
		extdb_playerdata = true;
		extdb_querylog = true; //Logs every single query to server
	};
};
