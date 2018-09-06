/*
	File:	fn_repackMags.sqf
	Date:   2017-04-12 00:39:17
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

if (life_action_inUse || life_interrupted) exitWith {};

if (count (magazinesAmmo player) == 0) exitwith {
	["Du hast keine Magazine",false,"fast"] call life_fnc_notification_system;
};
private _fnc = {
	params[
		["_s", false, [false]]
	];
	if (_s) then {	
		private _crntM = magazinesAmmo player;
		private _canP = [];
		{
			private _c = getNumber(configFile >> "CfgMagazines" >> (_x select 0) >> "count");
			if (_c > 1) then {
				private _i = [_x select 0, _canP] call life_fnc_index;
				if (_i >= 0) then {
					private _t = _canP select _i select 1;
					_t = _t + (_x select 1);
					_canP set [_i,[_x select 0,_t]];
				} else {
					_canP pushBackUnique [_x select 0,_x select 1];
				};
			};
			nil
		} count _crntM;

		{
			private _m = _x select 0;
			private _h = _x select 1;
			private _c = getNumber(configFile >> "CfgMagazines" >> _m >> "count");

			player removeMagazines _m;
			private _t = _h % _c;
			private _f = (_h-_t)/_c;
			if (_f > 0) then {
				player addMagazines [_m,_f];
			};
			if (_t > 0) then {
				player addMagazine [_m,_t];
			};
			nil
		} count _canP;
		_getXp = round ((random 30)+80);
		if (life_real_date in (call de100_Dxp_days) || life_admin_moreXp) then {
			_getXp = _getXp * 2;
		};
		private _profName = call {if (playerSide isEqualTo civilian) exitWith {"mag_Prof";};if (playerSide isEqualTo west) exitWith {"mag_Prof_cop";};if (playerSide isEqualTo independent) exitWith {"mag_Prof_thr";};};
		[_profName,_getXp] call life_fnc_addExp;
		[format["Magazine wurden zusammengepackt, dabei %1 Erfahrung erhalten.",_getXp],false,"fast"] call life_fnc_notification_system;
	} else {
		[localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system;
	};
	life_action_inUse = false;
};

private _profName = call {if (playerSide isEqualTo civilian) exitWith {"mag_Prof";};if (playerSide isEqualTo west) exitWith {"mag_Prof_cop";};if (playerSide isEqualTo independent) exitWith {"mag_Prof_thr";};};
private _pData = _profName call life_fnc_getProf;
life_action_inUse = true;
if (isNull objectParent player) then {
	[player,"MedicOther",2,_pData select 0,{!life_action_inUse || !isNull objectParent player}] spawn life_fnc_doAnimation;
};
[_pData select 0,"Magazine werden zusammengepackt",{!life_action_inUse},[],_fnc,_fnc] spawn life_fnc_progressBar;