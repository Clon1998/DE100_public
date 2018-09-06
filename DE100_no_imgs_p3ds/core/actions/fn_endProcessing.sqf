/*
	File:	fn_endProcessing.sqf
	Date:   2017-03-27 12:45:23
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_cEntry", "", [""]],
	["_vendor", objNull, [objNull]],
	["_pay", true, [false]],
	["_step", 0, [0]],
	["_fVal", 0, [0]],
	["_success", false, [false]]
];

private _result = getText (missionConfigFile >> "ItemProcessing" >> _cEntry >> "newItem");
if (_success) then {
	private _oItem = getText(missionConfigFile >> "ItemProcessing"  >> _cEntry >> "oldItem");
	private _cost = getNumber (missionConfigFile >> "ItemProcessing" >> _cEntry >> "noLicenseCost");
	_step = _step min ([0,_oItem] call life_fnc_handleVItem);
	if (!_pay && de100_luciandjuli_mula < _step * _cost) exitwith {
		if (_fVal > 0) then {
			private _getXp = _fVal * (round ((random 60) + 10));
			if (life_real_date in (call de100_Dxp_days) || life_admin_moreXp) then {
				_getXp = _getXp * 2;
			};

			[format["Du hast %1 %2 hergestellt und dabei %3 Erfahrung erhalten.",_fVal,localize (getText(missionConfigFile >> "VirtualItems" >> _result >> "displayName")),_getXp],false,"fast"] call life_fnc_notification_system;

			[(getText(missionConfigFile >> "VirtualItems" >> _result >> "profVar")),_getXp] call life_fnc_addExp;
		};
		["Du hast nicht genug Geld, um weiter ohne Lizenz zu verarbeiten",true,"fast"] call life_fnc_notification_system;
		life_is_processing = false;
	};
	if (!_pay) then {
		[format["Du hast €%1 für das verarbeiten bezahlt",_step * _cost],false,"fast"] call life_fnc_notification_system;
		de100_mSpace setVariable ["cT",diag_tickTime];
		de100_luciandjuli_mula = de100_luciandjuli_mula - _step * _cost;
		de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
	};
	if (([false,_oItem,_step] call life_fnc_handleInv) == 0) exitWith {
		["Ein Fehler ist aufgetreten#01",false,"fast"] call life_fnc_notification_system;
		life_is_processing = false;
	};

	private _added = [true,_result,_step] call life_fnc_handleInv;
	if (_added != _step) exitWith {
		["Ein Fehler ist aufgetreten#02",false,"fast"] call life_fnc_notification_system;
		[true,_oItem,_added] call life_fnc_handleInv;
		life_is_processing = false;
	};
	_fVal = _fVal + _added;
	if (([0,_oItem] call life_fnc_handleVItem) == 0) then {
		private _getXp = _fVal * (round (random [10,30,90]));
		if (life_real_date in (call de100_Dxp_days) || life_admin_moreXp) then {
			_getXp = _getXp * 2;
		};

		[format["Du hast %1 %2 hergestellt und dabei %3 Erfahrung erhalten.",_fVal,localize (getText(missionConfigFile >> "VirtualItems" >> _result >> "displayName")),_getXp],false,"fast"] call life_fnc_notification_system;

		[(getText(missionConfigFile >> "VirtualItems" >> _result >> "profVar")),_getXp] call life_fnc_addExp;
		life_is_processing = false;
	} else {
		private _pData = (getText(missionConfigFile >> "VirtualItems" >> _result >> "profVar")) call life_fnc_getProf;
		private _header = format["%1 [%2]",localize (getText (missionConfigFile >> "ItemProcessing" >> _cEntry >> "progressTitel")),_fVal];
		[_pData select 0,_header,compile (format["!isNull objectParent player || !life_is_processing || player distance %1 > 10",getPos _vendor]),[_cEntry,_vendor,_pay,_pData select 1,_fVal],life_fnc_endProcessing,life_fnc_endProcessing] spawn life_fnc_progressBar;
	};
} else {
	if (_fVal > 0) then {
		private _getXp = _fVal * (round (random [10,30,90]));
		if (life_real_date in (call de100_Dxp_days) || life_admin_moreXp) then {
			_getXp = _getXp * 2;
		};

		[format["Du hast %1 %2 hergestellt und dabei %3 Erfahrung erhalten.",_fVal,localize (getText(missionConfigFile >> "VirtualItems" >> _result >> "displayName")),_getXp],false,"fast"] call life_fnc_notification_system;

		[(getText(missionConfigFile >> "VirtualItems" >> _result >> "profVar")),_getXp] call life_fnc_addExp;
	};

	[localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system;
	life_is_processing = false;
};
if (!isNull findDisplay 2001) then {
	(findDisplay 2001) closeDisplay 2;
};
if (!isNull findDisplay 3500) then {
	(findDisplay 3500) closeDisplay 2;
};