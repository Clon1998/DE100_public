/*
	File : fn_showBoxesLbChange.sqf
	Date:   04.01.2016	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

private ["_control","_index","_display","_boxLB","_InfoBox","_selClassname1","_boxSpace","_varName"];
disableSerialization;

_display 		= findDisplay 7770;
_boxLB 			= _display displayCtrl 7771;
_InfoBox		= _display displayCtrl 7773;


_index = lbCurSel _boxLB;
_selClassname1 = _boxLB lbData _index;

_varName = switch _selClassname1 do {
	case "gang_storageBox" 	:		{"storagegang"};
	case "cop_storageBox" 	:		{"storagecop"};
	case "big_storageBox" 	:		{"storagebig"}; 
	case "small_storageBox" : 	{"storagesmall"};
};
_itemDisplayName = localize (getText(missionConfigFile >> "VirtualItems" >> _varName >> "displayName"));

_boxSpace = switch (_selClassname1) do {
	case "gang_storageBox" 	:		{4000}; 
	case "big_storageBox" 	:		{900}; 
	case "small_storageBox" : 		{700}; 
	case "cop_storageBox" : 		{700}; 
};

_InfoBox ctrlSetStructuredText parseText format[
	"%1<br/>Lagerraum: %2",
	_itemDisplayName,
	_boxSpace
];