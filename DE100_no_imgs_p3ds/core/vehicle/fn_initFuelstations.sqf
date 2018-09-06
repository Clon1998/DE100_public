/*
	File: fn_initFuelstations.sqf
	Author: MarioF
	
	Description:
	Emtpy the Fuelstations and add the Refill action
*/

private["_stations","_tanke","_distance","_nummer"];
{
	_tanke = _x;
	{
		if(_tanke distance (getMarkerPos (_x select 0)) < 30) exitWith {_nummer = _x select 0;};
	}foreach tankstellen;
	_x setFuelCargo 0;
	if((typeOf _x) == "Land_fs_feed_F") then {
		_x addAction["Tankstelle befüllen",life_fnc_refuelStation,_nummer,3,false,false,""," (!isNull objectParent player) && player == driver vehicle player && (((vehicle player) getVariable [""stationfuel"",0]) > 0)"];
		_x addAction["Auftanken",life_fnc_fuelStationMenu,["CAR",1],2,false,false,"","isNull objectParent player && !life_action_inUse"];
		_x addAction["Tankstellen Laden",life_fnc_weaponShopMenu,"w_gas"];
		_x addAction["Tankstellen Bistro",life_fnc_virt_menu,"gasstation"];
		//_x addAction["Tankstelle überfallen",life_fnc_robShops,[],0,false,false,"","isNull objectParent player && !life_action_inUse && playside player == civilian"];
	};
} foreach life_fuelstation_stationlist;