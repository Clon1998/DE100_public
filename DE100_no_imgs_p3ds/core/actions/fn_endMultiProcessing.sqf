/*
	File:	fn_endMultiProcessing.sqf
	Date:   2017-03-25 21:44:48
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_cEntry", "", [""]],
	["_amnCanProd", 0, [0]],
	["_vendor", objNull, [objNull]],
	["_step", 0, [0]],
	["_fVal", 0, [0]],
	["_success", false, [false]]
];

private _result = getText (missionConfigFile >> "ItemProcessing" >> _cEntry >> "newItem");
if (_success) then {
	private _error = false;
	private _oItems = getArray(missionConfigFile >> "ItemProcessing"  >> _cEntry >> "oldItems");
	_step = _step min _amnCanProd;
	{
		if (([false,_x select 0,_step * (_x select 1)] call life_fnc_handleInv) != (_step * (_x select 1))) exitWith {_error = true;};
	} forEach _oItems;

	if (_error) exitWith {
		["Ein Fehler ist aufgetreten#01",false,"fast"] call life_fnc_notification_system;
		life_is_processing = false;
	};

	private _added = [true,_result,_step] call life_fnc_handleInv;
	if (_added != _step) exitWith {
		["Ein Fehler ist aufgetreten#02",false,"fast"] call life_fnc_notification_system;
		{
			[true,_x select 0,_added * (_x select 1)] call life_fnc_handleInv;
		} forEach _oItems;
		life_is_processing = false;
	};
	_fVal = _fVal + _added;
	_amnCanProd = (_amnCanProd - _step) max 0;
	if (_amnCanProd == 0) then {
		private _getXp = _fVal * (round (random [10,30,120]));
		if (life_real_date in (call de100_Dxp_days) || life_admin_moreXp) then {
			_getXp = _getXp * 2;
		};

		[format["Du hast %1 %2 hergestellt und dabei %3 Erfahrung erhalten.",_fVal,localize (getText(missionConfigFile >> "VirtualItems" >> _result >> "displayName")),_getXp],false,"fast"] call life_fnc_notification_system;

		[(getText(missionConfigFile >> "VirtualItems" >> _result >> "profVar")),_getXp] call life_fnc_addExp;
		life_is_processing = false;
	} else {
		private _data = (getText(missionConfigFile >> "VirtualItems" >> _result >> "profVar")) call life_fnc_getProf;
		private _header = format["%1 [%2]",localize (getText (missionConfigFile >> "ItemProcessing" >> _cEntry >> "progressTitel")),_fVal];
		[_data select 0,_header,compile format ["!isNull objectParent player || !life_is_processing || player distance %1 > 10",getPos _vendor],[_cEntry,_amnCanProd,_vendor,_data select 1,_fVal],life_fnc_endMultiProcessing,life_fnc_endMultiProcessing] spawn life_fnc_progressBar;
	};
} else {
	if (_fVal > 0) then {
		private _getXp = _fVal * (round (random [10,30,120]));
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