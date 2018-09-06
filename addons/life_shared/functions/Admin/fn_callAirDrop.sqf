#include "\life_shared\script_macros.hpp"
/*
	File:	fn_callAirDrop.sqf
	Date:   2017-05-24 16:40:36
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_pos", [], [[]]],
	["_content", [], [[]]]
];
if (_content isEqualTo []) exitwith {};
private _tPos = _pos vectorAdd [random 250,random 250,0];
private _zMarker = createMarker [format["%1_area",diag_tickTime],_tPos];
_zMarker setMarkerColor "ColorYellow";
_zMarker setMarkerType "Empty";
_zMarker setMarkerShape "ELLIPSE";
_zMarker setMarkerSize [500,500];
private _tMarker = createMarker [format["%1_marker",diag_tickTime],_tPos];
_tMarker setMarkerColor "ColorBlack";
_tMarker setMarkerType "mil_warning";
_tMarker setMarkerText " Airdrop - 600 Sek";
[3,format["Ein Airdrop ist unterwegs zum MapGrid %1",mapGridPosition _pos]] remoteExec ["life_fnc_broadcast",0];

private _cTime = diag_tickTime + 600;
for "_i" from 0 to 1 step 0 do {
	if (_cTime - diag_tickTime <= 0) exitwith {};
	_tMarker setMarkerText format[" Airdrop - %1 Sek",round ((_cTime - diag_tickTime) max 0)];
	uiSleep 1;
};
_tMarker setMarkerText "Airdrop - Unterwegs";
_zMarker setMarkerColor "ColorOrange";
private _sPos = _pos vectorAdd [(-1)^(round (1 + random 1))*(2000 + random 4000),(-1)^(round (1 + random 1))*(2000 + random 4000),200];
private _veh = [_sPos,0,"B_Heli_Transport_03_unarmed_F",west] call BIS_fnc_spawnVehicle;
_veh params[
	["_veh", objNull, [objNull]],
	["_units", [], [[]]],
	["_grp", grpNull, [grpNull]]
];
_veh allowDamage false;
_grp move (_tPos vectorAdd [0,0,300]);
_veh flyInHeight 350;
waitUntil {_veh distance2D _tPos < 130};
_grp move _sPos;
_tMarker setMarkerText " Airdrop - Abgeworfen";
_zMarker setMarkerColor "colorOPFOR";

private _box = createVehicle ["B_supplyCrate_F",(visiblePosition _veh) vectorAdd [0,0,-15], [], 0, "CAN_COLLIDE"];
_box allowDamage false;
uiSleep 5;
private _para = createVehicle ["O_Parachute_02_F",visiblePosition _box, [], 0, "CAN_COLLIDE"];
private _smoke= "SmokeShellGreen" createVehicle visiblePosition _box;
private _flare = "F_40mm_Green" createVehicle visiblePosition _box;
_box attachTo [_para,[0,0,1]];
_smoke attachTo [_box,[0.5,0.3,0]];
_flare attachTo [_box,[0.5,0.3,0]];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

{
	if !(_x isEqualTo "") then {
		_box addItemCargoGlobal [_x, 1];
	};
	nil;
} count _content;

_box setVariable ["markers",[_zMarker,_tMarker],true];
[3,format["Ein Airdrop wurde im MapGrid %1 abgeworfen",mapGridPosition _pos]] remoteExec ["life_fnc_broadcast",0];
private _array = (bank_obj getVariable ["airDrops",[]]) select {!isNull _x};
_array pushBackUnique _box;
bank_obj setVariable ["airDrops",_array,true];
uiSleep 120;
deleteVehicle _veh;