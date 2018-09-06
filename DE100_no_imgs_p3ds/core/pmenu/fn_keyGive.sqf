/*
	File: fn_keyGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a copy of the key for the selected vehicle to the selected player.
	Player must be within range.
*/
disableSerialization;
params[
	["_btn", controlNull, [controlNull]]
];

private _display = ctrlParent _btn;
private _vLb = _display displayCtrl 2701;
private _pLb = _display displayCtrl 2702;

if ((lbCurSel _vLb) == -1) exitWith {["Kein Schlüssel ausgewählt",true,"fast"] call life_fnc_notification_system;};
if ((lbCurSel _pLb) == -1) exitWith {["Kein Spieler ausgewählt",true,"fast"] call life_fnc_notification_system;};

private _veh = _vLb lbData (lbCurSel _vLb);
private _unit = _pLb lbData (lbCurSel _pLb);

if (_veh isequalto "") exitWith {["Kein Schlüssel ausgewählt",true,"fast"] call life_fnc_notification_system;};
if (_unit isequalto "") exitWith {["Kein Spieler ausgewählt",true,"fast"] call life_fnc_notification_system;};
_veh = objectFromNetId _veh;
_unit = if (isNull (objectFromNetId _unit)) then {
	(parseSimpleArray _unit)apply{objectFromNetId _x};
} else {
	objectFromNetId _unit;
};

private _owners = _veh getVariable ["key_owners",[]];
if (_unit isEqualType objNull) then {
	private _uid = getPlayerUID _unit;
	private _i = [_uid,_owners] call life_fnc_index;
	if(_i == -1) then {
		_owners pushBack [_uid,_unit call life_fnc_name];
	};
	[format["Du hast %1 die Schlüssel zu deinem %2 gegeben",_unit call life_fnc_name,getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName")],false,"slow"] call life_fnc_notification_system;
} else {
	{
		private _uid = getPlayerUID _x;
		private _i = [_uid,_owners] call life_fnc_index;
		if(_i == -1) then {
			_owners pushBack [_uid,_x call life_fnc_name];
		};
		nil;
	} count _unit;
	[format["Du hast deinen Gangmitgliedern, im Umkreis von 10 Metern, die Schlüssel für deinen %1 gegeben",getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName")],false,"slow"] call life_fnc_notification_system;
};
_veh setVariable["key_owners",_owners,true];

[_veh,player call life_fnc_name] remoteExecCall ["life_fnc_clientGetKey",_unit];