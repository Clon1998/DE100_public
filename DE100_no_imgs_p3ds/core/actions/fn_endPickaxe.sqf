/*
	File:	fn_endPickaxe.sqf
	Date:   2017-03-03 18:56:17
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_altStat", false, [false]],
	["_item", "", [""]],
	["_val", 1, [1]],
	["_fval", 0, [1]],
	["_success", true, [false]],
	"_cAdd",
	"_header"
];

if (_success) then {
	_val = [true,_item,_val] call life_fnc_handleInv;
	_fval = _fval + _val;
	if (_altStat) then {
		private _pData = (getText(missionConfigFile >> "VirtualItems" >> _item >> "profVar")) call life_fnc_getProf;
		_cAdd = [_item,_pData select 1] call life_fnc_canAdd;
		if (_cAdd > 0) then {
			_header = format["Baue %1 ab [%2] (Automatisch)",localize (getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName")),_fval];
			life_action_inUse = true;
			[player,"AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon",1,_pData select 0,{!isNull objectParent player || !life_action_inUse}] spawn life_fnc_doAnimation;
			[_pData select 0,_header,{!isNull objectParent player || !life_action_inUse},[_altStat,_item,_cAdd,_fval],life_fnc_endPickaxe,life_fnc_endPickaxe] spawn life_fnc_progressBar;
		} else {
			private _getXp = _fval * (round ((random 3)+12));
			if (life_real_date in (call de100_Dxp_days) || life_admin_moreXp) then {
				_getXp = _getXp * 2;
			};

			[format["Insgesamt hast Du %2 %1(s) abgebaut und dabei %3 Erfahrung erhalten.",localize (getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName")),_fval,_getXp],false,"fast"] call life_fnc_notification_system;
			[(getText(missionConfigFile >> "VirtualItems" >> _item >> "profVar")),_getXp] call life_fnc_addExp;

			["Mining",_fval] spawn life_fnc_addAchievExp;
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
			life_action_inUse = false;
		};
	} else {
		private _getXp = _fval * (round ((random 3)+12));
		if (life_real_date in (call de100_Dxp_days) || life_admin_moreXp) then {
			_getXp = _getXp * 2;
		};

		[format["Du hast %2 %1(s) abgebaut und dabei %3 Erfahrung erhalten.",localize (getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName")),_fval,_getXp],false,"fast"] call life_fnc_notification_system;
		[(getText(missionConfigFile >> "VirtualItems" >> _item >> "profVar")),_getXp] call life_fnc_addExp;

		["Mining",_fval] spawn life_fnc_addAchievExp;
		if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
			player selectWeapon life_curWep_h;
		};
		life_action_inUse = false;
	};
} else {
	[localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system;
	life_action_inUse = false;
	if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
		player selectWeapon life_curWep_h;
	};
	if (_fval > 0) then {
		private _getXp = _fval * (round ((random 3)+12));
		if (life_real_date in (call de100_Dxp_days) || life_admin_moreXp) then {
			_getXp = _getXp * 2;
		};

		[format["Du hast %2 %1(s) abgebaut und dabei %3 Erfahrung erhalten.",localize (getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName")),_fval,_getXp],false,"fast"] call life_fnc_notification_system;
		[(getText(missionConfigFile >> "VirtualItems" >> _item >> "profVar")),_getXp] call life_fnc_addExp;

		["Mining",_fval] spawn life_fnc_addAchievExp;
	};
};