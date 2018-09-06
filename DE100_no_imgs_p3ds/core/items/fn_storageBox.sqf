/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Tries to place a storage box in the nearest house.
*/
private["_boxType","_house","_positions","_boxTypeadd","_containers","_pos","_houseCfg","_itemDisplayName"];
_boxType = _this select 0;

_boxTypeadd = switch(_boxType) do {
	case "storagesmall": {"small_storageBox";};
	case "storagebig": {"big_storageBox"};
	case "storagegang": {"gang_storageBox"};
	case "storagecop": {"cop_storageBox"};
	default {""};
};

_house = nearestBuilding (getPosATL player);
private _exit = false;
private _exit2 = false;
_isLocker = false;
if (playerSide isEqualTo west) then {
	_house = lockers_obj;
	_isLocker = true;
	if (player distance (getMarkerPos "cop_spawn_1") > 25 && typeOF _house != "Land_Offices_01_V1_F") then {
		_exit = true;
	};
	if (_house getVariable [format["%1_%2_locker_id",getPlayerUID player,playerSide],-1] < 0) then {
		_exit2 = true;
	};
};
_containerVar = if (_isLocker) then {
	format["%1_%2_locker_container",getPlayerUID player,playerSide];
} else {
	"container";
};
if (_exit) exitwith {
	["Du kannst Spindkisten nur am Kavala HQ einbauen",true,"fast"] call life_fnc_notification_system;
};

if (_exit2) exitwith {
	["Du musst erst einen Spind beantragen",true,"fast"] call life_fnc_notification_system;
};
_boxes = _house getVariable [_containerVar,[]];
_itemDisplayName = localize (getText(missionConfigFile >> "VirtualItems" >> _boxType >> "displayName")); 

if(!(_house in life_vehicles) && !_isLocker) exitWith {[localize "STR_ISTR_Box_NotinHouse",true,"fast"] call life_fnc_notification_system;};

if (_boxType isEqualTo "storagegang") exitWith {
	if !(_house getVariable ["isStorehouse",false]) exitwith {
		[format["Der %1 kann nur in einem Lagerhaus verbaut werden",_itemDisplayName],true,"fast"] call life_fnc_notification_system;
	};
	_houseCfg = getNumber (missionConfigFile >> "life_gang_config" >> "gang_storeRoom_slots");

	_full = true;
	if (count _boxes < _houseCfg) then {
		_full = false;
		_boxes pushBack _boxTypeadd;
	};

	if (!_full) then {
		[format["Der %1 wurde im Lagerhaus verbaut!",_itemDisplayName],false,"fast"] call life_fnc_notification_system;
		_house setVariable[_containerVar,_boxes,true];
		[false,_boxType,1] call life_fnc_handleInv;
		[_house] call life_fnc_updateHouseContainer;
	} else {
		[format["In dem Lagerhaus können maximal %1 Container verbaut werden.",(_houseCfg select 1)],false,"fast"] call life_fnc_notification_system;
	};

};

if (_boxType isEqualTo "storagecop") exitWith {
	if !(_isLocker) exitwith {
		[format["Die %1 kann nur in einem Polizei Spind verbaut werden",_itemDisplayName],true,"fast"] call life_fnc_notification_system;
	};
	_houseCfg = 10;

	_full = true;
	if (count _boxes < _houseCfg) then {
		_full = false;
		_boxes pushBack _boxTypeadd;
	};

	if (!_full) then {
		[format["Die %1 wurde im Spind verbaut!",_itemDisplayName],false,"fast"] call life_fnc_notification_system;
		_house setVariable[_containerVar,_boxes,true];
		[false,_boxType,1] call life_fnc_handleInv;
		[_house] call life_fnc_updateHouseContainer;
	} else {
		[format["In deinem Spind können maximal %1 Boxen verbaut werden.",(_houseCfg select 1)],false,"fast"] call life_fnc_notification_system;
	};

};

if (_house getVariable ["isStorehouse",false]) exitwith {
	[format["Die %1 kann nicht in einem Lagerhaus verbaut werden",_itemDisplayName],true,"fast"] call life_fnc_notification_system;
};
_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {}; //Default value got used

_full = true;
if (count _boxes < (_houseCfg select 1)) then {
	_full = false;
	_boxes pushBack _boxTypeadd;
};

if (!_full) then {
	[format["Die %1 wurde in dein Haus verbaut!",_itemDisplayName],false,"fast"] call life_fnc_notification_system;
	_house setVariable[_containerVar,_boxes,true];
	[false,_boxType,1] call life_fnc_handleInv;
	[_house] call life_fnc_updateHouseContainer;
} else {
	[format["In dem Haus können maximal %1 Kisten verbaut werden.",(_houseCfg select 1)],false,"fast"] call life_fnc_notification_system;
};