/*
	File:	fn_leaveGang.sqf
	Date:   2016-10-15 12:01:40
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
params[
	["_type", "", [""]],
	["_gang", grpNull, [grpNull]]
];

switch (_type) do { 
	case "leave" : {
		private _action = [
			format["Möchtest du die Gang %1 wirklick verlassen?",_gang getVariable ["gang_NAME",""]],
			"Gang verlassen?",
			localize "STR_Global_Yes",
			localize "STR_Global_No"
		] call BIS_fnc_guiMessage;

		if (!_action) exitwith {};

		private _gangMembers = _gang getVariable ["gang_MEMBERS",[]];
		_gangMembers deleteAt ([getPlayerUID player,_gangMembers] call life_fnc_index);
		_gang setVariable ["gang_MEMBERS",_gangMembers,true];

		[2,format["%1 hat die Gang %2 verlassen",player call life_fnc_name,_gang getVariable ["gang_NAME",""]]] remoteExecCall ["life_fnc_broadcast",units _gang];


		if (life_HC_isActive) then {
			["Permission",_gang getVariable ["gang_ID",1],[_gang getVariable ["gang_MEMBERS",[]]]] remoteExec ["HC_fnc_gangUpdatePartial",HC_Life];
		} else {
			["Permission",_gang getVariable ["gang_ID",1],[_gang getVariable ["gang_MEMBERS",[]]]] remoteExec ["TON_fnc_gangUpdatePartial",2];
		};
		closeDialog 0;
	};

	case "terminate" : {
		[2,format["Der Besitzer hat die Gang %1 aufgelöst",_gang getVariable ["gang_NAME",""]]] call life_fnc_broadcast; 
		if (!isNull findDisplay 2500) then {
			(findDisplay 2500) closeDisplay 2;
		};
	};

	case "Kicked" : {
		private _gangMembers = _gang getVariable ["gang_MEMBERS",[]];
		_gangMembers deleteAt ([getPlayerUID player,_gangMembers] call life_fnc_index);
		_gang setVariable ["gang_MEMBERS",_gangMembers,true];
		[2,format["Du wurdest aus der Gang %1 geworfen",_gang getVariable ["gang_NAME",""]]] call life_fnc_broadcast; 
		if (!isNull findDisplay 2500) then {
			(findDisplay 2500) closeDisplay 2;
		};
	}; 
};

[_gang getVariable ["gang_HOUSES",[]]] call life_fnc_removeStorehoselocal;
uiSleep random 1;
[player] join grpNull;

if(count units _gang == 0) then {
	deleteGroup _gang;
};
//Make sure the Dialog is closed
if (!isNull findDisplay 2500) then {
	(findDisplay 2500) closeDisplay 2;
};