/*
	File:	fn_updateTrunkView.sqf
	Date:   2016-08-08 23:29:25
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
private _error = params[
	["_vehicle", objNull, [objNull]],
	["_selIndex",-1]
];
private _display = findDisplay 3500;
private _VItemData = _vehicle getVariable ["Trunk",[]];
private _totalWeight = [_vehicle] call life_fnc_vehicleWeight;
if (count _VItemData == 0) then {_vehicle setVariable["Trunk",[[],0],true];} else {_VItemData = _VItemData select 0;};
if ((_totalWeight select 0) isEqualTo -1) exitWith {[localize "STR_MISC_NoStorageVeh",true,"fast"] call life_fnc_notification_system; _display closeDisplay 2};
private _vehiclelist  = _display displayCtrl 3502;
private _playerlist = _display displayCtrl 3503;
lbClear _vehiclelist;
lbClear _playerlist;

(_display displayCtrl 3504) ctrlSetText format[(localize "STR_MISC_Weight")+ " %2/%1",_totalWeight select 0,_totalWeight select 1];

{
	_val = [0,configName _x] call life_fnc_handleVItem;
	
	if(_val > 0) then {
		_playerlist lbAdd format["[%1] - %2",_val,localize (getText(_x >> "displayName"))];
		_playerlist lbSetData [(lbSize _playerlist)-1,configName _x];
		_icon = getText(missionConfigFile >> "VirtualItems" >> (configName _x) >> "icon");
		if(!((_icon isEqualTo ""))) then {
			_playerlist lbSetPicture [(lbSize _playerlist)-1,_icon];
		};
		if (((getNumber(missionConfigFile >> "VirtualItems" >> (configName _x) >> "illegal")) isEqualTo 1)) then {
			_playerlist lbSetColor [(lbSize _playerlist)-1, getArray(missionConfigFile >> "Life_Settings" >> "dialog_illegal_color")];
		};
	};
} foreach ("true" configClasses (missionConfigFile >> "VirtualItems"));
if (lbSize _playerlist > 0 && (lbSize _playerlist -1) < _selIndex) then {
	if (_selIndex >= 0) then {
		_playerlist lbSetCurSel (lbSize _playerlist -1);
	} else {
		_playerlist lbSetCurSel 0;
	};
};

{
	_name = getText(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "displayName");
	_val = _x select 1;
		
	if(_val > 0) then {
		_vehiclelist lbAdd format["[%1] - %2",_val,localize _name];
		_vehiclelist lbSetData [(lbSize _vehiclelist)-1,(_x select 0)];
		_icon = getText(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "icon");
		if(!((_icon isEqualTo ""))) then {
			_vehiclelist lbSetPicture [(lbSize _vehiclelist)-1,_icon];
		};
		if (((getNumber(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "illegal")) isEqualTo 1))then {
			_vehiclelist lbSetColor [(lbSize _vehiclelist)-1, getArray(missionConfigFile >> "Life_Settings" >> "dialog_illegal_color")];
		};
	};
} foreach _VItemData;

if (lbSize _vehiclelist > 0 && (lbSize _vehiclelist -1) < _selIndex) then {
	if (_selIndex >= 0) then {
		_vehiclelist lbSetCurSel (lbSize _vehiclelist -1);
	} else {
		_vehiclelist lbSetCurSel 0;
	};
};