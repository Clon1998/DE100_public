/*
	File:	fn_vehInvSearch.sqf
	Date:   2016-08-01 21:38:12
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
if (life_action_inUse || life_interrupted) exitWith {};
private _veh = param [0,objNull,[objNull]];
if (isNull _veh) exitWith {};
if !(_veh isKindOf "Air" || _veh isKindOf "Ship" || _veh isKindOf "LandVehicle" || _veh isKindOf "Pod_Heli_Transport_04_base_F") exitWith {};

private _fnc = {
	params[
		["_veh", objNull, [objNull]],
		["_s", true, [true]]
	];
	if (_s) then {
		private _trunkD = _veh getVariable ["Trunk",[]];
		if (count _trunkD isEqualTo 0) exitWith {
			[localize "STR_Cop_VehEmpty",true,"fast"] call life_fnc_notification_system;
		};

		private _inv = _trunkD select 0;
		private _weigth = _trunkD select 1;
		private _bounty = 0;
		{
			_x params[
				["_var", "", [""]],
				["_val", 0, [0]]
			];
			if ((getNumber(missionConfigFile >> "VirtualItems" >> _var >> "illegal")) isEqualTo 1) then {
				private _i = [_var,DYN_Price_array] call life_fnc_index;
				_inv set [_forEachIndex,-1];
				_weigth = (_weigth - ([_var] call life_fnc_itemWeight) * _val) max 0;
				if (_i >= 0) then {
					_bounty = _bounty + round(_val * ((DYN_Price_array select _i) select 1));
				} else {
					if (((getNumber(missionConfigFile >> "VirtualItems" >> _var >> "sellPrice")) * _val) <= 0) then {
						_bounty = _bounty + 3000 * _val;
					} else {
						_bounty = _bounty + ((getNumber(missionConfigFile >> "VirtualItems" >> _var >> "sellPrice")) * _val);
					};
				};
			};
		} forEach (_trunkD select 0);
		_inv = _inv - [-1];

		private _aInv = [getWeaponCargo _veh,getMagazineCargo _veh,getItemCargo _veh,getBackpackCargo _veh];
		clearWeaponCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearItemCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		private _ret = "";
		{
			private _tmpArray = _x;
			private _tIndex = _forEachIndex;
			{
				private _item = _x;
				if (_item in getArray(missionConfigFile >> "Life_Settings" >> "illegal_arma_items")) then {
					_info = [_item] call life_fnc_fetchCfgDetails;
					_ret = _ret + (format ["%1x - %2<br/>",(_tmpArray select 1) select _forEachIndex, _info select 1]);
				} else {
					call {
						if (_tIndex isEqualTo 0) exitWith {_veh addWeaponCargoGlobal [_item,(_tmpArray select 1) select _forEachIndex];};
						if (_tIndex isEqualTo 1) exitWith {_veh addMagazineCargoGlobal [_item,(_tmpArray select 1) select _forEachIndex];};
						if (_tIndex isEqualTo 2) exitWith {_veh addItemCargoGlobal [_item,(_tmpArray select 1) select _forEachIndex];};
						if (_tIndex isEqualTo 3) exitWith {_veh addBackpackCargoGlobal [_item,(_tmpArray select 1) select _forEachIndex];};
					};
				};
			} forEach (_tmpArray select 0);
		} forEach _aInv;

		if (_bounty > 0) then {
			[0,"STR_NOTF_VehContraband",true,[[_bounty] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",-2];
			de100_mSpace setVariable ["cT",diag_tickTime];
			de100_luciandjuli_bc = de100_luciandjuli_bc + _bounty;
			de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
			_veh setVariable["Trunk",[_inv,_weigth],true];
		} else {
			[localize "STR_Cop_NoIllegalVeh",true,"fast"] call life_fnc_notification_system;
		};

		if (count _ret > 0) then {
			hint parseText format ["<t color='#FFD700'><t size='1.5'><br/>Gefundene Illegale-Waffen</t></t><br/>%1", _ret];
		};
		private _getXp = (round ((random 80)+20));
		if (life_real_date in (call de100_Dxp_days) || life_admin_moreXp) then {
			_getXp = _getXp * 2;
		};

		[format["Du hast %1 Erfahrung erhalten.",_getXp],false,"fast"] call life_fnc_notification_system;
		["search_veh",_getXp] call life_fnc_addExp;
	} else {
		[localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system;
	};
	life_action_inUse = false;
};

private _pData = "search_veh" call life_fnc_getProf;
life_action_inUse = true;
[player,"MedicOther",2,_pData select 0,{!life_action_inUse || !isNull objectParent player}] spawn life_fnc_doAnimation;
[_pData select 0,"Fahrzeug wird durchsucht",{!life_action_inUse || !isNull objectParent player},[_veh],_fnc,_fnc] spawn life_fnc_progressBar;