/*
	File:	fn_mapSingleClick.sqf
	Date:   26.08.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_units", [], [[]]],
	["_pos", [], [[]]],
	["_alt", false, [true]],
	["_shift", false, [true]]
];

if (!isNil "DE100_Diagnostic") then {
	systemChat format["OnMapSingeClick params: %1",_this];
};

if (call (life_adminlevel) >= 1 && _alt) then {
	if (time - life_conf_tp < 5) then {
		(vehicle player) setPos _pos;
		if (life_HC_isActive) then {
			[format["%1(UID: %3) hat sich teleportiert (%2).",player call life_fnc_name,mapGridPosition player,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
		} else {
			[format["%1(UID: %3) hat sich teleportiert (%2).",player call life_fnc_name,mapGridPosition player,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
		};
		life_conf_tp = 0;
	} else {
		life_conf_tp = time;
		[format["Möchtest du dich teleportieren?",typeOf _curTarget],true,"fast"] call life_fnc_notification_system;
	};
};