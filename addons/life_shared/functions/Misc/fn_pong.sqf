/*
   File:    fn_pong.sqf
   Date:    2018-4-23 17:21:38
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_fnc", ""],
	["_args", []],
	["_suspendable", false]
];

if !([_uid,_cid]call AH_fnc_verify) exitWith {};

[_fnc,_args,_suspendable,1] remoteExecCall ["SOCK_fnc_ping",remoteExecutedOwner];