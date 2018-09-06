/*
	File : fn_deleteBoxes.sqf
	Date:   04.01.2016	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_btn", controlNull, [controlNull]]
];
private _display = ctrlParent _btn;
private _lb = _display displayCtrl 7771;
private _house = _display getVariable ["house",objNull];
if (lbCurSel _lb < 0) exitWith {
	["Du musst eine Kiste/Container auswählen", true, "fast"] call life_fnc_notification_system;
};
if (isNull _house) exitWith {
	closeDialog 0;
	["Es ist ein Fehler aufgetreten, bitte versuche es nochmal", true, "fast"] call life_fnc_notification_system;
};
private _usedSpace = ([_house,"weapon_space"] call life_fnc_getUsedSpace) max ([_house,"clothing_space"] call life_fnc_getUsedSpace) max ([_house,"other_space"] call life_fnc_getUsedSpace) max (_house getVariable ["Trunk",[[],0]] select 1);
private _availableSpace = _house call life_fnc_getSpace;

private _selClass = _lb lbData (lbCurSel _lb);
private _boxType = switch (_selClass) do {
	case "gang_storageBox" : 	{["storagegang", 4000]}; 
	case "cop_storageBox" : 	{["storagecop", 700]}; 
	case "big_storageBox" 	:		{["storagebig", 900]}; 
	case "small_storageBox" : 	{["storagesmall", 700]}; 
};

private _boxName = getText(missionConfigFile >> "VirtualItems" >> (_boxType select 0) >> "displayName");

if (_availableSpace - (_boxType select 1) < _usedSpace) exitWith {
	[format["Die %1 konnte nicht ausgebaut werden, da das Haus ansonsten nicht genug Platz für die gelagerten Items hat.",localize _boxName],true,"slow"] call life_fnc_notification_system;
};

if (([true,(_boxType select 0),1] call life_fnc_handleInv) > 0) then {
	closeDialog 0;
	private _spaceData = _house getVariable ["container",[]];
	_spaceData deleteAt (_spaceData find _selClass);
	_house setVariable ["container",_spaceData,true];
	[_house] call life_fnc_updateHouseContainer;
	[format["Die %1 wurde ausgebaut und in dein Inventar gelegt.",localize _boxName],false,"fast"] call life_fnc_notification_system;
} else {
	[format["Die %1 konnte nicht ausgebaut werden, da du nicht genug Platz im Inventar hast.",localize _boxName],false,"fast"] call life_fnc_notification_system;
};