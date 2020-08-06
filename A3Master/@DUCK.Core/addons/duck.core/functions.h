/*
    Author: Duckfine

    Description:
        Serverside functions.h
*/

class Duck_Core_Test
{
	tag = "test";
	class test
	{
		file = "duck.core\test";
		class log {};
	};
};



class Duck_Core_Startup
{
	class Initialize
	{
		file = "duck.core";

		class preInit {preInit=1;};
		class postInit {postInit=1;};
	};
};


class Duck_Core
{
	tag = "duc_core";
	class Util
	{
		file = "duck.core\core\util";
		
		class generateID {};

		class getArrayValue {};
		class getConfigEntry {};

		class mresStringToArray {};
		class mresArrayToString {};
		class mresString {};

		class numberToString {};

		class setArrayValue {};
		
		class stringIsNumber {};

	};

	class StringUtils
	{
		file = "duck.core\core\util\string";

		 class replaceString {};
	};


};

/////////////////////////////////////////////////
//           __  ___      _____ ____    __     //
//          /  |/  /_  __/ ___// __ \  / /     //
//         / /|_/ / / / /\__ \/ / / / / /      //
//        / /  / / /_/ /___/ / /_/ / / /___    //
//       /_/  /_/\__, //____/\___\_\/_____/    //
/////////////////////////////////////////////////


class Duck_Core_MySQL_Life
{
	tag = "duc_core_mysql";

	// Overall methods
	class MySQLDatabaseManager
	{
		file = "duck.core\core\database\helper\mysql";
		
		class buildInsert {};
		class buildSelect {};
		class buildUpdate {};

		class queryHandler {};
		class DBArrayToA3Array {};
		class A3ArrayToDBArray {};
		class A3ArrayToDBList {};
	};

	class UniversalMethods
	{
		file = "duck.core\core\database\mysql";
		class datasetFetch {};
		class datasetUpdate {};
	};

	// table: players
	class Players_players
	{
		file = "duck.core\core\database\db_life\players\mysql";
		class playerCheck {};
		class playerNew {};
	};
};



/////////////////////////////////////////////
//           ____           ___            //
//          / __ \___  ____/ (_)____       //
//         / /_/ / _ \/ __  / / ___/       //
//        / _, _/  __/ /_/ / (__  )        //
//       /_/ |_|\___/\__,_/_/____/         //
/////////////////////////////////////////////



class Duck_Core_Redis
{
	tag = "duc_core_redis";

	//Universal Methods which can be used with any db context
	class UniversalMethods
	{
		file = "duck.core\core\database\redis";

		class connect {};
		// TODO RECONNECT / DISCONNECT ?

		class DBFlush {};
		class DBGetKeys {};
		class DBGetSize {};

		class keyDelete {};
		class keyExists {};
		class keyGet {};
		class keySet {};

		class listAdd {};
		class listDelete {};
		class listFetch {};
		class listEntryGet {};
		class listEntryUpdate {};

	};




	// Helper methods for redis
	class RedisUtil
	{
		file = "duck.core\core\database\helper\redis";
		class checkVersion {};

		class DBArrayToA3Array {};
		class DBValToA3Val {};
		class A3ValToDBVal {};

	};


};

////////////////////////////////
//     ______
//    / ____/___  ________
//   / /   / __ \/ ___/ _ \
//  / /___/ /_/ / /  /  __/
//  \____/\____/_/   \___/
////////////////////////////////


class Duck_Core_System
{
	tag = "DUC_CORE_SYS";

	class System
	{
		file = "duck.core\core\system";
		class handlerSystem {};
		class initPlayer {};
	};

	class Server
  {
    file = "duck.core\core\system\server";

    class getServerInfo {};
  };

};



class Duck_Core_AUTH
{
	tag = "DUC_core_auth";

	class Auth
	{
		file = "duck.core\core\system\auth";
		class register {};
	};
};


class Duck_Core_NETWORK
{
	tag = "DUC_core_net";

	class Network
	{
		file = "duck.core\core\system\network";

		class serverInterface {};
		class sendClient {};
		class prepClientVars {};
	};
};


class Duck_Core_PTS
{
	// Stands for Player Transaction System
	tag = "DUC_CORE_PTS";

  class Handler
  {
    file = "duck.core\core\pts";

    class handlerPTS {};
  };



	class Functions
	{
		file = "duck.core\core\pts\functions";

		class getTransactionInfoPlayer {};
    class transactPlayer {};
	};

};









































//
