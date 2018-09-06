#define true 1
#define false 0

class DefaultEventHandler;

class CfgPatches
{
    class life_headless_client
    {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F","life_shared"};
        fileName = "life_hc.pbo";
        author[] = {"Nanou"};
    };
};

class CfgFunctions
{
	class ini
	{
		tag = "INI";
		class Functions {
			file = "\life_hc";
			class loadinit {postInit  = 1;};
		};
	};
	
	class MySQL_Database
	{
		tag = "HC";
		class Housing
		{
			file = "\life_hc\functions\Housing";
			class addHouse {};
			class sellHouse {};
			class updateVehSpawnPoint {};
		};

		class Gang_System
		{
			file = "\life_hc\functions\Gang_System";
			class addStoreHouse {};
			class fetchOfflineMembers {};
			class gangUpdatePartial {};
			class sellStoreHouse {};
		};

		class General
		{
			file = "\life_hc\functions\General";
			class addBet {};
			class dynMarketInit {};
			class fetchStaff {};
			class getDepository {};
			class getVehicles {};
			class insertKontoAuzug {};
			class requestKontoAuzug {};
			class savefuelstation {};
			class spikeStrip {};
			class startJackpot {};
			class updateRank {};
		};
	};
};