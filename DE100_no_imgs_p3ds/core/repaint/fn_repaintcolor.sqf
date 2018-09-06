/*
	File:	fn_repaintcolor.sqf
	Date:   24.12.2015
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_VehList", controlNull, [controlNull]],
	["_Index", -1, [0]],
	"_dialog",
	"_ColorList",
	"_classname",
	"_ColorArray",
	"_allowedColors"
];
_dialog = findDisplay 2300;
_ColorList = _dialog displayCtrl 2303;
_classname = typeOf (objectFromNetId (_VehList lbData _Index));
_CollorPermission = [];
switch (playerSide) do { 
	case civilian : {
		_CollorPermission pushBack "civ";
	}; 
	
	case blufor : {
		_CollorPermission pushBack "cop";
	}; 

	case independent : {
		_CollorPermission pushBack "thr";
	}; 
};

if ((call life_adminlevel) > 4) then {
	_CollorPermission pushBack "ADMIN";
};

private _tier = call life_skin_tier;

if (_tier > 0) then {
	for "_i" from 1 to _tier do {
		_CollorPermission pushBack format["tier%1_%2",_i,playerSide];
	};
};

_colorArray = configProperties [
	(missionConfigFile >> "lifeVehicles" >> _classname >> "TextureSources"), 
	format["count (%1 arrayIntersect (getArray(_x >> 'factions'))) > 0",_CollorPermission], 
	true
];
lbClear _ColorList;

{
	_ColorList lbAdd format ["%1",getText(_x >> "displayName")];	
	_ColorList lbSetData [(lbSize _ColorList)-1,(configName _x)];	
} forEach _ColorArray;
_ColorList lbSetCurSel 0;

if (count _ColorArray > 0) then {
	ctrlShow[2303,true];
	ctrlShow[1006,true];
} else {
	ctrlShow[2303,false];
	ctrlShow[1006,false];
};