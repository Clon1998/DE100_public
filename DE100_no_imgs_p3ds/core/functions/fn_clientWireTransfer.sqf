/*
	File:	fn_clientWireTransfer.sqf
	Date:   2016-08-01 21:38:12
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private["_unit","_val","_from","_ver"];
_val = _this select 0;
_from = _this select 1;
_ver = _this select 2;
if (isNil "_ver" || _ver == "" || _ver == "any") exitWith {};
if(!([[_val] call life_fnc_number] call life_fnc_isnumber)) exitWith {};
if(isNull _from) exitWith {};
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_bc = de100_luciandjuli_bc + _val;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
[format['%1 hat dir €%2 gesendet und folgenden Verwendungszweck angegeben:<br/>%3',_from call life_fnc_name,[_val] call life_fnc_numberText,_ver],false,"slow"] call life_fnc_notification_system;

if (life_HC_isActive) then {
	[getPlayerUID player, 3, format ["%1 hat €%3 von %2 erhalten",player call life_fnc_nameUID, _from call life_fnc_nameUID,[_val] call life_fnc_numberText]] remoteExecCall ["MSC_fnc_log",HC_Life];
} else {
	[getPlayerUID player, 3, format ["%1 hat €%3 von %2 erhalten",player call life_fnc_nameUID, _from call life_fnc_nameUID,[_val] call life_fnc_numberText]] remoteExecCall ["MSC_fnc_log",2];
};