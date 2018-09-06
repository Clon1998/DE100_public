#include "\life_server\script_macros.hpp"
/*
	File : fn_spawnDealer.sqf
	Date:   05.11.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.


	Description:
	Take a look for yourself.
	
	Cfg-Arrays:
	0 = Name
	2- X = Markers
*/

private ["_tmp","_dealers","_Dealer1Cfg","_Dealer2Cfg","_Dealer3Cfg"];
//////////////////////////////
//			CFG's 			//
//////////////////////////////

_Dealer1Cfg = ["Dealer_1", ["Dealer1_pos1", "Dealer1_pos2", "Dealer1_pos3"]];
_Dealer2Cfg = ["Dealer_2", ["Dealer2_pos1", "Dealer2_pos2", "Dealer2_pos3"]];
_Dealer3Cfg = ["Dealer_3", ["Dealer3_pos1", "Dealer3_pos2", "Dealer3_pos3"]];

_dealers = [_Dealer1Cfg,_Dealer2Cfg,_Dealer3Cfg];
////////////////////////////



//Dynamic pos Stuff

{
	_outerArray = _x select 1;
	{
		_tmp = [getMarkerPos _x, markerDir _x];
		_outerArray set [_forEachIndex,_tmp];
	} forEach _outerArray;
} foreach _dealers;

DealerMarkers = [];
publicVariable "DealerMarkers";
waitUntil {!life_gamble_serverCooldown};
{
	_x execFSM "\life_server\fsm\dealer.fsm";
} forEach _dealers;