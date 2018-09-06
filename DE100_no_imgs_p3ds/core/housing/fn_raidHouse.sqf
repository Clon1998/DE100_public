/*
	File:	fn_raidHouse.sqf
	Date:   2016-08-01 21:38:12
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_house", objNull, [objNull]]
];

if (isNull _house) exitwith {};

private _online = if (_house getVariable ["isStorehouse",false]) then {
	{_x getVariable ["gang_ID",0] isEqualTo ((_house getVariable ["house_owner",[0,""]]) select 0)} count allGroups > 0;
} else {
	[(_house getVariable ["house_owner",[0,""]]) select 0] call life_fnc_isUIDActive;
};

if (!_online) exitwith {
	[localize "STR_House_Raid_OwnerOff",true,"fast"] call life_fnc_notification_system;
};

private _fnc = {
	params[
		["_h", objNull, [objNull]],
		["_s", true, [true]]
	];
	if (_s) then {
		private _tData = _h getVariable ["Trunk",[[],0]];
		private _tItems = _tData select 0;
		private _tWeight = _tData select 1;
		private _bounty = 0;
		private _fDrugs = "";
		private _fWeapons = "";
		private _del = [];
		{
			private _var = _x select 0;
			private _val = _x select 1;
			private _i = [_var,DYN_Price_array] call life_fnc_index;
			if ((getNumber(missionConfigFile >> "VirtualItems" >> _var >> "illegal")) isEqualTo 1) then {
				private _price = if (_i >= 0) then {
					((DYN_Price_array select _i) select 1) * _val;
				} else {
					if ((getNumber(missionConfigFile >> "VirtualItems" >> _var >> "sellPrice")) <= 0) then {
						3000 * _val;
					} else {
						(getNumber(missionConfigFile >> "VirtualItems" >> _var >> "sellPrice")) * _val;
					};
				};
				_del pushBack _forEachIndex;
				_tWeight = _tWeight - ([_var] call life_fnc_itemWeight) * _val;
				_bounty = _bounty + _price;
				_fDrugs = format["%1%2x - %3 Wert: €%4<br/>",_fDrugs,_val,localize (getText(missionConfigFile >> "VirtualItems" >> _var >> "displayName")),[_price] call life_fnc_numberText];
			};
		} forEach _tItems;
		{
			_tItems deleteAt (_x - _forEachIndex);
		} forEach _del;
		_h setVariable ["Trunk",[_tItems,_tWeight],true];
		{
			private _data = _x select 0;
			private _itemSpace = _x select 1;
			{
				private _key = _x select 0;
				private _kData = _x select 1;
				private _del = [];
				private _iItems = toLower(str getArray(missionConfigFile >> "Life_Settings" >> "illegal_arma_items"));
				{
					private _class = _x select 0;
					private _val = _x select 1;

					if (_iItems find (toLower _class) >= 0) then {
						_del pushBack _forEachIndex;
						_bounty = _bounty + 5000 * _val;
						_fWeapons = format["%1%2x - %3<br/>",_fWeapons,_val,([_class] call life_fnc_fetchCfgDetails) select 1];
					};
				} forEach _kData;
				{
					_kData deleteAt (_x - _forEachIndex);
				} forEach _del;
				_data set [_forEachIndex,[_key,_kData]];
			} forEach _data;
			_h setVariable [_itemSpace,_data,true];
			nil;
		} count [[_h getVariable ["other_space",[]],"other_space"],[_h getVariable ["clothing_space",[]],"clothing_space"],[_h getVariable ["weapon_space",[]],"weapon_space"]];

		if (_bounty > 0) then {
			[0,"STR_House_Raid_Successful",true,[[_bounty] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",-2];
			de100_mSpace setVariable ["cT",diag_tickTime];
			de100_luciandjuli_bc = de100_luciandjuli_bc + _bounty;
			de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
			[_h] call life_fnc_updateHouseContainer;
		};
		private _txt = format ["<t color='#FF0000' size='2'>Hausbesitzer:<br/>%1</t><br/>",(_h getVariable "house_owner") select 1];
		if (_fDrugs isEqualTo "" && _fWeapons isEqualTo "") exitwith {
			hint parseText format["%1<t color='#FFD700' size='1.5'>Keine illegalen Gegenstände</t>",_txt];
		};
		if (_fWeapons isEqualTo "") then {
			_fWeapons = "Keine";
		};
		if (_fDrugs isEqualTo "") then {
			_fDrugs = "Keine";
		};
		hint parseText format["%1<t color='#FFD700' size='1.5'>Illegale Gegenstände</t><br/>%2<t color='#FFD700' size='1.5'>Schmuggelware</t><br/>%3",_txt,_fWeapons,_fDrugs];
	} else {
		[localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system;
	};
	life_action_inUse = false;
};

life_action_inUse = true;
[120,localize "STR_House_Raid_Searching",compile format["!life_action_inUse || !isNull objectParent player || player distance (objectFromNetId '%1') > 13",netId _house],[_house],_fnc,_fnc] spawn life_fnc_progressBar;