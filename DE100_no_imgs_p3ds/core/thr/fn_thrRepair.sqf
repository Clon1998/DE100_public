/*
	File:	fn_thrRepair.sqf
	Date:   2016-12-28 21:11:30
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_veh", objNull, [objNull]],
	"_getXp"
];
if (life_action_inUse || life_interrupted) exitWith {};
if(isNull _veh) exitWith {};

if !((_veh isKindOf "Car") || (_veh isKindOf "Ship") || (_veh isKindOf "Air") || (_veh isKindOf "Pod_Heli_Transport_04_base_F")) exitwith {["Das kann nicht repariert werden.",true,"fast"] call life_fnc_notification_system;};
if (([0,"toolbox"] call life_fnc_handleVItem) == 0) exitwith {["Du hast keinen Werkzeugkasten",false,"fast"] call life_fnc_notification_system;};

private _header = format["Repariere %1",getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName")];
private _pData = "repair_thr_Prof" call life_fnc_getProf;
private _onFinish = {
	params[
		["_veh", objNull, [objNull]],
		["_success", false, [false]],
		"_getXp"
	];
	player playAction "medicStop";
	if (_success) then {
		if (([false,"toolbox",1] call life_fnc_handleInv) > 0) then {	
			_veh setDamage 0;

			_getXp = round ((random 30)+80);
			if (life_real_date in (call de100_Dxp_days) || life_admin_moreXp) then {
				_getXp = _getXp * 2;
			};
			["repair_thr_Prof",_getXp] call life_fnc_addExp;
			["Repair",1] call life_fnc_addAchievExp;
			[format["Du hast das Fahrzeug repariert und dabei %1 Erfahrung erhalten.",_getXp],false,"fast"] call life_fnc_notification_system;
		};

		if (!isNull (_veh getVariable ["requestveh",objNull])) then {
			private _owner = _veh getVariable ["requestveh",objNull];
			_owner setVariable["thrClerk",nil,true];
			_owner setVariable ["requestveh",nil,true];
			_veh setVariable ["requestveh",nil,true];
		};
	} else {
		[localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system;
	};
	life_action_inUse = false;
};

life_action_inUse = true;

[player,"MedicOther",2,_pData select 0,compile format["!isNull objectParent player || !life_action_inUse || player distance %1 > 4",getPos _veh]] spawn life_fnc_doAnimation;
[_pData select 0,_header,compile format["!isNull objectParent player || !life_action_inUse || player distance %1 > 4",getPos _veh],[_veh],_onFinish,_onFinish] spawn life_fnc_progressBar;