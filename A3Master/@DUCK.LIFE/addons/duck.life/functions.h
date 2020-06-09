/**
 * @Date:   2020-04-01T11:19:22+02:00
 * @Last modified time: 25-04-2020 23:11
 */



/*
    Author: Duckfine

    Description:
        Serverside functions.h
*/


class Duck_Life_Startup
{
	class Initialize
	{
		file = "duck.life";

		class preInit {preInit=1;};
		class postInit {postInit=1;};
	};
};


class Duck_life_System
{
	tag = "duc_life_sys";

	class Handler
	{
			file = "duck.life\life\handler";
	};



};

class Duck_Life_Economy
{
	tag = "duc_life_eco";

	class Handler
	{
			file = "duck.life\life\modules\economy";
			class handlerEconomy {};
	};

	class Bank
	{
		file = "duck.life\life\modules\economy\money";

		class deposit {};
		class withdraw {};
		class transfer {};
	};
};

class Duck_Life_VItems
{
	tag = "duc_life_vitem";

	class Handler
	{
		file = "duck.life\life\modules\item";

		class handlerItem {};
	};

	class Helper
	{
		file = "duck.life\life\modules\item\inventory\helper";

		class invAddItem {};
		class invGetItem {};
		class invRemoveItem {};
		class invSetItem {};
	};

	class Inventory
	{
		file = "duck.life\life\modules\item\inventory";

		class removeItem {};
		class addItem  {};
		class transferItem {};
	};

	class Shop_Database
	{
		file = "duck.life\life\modules\item\shop\database";

		class syncCacheToMySQL {};
		class syncShopToCache {};
	};



};






class Duck_Life_Vehicles
{
	tag = "duc_life_veh";
	class Database
	{
		file = "duck.life\life\modules\vehicle\database";

		class getPlayerGarage {};
	};
};



























//
