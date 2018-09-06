/*
   File:    fn_ping.sqf
   Date:    2018-4-23 17:21:28
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
params[
	["_fnc", ""],
	["_args", []],
	["_suspendable", false],
	["_mode", 0]
];

if (_mode == 0) then {
	missionNamespace setVariable ["de100_ping",diag_tickTime];
	uiNamespace setVariable ["ping_time",diag_tickTime];
	if (life_HC_isActive) then {
		[getPlayerUID player,call life_clientId select 0,_fnc,_args,_suspendable] remoteExecCall ["MSC_fnc_pong",HC_Life];
	} else {
		[getPlayerUID player,call life_clientId select 0,_fnc,_args,_suspendable] remoteExecCall ["MSC_fnc_pong",2];
	};
} else {
	if (!isNil "DE100_Diagnostic") then {
		systemChat format["Ping Pong Time %1",diag_tickTime-(uiNamespace getVariable ["ping_time",0])];
	};
	missionNamespace setVariable ["de100_ping",0];
	if (_fnc isEqualTo "") exitWith {};
	
	_fnc = missionNamespace getVariable [_fnc,""];
	//check if the _fnc with the string given by the param _fnc exists
	if (_fnc isEqualTo "") exitWith {};
	if (_suspendable) then {
		_args spawn _fnc;
	} else {
		_args call _fnc;
	};
};