/*
   File:    fn_revive.sqf
   Date:    2018-1-19 12:44:00
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
params[
	["_target", objNull, [objNull]],
	["_mode", 0, [0]]
];

if (isNull _target) exitWith {};
if (_target getVariable["isAlive",true]) exitwith {};
if (!isNull (_target getVariable ["reviver",objNull])) exitWith {[localize "STR_Medic_AlreadyReviving",true,"fast"] call life_fnc_notification_system;};
if (serverTime - (bank_obj getVariable [format["%1_%2_reviveNoMed",getPlayerUID _target,side _target],-3800]) < 3600) exitWith {
	["Der Spieler wurde bereits in den letzten 60 Minuten von einem Amateur reanimiert, nur ein ausgebildeter Sanitäter des THR kann den Spieler reanimieren", true, "slow"] call life_fnc_notification_system;
};
private _pData = (["revive_civ_Prof","revive_cop_Prof"] select (playerSide isEqualTo civilian)) call life_fnc_getProf;

call {
	if (_mode == 0) exitWith {
		private _time = serverTime - (_target getVariable ["deathTime",0]);
		if (_time > 60*5) exitWith {
			["Nur ein ausgebildeter Sanitäter des THR kann den Spieler reanimieren", true, "slow"] call life_fnc_notification_system;
		};
		private _needed = ceil(_time/100);
		if (([0,"morphine"] call life_fnc_handleVItem) < _needed) exitWith {
			[format["Du benötigst %1x %2 um %3 zu ranimieren",_needed,localize getText(missionConfigFile >> "VirtualItems" >> "morphine" >> "displayName"),_target call life_fnc_name], true, "slow"] call life_fnc_notification_system;
		};
		_target setVariable["reviver",player,true];
		life_action_inUse = true;
		
		private _onFinish = {
			params[
				["_target", objNull, [objNull]],
				["_needed", 0, [0]],
				["_success", false, [false]]
			];
			player playAction "medicStop";
			
			if (_success) then {
				if (([false,"morphine",_needed] call life_fnc_handleInv) == _needed) then {
					private _getXp = round ((random 155)+88)*_needed;
					if (life_real_date in (call de100_Dxp_days) || life_admin_moreXp) then {
						_getXp = _getXp * 2;
					};
					[(["revive_civ_Prof","revive_cop_Prof"] select (playerSide isEqualTo civilian)), _getXp] call life_fnc_addExp;
					_target setVariable ["painKiller",true,true];
					[format["Du hast %2 %3x %1 verabreicht und dabei %4 Erfahrung erhalten.",localize getText(missionConfigFile >> "VirtualItems" >> "morphine" >> "displayName"),_target call life_fnc_name,_needed,_getXp], false, "slow"] call life_fnc_notification_system;
				} else {
					[format["Du benötigst %1x %2 um %3 zu ranimieren",_needed,localize getText(missionConfigFile >> "VirtualItems" >> "morphine" >> "displayName"),_target call life_fnc_name], true, "slow"] call life_fnc_notification_system;
				};
			} else {
				[localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system;
			};
			_target setVariable["reviver",nil,true];
			life_action_inUse = false;
		};

		[player,"MedicOther",2,(_pData select 0) * _needed,compile format["!isNull objectParent player || !life_action_inUse || (objectFromNetId '%1') getVariable['isAlive',true] || (player distance %2) > 4",netId _target,getPos _target]] spawn life_fnc_doAnimation;
		[(_pData select 0) * _needed,format["Verabreiche %1",localize getText(missionConfigFile >> "VirtualItems" >> "morphine" >> "displayName")],compile format["!isNull objectParent player || !life_action_inUse || (objectFromNetId '%1') getVariable['isAlive',true] || (player distance %2) > 4",netId _target,getPos _target],[_target,_needed],_onFinish,_onFinish] spawn life_fnc_progressBar;
	};

	if (_mode == 1) exitWith {
		if !(_target getVariable ["painKiller",false]) exitWith {};
		if (([0,"epinephrine"] call life_fnc_handleVItem) == 0) exitWith {
			[format["Du benötigst 1x %1 um %2 zu ranimieren",localize getText(missionConfigFile >> "VirtualItems" >> "epinephrine" >> "displayName"),_target call life_fnc_name], true, "slow"] call life_fnc_notification_system;
		};
		_target setVariable["reviver",player,true];
		life_action_inUse = true;

		private _onFinish = {
			params[
				["_target", objNull, [objNull]],
				["_success", false, [false]]
			];
			player playAction "medicStop";
			
			if (_success) then {
				if (([false,"epinephrine",1] call life_fnc_handleInv) == 1) then {
					if (life_HC_isActive) then {
						[getPlayerUID player, 33, [format["%1 hat %2 wiederbelebt",player call life_fnc_nameUID, _target call life_fnc_nameUID],[getPlayerUID _target,34,format["%2 wurde von %1 wiederbelebt",player call life_fnc_nameUID, _target call life_fnc_nameUID]]]] remoteExecCall ["MSC_fnc_log",HC_Life];
					} else {
						[getPlayerUID player, 33, [format["%1 hat %2 wiederbelebt",player call life_fnc_nameUID, _target call life_fnc_nameUID],[getPlayerUID _target,34,format["%2 wurde von %1 wiederbelebt",player call life_fnc_nameUID, _target call life_fnc_nameUID]]]] remoteExecCall ["MSC_fnc_log",2];
					};
					private _getXp = round ((random 255)+128);
					if (life_real_date in (call de100_Dxp_days) || life_admin_moreXp) then {
						_getXp = _getXp * 2;
					};
					[(["revive_civ_Prof","revive_cop_Prof"] select (playerSide isEqualTo civilian)), _getXp] call life_fnc_addExp;
					[player] remoteExec ["life_fnc_revived",_target];
					bank_obj setVariable [format["%1_%2_reviveNoMed",getPlayerUID _target,side _target],serverTime,true];
					[format["Du hast %2 1x %1 verabreicht und dabei %3 Erfahrung erhalten.",localize getText(missionConfigFile >> "VirtualItems" >> "epinephrine" >> "displayName"),_target call life_fnc_name,_getXp], false, "slow"] call life_fnc_notification_system;
				} else {
					[format["Du benötigst 1x %1 um %2 zu ranimieren",localize getText(missionConfigFile >> "VirtualItems" >> "epinephrine" >> "displayName"),_target call life_fnc_name], true, "slow"] call life_fnc_notification_system;
				};
			} else {
				[localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system;
			};
			_target setVariable["reviver",nil,true];
			life_action_inUse = false;
		};

		[player,"MedicOther",2,_pData select 0,compile format["!isNull objectParent player || !life_action_inUse || (objectFromNetId '%1') getVariable['isAlive',true] || (player distance %2) > 4",netId _target,getPos _target]] spawn life_fnc_doAnimation;
		[_pData select 0,format["Verabreiche %1",localize getText(missionConfigFile >> "VirtualItems" >> "epinephrine" >> "displayName")],compile format["!isNull objectParent player || !life_action_inUse || (objectFromNetId '%1') getVariable['isAlive',true] || (player distance %2) > 4",netId _target,getPos _target],[_target],_onFinish,_onFinish] spawn life_fnc_progressBar;
	};
};