/*
	File:	fn_updateTrunk.sqf
	Date:   2016-08-09 00:22:43
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_veh", objNull, [objNull]]
];
if (isNull _veh) exitWith {};

private _vid = _veh getVariable["vid",-1];
if(_vid < 0) exitWith {};

if (life_HC_isActive) then {
	[getPlayerUID player,call life_clientId select 0,[
		["VEH_fnc_updateT",false,[getPlayerUID player,call life_clientId select 0,_veh]],
		["PL_fnc_updateP",false,["GEAR",true] call SOCK_fnc_updatePartial]
	]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
} else {
	[getPlayerUID player,call life_clientId select 0,[
		["VEH_fnc_updateT",false,[getPlayerUID player,call life_clientId select 0,_veh]],
		["PL_fnc_updateP",false,["GEAR",true] call SOCK_fnc_updatePartial]
	]] remoteExecCall ["MSC_fnc_execStack",2];
};

private _addZero = {
	params[
		["_n", 0, [0]]
	];
	if (_n < 10) exitWith {
		format ["0%1",_n];
	};
	_n;
};

_veh setVariable ["lastTime",parseNumber format["%1%2",(life_real_Time select 3) call _addZero,(life_real_Time select 4) call _addZero],true];