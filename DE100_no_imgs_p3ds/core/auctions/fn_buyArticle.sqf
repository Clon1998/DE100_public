/*
	File:	fn_buyArticle.sqf
	Date:   2017-09-07 18:33:06
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
	mode
	0 - buy
	1 - bet/offer

*/
disableSerialization;
params[
	["_btn", controlNull, [controlNull]],
	["_mode", 0, [0]]
];

private _display = ctrlParent _btn;
if !(missionNamespace getVariable ["life_ac_ready",false]) exitWith {
	_display closeDisplay 0;
	["Oooops,<br/>es scheint so als wäre das Auktionshaus noch nicht bereit. Bitte versuche es in 1-2 Minuten nochmal.", true, "slow"] call life_fnc_notification_system;
};
private _grp = ctrlParentControlsGroup _btn;
private _aId = _display getVariable ["openAuction",-1];
private _aData = [_aId,de100_ac_storage getVariable ["active_auctions",[]]] call life_fnc_dataFromKey;
if ((_aData select 1) isEqualTo "houses" && count life_houses >= (call life_houseLimit)) exitWith {[format[localize "STR_House_Max_House",(call life_houseLimit)],true,"fast"] call life_fnc_notification_system;};

if (_mode == 1) then {
	private _amnt = ctrlText (_grp controlsGroupCtrl 4407);
	
	if !([_amnt] call life_fnc_isNumber) exitWith {
		["Das eingegebene Gebot ist keine Zahl", true, "fast"] call life_fnc_notification_system;
	};
	_amnt = parseNumber _amnt;
	if (_amnt <= 0) exitWith {
		["Das eingegebene Gebot muss mindestens 1 sein", true, "fast"] call life_fnc_notification_system;
	};

	if (_amnt > de100_luciandjuli_bc) exitWith {
		["Deine Geldmittel reichen dafür nicht aus", true, "fast"] call life_fnc_notification_system;
	};

	if ((_aData select 7)+(call life_fnc_calcDebts) > de100_luciandjuli_bc) exitWith {
		["Deine Geldmittel reichen dafür nicht aus, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
	};

	if (_amnt < (_aData select 6) * 1.05) exitWith {
		["Das eingegebene Gebot muss mindestens 5% höher liegen als das aktuellle Gebot.", true, "fast"] call life_fnc_notification_system;
	};

	if (_amnt <= (_aData select 6)) exitWith {
		["Du musst ein höheres Gebot, als das aktuelle abgeben", true, "fast"] call life_fnc_notification_system;
	};
	["Deine Anfrage wird an den Server geschickt", false, "fast"] call life_fnc_notification_system;
	if (life_HC_isActive) then {
		[getPlayerUID player,call life_clientId select 0,_mode,_aId,_amnt]  remoteExecCall ["AC_fnc_buy",HC_Life];
	} else {
	    [getPlayerUID player,call life_clientId select 0,_mode,_aId,_amnt]  remoteExecCall ["AC_fnc_buy",2];
	};
} else {
	if ((_aData select 7) > de100_luciandjuli_bc) exitWith {
		["Deine Geldmittel reichen dafür nicht aus", true, "fast"] call life_fnc_notification_system;
	};

	if ((_aData select 7)+(call life_fnc_calcDebts) > de100_luciandjuli_bc) exitWith {
		["Deine Geldmittel reichen dafür nicht aus, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
	};
	["Deine Anfrage wird an den Server geschickt", false, "fast"] call life_fnc_notification_system;
	if (life_HC_isActive) then {
		[getPlayerUID player,call life_clientId select 0,_mode,_aId,-1]  remoteExecCall ["AC_fnc_buy",HC_Life];
	} else {
	    [getPlayerUID player,call life_clientId select 0,_mode,_aId,-1]  remoteExecCall ["AC_fnc_buy",2];
	};
};

