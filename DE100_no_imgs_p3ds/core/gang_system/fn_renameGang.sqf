/*
   File:    fn_renameGang.sqf
   Date:    2018-1-18 20:18:24
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
private _gangTag = ctrlText (_display displayCtrl 4002);
private _gangName = ctrlText (_display displayCtrl 4003);
private _gang = group _unit;
private _oTag = _gang getVariable ["gang_TAG",""];
private _oName = _gang getVariable ["gang_NAME",""];

if (count _gangName > 32) exitWith {[localize "STR_GNOTF_Over32",true,"fast"] call life_fnc_notification_system;};
if (_gangTag isEqualTo "" || _gangTag isEqualTo "") exitWith {
	["Der Tag und Name dürfen nicht leer sein!", true, "fast"] call life_fnc_notification_system;
};

if (_oTag isEqualTo _gangTag && _oName isEqualTo _gangName) exitWith {
	["Du hast nichts verändert?", true, "fast"] call life_fnc_notification_system;
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
private _gangBank = (group player) getVariable ["gang_BANK",0];
private _price = getNumber(missionConfigFile >> "life_gang_config" >> "gang_rename_price");
if (_gangBank < _price) exitWith {
	[format["Auf dem Gangkonto ist nicht genug Geld. Es fehlen %1€",[_price - _gangBank] call life_fnc_numberText],true,"slow"] call life_fnc_notification_system;
};
(group player) setVariable ["gang_BANK",_gangBank-_price,true];

if (life_HC_isActive) then {
	[getPlayerUID player,call life_clientId select 0, _gangName, _gangTag] remoteExec ["GS_fnc_rename",HC_Life];
} else {
	[getPlayerUID player,call life_clientId select 0, _gangName, _gangTag] remoteExec ["GS_fnc_rename",2];
};

closeDialog 0;