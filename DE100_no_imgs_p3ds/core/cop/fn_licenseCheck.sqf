/*
	File: fn_licenseCheck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the licenses to the cop.
*/
private["_cop","_licenses","_licensesConfigs","_struct","_displayName"];
_cop = param [0,objNull,[objNull]];
_struct = [];
if(isNull _cop) exitWith {}; //Bad entry

_licenses = "";
_licenses = if (player getVariable ["Perso_has_IdCard",false]) then {
	_licenses + "Personalausweis<br/>";
};
//Config entries for licenses that are civilian
_licensesConfigs = "getText(_x >> 'side') isEqualTo 'civ'" configClasses (missionConfigFile >> "Licenses");

{
    _displayName = localize(getText(_x >> "displayName"));

    if ([0,configName _x] call life_fnc_handleLicense) then {
        _struct pushBack _displayName;
    };
} forEach _licensesConfigs;
_struct sort true;

{
	_licenses = _licenses + format["%1<br/>",_x];
} forEach _struct;

if (_licenses isEqualTo "") then {_licenses = (localize "STR_Cop_NoLicensesFound");};

[player call life_fnc_name,_licenses] remoteExecCall ["life_fnc_licensesRead",_cop];