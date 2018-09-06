/*
	File:	fn_createAuction.sqf
	Date:   2017-09-03 11:21:02
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_btn", controlNull, [controlNull]],
	"_class",
	"_iAmnt"
];

private _display = ctrlParent _btn;
private _grp = ctrlParentControlsGroup _btn;
private _idc = ctrlIDC _grp;

if !(missionNamespace getVariable ["life_ac_ready",false]) exitWith {
	_display closeDisplay 0;
	["Oooops,<br/>es scheint so als wäre das Auktionshaus noch nicht bereit. Bitte versuche es in 1-2 Minuten nochmal.", true, "slow"] call life_fnc_notification_system;
};

private _iLb = _grp controlsGroupCtrl (_idc + 11);
private _tLb = _grp controlsGroupCtrl (_idc + 18);
private _bnEdit = _grp controlsGroupCtrl (_idc + 16);
private _sI = if (ctrlType _iLb == 102) then {
	lnbCurSelRow _iLb;
} else {
	lbCurSel _iLb;
};

if (_sI < 0) exitWith {["Du musst ein Item zum verkaufen auswählen", true, "fast"] call life_fnc_notification_system;};

if (ctrlType _iLb == 102) then {
	_class = _iLb lnbData [_sI,0];
	_iAmnt = _iLb lnbValue [_sI,0];
} else {
	_class = _iLb lbData _sI;
	_iAmnt = _iLb lbValue _sI;
};
if (_class isEqualTo "exit") exitWith {["Entschuldigung, es ist ein Fehler aufgetreten.", true, "fast"] call life_fnc_notification_system;};
private _amnt = _grp controlsGroupCtrl (_idc + 12);
_amnt = if (isNull _amnt) then {
	str _iAmnt;
} else {
	ctrlText _amnt;
};

private _type = ([_class] call Bis_fnc_itemType) select 1;
if (_type isEqualTo "") then {	
	_type = call {
		if (!isNull (objectFromNetId _class)) exitWith {["houses","storehouses"] select ((typeOf (objectFromNetId _class)) isEqualTo "Land_i_Shed_Ind_F");};
		if (isClass(missionConfigFile >> "VirtualItems" >> _class)) exitWith {"zitems";};
		if (!isNil {call compile _class}) exitWith {call {private _t = (parseSimpleArray _class) select 1;if (_t isKindOf "Car") exitWith {"car";};if (_t isKindOf "Air") exitWith {"air";};"ship";};};
		""
	};
};

if (_type isEqualTo "") exitWith {
	["Ein Fehler ist aufgetreten", true, "fast"] call life_fnc_notification_system;
	closeDialog 0;
};

private _bet = ctrlText (_grp controlsGroupCtrl (_idc + 15));
private _buyNow = if (ctrlEnabled _bnEdit) then {
	ctrlText _bnEdit;
} else {
	"-1";
};
private _desc = ctrlText (_grp controlsGroupCtrl (_idc + 20));
private _time = _tLb lbValue (lbCurSel _tLb);

if !([_amnt] call life_fnc_isNumber) exitWith {
	["Die eingegebene Verkaufsmenge ist keine Zahl", true, "fast"] call life_fnc_notification_system;
};
_amnt = parseNumber _amnt;
if (_amnt <= 0) exitWith {
	["Die eingegebene Verkaufsmenge muss mindestens 1 sein", true, "fast"] call life_fnc_notification_system;
};
if (_amnt > _iAmnt) exitWith {
	["Die eingegebene Verkaufsmenge ist größer als die Itemmenge", true, "fast"] call life_fnc_notification_system;
};

if !([_bet] call life_fnc_isNumber) exitWith {
	["Das eingegebene Startgebot ist keine Zahl", true, "fast"] call life_fnc_notification_system;
};
_bet = parseNumber _bet;
if (_bet < 0) exitWith {
	["Das eingegebene Startgebot muss mindestens 0€ sein", true, "fast"] call life_fnc_notification_system;	
};
if (_bet > 100000000) exitWith {
	["Das eingegebene Startgebot darf nicht größer als 100.000.000€ sein", true, "fast"] call life_fnc_notification_system;	
};

if !([_buyNow] call life_fnc_isNumber) exitWith {
	["Der eingegebene Sofortkaufpreis ist keine Zahl", true, "fast"] call life_fnc_notification_system;
};
_buyNow = parseNumber _buyNow;
if (_buyNow <= 0 && ctrlEnabled _bnEdit) exitWith {
	["Der eingegebene Sofortkaufpreis muss mindestens 1€ sein", true, "fast"] call life_fnc_notification_system;	
};
if (_buyNow > 100000000 && ctrlEnabled _bnEdit) exitWith {
	["Der eingegebene Sofortkaufpreis darf nicht größer als 100.000.000€ sein", true, "fast"] call life_fnc_notification_system;	
};
private _tax = _iAmnt*3000;
if (_tax > de100_luciandjuli_bc) then {
	["Du hast nicht genug Geld auf dem Konto um die Erstellungskosten zu zahlen", true, "fast"] call life_fnc_notification_system;
};
if (_tax+(call life_fnc_calcDebts) > de100_luciandjuli_bc) exitWith {
	["Deine Geldmittel reichen nicht aus um die Erstellungskosten zu zahlen, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
};

private _data = [];
private _dbId = -1;
call {
	if (_type isEqualTo "zitems") exitWith {
		private _b = _display getVariable ["house",objNull];
		private _trunkInfo = _b getVariable [format["%1_%2_locker_Trunk",getPlayerUID player,playerSide],[[],0]];
		private _tmpInv = _trunkInfo select 0;
		private _index = [_class,_tmpInv] call life_fnc_index;
		private _sAmnt = _tmpInv select _index select 1;
		
		private _iWeight = [_class] call life_fnc_itemWeight;
		private _weight = _iWeight * _amnt;
		
		if (_amnt == _sAmnt) then {
			_tmpInv deleteAt _index;
		} else {
			_tmpInv set[_index,[_class,(_sAmnt - _amnt)]];
		};
		_b setVariable[format["%1_%2_locker_Trunk",getPlayerUID player,playerSide],[_tmpInv,((_trunkInfo select 1) - _weight) max 0],true];
		[_display getVariable ["house",objNull]] call life_fnc_updateHouseContainer;
		_display setVariable ["house",objNull];
	};
	if (_type in ["car","air","ship"]) exitWith {
		private _vehData = parseSimpleArray _class;
		_class = _vehData select 1;
		_dbId = _vehData select 0;
		_data = [_vehData select 4, [_vehData select 5] call life_fnc_clientMresToArray, _vehData select 6];
		_display setVariable ["reqVeh",[]];
	};
	if (_type isEqualTo "houses") exitWith {
		private _b = objectFromNetId _class;
		deleteMarkerLocal format["house_%1",_class];
		_class = typeOf _b;
		_b setVariable ["forSale",true,true];
		_b setVariable ["trunkUser","",true];
		_data = getPosATL _b;
		_dbId = _b getVariable ["house_id",-1];
		_display setVariable ["lastCategoryImo",controlNull];
	};
	if (_type isEqualTo "storehouses") exitWith {
		private _b = objectFromNetId _class;
		deleteMarkerLocal format["house_%1",_class];
		_class = typeOf _b;
		_b setVariable ["forSale",true,true];
		_b setVariable ["trunkUser","",true];
		_data = getPosATL _b;
		_dbId = _b getVariable ["house_id",-1];
		_display setVariable ["lastCategoryImo",controlNull];
	};
	[_display,"","",_class,_amnt,true] call life_fnc_handleDeleteat;
	[_display getVariable ["house",objNull]] call life_fnc_updateHouseContainer;
	_display setVariable ["house",objNull];
};

[format["Auktion wurde erstellt und sollte in kürze gelistet sein.<br/>Die Erstellungskosten von %1€ wurden von deinem Bankkonto abgezogen",_tax call life_fnc_numberText], false, "fast"] call life_fnc_notification_system;
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_bc = de100_luciandjuli_bc - _tax;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
[_display] call life_fnc_openView;

if (life_HC_isActive) then {
	[getPlayerUID player, call life_clientId select 0,_class,_amnt,_type,_bet,_buyNow,_desc,_time,_dbId,_data] remoteExec ["AC_fnc_create",HC_Life];
} else {
    [getPlayerUID player, call life_clientId select 0,_class,_amnt,_type,_bet,_buyNow,_desc,_time,_dbId,_data] remoteExec ["AC_fnc_create",2];
};