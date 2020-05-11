class CfgPatches
{
	class testing
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {};
		author[] = {"Duckfine"};
	};
	
};


class CfgFunctions
{
	class TESTING
	{
		tag = "DUCK";
		class TEST
		{
			file = "\testing\functions";
			class sendReceive{};
		};
	};
	
};