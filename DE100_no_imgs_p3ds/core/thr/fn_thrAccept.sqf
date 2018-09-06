/*
	File:	fn_thrAccept.sqf
	Date:   2016-12-28 17:49:12
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
	#define ACC 2
	#define DEC 3
*/


params[
	["_type", 2, [0]]
];

disableSerialization;
private _display = findDisplay 3000;
private _unit = objectFromNetId ((_display displayCtrl 6) tvData (tvCurSel (_display displayCtrl 6)));

if (isNull _unit) exitwith {
	["Es scheint so, als ob die ausgewählte Einheit nicht mehr existiert.",true,"fast"] call life_fnc_notification_system;
	["",[]] spawn life_fnc_thrHQLoadPlayers;
};

if (!isNull (_unit getVariable ["thrClerk",objNull]) && !((_unit getVariable ["thrClerk",objNull]) isEqualTo player)) exitwith {
	["Es scheint so, als ob bereits ein anderes THR-Mitglied den Fall angenommen hat.",true,"fast"] call life_fnc_notification_system;
	["",[]] spawn life_fnc_thrHQLoadPlayers;
};

life_refresh_map = true;
switch (_type) do { 
	case 2 : {
		_unit setVariable ["thrClerk",player,true];
	}; 

	case 3 : {
		_unit setVariable ["thrClerk",nil,true];
	}; 
};
["",(tvCurSel (_display displayCtrl 6))] spawn life_fnc_thrHQLoadPlayers;
[] spawn life_fnc_thrMarker;
[_type,_unit] remoteExecCall ["life_fnc_thrHandleRequest",_unit];