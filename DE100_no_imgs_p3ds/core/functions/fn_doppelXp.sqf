/*
	File:	fn_doppelXp.sqf
	Date:   25.01.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/


private ["_msg"];

if (life_admin_moreXp) then {
	life_admin_moreXp = false;
	_msg = format ["Ein De100-Admin hat gerade Doppelte Xp deaktiviert!"];
	if (life_HC_isActive) then {
		[format["%1(%2) hat den Doppel-XP-Mode deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
	} else {
		[format["%1(%2) hat den Doppel-XP-Mode deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
	};	
} else {
	life_admin_moreXp = true;
	_msg = format ["Ein De100-Admin hat gerade Doppelte Xp aktiviert!"];
	if (life_HC_isActive) then {
		[format["%1(%2) hat den Doppel-XP-Mode aktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
	} else {
		[format["%1(%2) hat den Doppel-XP-Mode aktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
	};		
};
publicVariable "life_admin_moreXp";
[0,_msg] remoteExecCall ["life_fnc_broadcast",-2];