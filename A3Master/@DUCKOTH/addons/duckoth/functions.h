/*
    Author: Duckfine

    Description:
        Serverside functions.h*/

class DUCK_KOTH_STARTUP
{
	class Initialize
	{
		file = "\duckoth";
		class preInit {preInit=1;};
	};
};

class Database
{
	tag = "DUCDB";
	class DatabaseManager
	{
		file = "\duckoth\database";
		class queryHandler {};
		class syncDataCl {};
		class syncDataDB {};
		class newPlayerIntID {};
	};
};

class DatabaseHelper
{
	tag = "DUCHELP";
	class HelpManager
	{
		file = "\duckoth\database\helper";
		class mresArray {};
		class mresString {};
		class mresToArray {};
		class numberSafe {};
	};
};

class PointSystem
{
	tag = "DCKPNT";
	class Initialize
	{
		file = "\duckoth\functions\pointSystem";
		class init {};
		class killHandler {};
	};
};

/*
class MissionVoteSystem
{
	tag = "DCKMVS";
	class Initialize
	{
		file = "\duckoth\functions\missionVoteSystem";
		class init {};

	};
};
*/

class LevelSystem
{
	tag = "DUCLVL";
	class Calculation
	{
		file = "\duckoth\functions\levelSystem";
		class calcLevel {};
		class calcNextLevel {};
		class sendLevelinfoCl {};
	};
};

class Utilities
{
	tag = "DUCUT";
	class Time
	{
		file = "\duckoth\util";
		class getTimeStamp {};
	};
	class Debug
	{
		file = "\duckoth\functions\debug";
		class receiveMsg {};
	};
	class A3Log
	{
		file = "\duckoth\util";
		class a3logapi {};
	};
};
