/*
	File : fn_showBoxes.sqf
	Date:   04.01.2016	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;

createDialog "life_house_boxlist";

private _house = cursorObject;
private _display = findDisplay 7770;
private _boxLb = _display displayCtrl 7771;
_display setVariable ["house",_house];
lbClear _boxLB;

{
	private _varName = switch (_x) do {
		case "gang_storageBox" 	:	{"storagegang"};
		case "cop_storageBox" 	:	{"storagecop"};
		case "big_storageBox" 	:	{"storagebig"}; 
		case "small_storageBox" : 	{"storagesmall"}; 
	};
	private _i = _boxLB lbAdd format ["%1", localize (getText(missionConfigFile >> "VirtualItems" >> _varName >> "displayName"))];
	_boxLB lbSetPicture [_i, getText(missionConfigFile >> "VirtualItems" >> _varName >> "icon")];
	_boxLB lbSetPictureColor [_i, [1, 1, 1, 1]];
	_boxLB lbSetData [_i,_x];
	nil;
} count (_house getVariable ["container",[]]);

if (lbSize _boxLB == 0) then {
	closeDialog 0;
	["Es sind keine Kisten/Container im Haus/Lagerhaus verbaut",true,"fast"] call life_fnc_notification_system;
};