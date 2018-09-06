/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/

params[
	["_unit", objNull, [objNull]],
	["_time", 15, [1]]
];
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitWith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable ["restrained",false])) exitWith {}; //He's not restrained.
if(!((side _unit) in [civilian,independent])) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid
if(_time < 1) exitWith {}; //Not Valid

[[getPlayerUID _unit] call life_fnc_getBounty,false] call life_fnc_bountyReceive;

if(isNull _unit) exitWith {}; //Not valid
detach _unit;
[_unit,false,_time] remoteExec ["life_fnc_jail",_unit];
[0,"STR_NOTF_Arrested_1",true, [_unit call life_fnc_name, player call life_fnc_name]] remoteExecCall ["life_fnc_broadcast",-2];
if (life_HC_isActive) then {
	[getPlayerUID _unit,31,format["%1 wurde von %2 für %3 Minuten inhaftiert.",_unit call life_fnc_nameUID,player call life_fnc_nameUID,_time]] remoteExecCall ["MSC_fnc_log",HC_Life];
} else {
	[getPlayerUID _unit,31,format["%1 wurde von %2 für %3 Minuten inhaftiert.",_unit call life_fnc_nameUID,player call life_fnc_nameUID,_time]] remoteExecCall ["MSC_fnc_log",2];
};