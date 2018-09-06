/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When a client disconnects this will remove their corpse and
	clean up their storage boxes in their house.
*/
_error = params [//Kinda funny params returns false if an error occurred or default value has been used...
	["_unit",objNull,[objNull]],
	["_id",0,[0]],
	["_uid","",[""]],
	["_name","",[""]]
];
if (!_error) exitWith {["An error occurred during the client cleanup"] call A3Log;};
if (_uid isEqualTo (missionNamespace getVariable ["HC_UID",""])) then {
    life_HC_isActive = false;
    publicVariable "life_HC_isActive";
    HC_Life = false;
    publicVariable "HC_Life";
	dynMarket = [] spawn life_fnc_dynMarketInit;
	call AC_fnc_loadAuctions;
	//aucFSM = [] execFSM "\life_shared\fsm\refreshAuctions.fsm";
	dbStatsFSM = [] execFSM "\life_shared\fsm\dbStats.fsm";
	cleanupFSM = [] execFSM "\life_server\fsm\cleanup.fsm";
	realtimeFSM = [] execFSM "\life_server\fsm\realtime.fsm";
	life_gamble_zi = false;
	publicVariable "life_gamble_zi";
	life_gamble_starttime = nil;
	life_gamble_amt = 0;
	life_gamble_teil = [];
	publicVariable "life_gamble_starttime";
	publicVariable "life_gamble_teil";
	publicVariable "life_gamble_amt";

    [["*****************************************","HeadlessClient crashed/disconnected","Server is ready to do some Work!","*****************************************"]] call A3Log;
} else {
	_validated = _unit getVariable [(format["logout_validate_id_%1",_uid]),false];
	if (!_validated) then {
		_gear = [_unit] call life_fnc_saveGear;
		if (_unit getVariable ["inMission",false]) then {		
			if (life_HC_isActive) then {
				[_uid,_unit getVariable ["side",civilian],_unit getVariable ["nobody",false],_gear] remoteExecCall ["AH_fnc_reSync",HC_Life];
				[format["%1 (UID: %2) hat den Server verlassen und war nicht validiert. (Connection Lost oder Alt+F4)",_name,_uid ],"unvalidateLogout"] remoteExecCall ["A3Log",HC_Life];
				[_uid, 9, format ["%1(%2) hat den Server verlassen und war nicht validiert. (Connection Lost oder Alt+F4)",_name,_uid]] remoteExecCall ["MSC_fnc_log",HC_Life];
			} else {
			    [_uid,_unit getVariable ["side",civilian],_unit getVariable ["nobody",false],_gear] call AH_fnc_reSync;
			    [format["%1 (UID: %2) hat den Server verlassen und war nicht validiert. (Connection Lost oder Alt+F4)",_name,_uid ],"unvalidateLogout"] call A3Log;
			    [_uid, 9, format ["%1(%2) hat den Server verlassen und war nicht validiert. (Connection Lost oder Alt+F4)",_name,_uid]] call MSC_fnc_log;
			};
			[0,format["%1 hat den Server nicht ordnungsgemäß verlassen",_name],false] remoteExecCall ["life_fnc_broadcast",-2];
		} else {
			[0,format["%1 hat den Server vor der Initialisierung verlassen",_name],false] remoteExecCall ["life_fnc_broadcast",-2];
			if (life_HC_isActive) then {
				[_uid, 9, format ["%1(%2) hat den Server vor der Initialisierung verlassen",_name,_uid]] remoteExecCall ["MSC_fnc_log",HC_Life];
			} else {
				[_uid, 9, format ["%1(%2) hat den Server vor der Initialisierung verlassen",_name,_uid]] call MSC_fnc_log;
			};
		};
	} else {
		[0,format["%1 ging in die Lobby",_name],false] remoteExecCall ["life_fnc_broadcast",-2];
		if (life_HC_isActive) then {
			[_uid, 9, format ["%1(%2) hat den Server verlassen",_name,_uid]] remoteExecCall ["MSC_fnc_log",HC_Life];
		} else {
			[_uid, 9, format ["%1(%2) hat den Server verlassen",_name,_uid]] call MSC_fnc_log;
		};
	};
	_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers;
	_unit setVariable [(format["logout_validate_id_%1",_uid]),nil];
	deleteVehicle _unit;
	life_telekomInUse = life_telekomInUse - [_uid];
	publicVariable "life_telekomInUse";
};
false;