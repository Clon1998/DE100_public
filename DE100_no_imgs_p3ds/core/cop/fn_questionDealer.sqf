/*
	File:	fn_questionDealer.sqf
	Date:   2017-06-14 18:15:22
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_vendor", objNull, [objNull]],
	["_caller", objNull, [objNull]],
	["_addactionId", 0, [0]]
];

private _sellers = _vendor getVariable["sellers",[]];
if (_sellers isEqualTo []) exitWith {[localize "STR_Cop_DealerQuestion",true,"fast"] call life_fnc_notification_system;};
private _names = [];
{
	[[_x select 0, _x select 1, getPos _vendor],"drugDealer",_x select 2] call life_fnc_addCrime;
	_names pushBackUnique (_x select 1);
	nil;
} count _sellers;
_vendor setVariable["sellers",[],true];

[format["Die folgenden Leute haben kürzlich an diesen Dealer verkauft.<br/><br/>%1",_names joinString "<br/>"], false, "fast"] call life_fnc_notification_system;