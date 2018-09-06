/*
	File:	fn_weaponShopClose.sqf
	Date:   2017-06-21 01:30:42
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
private _display = param[0,displayNull,[displayNull]];
private _bItems = _display getVariable ["boughtItems",[]];
if (_bItems isEqualTo []) exitWith {};
private _text = "";
{
	if (_text isEqualTo "") then {
		_text = format["%1x %2 für €%3", _x select 1, _x select 0, [_x select 2] call life_fnc_numberText];
	} else {
		_text = format["%4, %1x %2 für €%3", _x select 1, _x select 0, [_x select 2] call life_fnc_numberText,_text];
	};
	nil;
} count _bItems;

_text = format["%1 hat %2 gekauft",player call life_fnc_nameUID,_text];

if (life_HC_isActive) then {
	[getPlayerUID player,call life_clientId select 0,[
		["MSC_fnc_log",false,[getPlayerUID player, 12, _text]],
		["PL_fnc_updateP",false,[["CASH","GEAR"],true] call SOCK_fnc_updatePartial]
	]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
} else {
	[getPlayerUID player,call life_clientId select 0,[
		["MSC_fnc_log",false,[getPlayerUID player, 12, _text]],
		["PL_fnc_updateP",false,[["CASH","GEAR"],true] call SOCK_fnc_updatePartial]
	]] remoteExecCall ["MSC_fnc_execStack",2];
};