/*
	File:	fn_startMultiProcessing.sqf
	Date:   2017-03-25 21:44:32
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_vendor", objNull, [objNull]],
	["_caller", objNull, [objNull]],
	["_addactionId", 0, [0]],
	["_cEntry", "", [""]]
];

if (_cEntry isEqualTo "" || life_is_processing) exitWith {};
if (!isNull objectParent player) exitWith {
	["Du darfst nicht in einem Fahrzeug sitzen, während du etwas verarbeitest.",true,"fast"] call life_fnc_notification_system;
};

if (!isClass(missionConfigFile >> "ItemProcessing" >> _cEntry)) exitWith {};
private _hasLicense = missionNamespace getVariable [getText (missionConfigFile >> "ItemProcessing"  >> _cEntry >> "neededLicense"),false];

if (!_hasLicense) exitwith {
	["Du besitzt die benötigte Lizenz nicht",true,"fast"] call life_fnc_notification_system;
};

private _oItems = getArray(missionConfigFile >> "ItemProcessing"  >> _cEntry >> "oldItems");
private _result = getText (missionConfigFile >> "ItemProcessing" >> _cEntry >> "newItem");
private _header = localize (getText (missionConfigFile >> "ItemProcessing" >> _cEntry >> "progressTitel"));

private _amnCanProd = floor (([0,((_oItems select 0) select 0)] call life_fnc_handleVItem) / ((_oItems select 0) select 1));
{
	_amnCanProd = _amnCanProd min (floor (([0,_x select 0] call life_fnc_handleVItem) / (_x select 1)));
} forEach _oItems;

if (_amnCanProd == 0) exitWith {
	["Du hast nicht genung von allen Komponenten bei dir.",true,"fast"] call life_fnc_notification_system;
};
life_is_processing = true;
private _pData = (getText(missionConfigFile >> "VirtualItems" >> _result >> "profVar")) call life_fnc_getProf;
[_pData select 0,_header,compile (format["!isNull objectParent player || !life_is_processing || player distance %1 > 10",getPos _vendor]),[_cEntry,_amnCanProd,_vendor,_pData select 1,0],life_fnc_endMultiProcessing,life_fnc_endMultiProcessing] spawn life_fnc_progressBar;