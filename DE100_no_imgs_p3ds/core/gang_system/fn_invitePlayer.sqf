/*
	File:	fn_invitePlayer.sqf
	Date:   2016-10-15 03:08:04
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_inviter", objNull, [objNull]],
	["_gang", grpNull, [grpNull]],
	["_perm",[],[[]]]
];
if (life_gang_invite || player in units _gang || life_firstSpawn) exitwith {};
life_gang_invite = true;
private _action = [
	format[localize "STR_GNOTF_InviteMSG",_inviter call life_fnc_name, _gang getVariable ["gang_NAME",""]],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (!_action) exitwith {life_gang_invite = false;};
if (([getPlayerUID player,_gang getVariable ["gang_MEMBERS",[]]] call life_fnc_index) >= 0) exitwith {
	["Der Spieler ist bereits in der Gang",false,"fast"] remoteExecCall ["life_fnc_notification_system",_inviter];
};
private _start = diag_tickTime;
while {!(player in (units _gang)) && (diag_tickTime - _start < 10)} do {
	if !(player in (units _gang)) then {
		[player] joinSilent _gang;
	};
	uiSleep 1;
};
if (diag_tickTime - _start > 10 && !(player in (units _gang))) exitwith {
	["Ein Fehler ist aufgetreten, bitte melde dich im Support.",true,"fast"] call life_fnc_notification_system;
};
private _realPerm = [];
{
	if (_x select 1) then {
		_realPerm pushBackUnique (_x select 0);
	};
} forEach _perm;
private _gangMembers = _gang getVariable ["gang_MEMBERS",[]];
_gangMembers pushBackUnique [getPlayerUID player,_realPerm];
_gang setVariable ["gang_MEMBERS",_gangMembers,true];
[_gang getVariable ["gang_HOUSES",[]]] call life_fnc_storeHouseInitLocal;

[2,format["%1 ist der Gang %2 beigetreten.",player call life_fnc_name,_gang getVariable ["gang_NAME",""]]] remoteExecCall ["life_fnc_broadcast",units _gang];
if (life_HC_isActive) then {
	["Permission",_gang getVariable ["gang_ID",1],[_gang getVariable ["gang_MEMBERS",[]]]] remoteExec ["HC_fnc_gangUpdatePartial",HC_Life];
} else {
	["Permission",_gang getVariable ["gang_ID",1],[_gang getVariable ["gang_MEMBERS",[]]]] remoteExec ["TON_fnc_gangUpdatePartial",2];
};
uiSleep 2;
life_gang_invite = false;