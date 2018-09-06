/*
	File:	fn_licenseInfo.sqf
	Date:   06.06.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_arguments", "", [""]]
];

format["%1 (%2€)", localize (getText(missionConfigFile >> "Licenses" >> _arguments >> "displayName")), getNumber(missionConfigFile >> "Licenses" >> _arguments >> "price") call life_fnc_numberText];