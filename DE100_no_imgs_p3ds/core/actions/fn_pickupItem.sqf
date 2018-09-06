/*
   File:    fn_pickupItem.sqf
   Date:    2017-10-25 19:26:58
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

params[
	["_items", [], [[]]]
];
if (_items isEqualTo []) exitWith {};
_items resize 4;
if (life_action_delay != 0 && (time - life_action_delay) < 0.5) exitWith {["Speedklicker Schutz",true,"fast"] call life_fnc_notification_system;};
life_action_delay = time;

{
	if (!isNull _x) then {
		if !(_x getVariable ["pickedUp",false]) then {
			_x setVariable ["pickedUp",true,true];
			private _data = _x getVariable ["item",["",0]];
			if (_data select 1 > 0) then {
				if ((_data select 0) isEqualTo "de100_luciandjuli_mula") exitWith {
					player playMove "AinvPknlMstpSlayWrflDnon";
					[format[localize "STR_NOTF_PickedMoney",[(_data select 1)] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;
					de100_mSpace setVariable ["cT",diag_tickTime];
					de100_luciandjuli_mula = de100_luciandjuli_mula + (_data select 1);
					de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
					deleteVehicle _x;
				};
				if (playerSide isEqualTo west && getNumber(missionConfigFile >> "VirtualItems" >> (_data select 0) >> "illegal") == 1) then {
					private _i = [_data select 0,DYN_Price_array] call life_fnc_index;
					private _reward = if (_i >= 0) then {
						(_data select 1) * (DYN_Price_array select _i select 1);
					} else {
						(_data select 1) * 3000;
					};
					[format[localize "STR_NOTF_PickedEvidence",localize getText(missionConfigFile >> "VirtualItems" >> (_data select 0) >> "displayName"),[_reward] call life_fnc_numberText] ,false,"fast"] call life_fnc_notification_system;
					de100_mSpace setVariable ["cT",diag_tickTime];
					de100_luciandjuli_bc = de100_luciandjuli_bc + _reward;
					de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
					deleteVehicle _x;
				} else {
					private _cAdd = [true,_data select 0,_data select 1] call life_fnc_handleInv;
					if (_cAdd <= 0) exitWith {
						[localize "STR_NOTF_InvFull",true,"fast"] call life_fnc_notification_system;
						_x setVariable ["pickedUp",false,true];
					};
					if (_cAdd == (_data select 1)) then {
						player playMove "AinvPknlMstpSlayWrflDnon";
						[format[localize "STR_NOTF_Picked",_cAdd,localize getText(missionConfigFile >> "VirtualItems" >> (_data select 0) >> "displayName")],false,"fast"] call life_fnc_notification_system;
						deleteVehicle _x;
					} else {
						_x setVariable["item",[_data select 0,(_data select 1) - _cAdd],true];
						_x setVariable["PickedUp",false,true];
						player playMove "AinvPknlMstpSlayWrflDnon";
						[format[localize "STR_NOTF_Picked",_cAdd,localize getText(missionConfigFile >> "VirtualItems" >> (_data select 0) >> "displayName")],false,"fast"] call life_fnc_notification_system;
						[localize "STR_NOTF_InvFull",true,"fast"] call life_fnc_notification_system;
					};
				};
			};
		} else {
			deleteVehicle _x;
		};
	};
	nil;
} count _items;