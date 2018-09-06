/*
	File:	fn_startProcessing.sqf
	Date:   2017-03-27 12:45:12
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
private _oItem = getText (missionConfigFile >> "ItemProcessing"  >> _cEntry >> "oldItem");
private _result = getText (missionConfigFile >> "ItemProcessing" >> _cEntry >> "newItem");
private _header = localize(getText (missionConfigFile >> "ItemProcessing" >> _cEntry >> "progressTitel"));

private _hasLicense = missionNamespace getVariable [getText(missionConfigFile >> "ItemProcessing"  >> _cEntry >> "neededLicense"),false];

if (([0,_oItem] call life_fnc_handleVItem) == 0) exitwith {
	[format["Du hast kein %1",localize (getText(missionConfigFile >> "VirtualItems" >> _oItem >> "displayName"))],true,"fast"] call life_fnc_notification_system;
};
life_is_processing = true;
private _pData = (getText(missionConfigFile >> "VirtualItems" >> _result >> "profVar")) call life_fnc_getProf;

[_pData select 0,_header,compile (format["!isNull objectParent player || !life_is_processing || player distance %1 > 10",getPos _vendor]),[_cEntry,_vendor,_hasLicense,_pData select 1,0],life_fnc_endProcessing,life_fnc_endProcessing] spawn life_fnc_progressBar;