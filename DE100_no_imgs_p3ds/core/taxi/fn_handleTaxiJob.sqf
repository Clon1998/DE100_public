/*
	File:	fn_handleTaxiJob.sqf
	Date:   2016-07-29 17:58:10
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_vendor", objNull, [objNull]],
	["_caller", objNull, [objNull]],
	["_addactionId", 0, [0]],
	["_arguments", "", [""]]
];

if (_arguments isEqualTo "JOIN") then {
	["Du bist jetzt im Taxidienst",false,"fast"] call life_fnc_notification_system;
	player setVariable ["TaxiDuty",true,true];
	life_taxiDriver = true;
} else {
	["Du bist nicht mehr im Taxidienst",false,"fast"] call life_fnc_notification_system;
	player setVariable ["TaxiDuty",nil,true];
	life_taxiDriver = false;
};
