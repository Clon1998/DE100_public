/*
   File:    fn_onPut.sqf
   Date:    2017-9-23 14:37:44
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
private _error = params[
	["_unit", objNull, [objNull]],
	["_container", objNull, [objNull]],
	["_item", "", [""]]
];

if (!_error) exitWith {};
if ((_unit getVariable ["vhcPro",str getUnitLoadout _unit]) find _item < 0 && (_unit getVariable ["isAlive",true])) then {
	_unit removeItem _item;
	[getPlayerUID _unit,call(life_clientId)select 0,[46,format["hat versucht über den Fahrzeug-Itemcontainer Dupe Items(%1) zu verdoppeln",_item]],true] remoteExecCall ["TON_fnc_report",2];
};
_unit setVariable ["vhcPro",str getUnitLoadout _unit];