class DefaultEventhandlers;
class CfgPatches 
{
	class life_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F","life_shared"};
		fileName = "life_server.pbo";
		author[]= {"TAW_Tonic"}; 
	};
};

class CfgFunctions
{
	class ini
	{
		tag = "INI";
		class Functions {
			file = "\life_server";
			class loadinit {postInit  = 1;};
		};
	};
	
	class Life_System
	{
		tag = "life";
		
		class DynMarket {
			file = "\life_server\Functions\DynMarket";
			class dynMarketInit {};
		};

		class Jail_Sys
		{
			file = "\life_server\Functions\Jail";
			class jailSys {};
			class jailTimer {};
			class jailPlayer {};
		};
	};
	
	class TON_System
	{
		tag = "TON";
		class Systems
		{
			file = "\life_server\Functions\Systems";
			class addBet {};
			class clientDisconnect {};
			class fetchStaff {};
			class getID {};
			class getDepository {};
			class getVehicles {};
			class insertKontoAuzug {};
			class Nobody {};
			class requestKontoAuzug {};
			class savefuelstation {};
			class spikeStrip {};
			class startJackpot {};
			class testSystem {};
			class updateRank {};
		};
		
		class Taxi
		{
			file = "\life_server\Functions\Taxi";
			class handlealleTaxis {};
		};
		
		class Housing
		{
			file = "\life_server\Functions\Housing";
			class addHouse {};
			class initHouses {};
			class sellHouse {};
			class updateVehSpawnPoint {};
		};

		class Gang_System
		{
			file = "\life_server\Functions\Gang_System";
			class addStoreHouse {};
			class fetchOfflineMembers {};
			class gangUpdatePartial {};
			class sellStoreHouse {};
		};

		class Admin
		{
			file = "\life_server\Functions\Admin";
			class execGlobal {};
			class VehSpawnerSpawn {};
			class invisible {};
		};

		class AntiHack
		{
			file = "\life_server\Functions\AntiHack";
			class banPlayer {};
			class deCryptFiles {};
			class createID {};
			class report {};
			class transferID {};
		};
	};
};

class CfgVehicles
{
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F : Civilian
	{
		class EventHandlers;
	};
	
	class C_man_1 : Civilian_F
	{
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\fix_headgear.sqf""";
		};
	};
};