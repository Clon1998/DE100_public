/*
   File:    fn_keyMenu.sqf
   Date:    2017-9-15 00:49:26
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
disableSerialization;
params[
	["_display", displayNull, [displayNull]]
];
private _vLb = _display displayCtrl 2701;
private _pLb = _display displayCtrl 2702;

lbClear _vLb;
lbClear _pLb;
private _cTarget = [cursorobject,cursorTarget] select (isNull cursorObject);

private _nUnits = if (isNull _cTarget) then {
	[];
} else {
	[_cTarget] select {
   	 	_x isKindOf "Man" &&
   	 	!isNull _x && 
   	 	alive _x && 
   	 	player distance _x < 10
	};
};

private _gUnits = ((units (group player)) select {
	alive _x &&
	player distance _x < 10 &&
	!(_x isEqualTo player)
}) apply {netId _x};

if !(_gUnits isequalto []) then {
	_nUnits pushBack _gUnits;
};

{
	if (alive _x && !isNull _x) then {
		private _class = typeOf _x;
		private _i = _vLb lbAdd format["%1 (%2) - [Entfernung: %3m]",getText(configFile >> "CfgVehicles" >> _class >> "displayName"),[_class,_x getVariable "Life_VEH_color"] call life_fnc_vehicleColorStr,round(player distance _x)];
		_vLb lbSetData [_i,netId _x];
		private _pic = getText(configFile >> "CfgVehicles" >> _class >> "picture");
		if !(_pic isEqualTo "pictureStaticObject") then {
			_vLb lbSetPicture [_i,_pic];
		};
	};
	nil;
} count life_vehicles;

if (lbSize _vLb == 0) then {
	_vLb lbSetData [_vLb lbAdd "Du hast keinen Schlüssel",""];
};
lbSort _vLb;
_vLb lbSetCurSel 0;

if !(_nUnits isequalto []) then {
	{
		if (_x isEqualType objNull) then {
			_pLb lbSetData [_pLb lbAdd format["Person vor dir"],netId _x];
		} else {
			_pLb lbSetData [_pLb lbAdd format["Gangmitglieder (10m)"],str _x];
		};
		nil;
	} count _nUnits;
} else {
	_pLb lbSetData [_pLb lbAdd "Niemand",""];
};
_pLb lbSetCurSel 0;