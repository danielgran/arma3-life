class CfgPatches
{
	class duckoth
	{
		name = "DUCKOTH";
		author = "Duckfine";
		url = "duckoth.eu";

		requiredAddons[] = {};
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
	class Logging
	{
		A3Log = true;
		playerdata = true;
		qrylog = true; //Logs every single query to server
	};
	class Functionality
	{
		missionVoteSystem = false;
		pointSystem = false;
	};
};
