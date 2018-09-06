class CfgPatches 
{
	class life_shared
	{
		requiredAddons[] = {"A3_Data_F"};
		fileName = "life_shared.pbo";
		author[]= {"Lucian 'Patrick' Schmidt"}; 
	};
};

class CfgFunctions
{
	class Admin
	{
		tag = "AD";
		class Functions
		{
			file = "\life_shared\functions\Admin";
			class callAirDrop {};
			class delAirDrop {};
			class load {};
		};
	};

	class AntiHack
	{
		tag = "AH";
		class Functions
		{
			file = "\life_shared\functions\AntiHack";
			class getUnit {};
			class pardon {};
			class reSync {};
			class verify {};
		};
	};

	class Auctions
	{
		tag = "AC";
		class Functions
		{
			file = "\life_shared\functions\Auctions";
			class buy {};
			class create {};
			class delete {};
			class distribute {};
			class fetchVeh {};
			class getAuctions {};
			class loadAuctions {};
		};
	};

	class ChopShop
	{
		tag = "CS";
		class Functions
		{
			file = "\life_shared\functions\ChopShop";
			class buy {};
			class get {};
			class sell {};
		};
	};

	class DataBase
	{
		tag = "DB";
		class Functions
		{
			file = "\life_shared\functions\DataBase";
			class asyncCall {};
			class load {};
			class mres {};
			class toArray {};
		};
	};

	class DB_Config
	{
		tag = "CFG";
		class Functions
		{
			file = "\life_shared\functions\DB_Cfgs";
			class load {};
		};
	};

	class Gang_System
	{
		tag = "GS";
		class Functions
		{
			file = "\life_shared\functions\GangSystem";
			class checkName {};
			class insert {};
			class rename {};
		};
	};

	class Misc
	{
		tag = "MSC";
		class Functions
		{
			file = "\life_shared\functions\Misc";
			class deathTracker {};
			class enableSimulation {};
			class execStack {};
			class itemTracker {};
			class log {};
			class pong {};
			class teamspeak {};
		};
	};

	class Player
	{
		tag = "PL";
		class Core
		{
			file = "\life_shared\functions\Player";
			class fetchGang {};
			class insert {};
			class request {};
			class saveTime {};
			class updateC {};
			class updateP {};
		};
	};

	class StorageSystems
	{
		tag = "SS";
		class Functions
		{
			file = "\life_shared\functions\StorageSystems";
			class addLocker {};
			class fetchHouse {};
			class fetchLocker {};
			class saveInventory {};
		};
	};

	class Vehicle
	{
		tag = "VEH";
		class Functions
		{
			file = "\life_shared\functions\Vehicle";
			class delete {};
			class handleInv {};
			class insert {};
			class remContainer {};
			class spawn {};
			class spawnContainers {};
			class store {};
			class updateC {};
			class updateF {};
			class updateT {};
		};
	};
};