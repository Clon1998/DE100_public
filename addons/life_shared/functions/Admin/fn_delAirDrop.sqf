#include "\life_shared\script_macros.hpp"
/*
	File:	fn_delAirDrop.sqf
	Date:   2017-05-24 16:40:36
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
params[
	["_cargo", objNull, [objNull]]
];
if (_cargo getVariable ["deleted",false]) exitWith {};
_cargo setVariable ["deleted",true];

[3,format["Der Airdrop im MapGrid %1 ist vorbei.<br/>In 10 Minuten wird die Airdrop-Zone gelöscht",mapGridPosition visiblePosition _cargo]] remoteExec ["life_fnc_broadcast",0];
private _markers = _cargo getVariable ["markers",[]];
_zMarker = _markers select 0;
_tMarker = _markers select 1;
_zMarker setMarkerColor "ColorWhite";
private _dTime = diag_tickTime + 600;
for "_i" from 0 to 1 step 0 do {
	if (_dTime - diag_tickTime <= 0) exitwith {};
	_tMarker setMarkerText format[" Löschung - %1 Sek",round ((_dTime - diag_tickTime) max 0)];
	uiSleep 1;
};

deleteMarker _zMarker;
deleteMarker _tMarker;
deleteVehicle _cargo;