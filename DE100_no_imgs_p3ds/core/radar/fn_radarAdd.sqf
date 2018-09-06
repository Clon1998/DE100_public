/*
	File:	fn_radarAdd.sqf
	Date:   29.11.2015
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/


if(playerSide != west) exitWith {hint "Dafür hast du keine Ausbildung.";};
if(!isNull objectParent player) exitWith {hint "Du kannst das nicht in einem Auto Aufbauen?";};
if(!isNull (player getVariable ["radar",objNull])) exitWith {hint "Du stellst gerade schon einen Blitzer auf";};

if(([0,"speedtrap"] call life_fnc_handleVItem) <= 0) exitWith {};

_radar = createSimpleObject [(parsingNamespace getVariable ["MISSION_ROOT",''])+"3d\m2_v9.p3d",getPosWorld player];
_radar setVariable["className","m2_radarCam",true];
player setVariable ["radar",_radar];
_radar attachTo[player,[0,1.5,1.3]];
private _onDone = {
	private _radar = player getVariable ["radar",objNull];
	player setVariable ["radar",nil];
	private _aaid = player getVariable ["placeRadar",-1];
	player removeAction _aaid;
	if (!isNull _radar) then {
		detach _radar;
		if (([false,"speedtrap",1] call life_fnc_handleInv) == 0) exitWith {
		    deleteVehicle _radar;
		};

		_radar allowdamage false;
		_radar setVariable ["limit",50,true];
		_radar setVariable ["enabled",true,true];
		_radar setVariable ["manager",player call life_fnc_name,true];

		private _radars = bank_obj getVariable ["radars",[]];
		_radars pushBackUnique _radar;
		bank_obj setVariable ["radars",_radars,true];
		_radar remoteExecCall ["life_fnc_createRadar",-2];
	};
};
player setVariable ["placeRadar", player addAction["Blitzer plazieren",_onDone]];
