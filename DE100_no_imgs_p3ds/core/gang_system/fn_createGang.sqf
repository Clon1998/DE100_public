/*
	File:	fn_createGang.sqf
	Date:   2016-10-13 16:19:08
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_btn", controlNull, [controlNull]]
];

private _display = ctrlParent _btn;
private _price = getNumber(missionConfigFile >> 'life_gang_config' >> 'levels' >> 'level_1' >> 'price');
private _gangTag = ctrlText (_display displayCtrl 4002);
private _gangName = ctrlText (_display displayCtrl 4003);

if (count _gangName > 32) exitWith {[localize "STR_GNOTF_Over32",true,"fast"] call life_fnc_notification_system;};

if (_gangTag isEqualTo "" || _gangTag isEqualTo "") exitWith {
	["Der Tag und Name dürfen nicht leer sein!", true, "fast"] call life_fnc_notification_system;
};

private _validateStr = {
	params[
		["_toCheck", "", [""]],
		["_fName", "", [""]]
	];
	private _badwords = getArray(missionConfigFile >> "Life_Settings" >> "badWords_filter");
	private _allowedChars = toArray getText(missionConfigFile >> "Life_Settings" >> "allowed_dbChars");
	_toCheck = toLower _toCheck;
	private _tmp = [];
	{
		if (_toCheck find _x >= 0 && _x != "  ") then {
			_tmp pushBackUnique _x;
		};
		nil;
	} count _badwords;


	{
		if !(_x in _allowedChars) then {
			_tmp pushBackUnique toString [_x];
		};
		nil;
	} count (toArray _toCheck);

	if !(_tmp isEqualTo []) exitWith {
		[format["%1 enthält nicht erlaubte Wörter/Zeichen:<br/><t color='#ff0000'>%2</t>",_fName, _tmp joinString ", "], true, "slow"] call life_fnc_notification_system;
		true;
	};
	false;
};
if ([_gangName,"Gang Name"] call _validateStr || [_gangTag,"Gang Tag"] call _validateStr) exitWith {};

if (de100_luciandjuli_bc < _price) exitWith {[format[localize "STR_GNOTF_NotEnoughMoney",[((getNumber(missionConfigFile >> 'life_gang_config' >> 'levels' >> 'level_1' >> 'price'))-de100_luciandjuli_bc)] call life_fnc_numberText],true,"fast"] call life_fnc_notification_system;};
if (_price+(call life_fnc_calcDebts) > de100_luciandjuli_bc) exitWith {
	["Deine Geldmittel reichen dafür nicht aus, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
};

if (life_HC_isActive) then {
	[getPlayerUID player,call life_clientId select 0, _gangName, _gangTag] remoteExec ["GS_fnc_insert",HC_Life];
} else {
	[getPlayerUID player,call life_clientId select 0, _gangName, _gangTag] remoteExec ["GS_fnc_insert",2];
};

de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_bc = de100_luciandjuli_bc - _price;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
closeDialog 0;